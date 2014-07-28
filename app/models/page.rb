class Page < ActiveRecord::Base
  # set nesting tree ability
  has_ancestry
  
  # set auditing
  has_paper_trail
  
  # associate to banners
  has_many :pagebanners, dependent: :destroy
  has_many :banners, through: :pagebanners
  
  # validations
  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug
  
  def parent_enum
    Page.where.not(id: id).map { |p| [ p.name, p.id ] }
  end
  
  # set friendly url ability
  def to_param
    slug
  end
  
  def generate_slug
    self.slug ||= name.parameterize
  end
end
