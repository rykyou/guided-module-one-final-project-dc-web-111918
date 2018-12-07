class Cli
 #place where we write methods relating to interface of our app
 attr_writer :user_list

  def user_list
    @user_list ||= []
  end

#greeting user and asking what they could like to do.
  def start
    puts "Hello Shopper! List out what you need to buy and we'll help you figure out which store you need to go to."
    puts "After each item, hit 'return/enter' before proceeding on to the next item."
    puts "Type in 'done' when you are finished and would like to see your completed list."
    puts "Type 'exit' when you would like to leave the app."
    self.get_user_input
  end

#responding to user's input and directing them where they want to go.
  def get_user_input
    user_response = gets.strip.downcase
    if user_response == "done"
      self.sort_list(self.user_list)
      self.user_done
    elsif user_response == "exit"
      abort
    else
      current_item = Item.find_by(name: user_response)
      if current_item
        self.user_list << current_item
        self.get_user_input
      else
        puts "Invalid item, please try again."
        self.get_user_input
      end
    end
  end

#
  def sort_list(item_list)
    #return an array of arrays that looks like [store_obj, [item_obj, item_obj]], [store_obj], [item_obj, item_obj]]
    # byebug
    stores_items_hash = {}
    item_list.each do |item_obj|
      item_obj.stores.each do |store_obj|
        if stores_items_hash[store_obj]
          stores_items_hash[store_obj] << item_obj
        else
          stores_items_hash[store_obj] = []
          stores_items_hash[store_obj] << item_obj
        end
      end
    end
    self.user_list = stores_items_hash.sort_by{|k,v| v.length}.reverse
  end

  def user_done
    puts "Here's our suggestions for stores that have the item(s) you're looking for:"
    counter = 0
    self.user_list.each do |store, v|
      counter += 1
      puts "#{counter}. #{store.name.upcase}"
    end
    self.list_of_store
  end

  def list_of_store
    puts "Enter number to see each store's list:"
    user_input = gets.strip.to_i
    if user_input == 0
      puts "Must be a number on the list. Please try again."
      self.list_of_store
    elsif user_input > self.user_list.size
      puts "Must be a number on the list. Please try again."

      self.list_of_store
    else
      user_input -= 1
      current_store = self.user_list[user_input][0].name
      items_array = self.user_list[user_input][1]
      puts "#{current_store.upcase}:"
      puts "-----------------------"
      #displays list of items under store
      counter = 0
      items_array.each do |item_obj|
        counter += 1
        puts "#{counter}. #{item_obj.name}"
      end
      # puts ""
    end
    self.back_to_stores
  end


  def back_to_stores
    puts "Type 'back' to go back to the list of stores, 'menu' to go back to main menu of app or press 'exit' to exit app."
    user_input = gets.strip
    if user_input == "back"
      self.user_done
      # counter = 0
      # self.user_list.each do |store, v|
      #   counter += 1
      #   puts "#{counter}. #{store.name.upcase}"
      #   self.list_of_store
    elsif user_input == "menu"
      self.user_list = []
      self.start
    else
      abort
    end
  end

end

#picks out best store for user to go to:
# new_hash = hash.key(hash.values.max)
