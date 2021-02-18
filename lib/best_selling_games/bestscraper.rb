class BestSellingGames::Bestscraper

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
    @nu_array.each do |d|
      if d[0].to_i >= 1
        d.shift
      end
    end
    @nu_array
  end

  def self.make_best
    self.best_array.each do |a|
      best = BestSellingGames::Best.new
      best.title = a[0].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.sales = a[1].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.platform = a[2].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.release = a[3].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.developer = a[4].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best.publisher = a[5].gsub("\n", "").gsub(/\[[a-z]\]/, "")
      best
    end
  end

end
