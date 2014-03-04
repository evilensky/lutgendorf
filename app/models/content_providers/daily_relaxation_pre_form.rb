class ContentProviders::DailyRelaxationPreForm < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'daily_relaxation_sessions/daily_relaxation_pre_form', locals: {
        create_path: options.view_context.participant_data_path 
      }
    )
  end

  def data_attributes
  [:pre_stress, :post_stress]
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