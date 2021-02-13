class BestSellingGames::Best
  attr_accessor :name

  def self.best_list
    best_games = []

    best_games << best_scrape

    best_games
  end

  def self.best_scrape
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_best-selling_video_games"))
    nu_array = []
    things = doc.css("table.wikitable tbody tr").each do |a|
      b = a.text
      nu_array << b
    end
    nu_array.shift
    nu_array
    # things.gsub(/\n/, ',')
  end

end
