class ContentProviders::GroupSessionDetail < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'group_sessions/group_session_detail', locals: {
        create_path: options.view_context.participant_data_path 
      }
    )
  end

  def data_attributes
    [:hope, :safety, :comfort, :well_being, :closeness, :clarity, :understanding, :self_confidence]
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