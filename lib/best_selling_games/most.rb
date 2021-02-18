class BestSellingGames::Most
  attr_accessor :title, :number, :as_of, :model, :release, :publisher

  @@all = []

  def self.all
    @@all << self.make_most
    @@all.pop
    @@all
  end

  def self.reset
    @@all.clear
  end

  def self.most_scrape
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_most-played_video_games_by_player_count"))
  end

  def self.most_elements
    self.most_scrape.css("table.wikitable tbody tr")
  end

  def self.most_array
    @nu_array = []
    self.most_elements.each do |a|
      b = a.text.split("\n\n")
      @nu_array << b
    end
    @nu_array.shift
    @nu_array
  end

  def self.make_most
    self.most_array.each do |a|
      most = self.new
      most.title = a[0].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.number = a[1].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.as_of = a[2].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.model = a[3].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.release = a[4].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      most.publisher = a[5].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      @@all << most
    end
  end

end
