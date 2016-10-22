class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password

  def incoming_messages
    Message.where(recipient_id: id).order('created_at DESC')
  end

  def sent_messages
    Message.where(sender_id: id).order('created_at DESC')
  end

  def to_s
    email
  end

  def all_other_users
    User.where.not(id: id)
  end
end
