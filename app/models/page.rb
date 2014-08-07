class Page < ActiveRecord::Base
  # set nesting tree ability
  has_ancestry
  
  # set auditing
  has_paper_trail
  
  # layout
  belongs_to :layout
  
  # picture association
  belongs_to :picture, class_name: Ckeditor::Picture
  
  # associate to banners
  has_many :pagebanners, dependent: :destroy
  has_many :banners, through: :pagebanners
  
  # validations
  validates :slug, uniqueness: true, presence: true
  validates :layout, :layout_id, presence: true
  validates :name, presence: true
  
  before_validation :generate_slug
  
  after_initialize do
    if new_record?
      self.layout = Layout.find_by_layout 'Application'
    end
  end
    
  def parent_enum
    Page.where.not(id: id).map { |p| [ p.name, p.id ] }
  end
  
  def layout_enum
    Layout.where.not(id: id).map { |l| [ l.layout, l.id ] }
  end
  
  # set friendly url ability
  def to_param
    slug
  end
  
  def generate_slug
    self.slug ||= name.parameterize
  end
end
