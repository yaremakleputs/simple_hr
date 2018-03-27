class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :admin, foreign_key: true, index: true

      t.timestamps
    end
  end
end
