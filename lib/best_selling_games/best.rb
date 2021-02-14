class BestSellingGames::Best
  attr_accessor :name, :copies_sold, :platform

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.best_list
    @@all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name}"
    end
  end

  def self.best_scrape
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_best-selling_video_games"))
  end

  def self.best_elements
    self.best_scrape.css("table.wikitable tbody tr")
  end

  def self.best_array
    @nu_array = []
    self.best_elements.each do |a|
      b = a.text.split("\n\n")
      @nu_array << b
    end
    @nu_array.shift
    @nu_array
  end

  def self.make_best
    self.best_array.each do |a|
      best = BestSellingGames::Best.new
      best.name = a[1]
      best.copies_sold = a[2]
      best.platform = a[3]
    end
    @@all[49]
  end

end
