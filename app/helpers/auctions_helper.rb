module AuctionsHelper

  def time_to_auction_end(auction_id)
    auction = Auction.find(auction_id)
    now = DateTime.now()
    end_date = auction.end_date

    distance_of_time_in_words(now, end_date, include_seconds: true)
  end

end
