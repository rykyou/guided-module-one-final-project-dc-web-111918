require 'pry'

class Cli

  #place where we write methods relating to interface of our app

  def user_list
    @user_list ||= []
  end

  def start
    puts "Hello Shopper! List out what you need to buy and we'll help you figure out which store you need to go to."
    puts "After each item, hit 'return/enter' before proceeding on to the next item."
    puts "Type in 'done' when you are finished and would like to see your completed list."
    puts "Type 'exit' when you would like to leave the app."
    # puts Item.first.name
    self.get_user_input
  end

  def get_user_input
    user_response = gets.strip.downcase
    if user_response == "done"
      self.sort_list(self.user_list)
      puts "Here is your list:"
      user_list.collect {|user_item| puts user_item.name }


    elsif user_response == "exit"
      abort
    else
      current_item = Item.find_by(name: "#{user_response}")
      if current_item
        self.user_list << current_item
        self.get_user_input
      else
        puts "Invalid item, please try again."
        self.get_user_input
      end
    end
  end

  def sort_list(array)
    hash = Hash.new(0)
    new_array = array.collect {|item_obj| item_obj.stores }
    binding.pry
    new_array.each do |stores_for_an_item|
      stores_for_an_item.each { |store| hash[store] += 1 }
    end
    binding.pry
  end




end
