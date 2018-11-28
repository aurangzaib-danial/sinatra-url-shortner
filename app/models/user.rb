class User < ActiveRecord::Base
	has_many :urls
	validates_presence_of(:username)
	has_secure_password
end