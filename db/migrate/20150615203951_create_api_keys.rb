class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|

      t.integer :user_id, null: false
      t.string :value, null: false
      t.datetime :expiration_date
      t.timestamps null: false

    end
  end
end
