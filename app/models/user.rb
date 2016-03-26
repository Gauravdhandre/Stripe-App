class User < ActiveRecord::Base
	#acts_as_authentic
	has_many :payments, dependent: :destroy
	validates :name,presence: true
	validates :email, presence: true
	validates :password, presence: true
	acts_as_authentic do |c|
		c.login_field = 'email'
	end
end
