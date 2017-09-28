class User < ApplicationRecord
  extend Enumerize
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:stripe_connect]

  has_many :products

  enumerize :role, in: %i[buyer seller]

  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_initialize.tap do |user|
      user.password = "12345678"
      user.email = auth.info.email
      user.uid = auth.uid
      user.access_code = auth.credentials.token
      user.publishable_key = auth.info.stripe_publishable_key
      user.save!
    end
  end
end
