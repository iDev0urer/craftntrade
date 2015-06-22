class RemoveAddedDateAndEndedDateFromAuctions < ActiveRecord::Migration
  def change
    remove_column :auctions, :added_date
    remove_column :auctions, :ended_date
  end
end
