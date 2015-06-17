class Photo < ActiveRecord::Base
  mount_uploader :photo, AuctionPhotoUploader
  belongs_to :auction
end
