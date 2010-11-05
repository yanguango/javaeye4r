require "rubygems"
require "javaeye4r"

client = JavaEye::Client.new("qichunren", "qichunrenjavaeye8")

# this show client reponse code, "true" means 200 http response code.
puts client.verify.to_s  

# get your chat message list in chat app index page:http://app.javaeye.com/chat
client.get_list.each do |post|
 puts post.user.name + ":   " + post.body
end