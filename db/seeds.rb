Item.destroy_all
Store.destroy_all

petco = Store.find_or_create_by(name: "petco")
bestbuy = Store.find_or_create_by(name: "best buy")
wholefoods = Store.find_or_create_by(name: "whole foods")
dicks = Store.find_or_create_by(name: "dicks sporting goods")
target = Store.find_or_create_by(name: "target")
walgreens = Store.find_or_create_by(name: "walgreens")

milk = Item.find_or_create_by(name: "milk")
organic_granola = Item.find_or_create_by(name: "organic granola")
free_range_eggs = Item.find_or_create_by(name: "free range eggs")
bread = Item.find_or_create_by(name: "bread")
cereal = Item.find_or_create_by(name: "cereal")
organic_fruit = Item.find_or_create_by(name: "organic fruit")
steak = Item.find_or_create_by(name: "steak")
cookies = Item.find_or_create_by(name: "cookies")
ice_cream = Item.find_or_create_by(name: "ice cream")
cheese = Item.find_or_create_by(name: "cheese")

tv = Item.find_or_create_by(name: "tv")
smart_watch = Item.find_or_create_by(name: "smart watch")
phone_charger = Item.find_or_create_by(name: "phone charger")
video_game = Item.find_or_create_by(name: "video game")
laptop = Item.find_or_create_by(name: "laptop")
phone_case = Item.find_or_create_by(name: "phone case")
printer = Item.find_or_create_by(name: "printer")
drone = Item.find_or_create_by(name: "drone")
headphones = Item.find_or_create_by(name: "headphones")
camera = Item.find_or_create_by(name: "camera")

football = Item.find_or_create_by(name: "football")
golf_club = Item.find_or_create_by(name: "golf club")
baseball = Item.find_or_create_by(name: "baseball")
basketball = Item.find_or_create_by(name: "basketball")
shoes = Item.find_or_create_by(name: "shoes")
shirt = Item.find_or_create_by(name: "shirt")
bat = Item.find_or_create_by(name: "bat")
gloves = Item.find_or_create_by(name: "gloves")
net = Item.find_or_create_by(name: "net")
weights = Item.find_or_create_by(name: "weights")
backpack = Item.find_or_create_by(name: "backpack")

toothbrush = Item.find_or_create_by(name: "toothbrush")
candy = Item.find_or_create_by(name: "candy")
soda = Item.find_or_create_by(name: "soda")
medicine = Item.find_or_create_by(name: "medicine")
makeup = Item.find_or_create_by(name: "makeup")
scissors = Item.find_or_create_by(name: "scissors")
chips = Item.find_or_create_by(name: "chips")
toothpaste = Item.find_or_create_by(name: "toothpaste")

dog_food = Item.find_or_create_by(name: "dog food")
litterbox = Item.find_or_create_by(name: "litterbox")
leash = Item.find_or_create_by(name: "leash")
cat_food = Item.find_or_create_by(name: "cat food")
cage = Item.find_or_create_by(name: "cage")
pet_toys = Item.find_or_create_by(name: "pet toys")


[printer, drone, headphones, camera, laptop, phone_case, video_game, tv, smart_watch, phone_charger].each do |product|
  StoreItem.find_or_create_by(store: bestbuy, item: product)
end

[cat_food, cage, pet_toys, dog_food, litterbox, leash].each do |product|
  StoreItem.create(store: petco, item: product)
end

[makeup, chips, toothpaste, steak, cookies, ice_cream, cheese, organic_fruit, cereal, bread, milk, organic_granola, free_range_eggs, candy, soda, toothbrush, dog_food].each do |product|
  StoreItem.create(store: wholefoods, item: product)
end

[shirt, shoes, bat, gloves, net, weights, backpack, basketball, football, golf_club, baseball, smart_watch].each do |product|
  StoreItem.create(store: dicks, item: product)
end

[shirt, cat_food, dog_food, makeup, medicine, chips, toothpaste, shoes, backpack, gloves, laptop, headphones, camera, cookies, ice_cream, cheese, cereal, video_game, bread, milk, tv, smart_watch, phone_charger, football, toothbrush, candy, soda, leash].each do |product|
  StoreItem.create(store: target, item: product)
end

[makeup, medicine, chips, toothpaste, toothbrush, headphones, ice_cream, cookies, soda, candy].each do |product|
  StoreItem.find_or_create_by(store: walgreens, item: product)
end
