class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :preferences
  has_many :results
  has_many :donations
  has_many :matched_charities, through: :results, source: :charity
  has_many :donated_charities, through: :donations, source: :donation
  has_many :categories, through: :preferences
  validates(:name, :presence => true)
  validates(:monthly_payment, :numericality => { :greater_than => 0})
end
