class User < ActiveRecord::Base
	has_many :urls
	has_secure_password
end