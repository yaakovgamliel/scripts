require 'webrick'

#root = File.expand_path 'www'
puts "[*] you're running at http://localhost:8080"
server = WEBrick::HTTPServer.new :Port => 8080, :DocumentRoot => '/Users/sergatamobile/Desktop/nooly 2/www'

trap 'INT' do
  puts "shuting down................"
  server.shutdown
  puts "server is down!"
end

server.start
