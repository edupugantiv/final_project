class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :preferences
  has_many :results
  has_many :charities, through: :results
  has_many :categories, through: :preferences
  validates(:name, :presence => true)
end
