class Post < ApplicationRecord
  belongs_to :admin
  has_many :employee_posts
  has_many :employees, through: :employee_posts

  accepts_nested_attributes_for :employee_posts, allow_destroy: true
end
