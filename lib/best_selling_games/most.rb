class BestSellingGames::Most
  attr_accessor :title, :number, :as_of, :model, :release, :publisher

  @@all

  def self.all

  end

  def self.reset

  end

  def self.most_scrape
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_most-played_video_games_by_player_count"))
  end

  def self.most_elements
    self.most_scrape.css("table.wikitable tbody tr")
  end

  def self.most_array
    @nu_array = []
    self.most_elements.each do |a|
      b = a.text.split("\n\n")
      @nu_array << b
    end
    @nu_array.shift
    @nu_array[0]
  end


end
