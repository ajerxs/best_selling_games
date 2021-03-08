class BestSellingGames::Scraper

  @@best = []
  @@most = []

  def self.scrape_games(type, url)
    doc = Nokogiri::HTML(open(url))
    @table = doc.css("table.wikitable tbody tr")
    if type == "best"
      self.add_best
    elsif type == "most"
      self.add_most
    end
  end

  def self.add_best
    @table.each do |element|
      split = element.text.split("\n\n")
      @@best << split
    end
    @@best.shift
    @@best.each do |game|
      if game[0].to_i >= 1
        game.shift
      end
    end
  end

  def self.add_most
    @table.each do |game|
      split = game.text.split("\n\n")
      @@most << split
    end
    @@most.shift
    @@most
  end

  def self.best
    @@best
  end

  def self.most
    @@most
  end

end
