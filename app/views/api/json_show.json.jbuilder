json.data @auctions do |auction|
  json.id               auction.id
  json.user             auction.user
  json.title            auction.title
  json.details          auction.details
  json.specifics        auction.specifics
  json.listing_format   auction.listing_format
  json.buy_now          auction.buy_now
  json.start_date       auction.start_date
  json.end_date         auction.end_date
  json.added_date       auction.added_date
  json.ended_date       auction.ended_date
  json.pickup_only      auction.pick_up_only
  json.free_shipping    auction.free_shipping
  json.weight           auction.weight
  json.width            auction.width
  json.height           auction.height
  json.length           auction.length
  json.paypal_email     auction.paypal_email
  json.item_location    auction.item_location
  json.photos           auction.photos do |photo|
    json.id             photo.id
    json.thumb          photo.photo.thumb.url
    json.medium         photo.photo.medium.url
    json.large          photo.photo.large.url
    json.original       photo.photo.url
  end
end