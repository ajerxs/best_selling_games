class BestSellingGames::Best
  attr_accessor :rank, :name, :copies_sold, :platform

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

  def self.first_array
    @nu_array = []
    self.best_elements.each do |a|
      b = a.text.split("\n\n")
      @nu_array << b
    end
    @nu_array.shift
    @nu_array.each do |d|
      if d[0].to_i >= 1
        d.shift
      end
    end
    @nu_array
  end

  # def self.best_array
    # @bst_array = []
    # self.first_array.each do |a|
      # if a[0].to_i >= 1
        # self.first
    # end
    # @bst_array
  # end

  def self.make_best
    self.first_array.each do |a|
      best = BestSellingGames::Best.new
      best.name = a[0].gsub("\n", "")
      best.copies_sold = a[1].gsub("\n", "")
      best.platform = a[2].gsub("\n", "")
    end
    @@all[0]
  end

end
