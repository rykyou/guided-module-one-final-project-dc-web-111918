class Cli
 #place where we write methods relating to interface of our app

  attr_writer :user_list

#acts as reader method of @user_list if it is not empty. If empty, set @user_list to empty array
  def user_list
    @user_list ||= []
  end

#greeting user and asking what they would like to do
  def start
    puts ""
    puts ""
    puts <<-'EOF'

           _    _      _ _          _____ _                                 _
          | |  | |    | | |        / ____| |                               | |
          | |__| | ___| | | ___   | (___ | |__   ___  _ __  _ __   ___ _ __| |
          |  __  |/ _ \ | |/ _ \   \___ \| '_ \ / _ \| '_ \| '_ \ / _ \ '__| |
          | |  | |  __/ | | (_) |  ____) | | | | (_) | |_) | |_) |  __/ |  |_|
          |_|  |_|\___|_|_|\___/  |_____/|_| |_|\___/| .__/| .__/ \___|_|  (_)
                                                     | |   | |
                                                     |_|   |_|

    EOF
    puts "------------------------------------------------------------------------------------------"
    puts "List out what you need to buy and we'll help you figure out which store you need to go to!"
    puts ""
    puts ""
    puts "     _________________________________________________________________________________"
    puts "    |After each item, hit 'return/enter' before proceeding on to the next item.       |"
    puts "    |                                                                                 |"
    puts "    |Type in 'done' when you are finished and would like to see your completed list.  |"
    puts "    |                                                                                 |"
    puts "    |Type 'exit' when you would like to leave the app.                                |"
    puts "     ---------------------------------------------------------------------------------"
    puts ""
    puts ""
    puts ""
    puts "What do you need to get?"
    puts "------------------------"
    self.get_user_items
  end

#responding to user's input and directing them where they want to go.
  def get_user_items
    user_response = gets.strip.downcase
    puts ""
    if user_response == "done"
      self.sort_list(self.user_list)
      self.suggestion_of_stores
    elsif user_response == "exit"
      abort
    else
      current_item = Item.find_by(name: user_response)
      if current_item
        self.user_list << current_item
        self.get_user_items
      else
        puts "<Invalid item, please try again.>"
        puts ""
        self.get_user_items
      end
    end
  end

#reconstructs array of item objects into new array that looks like [store_obj, [item_obj, item_obj]], [store_obj], [item_obj]]
# @user_list is reset to be this new array so it can be used as oragnized collection that can be indexed
  def sort_list(items_array)
    stores_items_hash = {}
    items_array.each do |item_obj|
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

#lists out suggestions for stores in order and gives option to see list for a store
  def suggestion_of_stores
    puts ""
    puts ""
    puts ""
    puts ""
    puts "Here's our suggestion of stores that have the item(s) you're looking for"
    puts "ordered so the stores at the top of the list have more of the items you need:"
    puts "--------------------------------------------------------------------------------"
    counter = 0
    self.user_list.each do |store, v|
      counter += 1
      puts "#{counter}. #{store.name.upcase}"
    end
    puts ""
    puts "Enter number to see each store's list:"
    self.list_for_chosen_store
  end

#outputs list for store that was chosen
  def list_for_chosen_store
    user_input = gets.strip.to_i
    if user_input == 0 || user_input > self.user_list.size
      puts ""
      puts "<Must be a number on the list. Please try again.>"
      self.list_for_chosen_store
    else
      user_input -= 1
      current_store = self.user_list[user_input][0].name
      items_array = self.user_list[user_input][1]
      puts ""
      puts ""
      puts ""
      puts ""
      puts ""
      puts "#{current_store.upcase}:"
      puts "-----------------------"
      #displays list of items under store
      counter = 0
      items_array.each do |item_obj|
        counter += 1
        puts "#{counter}. #{item_obj.name}"
      end
    end
    self.options
  end

#provides user with options of what to do and does what user specifies
  def options
    puts " __________________________________________________"
    puts "|Type one of the following:                        |"
    puts "|  'back' to go back to the list of stores         |"
    puts "|  'menu' to go back to create a new shopping list |"
    puts "|  'exit' to exit the app                          |"
    puts " --------------------------------------------------"
    user_input = gets.strip
    if user_input == "back"
      self.suggestion_of_stores
    elsif user_input == "menu"
      self.user_list = []
      self.start
    elsif user_input == "exit"
      abort
    else
      puts ""
      puts "<Invalid option. Try again!>"
      self.options
    end
  end

end
