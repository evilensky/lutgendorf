class Slideshow < ActiveRecord::Base
  has_many :slides, -> { order 'position' }, dependent: :destroy, inverse_of: :slideshow
  has_one :content_provider, as: :source_content, inverse_of: :source_content
  has_one :content_release
  validates :title, presence: true

  accepts_nested_attributes_for :slides
  accepts_nested_attributes_for :content_release
end
