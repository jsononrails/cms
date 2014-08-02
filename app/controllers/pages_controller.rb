class PagesController < ApplicationController
   before_filter :find_page, only: [:show]

  def show
  end
  
  def index
    @home ||= Page.find_by_slug('home')
    @home_children ||= @home.children
    @page ||= Page.find_by_slug('about-us')
    render :show
  end
  
  private
    def find_page
      @home ||= Page.find_by_slug('home')
      @home_children ||= @home.children
      @page ||= Page.find_by_slug(params[:id])
    end
    helper_method :page
end
