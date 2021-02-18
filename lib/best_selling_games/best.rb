class BestSellingGames::Best
  attr_accessor :title, :sales, :platform, :release, :developer, :publisher

  @@all = []

  def self.all
    @@all << self.make_best
    @@all.pop
    @@all
  end

  def self.reset
    @@all.clear
  end

  def self.best_scrape
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_best-selling_video_games"))
  end

  def self.best_elements
    self.best_scrape.css("table.wikitable tbody tr")
  end

  def self.best_array
    @nu_array = []
    self.best_elements.each do |element|
      split = element.text.split("\n\n")
      @nu_array << split
    end
    @nu_array.shift
    @nu_array.each do |game|
      if game[0].to_i >= 1
        game.shift
      end
    end
    @nu_array
  end

  def self.make_best
    self.best_array.each do |game|
      best = self.new
      best.title = game[0].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.sales = game[1].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.platform = game[2].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.release = game[3].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.developer = game[4].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.publisher = game[5].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      @@all << best
    end
  end

end
