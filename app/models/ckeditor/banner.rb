class Ckeditor::Banner < Ckeditor::Asset
  mount_uploader :data, CkeditorBannerUploader, :mount_on => :data_file_name
  def url_content
    url(:content)
  end
end
