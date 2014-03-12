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

  config.excluded_models = ["ContentProviders::DailyJournalAverageSleep", "ContentProviders::DailyJournalAverageStress", "ContentProviders::DailyJournalMeaningful", "ContentProviders::DailyRelaxationPostForm", "ContentProviders::DailyRelaxationPreForm", "ContentProviders::GroupSessionDetail", "ContentProviders::GroupSessionPostForm", "ContentProviders::GroupSessionPreForm", "ContentProviders::Home", "ContentProviders::ModuleCompleteProvider", "ContentProviders::ModuleIndexProvider", "ContentProviders::RelaxationAudioIndex", "ContentProviders::SlideshowProvider", "ParticipantStatus", "ContentRelease", "ContentModule", "ContentProvider", "VideoSlide"]

  config.model Participant do
    
    object_label_method :email

    list do
      field :email
      field :id
      field :study_start_date
    end
    
  end
  
  def email
    return "#{self.email}"
  end

  config.model Webex do
    label "Webex Session Date" 
    label_plural "Webex Session Dates"
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
