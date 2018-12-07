Item.destroy_all
Store.destroy_all

petco = Store.find_or_create_by(name: "petco")
bestbuy = Store.find_or_create_by(name: "best buy")
wholefoods = Store.find_or_create_by(name: "whole foods")
dicks = Store.find_or_create_by(name: "dicks sporting goods")
target = Store.find_or_create_by(name: "target")


milk = Item.find_or_create_by(name: "milk")
organic_granola = Item.find_or_create_by(name: "organic granola")
free_range_eggs = Item.find_or_create_by(name: "free range eggs")
bread = Item.find_or_create_by(name: "bread")

tv = Item.find_or_create_by(name: "tv")
smart_watch = Item.find_or_create_by(name: "smart watch")
phone_charger = Item.find_or_create_by(name: "phone charger")
video_game = Item.find_or_create_by(name: "video game")

football = Item.find_or_create_by(name: "football")
golf_club = Item.find_or_create_by(name: "golf club")
baseball = Item.find_or_create_by(name: "baseball")

toothbrush = Item.find_or_create_by(name: "toothbrush")
candy = Item.find_or_create_by(name: "candy")
soda = Item.find_or_create_by(name: "soda")

dog_food = Item.find_or_create_by(name: "dog food")
litterbox = Item.find_or_create_by(name: "litterbox")
leash = Item.find_or_create_by(name: "leash")

[video_game, tv, smart_watch, phone_charger].each do |product|
  StoreItem.find_or_create_by(store: bestbuy, item: product)
end

[dog_food, litterbox, leash].each do |product|
  StoreItem.create(store: petco, item: product)
end

[bread, milk, organic_granola, free_range_eggs, candy, soda, toothbrush, dog_food].each do |product|
  StoreItem.create(store: wholefoods, item: product)
end

[football, golf_club, baseball, smart_watch].each do |product|
  StoreItem.create(store: dicks, item: product)
end

[video_game, bread, milk, tv, smart_watch, phone_charger, football, toothbrush, candy, soda, leash].each do |product|
  StoreItem.create(store: target, item: product)
end
