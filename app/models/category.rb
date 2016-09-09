class Category < ActiveRecord::Base
	has_many :preferences
	has_many :classifications
	has_many :users, through: :preferences
	has_many :charities, through: :classifications

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
