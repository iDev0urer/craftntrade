class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.string    :line_one,     null: false, default: ''
      t.string    :line_two,     default: ''
      t.integer   :apartment
      t.string    :city,         null: false
      t.string    :state,        null: false
      t.integer   :zip,          null: false
      t.string    :type,         null: false, default: 'residential'

      t.timestamps null: false
    end
  end
end
