class Layout < ActiveRecord::Base
  has_many :pages, inverse_of: :layout
end
