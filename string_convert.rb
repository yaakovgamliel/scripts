#little monkey pathch to get nice string color
#
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

mail_string = ''
my_email = ARGV[0]

my_email.each_char do |c|
	if c.ord < 100
		mail_string += "&#" + "0" + c.ord.to_s + ";"
	else
		mail_string += "&#" + c.ord.to_s + ";"
	end
end

puts "String2Dec".green

puts my_email.cyan
puts mail_string.cyan


