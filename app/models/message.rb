class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  validates :subject, presence: true

  def mark_as_read!
    self.read_at = Time.now
    self.save!
  end

  def unread?
    read_at.nil?
  end

  def read?
    !!read_at
  end

  def self.unread
    where(read_at: nil)
  end
end
