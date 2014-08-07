class Ckeditor::Picture < Ckeditor::Asset
  mount_uploader :data, CkeditorPictureUploader, :mount_on => :data_file_name
  
  # page association
  has_many :pages
  
  def url_content
    url(:content)
  end
  
  def select_title
    self.title
  end
end
