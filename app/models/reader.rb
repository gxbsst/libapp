class Reader < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  attr_accessor :password, :password_confirmation
  validates :email, :password,  presence: true
  validates :email, email: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
end
