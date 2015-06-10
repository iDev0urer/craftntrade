module UsersHelper

  def user_has_auctions?
    if(user_signed_in? && current_user.auctions.first != nil)
      true
    else
      false
    end
  end

  def user_has_address?
    if(user_signed_in? && current_user.addresses.first != nil)
      true
    else
      false
    end
  end

  def user_default_address
    if(user_signed_in? && user_has_address?)
      default_address = current_user.addresses.where(default: true)
    end
  end

end
