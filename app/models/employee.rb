class Employee < User
  has_many :employee_posts
  has_many :posts, through: :employee_posts
  has_and_belongs_to_many :groups, dependent: :destroy
end
