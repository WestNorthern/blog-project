class User < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	has_many :posts, dependent: :destroy
	validates :first_name, :last_name, :avatar, :email, :presence => true

	def full_name
		first_name + ' ' + last_name
	end
end
