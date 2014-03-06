class ContentProviders::DailyJournalAverageStress < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'daily_journals/daily_journal_average_stress', locals: {
        create_path: options.view_context.participant_data_path 
      }
    )
  end

  def data_attributes
  [:average_stress]
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