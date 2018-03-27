class Employee < User
  has_many :posts, through: :employee_posts
end
