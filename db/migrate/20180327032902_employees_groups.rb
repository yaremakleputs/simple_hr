class EmployeesGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :employees_groups do |t|
      t.references :employee, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true
    end
  end
end
