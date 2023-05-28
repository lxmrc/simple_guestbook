class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_one :guestbook

  after_create :create_guestbook

  def create_guestbook
    Guestbook.create(user: self)
  end
end
