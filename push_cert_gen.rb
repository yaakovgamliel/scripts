# This little script setups your push notifications certificate
# 
#

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
  
  opts.on("-c CERT") do |cert|
    options[:cert] = cert
  end

  opts.on("-","--") do
    options[:] = true
  end

  opts.on("-k KEY") do |key|
    options[:key] = dir
  end

  opts.on("-o OUT_KEY") do |out_key|
    options[:out_key] = out_key
  end

  opts.on("-pem PEM") do |pem|
    options[:pem] = pem
  end

  opts.on("-h","--help") do 
    options[:help] = true
  end

  opts.on("-t","--test") do
    options[:test] = true
  end

end

option_parser.parse!

system("openssl x509 -in #{options[:cert]} -inform der -out #{options[:key]}.pem")
system("openssl pkcs12 -nocerts -out #{options[:out_key]}.pem -in #{options[:key]}")
system("cat > #{options[:pem]}")
system(")













