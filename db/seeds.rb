User.destroy_all
Garden.destroy_all
Zone.destroy_all
Element.destroy_all
Log.destroy_all
Product.destroy_all
Follow.destroy_all

puts "destroying ALL"

# Create 4 users
alexia = User.create!(admin: true, email: "alexia@gmail.com", password: "password", name: "alexia", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/uulvf4bsfdnfbnlzn5zl.jpg")
bruno = User.create!(admin: true, email: "bruno@gmail.com", password: "password", name: "bruno", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
damien = User.create!(admin: true, email: "damien@gmail.com", password: "password", name: "damien", remote_avatar_url: "https://avatars0.githubusercontent.com/u/37899667?v=4")
louisa = User.create!(admin: true, email: "louisa@gmail.com", password: "password", name: "louisa", remote_avatar_url: "https://avatars2.githubusercontent.com/u/13285082?v=4")
olivier = User.create!(admin: true, email: "olivier@gmail.com", password: "password", name: "olivier", remote_avatar_url: "https://avatars2.githubusercontent.com/u/13285082?v=4")
delphine = User.create!(admin: true, email: "delphine@gmail.com", password: "password", name: "delphine", remote_avatar_url: "https://avatars2.githubusercontent.com/u/13285082?v=4")

#worker = User.create!(admin: false, email: "worker@gmail.com", password: "password", name: "worker", avatar: "https://avatars2.githubusercontent.com/u/13285082?v=4")
juliette = User.create(admin: true, email: "juliette@gmail.com", password: "password", name: "juliette", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
denis = User.create(admin: true, email: "denis@gmail.com", password: "password", name: "denis", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
# Create 4 farms / gardens
ferme_de_quelenne = Garden.new(name: "Ferme maraîchère de Quélénesse", area: "4000",
  address: 'D918, 61290 Longny-au-Perche', latitude: 48.538352, longitude: 0.746001,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1506140006527-5ca84877d824.jpg')
ferme_de_quelenne.save!
bruno.garden = ferme_de_quelenne
bruno.save!

ferme_louley = Garden.new(name: "Ferme forestière Louley Médoc", area: "4000",
  address: "9 Rue du Dr Jean Vivares, 61290 Longny-au-Perche", latitude: 48.529327, longitude: 0.751545,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1499348287264-a2603bc210c9.jpg')
ferme_louley.save!
louisa.garden = ferme_louley
louisa.save!

maison_ane = Garden.new(name: "La maison de l'âne", area: "4000",
  address: "La Hutte, 61290 Longny-au-Perche", latitude: 48.543471, longitude: 0.714202,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528190395/photo-1441749074938-1c6782303919.jpg')
maison_ane.save!
alexia.garden = maison_ane
alexia.save!

champs = Garden.new(name: "L'envie des champs", area: "4000",
  address: "La Heslière, 61290 Longny-au-Perche", latitude: 48.530741, longitude: 0.784926,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528190395/photo-1444755303876-9cbab89f863c.jpg')
champs.save!
damien.garden = champs
damien.save!

bizou = Garden.new(name: "Bizou", area: "4000", address: "La Bellangerie, 61110 Moutiers-au-Perche", latitude: 48.494182, longitude: 0.834733,remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528187374/photo-1473973266408-ed4e27abdd47.jpg" )
bizou.save!
juliette.garden = bizou
juliette.save!

bonnePatate = Garden.new(name: "À La bonne patate", area: "4000", address: "La Ferme de Ronne, 61110 Moutiers-au-Perche", latitude: 48.451338, longitude: 0.826649,remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528187374/photo-1464684979825-ad6f2811cef2.jpg" )
bonnePatate.save!
denis.garden = bonnePatate
denis.save!

champi = Garden.new(name: "L'étang Chiot", area: "3020",
  address: "L'Étang Chiot, 61290 Longny-au-Perche", latitude: 48.546360, longitude: 0.730251,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528190394/photo-1471231681582-352356ab45a0.jpg')
champi.save!
olivier.garden = champi
olivier.save!

champil = Garden.new(name: "Moulin de la Vigne", area: "420",
  address: "Moulin de la Vigne, 61400 Feings", latitude: 48.546587, longitude: 0.688022,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528190394/photo-1521511263595-37aa9f9c6ea1.jpg')
champil.save!
delphine.garden = champil
delphine.save!

# Create 8 zones
Garden.all.each do |garden|
  zone = Zone.new(name: "Potager", area: "200", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
  zone.garden = garden
  zone.save!
end


a = Zone.new(name: "Aromates", area: "300", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
a.garden = ferme_de_quelenne
a.save


b = Zone.new(name: "Poulailler", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528036811/photo-1495696386015-f371820f82a6.jpg")
b.garden = ferme_de_quelenne
b.save

c = Zone.new(name: "Chevaux", area: "2500", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1511374322656-82cdd30150c9.jpg")
c.garden = ferme_de_quelenne
c.save

d = Zone.new(name: "Ruches", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1498936178812-4b2e558d2937.jpg")
d.garden = ferme_de_quelenne
d.save

e = Zone.new(name: "Verger", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1505872342847-6dbb5e76cd31.jpg")
e.garden = ferme_de_quelenne
e.save

f = Zone.new(name: "Vaches", area: "500", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1500595046743-cd271d694d30.jpg" )
f.garden = ferme_de_quelenne
f.save

g = Zone.new(name: "Moutons", area: "4000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1520644981554-74cd132a97e8.jpg")
g.garden = ferme_de_quelenne
g.save

h = Zone.new(name: "Cochons", area: "300", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1524317818500-ab1fded2ce81.jpg")
h.garden = ferme_de_quelenne
h.save

i = Zone.new(name: "Zone 6", area: "10")
i.garden = maison_ane
i.save

j = Zone.new(name: "Zone 7", area: "3")
j.garden = maison_ane
j.save

k = Zone.new(name: "Zone 8", area: "70")
k.garden = maison_ane
k.save

l = Zone.new(name: "Verger", area: "700")
l.garden = maison_ane
l.save

m = Zone.new(name: "Fruits", area: "30")
m.garden = maison_ane
m.save

n = Zone.new(name: "Ruches", area: "100")
n.garden = maison_ane
n.save

o = Zone.new(name: "Potager", area: "20")
o.garden = maison_ane
o.save

p = Zone.new(name: "Donkeys", area: "200")
p.garden = maison_ane
p.save


# Create 10 elements
Garden.all.each do |garden|
  carrot = Element.new(name: "Carrots", quantity: "300")
  carrot.zone = garden.zones.first
  carrot.save!
end

beetroot = Element.new(name: "Beetroot", quantity: "200")
beetroot.zone = a
beetroot.save

onion = Element.new(name: "Onion", quantity: "100")
onion.zone = a
onion.save

leek = Element.new(name: "Leek", quantity: "10")
leek.zone = a
leek.save

leeks = Element.new(name: "Leeks", quantity: "100")
leeks.zone = o
leeks.save

carrots = Element.new(name: "Carrots", quantity: "300")
carrots.zone = o
carrots.save

beetradish = Element.new(name: "Beetroot", quantity: "200")
beetradish.zone = o
beetradish.save

onions = Element.new(name: "Onion", quantity: "100")
onions.zone = o
onions.save

leeki = Element.new(name: "Leek", quantity: "10")
leeki.zone = n
leeki.save

bees = Element.new(name: "Bees", quantity: "10000")
bees.zone = m
bees.save

donkey = Element.new(name: "Donkey", quantity: "3")
donkey.zone = n
donkey.save

horses = Element.new(name: "Horse", quantity: "18")
horses.zone = c
horses.save

product1 = Product.new(quantity: 50, end_date: "15/06/2018")
product1.element = carrots
product1.save
product2 = Product.new(quantity: 100, end_date: "15/06/2018")
product2.element = beetradish
product2.save
product3 = Product.new(quantity: 50, end_date: "20/06/2018")
product3.element = leeks
product3.save
product4 = Product.new(quantity: 500, end_date: "23/09/2018")
product4.element = bees
product4.save
product5 = Product.new(quantity: 50, end_date: "15/07/2018")
product5.element = onions
product5.save
product6 = Product.new(quantity: 1, end_date: "25/08/2018")
product6.element = donkey
product6.save

# Create a few logs

3.times do
  log = Log.new(category: "sowing")
  log.user = alexia
  log.save!
  log_scope = LogScope.new
  log_scope.element = alexia.garden.zones.first.elements.first
  log_scope.log = log
  log_scope.save!
end

10.times do
  log = Log.new(category: "sowing")
  log.user = bruno
  log.save!
  log_scope = LogScope.new
  log_scope.element = bruno.garden.zones.first.elements.first
  log_scope.log = log
  log_scope.save!
end

20.times do
  log = Log.new(category: "sowing")
  log.user = louisa
  log.save!
  log_scope = LogScope.new
  log_scope.element = louisa.garden.zones.first.elements.first
  log_scope.log = log
  log_scope.save!
end



seedling = Log.new(category: "seed", description: "i did my work today, i'm happy", quantity: "100", status: false, date: '21/05/2018')
seedling.user = bruno
seedling.save

watering = Log.new(category: "maintenance", description: "watering the onions", status: false, date: '24/04/2018')
watering.user = bruno
watering.save

cutting = Log.new(category: "sowing", description: "cutting the dead branches", status: false, date: '24/03/2018')
cutting.user = bruno
cutting.save

digging = Log.new(category: "preparing soil", description: "preparing the soil", status: true, date: '24/02/2018')
digging.user = bruno
digging.save

feeding = Log.new(category: "preparing soil", description: "preparing the soil", status: true, date: '24/05/2018')
feeding.user = bruno
feeding.save


# create log_scope
scope1 = LogScope.new
log_id = seedling.id
scope1.element_id = leeki.id
scope1.save

scope2 = LogScope.new
scope2.log_id = watering.id
scope2.element_id = onion.id
scope2.save

scope3 = LogScope.new
scope3.log_id = cutting.id
scope3.element_id = carrots.id
scope3.save

carrot = Element.new(name: "Carrots", quantity: "300")
carrot.zone = a
carrot.save

beetroot = Element.new(name: "Beetroot", quantity: "200")
beetroot.zone = a
beetroot.save

onion = Element.new(name: "Onion", quantity: "100")
onion.zone = a
onion.save

leek = Element.new(name: "Leek", quantity: "10")
leek.zone = a
leek.save

leeks = Element.new(name: "Leeks", quantity: "100")
leeks.zone = o
leeks.save

carrots = Element.new(name: "Carrots", quantity: "300")
carrots.zone = o
carrots.save

beetradish = Element.new(name: "Beetroot", quantity: "200")
beetradish.zone = o
beetradish.save

onions = Element.new(name: "Onion", quantity: "100")
onions.zone = o
onions.save

leeki = Element.new(name: "Leek", quantity: "10")
leeki.zone = n
leeki.save

bees = Element.new(name: "Bees", quantity: "10000")
bees.zone = m
bees.save

donkey = Element.new(name: "Donkey", quantity: "3")
donkey.zone = n
donkey.save

horses = Element.new(name: "Horse", quantity: "18")
horses.zone = c
horses.save

#create 6 products for the share
product1 = Product.new(quantity: 50, end_date: "15/06/2018")
product1.element = carrots
product1.save
product2 = Product.new(quantity: 100, end_date: "15/06/2018")
product2.element = beetradish
product2.save
product3 = Product.new(quantity: 50, end_date: "20/06/2018")
product3.element = leeks
product3.save
product4 = Product.new(quantity: 500, end_date: "23/09/2018")
product4.element = bees
product4.save
product5 = Product.new(quantity: 50, end_date: "15/07/2018")
product5.element = onions
product5.save
product6 = Product.new(quantity: 1, end_date: "25/08/2018")
product6.element = donkey
product6.save

# Create a few logs
seedling = Log.new(category: "sowing", description: "i did my work today", status: false, date: '21/05/2018')
seedling.user = bruno
seedling.save

watering = Log.new(category: "watering", description: "watering the onions", status: false, date: '24/04/2018')
watering.user = bruno
watering.save

cutting = Log.new(category: "caring crops", description: "cutting the dead branches", status: false, date: '24/03/2018')
cutting.user = bruno
cutting.save

digging = Log.new(category: "preparing soil", description: "preparing the soil for transplant", status: true, date: '24/02/2018')
digging.user = bruno
digging.save

feeding = Log.new(category: "fertilisating", description: "fertilisating the carrots", status: false, date: '24/05/2018')
feeding.user = bruno
feeding.save


# create log_scope
scope1 = LogScope.new
log_id = seedling.id
scope1.element_id = leeki.id
scope1.save

scope2 = LogScope.new
scope2.log_id = watering.id
scope2.element_id = onion.id
scope2.save

scope3 = LogScope.new
scope3.log_id = cutting.id
scope3.element_id = carrot.id
scope3.save


scope4 = LogScope.new
scope4.log_id = digging.id
scope4.element_id = donkey.id
scope4.save


# create follows
follow1 = Follow.new(user: bruno, garden: ferme_louley)
follow1.save!
follow2 = Follow.new(user: bruno, garden: maison_ane)
follow2.save!
follow3 = Follow.new(user: bruno, garden: champs)
follow3.save!
follow4 = Follow.new(user: bruno, garden: bizou)
follow4.save!


puts "our first users, gardens, zones, elements and logs have been saved with success. love from the radicl team"
puts "zones saved"
puts "Is anybody here? Hellooo ? I'm a tiny ant stuck in the machine"
puts "Bitch better have my money ... OUH LA LA"
puts "ACHETEZ MES BONNES PATATES ! 5 EURO ! 5 EURO LA PATATE BIO"

