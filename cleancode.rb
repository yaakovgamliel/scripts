#!/usr/bin/ruby
#this little script clean coments from code
#
require 'optparse'
require 'rainbow'

#program variables
options = { }
clean_code = ''

option_parser = OptionParser.new do |opts|
  #create switch
	opts.on("-h","--help") do
	  puts "CleanCode helps you to extract comments you made before pushing to production".color(:green)
		puts "usage: ".color(:red) + "./cleancode.rb [-f] <file_name>".color(:green)
		puts "       ./cleancode.rb [-h] shows this help massage".color(:green)
		exit
	end

	opts.on("-f file") do |file_name|
		options[:file] = file_name
	end
end
option_parser.parse!

file = File.open(options[:file]) do |f|
  f.each_line do |line|
    unless line =~ /\/+\//
      clean_code << line
    end
  end
end
result = File.open("clean_code_" + "#{options[:file]}",'w+') do |f|
  f.write clean_code
	puts "Done check".color(:green) 
end

