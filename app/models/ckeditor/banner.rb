class Ckeditor::Banner < Ckeditor::Asset
  
  has_many :pagebanners, dependent: :destroy
  has_many :pages, through: :pagebanners
  
  mount_uploader :data, CkeditorBannerUploader, :mount_on => :data_file_name
  def url_content
    url(:content)
  end
end
