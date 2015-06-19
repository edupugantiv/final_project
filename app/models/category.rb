class Category < ActiveRecord::Base
	has_many :preferences
	has_many :users, through: :preferences
end
