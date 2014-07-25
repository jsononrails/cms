RailsAdmin.config do |config|

  ### Popular gems integration
  config.main_app_name = Proc.new { |controller| [ "Sault Sports Medicine", "Content Management System - #{controller.params[:action].try(:titleize)}" ] }
  
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  config.audit_with :paper_trail, 'Page', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  
  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  # Ignore models
  config.excluded_models = ["Assignment", ""]

  # Custom admin Model configurations
  
  # use icon-user for menu
  
  config.model 'User' do
    navigation_icon 'icon-user'
    navigation_label 'Security'
  end
  
  # hide user associations for roles page
  config.model 'Role' do
    navigation_icon 'icon-lock'
    configure :users do
      hide
    end
    navigation_label 'Security'
  end
  
  # banners
  config.model Ckeditor::Banner do
    list do
      field :content do
        hide
      end
      field :id
      field :data
      field :width
      field :height
      field :created_at
      field :updated_at
    end
  end
  
  # pages
  config.model 'Page' do
    navigation_icon 'icon-folder-close'
    navigation_label 'Content'
    
    field :name
    field :content, :ck_editor 
    
    field :parent_id, :enum do
      enum_method do
        :parent_enum
      end
    end
    
    nestable_list true
    nestable_tree({
      position_field: :position,
      max_depth: 6
    })
    
    list do
      field :content do
        hide
      end
      field :created_at
      field :updated_at
    end
  end
    
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
    history_index
    history_show
    
    # Add the nestable action for configured models
    nestable
  end
end
