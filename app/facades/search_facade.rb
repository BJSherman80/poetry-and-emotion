class SearchFacade

  def self.fetch_poem_data(author)
    poem_data = PoemService.poem_information(author)

    poem_data.map do |data|
      Poem.new(data)
    end
  end

  def self.fetch_ibm_data(poem)
    ibm_data = ItemService.poem_information(poem)

    end
  end
end
