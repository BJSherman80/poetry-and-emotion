class Poem
  attr_reader :title, :lines
  def initialize(poem_data)
    @tite = poem_data[:title]
    @lines = poem_data[:lines]
  end
end
