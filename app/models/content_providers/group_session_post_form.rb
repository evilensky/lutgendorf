class ContentProviders::GroupSessionPostForm < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'group_sessions/group_session_post_form', locals: {
        update_path: options.view_context.participant_data_path,
        group_session_mood_summary: options.participant.group_session_mood_summary.last 
      }
    )
  end

  def data_attributes
  []
  end

  def data_class_name
    'GroupSessionMoodSummary'
  end

  def exists?(position)
    false
  end

  def show_nav_link?
    false
  end
end