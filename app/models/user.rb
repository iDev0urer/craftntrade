class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login, :terms_of_service

  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :username, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates_acceptance_of :terms_of_service

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  has_many :auctions, dependent: :destroy
  has_many :addresses, dependent: :destroy
  
end
