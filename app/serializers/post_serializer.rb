class PostSerializer < ActiveModel::Serializer
  attributes :id, :post_type, :content, :media_url, :author_id, :created_at, :duration

  belongs_to :author, key: :user, serializer: UserPreviewSerializer
  has_many :post_distributions

  def media_url
    if object.media.attached?
      Rails.application.routes.url_helpers.url_for(object.media)
    end
  end

  def created_at
    # Format the date nicely for your React UI
    object.created_at.strftime("%b %d, %Y")
  end

  def duration
    object.media.metadata["duration"] if object.post_type == "video"
  end

  def include_duration?
    object.post_type == "video"
  end
end
