class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :birthday, :created_at

  # has_many :created_posts, serializer: PostSerializer


  # def avatar_url
  #   object.avatar.attached? ? Rails.application.routes.url_helpers.url_for(object.avatar) : nil
  # end
  #
  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
