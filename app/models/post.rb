class Post < ApplicationRecord
  belongs_to :admin
  has_many :employees, through: :employee_posts
end
