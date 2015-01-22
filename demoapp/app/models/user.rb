class User < ActiveRecord::Base
	has_many :microposts
	validates :name, length: {maximum: 20}, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.+\d]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
end
