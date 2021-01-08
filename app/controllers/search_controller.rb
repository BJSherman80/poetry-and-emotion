class SearchController < ApplicationController


  def index
      poem_conn = Faraday.new(url: "https://poetrydb.org")
      poem_response = poem_conn.get("/author/#{params[:author]}")
      poem_parsed = JSON.parse(poem_response.body, symbolize_names: true)

      def fetch_poem_data(poem_parsed)
        poem_parsed.map do |data|
        Poem.new(data)
      end
    end

    @poems = fetch_poem_data(poem_parsed)

  end
end
