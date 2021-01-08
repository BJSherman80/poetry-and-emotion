class SearchController < ApplicationController

  def index
      @poems = SearchFacade.fetch_poem_data(params[:author])
      # poem_conn = Faraday.new(url: "https://poetrydb.org")
      # poem_response = poem_conn.get("/author/#{params[:author]}")
      # poem_parsed = JSON.parse(poem_response.body, symbolize_names: true)
      #
      # def fetch_poem_data(poem_parsed)
      #     poem_parsed.map do |data|
      #     Poem.new(data)
      #   end
      # end
      #
      # @poems = fetch_poem_data(poem_parsed)

      poem = @poems.first.lines

      ibm_conn = Faraday.new(url: "https://api.us-south.tone-analyzer.watson.cloud.ibm.com") do |faraday|
        faraday.basic_auth('apikey', ENV['API_KEY'])
      end
      ibm_response = ibm_conn.get("/instances/d077d333-99fc-462d-94a7-b25ee901dc19/v3/tone?version=2017-09-21&text=#{poem}")
      ibm_parsed = JSON.parse(ibm_response.body, symbolize_names: true)
    binding.pry
  end
end
