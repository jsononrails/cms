class Page < ActiveRecord::Base
  has_ancestry
  
  # set auditing
  has_paper_trail
  
  has_many :pagebanners
  has_many :banners, through: :pagebanners
  
  def parent_enum
    Page.where.not(id: id).map { |p| [ p.name, p.id ] }
  end
  
end
