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
  def blue
	  self.class.colorize(self, 34)
  end
end
#
#  
#
dec_string = ''
string_to_dec = ARGV[0]
#
#
#
#
string_to_dec.each_char do |c|
	if c.ord < 100
		dec_string  += "&#" + "0" + c.ord.to_s + ";"
	else
	  dec_string  += "&#" + c.ord.to_s + ";"
	end
end

puts "[*] String2Dec by me".blue
puts "your string: " + string_to_dec.green
puts "yor dec: " + dec_string.cyan


