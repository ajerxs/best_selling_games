class BestSellingGames::Scraper

  attr_accessor :type

  @@best = []
  @@most = []

  def self.scrape_games(type, url)
    doc = Nokogiri::HTML(open(url))
    table = doc.css("table.wikitable tbody tr")
    table.each do |element|
      split = element.text.split("\n\n")
      if type = best
        @@best << split
      elsif type = most
        @@most << split
      end
    end
    if type = best
      @@best.shift
    elsif type = most
      @@most.shift
    end
  end

  def self.best
    @@best
  end

  def self.most
    @@most
  end

end
