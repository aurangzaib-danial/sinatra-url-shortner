class Url < ActiveRecord::Base
	belongs_to :user

	def id_to_base32
		self.id_base32 = id.to_s(32)
	end

	def shorten
		id_to_base32
		"http://localhost/#{id_base32}"
	end
end