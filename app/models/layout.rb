class Layout < ActiveRecord::Base
  has_many :pages, inverse_of: :layout
  
  validates :layout, presence: true
  
  def select_layout
    self.layout
  end
end
