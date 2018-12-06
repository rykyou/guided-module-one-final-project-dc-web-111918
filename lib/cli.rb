require 'pry'

class Cli

  #place where we write methods relating to interface of our app

  def user_list
    @user_list ||= []
  end

  def user_sorted_hash
    @user_sorted_hash ||= Hash.new(0)
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
      self.user_done
      # self.sort_list(self.user_list)
      # puts "Here is your list:"
      # user_list.collect {|user_item| puts user_item.name }
      #

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
    new_array = array.collect {|item_obj| item_obj.stores }
    new_array.each do |stores_for_an_item|
      stores_for_an_item.each { |store| self.user_sorted_hash[store] += 1 }
    end
    self.user_sorted_hash
  end

  def user_done
    self.sort_list(self.user_list)
    priority_store = user_sorted_hash.key(user_sorted_hash.values.max)
    puts "It looks like most of your items can be found at #{priority_store.name}"
    puts "To see your list of items, choose a store by its number:"
    counter = 0
    user_sorted_hash.each do |store, v|
      counter += 1
      puts "#{counter}. #{store.name}"
    end
     # user_list.collect {|user_item| puts user_item.name }
  end






end
