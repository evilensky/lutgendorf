class ContentModule < ActiveRecord::Base
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

  def is_released?(participant)
    if content_release
      Date.today - participant.study_start_date.to_date >= content_release.release_date * 7 rescue true
    else
      true
    end
  end

end
