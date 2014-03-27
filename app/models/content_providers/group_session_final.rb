class ContentProviders::GroupSessionFinal < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'group_sessions/group_session_final', locals: {
        update_path: options.view_context.participant_data_path,
        group_session_mood_detail: options.participant.group_session_mood_details.last  
      }
    )
  end

  def data_attributes
  [:session_satisfaction, :session_desire_for_future, :session_stress, :id]
  end

  def data_class_name
    'GroupSessionMoodDetail'
  end

  def exists?(position)
    false
  end

  def show_nav_link?
    false
  end
end