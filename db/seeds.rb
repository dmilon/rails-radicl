User.destroy_all
Garden.destroy_all
Zone.destroy_all
Element.destroy_all
Log.destroy_all

puts "destroying ALL"

# Create 4 users
alexia = User.create!(admin: true, email: "alexia@gmail.com", password: "password", name: "alexia", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/uulvf4bsfdnfbnlzn5zl.jpg")
bruno = User.create!(admin: true, email: "bruno@gmail.com", password: "password", name: "bruno", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
damien = User.create!(admin: true, email: "damien@gmail.com", password: "password", name: "damien", remote_avatar_url: "https://avatars0.githubusercontent.com/u/37899667?v=4")
louisa = User.create!(admin: true, email: "louisa@gmail.com", password: "password", name: "louisa", remote_avatar_url: "https://avatars2.githubusercontent.com/u/13285082?v=4")
#worker = User.create!(admin: false, email: "worker@gmail.com", password: "password", name: "worker", avatar: "https://avatars2.githubusercontent.com/u/13285082?v=4")
# Create 4 farms / gardens
ferme_de_quelenne = Garden.new(name: "Ferme maraîchère de Quélénesse", area: "4000",
  address: 'Rue de Bretagne 56300 Pontivy', latitude: 48.079894, longitude: -2.974862,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1520644981554-74cd132a97e8.jpg')
ferme_de_quelenne.save!
bruno.garden = ferme_de_quelenne
bruno.save!

ferme_louley = Garden.new(name: "Ferme forestière Louley Médoc", area: "4000",
  address: "Rue de Bretagne 56300 Pontivy", latitude: 48.079894, longitude: -2.974862,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1472653525502-fc569e405a74.jpg')
ferme_louley.save!
louisa.garden = ferme_louley
louisa.save!

maison_ane = Garden.new(name: "La maison de l'âne", area: "4000",
  address: "Rue de Bretagne 56300 Pontivy", latitude: 48.079894, longitude: -2.974862,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1495138434997-9d69d2a54c8a.jpg')
maison_ane.save!
alexia.garden = maison_ane
alexia.save!

champs = Garden.new(name: "L'envie des champs", area: "4000",
  address: "Rue de Bretagne 56300 Pontivy", latitude: 48.079894, longitude: -2.974862,
  remote_photo_url: 'http://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1469122312224-c5846569feb1.jpg')
champs.save!
damien.garden = champs
damien.save!

# Create 8 zones
a = Zone.new(name: "Potager", area: "200", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
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


# Create a few logs
seedling = Log.new(category: "seed", description: "i did my work today, i'm happy", quantity: "100", status: false)
seedling.user = bruno
seedling.save

watering = Log.new(category: "maintenance", description: "watering the onions", status: false)
watering.user = bruno
watering.save

cutting = Log.new(category: "sowing", description: "cutting the dead branches", status: false)
cutting.user = bruno
cutting.save

digging = Log.new(category: "preparing soil", description: "preparing the soil", status: true)
digging.user = bruno
digging.save

feeding = Log.new(category: "preparing soil", description: "preparing the soil", status: true)
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


puts "our first users, gardens, zones, elements and logs have been saved with success. love from the radicl team"

puts "zones saved"
puts "Is anybody here? Hellooo ? I'm a tiny ant stuck in the machine"
puts "Bitch better have my money ... OUH LA LA"

