require 'webrick'

puts "[*] you're running at http://localhost:8080"
server = WEBrick::HTTPServer.new Port: 8080, DocumentRoot: Dir.pwd

trap 'INT' do
  server.shutdown
  puts "server is down!"
end

server.start
