class Page < ActiveRecord::Base
  has_ancestry
  
  # set auditing
  has_paper_trail
  
  def parent_enum
    Page.where.not(id: id).map { |p| [ p.name, p.id ] }
  end
  
end
