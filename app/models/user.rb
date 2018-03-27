class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  validates_uniqueness_of :email
end
