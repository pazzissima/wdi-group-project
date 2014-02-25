module SearchHelper

  def search_by_title(search_string)
    Clip.search { fulltext search_string }.results
  end

end
