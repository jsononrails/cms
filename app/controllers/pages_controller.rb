class PagesController < ApplicationController
   before_filter :find_page, only: [:show]

  def show
  end
  
  def index
    @site ||= Site.find_by_name('Sault Sports Medicine')
    @home ||= Page.find_by_slug('home')
    @home_children ||= @home.children.order("position ASC")
    @page ||= Page.find_by_slug('about-us')
    @page_children ||= @page.children.order("position ASC")
    @layout ||= @page.layout ? "layouts/#{@page.layout.layout}".downcase : "layouts/application"
    @footer_about ||= Page.where("name = ? AND is_published = ?", "About Sault Sports Medicine", true).take
    @footer_contact_info ||= Page.where("name = ? AND is_published = ?", "Contact Information", true).take
    render :show
  end
  
  private
    def find_page
      @site ||= Site.find_by_name('Sault Sports Medicine')
      @home ||= Page.find_by_slug('home')
      @home_children ||= @home.children.order("position ASC")
      @page ||= Page.find_by_slug(params[:id])
      
      if !@page
        @page = Page.find_by_slug("error-404")
      end
      
      @page_children ||= @page.children.order("position ASC")
      @layout ||= @page.layout ? "layouts/#{@page.layout.layout}".downcase : "layouts/application"
      @footer_about ||= Page.where("name = ? AND is_published = ?", "About Sault Sports Medicine", true).take
      @footer_contact_info ||= Page.where("name = ? AND is_published = ?", "Contact Information", true).take
    end
    helper_method :page
end
