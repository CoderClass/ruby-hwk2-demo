class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :followings, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :followers, class_name: 'User', through: :followings, source: :user

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

  def find_friendship_with(friend)
    friendships.where(friend: friend).first
  end
end
