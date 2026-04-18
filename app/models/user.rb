class User < ApplicationRecord
  has_many :allowlisted_jwts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  include Devise::JWT::RevocationStrategies::Allowlist
  attr_accessor :login

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :birthday, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/}
  # validates :username, presence: true, uniqueness: true
  # validates :email, uniqueness: true, presence: true, format: {
  #   with: /\A(.+)@(.+)\z/,
  #   message: "is invalid"
  # }
  #
  # has_many :created_posts, class_name: "Post", foreign_key: "author_id"
  # has_many :post_distributions
  # has_many :feed_posts, through: :post_distributions, source: :post
  # has_many :friendships
  # has_many :friends, through: :friendships, source: :friend
  # has_many :friend_requests, class_name: "Friendship", foreign_key: "friend_id"
  # has_many :requested_friends, through: :friend_requests, source: :user
  # has_many :access_requests, class_name: "Access", foreign_key: "user_id"
  # has_many :requested_access, through: :access_requests, source: :accessable
  # has_many :accesses, foreign_key: "user_id"
  # has_many :accessable_posts, through: :accesses, source: :accessable, source_type: "Post"
  # has_one_attached :avatar

end
