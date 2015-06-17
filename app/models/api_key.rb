class ApiKey < ActiveRecord::Base

  before_create do |key|
    key.value = key.generate_key
  end

  def generate_key
    loop do
      token = SecureRandom.base64.tr('+/-=&*^', 'Qrt')
      break token unless ApiKey.exists?(value: token)
    end
  end

  def self.key_exists?(key)
    ApiKey.exists?(value: key)
  end

  def self.is_valid?(key)
    if key_exists?(key)
      ApiKey.where(value: key).first.expiration_date > DateTime.now ? true : false
    else
      false
    end
  end

  def self.get_user(key)
    raise ArgumentError, 'Supplied API key doesn\'t exist' unless key_exists?(key)
    raise ArgumentError, 'API key has expired' unless is_valid?(key)

    uid = ApiKey.where(value: key).first.user.id
    User.find(uid)
  end

  def self.user_auth(key)
    user = get_user(key)
  end

  belongs_to :user
end
