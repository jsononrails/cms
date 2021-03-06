RailsAdmin.config do |config|

  ### Popular gems integration
  config.main_app_name = Proc.new { |controller| [ "Sault Sports Medicine", "Content Management System" ] }
  
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
  config.excluded_models = ["Assignment", "Pagebanner", ""]

  # Custom admin Model configurations
  
  # site
  
  config.model 'Site' do
    navigation_label 'Site Information'
  end
  
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
  
  # assets
  config.model Ckeditor::Asset do    
    hide
  end
  
  # banners
  config.model Ckeditor::Banner do
    navigation_label 'Files'
    
    field :data do
      label "Banner"
    end
    
    field :title
    field :alttag do
      label "Alt Tag"
    end
    
    field :intro
    field :description
    field :pages
    
    list do
      field :content do
        hide
      end
      field :id do
        hide
      end
      field :data do
        label "Banner"
      end
      field :title
      #field :width
      #field :height
      field :created_at
      field :updated_at
    end
    
  end
  
  # pictures
  config.model Ckeditor::Picture do
    navigation_label 'Files'
    
    field :data do
      label "Picture"
    end
    
    field :title
    field :alttag do
      label "Alt Tag"
    end
    
    field :intro
    field :description

    
    list do
      field :content do
        hide
      end
      field :id do
        hide
      end
      field :data do
        label "Picture"
      end
      field :title
      #field :width
      #field :height
      field :created_at
      field :updated_at
    end
  end
  
  # files
  config.model Ckeditor::AttachmentFile do
    navigation_label 'Files'
    label 'Files'
    
    list do
      field :content do
        hide
      end
      field :id do
        hide
      end
      field :data do
        label "File"
      end
      field :title
      #field :width
      #field :height
      field :created_at
      field :updated_at
    end
  end
  
  # layouts
  config.model 'Layout' do
    navigation_label 'Content'
    
    list do
      field :layout
    
      field :content do
        hide
      end
    end
    
    field :layout
    
    field :content do
      hide
    end
    
    #hide pages
    #configure :pages do
      #hide
    #end
    field :pages
    
  end
  
  # pages
  config.model 'Page' do
    navigation_icon 'icon-folder-close'
    navigation_label 'Content'
    
    field :name
    
    field :parent_id, :enum do
      label "Parent Page"
      enum_method do
        :parent_enum
      end
    end
    
    field :meta_keywords do
      label "SEO Keywords"
    end
    
    field :meta_description do
      label "SEO Description"
    end
    
    field :is_published
    field :show_in_menu
    
    field :layout_id, :enum do      
      enum_method do
        :layout_enum
      end
    end
    
    field :intro
    field :picture do
      pretty_value do
        value.select_title
      end
    end

    field :content, :ck_editor 
    field :banners
    
    nestable_list true
    nestable_tree({
      position_field: :position,
      max_depth: 6
    })
    
    list do
      field :banners do
        hide
        # figure out how to do count
      end
      
      field :content do
        hide
      end
      
      field :picture do
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
