class BestSellingGames::CLI

  def call
    puts "Let's look for some popular games!"
    select_list
  end

  def select_list
    puts "Enter the number of the list would you like to display:"
    puts "1. Best-Selling Video Games"
    puts "2. Most-Played Video Games by Player Count"
  end

end
