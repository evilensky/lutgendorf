class AppSection
  SECTIONS = {
    daily_relaxation_practice: 'Daily Relaxation',
    daily_journal: 'Daily Journal',
    lesson: 'Weekly Session',
    webex_session: 'Webex Session',
    qualtrics_assessment: 'Qualtrics'
  }

  def self.by_name(name)
    new(name)
  end

  def self.all
    SECTIONS.keys.map { |s| by_name(s) }
  end

  def initialize(name)
    @name = name.to_s || ''
  end

  def slug
    @name
  end

  def label
    SECTIONS[@name.to_sym]
  end

  def content_modules
    ContentModule.where(context: @name)
  end
end