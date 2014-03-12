class ContentModule < ActiveRecord::Base
  include SharedMethods

  has_many :providers, -> { order 'position' }, class_name: 'ContentProvider', dependent: :destroy
  has_one :content_release

  validates :title, :context, :position, presence: true
  validates_numericality_of :position, greater_than_or_equal_to: 1
  validates_uniqueness_of :position, scope: :context

  accepts_nested_attributes_for :content_release

  def provider(position)
    providers.where(position: position).first || ContentProviders::Null.new
  end

  def provider_exists?(position)
    providers.exists?(position: position)
  end
end
