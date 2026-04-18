class UserPreviewSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url

  def avatar_url
    object.avatar.attached? ? Rails.application.routes.url_helpers.url_for(object.avatar) : nil
  end
end
