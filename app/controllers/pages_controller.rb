class PagesController < ApplicationController
   before_filter :find_page, only: [:show]

  def show
  end
  
  def index
    @page ||= Page.find_by_slug('about-us')
    render :show
  end
  
  private
    def find_page
      @page ||= Page.find_by_slug(params[:id])
    end
    helper_method :page
end
