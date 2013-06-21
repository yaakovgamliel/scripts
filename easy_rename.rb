require 'optparse'

class String
  def self.colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def cyan
    self.class.colorize(self, 36)
  end

  def green
    self.class.colorize(self, 32)
  end
end


options = {}
option_parser = OptionParser.new do |opts|
  opts.on("-n NAME") do |name|
    options[:name] = name
  end

  opts.on("-r","--retina") do
    options[:retina] = true
  end

  opts.on("-d DIR") do |dir|
    options[:directory] = dir
  end

  opts.on("-h","--help") do 
    options[:help] = true
  end
end

option_parser.parse!
help_message = <<HELP

Usage: easy_rename [options]
       -n           name your assets easy_rename will add number index for you
       -d           directory path for your assets
       --retina, -r add this flag for adding @2x to your assets 
       --help, -h   just print this

easy_rename.rb  -n <new-name-> -d <path-to-directory> 
easy_rename.rb  -h <shows-this-message>  
easy_rename.rb   --help <shows-this-message>

if you need retina assets juts add the -r or --retina flag in your options, 
all your assets will be named with @2x stuff.

easy_rename.rb  -n <new-name-> -d <path-to-directory> --retina
easy_rename.rb  -n <new-name-> -d <path-to-directory> -r


HELP


if options[:help]
  puts help_message.green
  exit
end


entries = Dir.entries(options[:directory])
Dir.chdir(options[:directory])
counter = 0

clean_entries = entries[3..-1]


#Check if we're need to make retina stuff

if options[:retina]
  clean_entries.each do |entry|
    next if File.directory?(entry)
    #Here we change the files name
    system("mv #{entry} #{options[:name]}#{counter}@2x.png")
    counter += 1
  end
else
  clean_entries.each do |entry|
    next if File.directory?(entry)
    #Here we change the files name
    system("mv #{entry} #{options[:name]}#{counter}.png")
    counter += 1
  end
end



puts "We renamed #{counter + 1} files".cyan




