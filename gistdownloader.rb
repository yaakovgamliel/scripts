# This script downaloads code files from GitHub gist pages

gist = ARGV[0]

unless gist
  puts "Usage: gistdownloader.rb '-- gist url --'"
  puts 'Give me gist!'
  exit
end

curl_link = gist.gsub('github','githubusercontent') << '/raw'

system("curl #{curl_link}")


