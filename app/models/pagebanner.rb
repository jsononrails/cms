class Pagebanner < ActiveRecord::Base
  belongs_to :page
  belongs_to :banner, class_name: Ckeditor::Banner
end
