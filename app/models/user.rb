class User < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	has_many :microposts , dependent: :destroy 

	before_save { self.email = email.downcase } #asegurarnos de que definitivamente el email es correcto 

	validates :password, length: { minimum: 6 }
	validates :name , presence: true  , length: { maximum: 50}
	validates :email , presence: true  , format: {with: VALID_EMAIL_REGEX} , uniqueness: { case_sensitive: false }

	has_secure_password 

end
