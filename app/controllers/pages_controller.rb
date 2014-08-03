class PagesController < ApplicationController
   before_filter :find_page, only: [:show]

  def show
  end
  
  def index
    @home ||= Page.find_by_slug('home')
    @home_children ||= @home.children
    @page ||= Page.find_by_slug('about-us')
    @layout ||= @page.layout ? "layouts/#{@page.layout.layout}".downcase : "layouts/application"
    render :show
  end
  
  private
    def find_page
      @home ||= Page.find_by_slug('home')
      @home_children ||= @home.children
      @page ||= Page.find_by_slug(params[:id])
      @layout ||= @page.layout ? "layouts/#{@page.layout.layout}".downcase : "layouts/application"
    end
    helper_method :page
end
