module JavaEye
  class Client
    attr_accessor :username
    attr_accessor :password

    def initialize(username, password)
      @username = username
      @password = password
    end

    def verify
      resp = get_request(URL[:auth])
      case resp.code
      when "200"
        true
      when "400"
        false
      when "401"
        false
      end
    end

    def get_request(url,option={})
      url = JavaEye::get_request_uri(url,option)
      url = URI.parse(url)
      Net::HTTP.start(url.host) do |http|
        req = Net::HTTP::Get.new(url.request_uri)
        req.basic_auth @username, @password
        resp = http.request(req)
        return resp
      end
    end

    def post_request(url,data,option={})
      url = JECoat::get_request_uri(url,option)
      url = URI.parse(url)
      Net::HTTP.start(url.host) do |http|
        req = Net::HTTP::Post.new(url.request_uri)
        req.basic_auth @username, @password
        req.set_form_data(data)
        resp = http.request(req)
        return resp
      end
    end

    def get_chats(url,option)
      resp = get_request(url, option)
      if resp.code == "200"
        chats ||= []
        JSON.parse(resp.body).each do |chat|
          chats << Chat.new(chat)
        end
      end
      chats
    end

    def get_list(option = {})
      get_chats(URL[:list], option)
    end

    def get_reply(option = {})
      get_chats(URL[:reply], option)
    end

    def get_all(option = {})
      get_chats(URL[:all], option)
    end

    def create_chat(body, option={})
      chat = {}
      chat[:body] = body
      chat[:reply_id] = option[:reply_id] ? option[:reply_id] : nil
      chat[:via] = JavaEye::VIA
      resp = post_request(URL[:create],chat)
      if resp.code == '200'
        chat
      else
        nil
      end
    end
  end
end