class PoemService

  def self.poem_information(author)
    poem_response = conn.get("/author/#{author}")
    JSON.parse(poem_response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://poetrydb.org")
  end

end
