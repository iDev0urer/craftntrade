class ChangeSpecificsFromHStoreToJson < ActiveRecord::Migration
  def change
    remove_column :auctions, :specifics
    add_column :auctions, :specifics, :json
  end
end
