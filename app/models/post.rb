class Post < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 1}
  validates :body, presence: true
  validates :subtitle, presence: true, length: {minimum: 5}

  has_many :comments, dependent: :destroy
  belongs_to :category, :counter_cache => true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
