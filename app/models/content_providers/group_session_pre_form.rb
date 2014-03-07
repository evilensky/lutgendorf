class ContentProviders::GroupSessionPreForm < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'group_sessions/group_session_pre_form', locals: {
        create_path: options.view_context.participant_data_path 
      }
    )
  end

  def data_attributes
  [:pre_anxious, :pre_sad, :pre_confused, :pre_energy, :pre_fatigue]
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