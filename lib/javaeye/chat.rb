module JavaEye
  class Chat

    %W[user id created_at body name logo domain receiver reply_to_id via].each do |attr|
      attr_accessor attr.to_sym
    end

    def initialize(hash)
      hash.each do |key,value|
        if key=="user"
          self.send("#{key}=",User.new(value))
        else
          self.send("#{key}=",value)
        end
      end
    end

  end
end