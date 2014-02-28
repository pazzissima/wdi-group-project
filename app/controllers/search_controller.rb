class SearchController < ApplicationController

  def new
  end

  def create
    search_string = params.require(:search_string)
    @title_results = search_by_clip_field(search_string, :title)
    @content_results = search_by_clip_field(search_string, :transcript)
    @tag_results = search_by_tags(search_string).map { |t| t.clip }
    render :results
  end

end
