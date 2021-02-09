class BestSellingGames::Best
  attr_accessor :name

  def self.best_list
    best_games = []

    best_games << best_scrape

    best_games
  end

  def self.best_scrape
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_best-selling_video_games"))
    things = doc.css("tr td i").each.with_index(1) do |a, i|
      puts "#{i}. #{a.text}"
    end
  end

end
