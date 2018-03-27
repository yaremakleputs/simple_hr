class CreateEmployeePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_posts do |t|
      t.references :employee, foreign_key: true, index: true
      t.references :post, foreign_key: true, index: true
      t.boolean :seen, null: false, default: false

      t.timestamps
    end
  end
end
