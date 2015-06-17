class AuctionsController < ApplicationController

  after_filter :cors_set_access_control_headers

  def index

  end

  def delete
    check_for_api_key
    if params['id'].include?('..')
      @auction = Auction.where(id: params['id'].to_range)
      @destroy = @auction.destroy_all
    elsif params['id'] === 'all'
      @auction = Auction.all
      @destroy = @auction.destroy_all
    else
      @auction = Auction.find(params['id'])
      @destroy = @auction.destroy
    end

    if @destroy
      render json: {status: 'deleted'}
    else
      render nothing: true, status: :bad_request
    end

  end

  def create

    check_for_api_key

    @auction = Auction.new

    @auction.user_id = params['user_id']
    @auction.title = params['title']
    @auction.specifics = params['specifics']
    @auction.details = params['details']
    @auction.specifics = params['specifics']
    @auction.listing_format = params['listing_format']
    @auction.buy_now = params['buy_now']
    @auction.start_date = params['start_date']
    @auction.end_date = params['end_date']
    @auction.added_date = params['added_date']
    @auction.pick_up_only = params['pick_up_only']
    @auction.free_shipping = params['free_shipping']
    @auction.weight = params['weight']
    @auction.width = params['width']
    @auction.height = params['height']
    @auction.length = params['length']
    @auction.paypal_email = params['paypal_email']
    @auction.item_location = params['item_location']

    if @auction.save

      #params[:photos].each do |photo|
        @photo = @auction.photos.create!(photo: params['photos'], auction_id: @auction.id)
      #end
      render json: @auction
    else
      render nothing: true, status: :bad_request
    end

  end

  def edit

  end

  def show
    check_for_api_key

    params['page'] ||= 1
    params['count'] ||= 25
    params['count'] === 'all' ? params['count'] = Auction.count() : params['count']

    params['order_by'] ||= 'id,ASC'
    order_by = params['order_by'].gsub(',', ' ');

    @auctions = Auction.page(params['page']).per(params['count']).order("#{order_by}")
    render 'show.json.jbuilder'
  end

  def search
    check_for_api_key
    raise ArgumentError, 'No id parameter was defined' unless params['id']
    # rescue ActiveRecord::RecordNotFound do

    @auction = Auction.find(params['id'])
    puts render 'search.json.jbuilder'
  end

  def check_for_api_key
    raise ArgumentError, 'API key is invalid' unless ApiKey.is_valid?(params['api_key'])
    raise ArgumentError, 'API key needs to be included' unless params['api_key']
  end

  private
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Max-Age'] = "1728000"
  end

end
