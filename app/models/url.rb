class Url < ActiveRecord::Base
	belongs_to :user

	def encode_id
		id.to_s(32)
	end

	def decode_id
		id.to_i(32)
	end

	def shorten
		"http://localhost/#{encode_id}"
	end
end