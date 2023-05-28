class Message < ApplicationRecord
  belongs_to :guestbook

  scope :published, -> { where(published: true) }
  scope :incoming, -> { where(published: false) }

  def incoming?
    !published
  end
end
