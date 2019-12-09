class Url < ActiveRecord::Base
	belongs_to :user

	def shorten
		"http://localhost:9393/#{Base32.encode_id(id)}"
	end

	def self.find_by_shortcode(shortcode)
		id = Base32.decode_id(shortcode)
		
		find_by_id(id)
	end

	def valid_target_url?
		target_url.match?(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix)
	end

end