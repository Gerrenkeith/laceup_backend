class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :post_distributions, dependent: :destroy
  has_many :recipients, through: :post_distributions, source: :user
  has_one_attached :media
end
