class BestSellingGames::Best
  attr_accessor :title, :sales, :platform, :release, :developer, :publisher

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.best_list
    @@all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
    "done"
  end

end
