class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	has_many :microposts , dependent: :destroy 

	before_save { self.email = email.downcase } #asegurarnos de que definitivamente el email es correcto 


	validates :name , presence: true  , length: { maximum: 50}
	validates :email , presence: true

end
