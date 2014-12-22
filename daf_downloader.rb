#require 'httparty'
require 'net/http'
require 'uri'

class DafYomi
	
  BASE_URL = "http://www.kolhalashon.com/imgs/Vilna/"

  #include HTTParty 

	attr_accessor :tractate, :amud

	def initialize(tractate, amud)
		@tractate = tractate
		@amud = amud
	end

	def tractate_name
	  @tractate
	end

  def download
    how_many = tractate_page_quantity(@tractate)
		counter = 0
		how_many.times do
			counter += 1
			start_download(counter)
			sleep 5
		end	
	end

	def download_all
	end

	def tractate_list
		puts tractates.keys
	end

  private

  #TODO: Add multithread download 

  # This metho uses HTTParty 
	#
	#def start_download(blatt)
	#	File.open("/tmp/#{tractate_name}_#{blatt}.pdf", "wb") do |f|
  #    f.write HTTParty.get("http://www.kolhalashon.com/imgs/Vilna/#{tractate_name}/#{tractate_name}_Amud_#{amud_conversion(blatt)}.pdf").parsed_response
  #  end
	#end

	def start_download(blatt)

		uri = URI("#{BASE_URL}#{tractate_name}/#{tractate_name}_Amud_#{amud_conversion(blatt)}.pdf")
		
		puts uri

    http = Net::HTTP.new(uri.host, uri.port)

    req = Net::HTTP::Get.new(uri)
    		
		res =  http.request(req)

	  File.open("/tmp/#{tractate_name}_#{blatt}.pdf", "wb") do |f|
      f.write res.body
    end
	end

	def amud_conversion(current_amud)
		converted_amud = ''
		if current_amud <= 9
			converted_amud = '00' << current_amud.to_s
		elsif current_amud <= 99
			converted_amud = '0' << current_amud.to_s
		else
			converted_amud = current_amud.to_s
		end
		return converted_amud 
	end
  
	def tractate_page_quantity(tractate)
			amuds = {'brachot' => 64,
					     'shabat' => 157,
							 'eyruvin' => 105,
					     'psachim' => 121,
							 'shkalim' => 22, 
							 'yuma' => 88,
					     'suka' => 57, 
							 'beyza' => 40,
							 'rosh-hashana'=> 35,
							 'taanit' => 31,
							 'megila' => 32,
							 'moed-katan' => 29,
						   'hagiga' => 27}
			
			return amuds[tractate]*2
	end
	
 def tractates
   amuds = {'brachot' => 64,
					 	'shabat' => 157,
						'eyruvin' => 105,
					  'psachim' => 121, 
						'shkalim' => 22, 
						'yuma' => 88,
				    'suka' => 57, 
						'beyza' => 40,
						'rosh-hashana' => 35,
		  			'taanit' => 31, 
						'megila' => 32, 
						'moed-katan' => 29,
	 			    'hagiga' => 27}
	 
   return amuds 
 end	 

end

