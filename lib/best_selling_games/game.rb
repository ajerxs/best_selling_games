class BestSellingGames::Game
  attr_accessor :title, :sales, :platform, :release, :developer, :publisher, :number, :as_of, :model

  @@best_games = []
  @@most_games = []

  def self.make_best
    BestSellingGames::Scraper.best.each do |game|
      best = self.new
      best.title = game[0].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.sales = game[1].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.platform = game[2].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.release = game[3].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.developer = game[4].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.publisher = game[5].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      @@best_games << best
  end

  def self.make_most
    BestSellingGames::Scraper.most.each do |game|
      most = self.new
      most.title = game[0].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.number = game[1].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.as_of = game[2].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.model = game[3].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.release = game[4].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.publisher = game[5].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      @@most_games << most
  end

  def self.best_games
    @@best_games
  end

  def self.most_games
    @@most_games
  end

end
