class AddressesController < ApplicationController
  def new

    @address = Address.new
    @user = current_user

    @address.line_one = params[:line_one]
    @address.line_two = params[:line_two]
    @address.city = params[:city]
    @address.state = params[:state]
    @address.zip = params[:zip]

    @address.save()

  end

end
