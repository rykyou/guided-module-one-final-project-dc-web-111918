
class Cli
 #place where we write methods relating to interface of our app
 attr_writer :user_list

  def user_list
    @user_list ||= []
  end

  def start
    puts "Hello Shopper! List out what you need to buy and we’ll help you figure out which store you need to go to."
    puts "After each item, hit ‘return/enter’ before proceeding on to the next item."
    puts "Type in ‘done’ when you are finished and would like to see your completed list."
    puts "Type ‘exit’ when you would like to leave the app."
    self.get_user_input
  end

  def get_user_input
    user_response = gets.strip.downcase
    if user_response == "done"
      self.user_done

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
    store_items_hash = {}
    array_of_items = array.collect do |item_obj|
      binding.pry
      # item_obj.each do |storeitem|
      # #   binding.pry
      # #   storeitem.each { |store| }
      # end
    end
    x = new_array
  end

  def user_done
   # priority_store = user_sorted_hash.key(user_sorted_hash.values.max)
    puts "It looks like most of your items can be found at #{self.sort_list(self.user_list).keys.first.name}"
    puts "To see your list of items, choose a store by its number:"
    counter = 0
    self.sort_list(self.user_list).each do |store, v|
      counter += 1
      puts "#{counter}. #{store.name}"
    end
    self.list_of_store
  end

  def list_of_store
   puts "Enter number:"
   user_input = gets.strip
   if user_input == "1"

   end
  end

end

#picks out best store for user to go to:
# new_hash = hash.key(hash.values.max)
