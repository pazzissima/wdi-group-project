module SearchHelper

  def search_by_title(search_string)
    search = Clip.search do
      fulltext(search_string) do
        fields(:title)
      end
    end

    search.results
  end

  def search_by_content(search_string)
    search = Clip.search do
      fulltext(search_string) do
        fields(:transcript)
      end
    end
    search.results
  end



end
