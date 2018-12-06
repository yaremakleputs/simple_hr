class Post < ApplicationRecord
  belongs_to :admin
  has_many :employee_posts
  has_many :employees, through: :employee_posts

  accepts_nested_attributes_for :employee_posts, allow_destroy: true

  def employee_ids=(ids)
    ids.each do |id|
      int_id = id.to_i
      next if int_id < 1
      employee = Employee.find(int_id)
      self.employees << employee
    end
  end
end
