class SearchController < ApplicationController

  def new
  end

  def create
    search_string = params.require(:search).permit(:search_string)[:search_string]
    @title_results = search_by_title(search_string)
    @content_results = search_by_content(search_string)
    render :results
  end

end
