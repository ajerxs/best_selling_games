class BestSellingGames::CLI

  def call
    select_list
  end

  def select_list
    puts "Let's look for some popular games!"
    puts "Enter the number of the list would you like to display:"
    puts "1. Best-Selling Video Games"
    puts "2. Most-Played Video Games by Player Count"
    input = gets.strip.downcase
    if input == "1"
      BestSellingGames::Best.best_list
    elsif input == "2"
      puts "Here's a list of the most-played video games of all time:"
    elsif input == "exit"
      puts "See you later!"
    else
      puts "Sorry, I didn't quite get that!"
      select_list
    end
  end


end
