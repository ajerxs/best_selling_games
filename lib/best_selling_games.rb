require_relative "./best_selling_games/version"
require_relative "./best_selling_games/cli"
require_relative "./best_selling_games/best"
require_relative "./best_selling_games/most"

require "pry"
require "nokogiri"
require "open-uri"
require "colorize"

module BestSellingGames
  class Error < StandardError; end
  # Your code goes here...
end
