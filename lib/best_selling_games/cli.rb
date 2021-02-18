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
      puts "Here's a list of the most-played video games of all time:"
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
      puts "#{BestSellingGames::Best.all[input - 1].title}"
      puts "  Copies Sold: #{BestSellingGames::Best.all[input - 1].sales}"
      puts "  Platform: #{BestSellingGames::Best.all[input - 1].platform}"
      puts "  Initial Release Date: #{BestSellingGames::Best.all[input - 1].release}"
      puts "  Developer: #{BestSellingGames::Best.all[input - 1].developer}"
      puts "  Publisher: #{BestSellingGames::Best.all[input - 1].publisher}"
      puts "Did you want to pick another game or go back?"
      find_best
    elsif input == 0
      BestSellingGames::Best.reset
      select_list
    else
      puts "Sorry, I didn't quite get that!"
    end
  end

end
