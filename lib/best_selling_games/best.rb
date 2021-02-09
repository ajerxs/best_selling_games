class BestSellingGames::Best

  def self.best_list
    best_games = []

    best_games << best_scrape

    best_games
  end

  def self.best_scrape
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_best-selling_video_games"))
    binding.pry
  end


end
