class Post < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :category, :counter_cache => true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
