class Layout < ActiveRecord::Base
  has_many :pages, inverse_of: :layout
  
  def select_layout
    self.layout
  end
end
