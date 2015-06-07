class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|

      enable_extension 'hstore'

      t.references :user, index: true, foreign_key: true

      t.string      :title,           null: false, default: ''
      t.hstore      :specifics,       default: {}
      t.text        :details,         default: ''
      t.string      :listing_format,  null: false, default: 'auction'
      t.boolean     :buy_now,         null: false, default: false
      t.datetime    :start_date,      null: false
      t.datetime    :end_date,        null: false
      t.datetime    :added_date,      null: false
      t.datetime    :ended_date,      null: false
      t.integer     :pick_up_only,    null: false
      t.boolean     :free_shipping
      t.integer     :weight
      t.integer     :width
      t.integer     :height
      t.integer     :length
      t.string      :paypal_email,    null: false
      t.integer     :item_location,   null: false
    end
  end
end
