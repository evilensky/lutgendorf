class ContentProviders::DailyRelaxationPostForm < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'daily_relaxation_sessions/daily_relaxation_post_form', locals: {
        update_path: options.view_context.participant_data_path,
        daily_relaxation_session: options.participant.daily_relaxation_sessions.last 
      }
    )
  end

  def data_attributes
  [:post_stress, :id]
  end

  def data_class_name
    'DailyRelaxationSession'
  end

  def exists?(position)
    false
  end

  def show_nav_link?
    false
  end
end