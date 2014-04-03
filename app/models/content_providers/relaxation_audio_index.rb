class ContentProviders::RelaxationAudioIndex < ContentProvider
  def render_current(options)
    options.view_context.render(template: 'daily_relaxation_sessions/relaxation_audio_index', locals: {
        create_path: options.view_context.participant_data_path, 
        audio_files: RelaxationAudio.all,
        current_relaxation_session: options.participant.daily_relaxation_sessions.last
      }
    )
  end

  def data_attributes
  [:relaxation_audio_id, :daily_relaxation_session_id, :self_guided]
  end

  def data_class_name
    'Listening'
  end

  def exists?(position)
    false
  end

  def show_nav_link?
    true
  end
end