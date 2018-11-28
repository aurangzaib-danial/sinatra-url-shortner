class Url < ActiveRecord::Base
	belongs_to :user

	def encode_id
		id.to_s(32)
	end

	def shorten
		"http://localhost:9393/#{encode_id}"
	end

	def self.decode_base32_id(id_base32)
		id_base32.to_i(32)
	end

	def self.find_by_base32_id(id_base32)
		id = decode_base32_id(id_base32)
		self.find_by_id(id)
	end

	def valid_url?
		url.match?(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix)
	end

end