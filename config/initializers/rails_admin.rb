RailsAdmin.config do |config|
  config.main_app_name = ["LiveWell"]

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.excluded_models = ["ContentProviders::DailyJournalAverageSleep", "ContentProviders::DailyJournalAverageStress", "ContentProviders::DailyJournalMeaningful", "ContentProviders::DailyRelaxationPostForm", "ContentProviders::DailyRelaxationPreForm", "ContentProviders::GroupSessionDetail", "ContentProviders::GroupSessionPostForm", "ContentProviders::GroupSessionPreForm", "ContentProviders::Home", "ContentProviders::ModuleCompleteProvider", "ContentProviders::ModuleIndexProvider", "ContentProviders::RelaxationAudioIndex", "ContentProviders::SlideshowProvider", "ContentProviders::GroupSessionFinal","ParticipantStatus", "VideoSlide", "ContentProvider", "ContentModule"]

  config.model Participant do
    
    object_label_method :email

    list do
      field :study_identification
      field :first_name
      field :last_name
      field :email
      field :study_start_date
    end

    edit do
      field :study_identification
      field :first_name
      field :last_name
      field :email
      field :study_start_date
      field :password
      field :password_confirmation
    end
  end
  
  def email
    return "#{self.email}"
  end

  config.model GroupSessionMoodDetail do
    navigation_label "Participant data"
    label "Group Session Eval" 
    label_plural "Group Session Evals"

    list do
      field :participant
      field :created_at
      field :hope
      field :safety
      field :comfort
      field :closeness
      field :well_being
      field :clarity
      field :understanding
      field :self_confidence
      field :session_satisfaction
      field :session_desire_for_future
      field :session_stress

      filters [:participant, :created_at]
    end
  end
  
  config.model Listening do
    navigation_label "Participant data"
    list do
      field :daily_relaxation_session
      field :relaxation_audio
      field :self_guided
      field :created_at

      filters [:created_at]
    end
  end

  config.model GroupSessionMoodSummary do
    navigation_label "Participant data"
    label "MINI POM" 
    label_plural "MINI POMS"

    list do
      field :participant
      field :created_at
      field :pre_anxious
      field :pre_sad
      field :pre_confused
      field :pre_energy
      field :pre_fatigue
      field :post_anxious
      field :post_sad
      field :post_confused
      field :post_energy
      field :post_fatigue
      

      filters [:participant, :created_at]
    end
  end

  config.model DailyRelaxationSession do
    navigation_label "Participant data"

    list do
      field :participant
      field :listenings
      field :pre_stress
      field :post_stress
      field :created_at do
        label "started"
      end
      field :updated_at do
        label "ended"
      end

      filters [:participant, :created_at]
    end
  end
  
  config.model DailyJournal do
    navigation_label "Participant data"

    list do
      field :participant
      field :created_at
      field :average_stress
      field :average_sleep_quality
      field :meaningful_text
      
      filters [:participant, :created_at]
    end
  end

  config.model Webex do
    label "Webex Session Date" 
    label_plural "Webex Session Dates"

    list do
      field :meeting_time
      field :url
    end
  end

  config.model ContentRelease do
    object_label_method :day
  end
  
  def day
    "#{self.release_date}"
  end

  config.model Slideshow do
    list do
      field :title
      field :content_release
    end
  end

  config.model Slide do
    
    parent Slideshow

    edit do
      field :title
      field :body, :wysihtml5 do
        config_options :html => true
      end
      field :slideshow 
      field :position
      field :is_title_visible
    end
  end

end
