class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :assignments
  has_many :roles, through: :assignments
  
  # set auditing
  has_paper_trail
end
