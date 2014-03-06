class ContentProviders::DailyJournalAverageSleep < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'daily_journals/daily_journal_average_sleep', locals: {
        update_path: options.view_context.participant_data_path,
        daily_journal: options.participant.daily_journals.last 
      }
    )
  end

  def data_attributes
  [:average_sleep_quality, :id]
  end

  def data_class_name
    'DailyJournal'
  end

  def exists?(position)
    false
  end

  def show_nav_link?
    false
  end
end