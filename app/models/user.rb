class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password

  has_many :friendships, dependent: :destroy
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

  def self.generate_users(n)
    response = open("https://randomuser.me/api/?results=#{n}").read
    results = JSON.parse(response)['results']

    results.each do |json|
      User.create(email: json["email"],
                  name: json["name"]["first"] + ' ' + json["name"]["last"],
                  thumbnail_url: json["picture"]["large"],
                  password: 'asdfasdf')
    end
  end

  def non_friends
    User.where.not(id: friend_ids)
  end

  def contact_info
    "#{name} <#{email}>"
  end
end
