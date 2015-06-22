class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.references :auction, index: true, foreign_key: true

      t.string :title
      t.integer :parent_id
      t.text :description

      t.timestamps null: false
    end
  end
end
