class User < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorite_photos, dependent: :destroy
  # I would rename the join table to `photo_favorites`, so that I could do the
  # following:
  has_many :photo_favorites
  has_many :favorite_photos, through: :photo_favorites, source: :photo
  # this way, .favorite_photos would return Photo objects, not the join model objects

  has_secure_password
  validates :username, uniqueness: true
  # validates :password_confirmation, presence: true

  # geniunely curious what this does? does this over-ride the default digesting
  # for has_secure_password?
  def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
  end

end
