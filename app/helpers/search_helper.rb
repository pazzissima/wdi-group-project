module SearchHelper

  def search_by_clip_field(search_string, field_symbol)
    search = Clip.search do
      fulltext(search_string) do
        fields(field_symbol)
      end
    end

    search.results
  end

  def search_by_tags(search_string)
    search = Tag.search { fulltext(search_string) }
    search.results
  end

end
