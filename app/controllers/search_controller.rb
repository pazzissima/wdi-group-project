class SearchController < ApplicationController

  def new
  end

  def create
    search_string = params.require(:search).permit(:search_string)[:search_string]
    @results = search_by_title(search_string)
    # binding.pry
    render :results
  end

end
