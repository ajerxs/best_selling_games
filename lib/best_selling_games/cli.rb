class BestSellingGames::CLI

  def call
    puts "Let's look for some popular games!"
    select_list
  end

  def select_list
    puts "Enter the number of the list would you like to display or type 'exit' to quit:"
    puts "1. Best-Selling Video Games"
    puts "2. Most-Played Video Games by Player Count"
    input = gets.strip.downcase
    if input == "1"
      best_list
      find_best
    elsif input == "2"
      most_list
      find_most
    elsif input == "exit"
      puts "See you later!"
    else
      puts "Sorry, I didn't quite get that!"
      select_list
    end
  end

  def best_list
    puts "Here's a list of the best-selling video games of all time in order of sales:"
    BestSellingGames::Best.all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
    puts "If you would like more information on a game, type the number of its rank!"
    puts "If you would like to go back, type the number '0'!"
  end

  def find_best
    input = gets.strip.downcase.to_i
    if input >= 1
      puts "#{BestSellingGames::Best.all[input - 1].title.colorize(:red)}"
      puts "  Copies Sold: #{BestSellingGames::Best.all[input - 1].sales.colorize(:blue)}"
      puts "  Platform: #{BestSellingGames::Best.all[input - 1].platform.colorize(:blue)}"
      puts "  Initial Release Date: #{BestSellingGames::Best.all[input - 1].release.colorize(:blue)}"
      puts "  Developer: #{BestSellingGames::Best.all[input - 1].developer.colorize(:blue)}"
      puts "  Publisher: #{BestSellingGames::Best.all[input - 1].publisher.colorize(:blue)}"
      puts "Did you want to pick another game or go back?"
      find_best
    elsif input == 0
      BestSellingGames::Best.reset
      select_list
    end
  end

  def most_list
    puts "Here's a list of the most-played video games of all time:"
    BestSellingGames::Most.all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
    puts "If you would like more information on a game, type the number of its rank!"
    puts "If you would like to go back, type the number '0'!"
  end

  def find_most
    input = gets.strip.downcase.to_i
    if input >= 1
      puts "#{BestSellingGames::Most.all[input - 1].title.colorize(:red)}"
      puts "  Player Count: #{BestSellingGames::Most.all[input - 1].number.colorize(:blue)}"
      puts "  As of: #{BestSellingGames::Most.all[input - 1].as_of.colorize(:blue)}"
      puts "  Business Model: #{BestSellingGames::Most.all[input - 1].model.colorize(:blue)}"
      puts "  Release Date: #{BestSellingGames::Most.all[input - 1].release.colorize(:blue)}"
      puts "  Publisher: #{BestSellingGames::Most.all[input - 1].publisher.colorize(:blue)}"
      puts "Did you want to pick another game or go back?"
      find_most
    elsif input == 0
      BestSellingGames::Most.reset
      select_list
    end
  end

end
