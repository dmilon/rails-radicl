
User.destroy_all
Garden.destroy_all
Zone.destroy_all
Element.destroy.all
Log.destroy.all

puts "destroying ALL"

# Create 4 users
alexia = User.create!(email: "alexia@gmail.com", password: "password", name: "alexia", avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/uulvf4bsfdnfbnlzn5zl.jpg")
bruno = User.create!(email: "bruno@gmail.com", password: "password", name: "bruno", avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
damien = User.create!(email: "damien@gmail.com", password: "password", name: "damien", avatar: "https://avatars0.githubusercontent.com/u/37899667?v=4")
louisa = User.create!(email: "louisa@gmail.com", password: "password", name: "louisa", avatar: "https://avatars2.githubusercontent.com/u/13285082?v=4")

# Create 4 farms / gardens
ferme_de_quelenne = Garden.new(name: "Ferme maraîchère de Quélénesse", area: "4000"
  location: "Rue de Bretagne 56300 Pontivy", lat: "48.079894", long: "-2.974862",
  remote_photo_url: 'https://images.wwoof.fr/815x458/photos/hosts/bc68d91a39f6ad7aaab270ced00d3dac.jpg')
ferme_de_quelenne.user = bruno
ferme_de_quelenne.save!

ferme_louley = Garden.new(name: "Ferme forestière Louley Médoc", area: "4000"
  location: "Rue de Bretagne 56300 Pontivy", lat: "48.079894", long: "-2.974862",
  remote_photo_url: 'https://images.wwoof.fr/380x253/photos/hosts/c695d233ad1898b9e1f76e87787d1439.jpg')
ferme_louley.user = louisa
ferme_louley.save!

maison_ane = Garden.new(name: "La maison de l'âne", area: "4000"
  location: "Rue de Bretagne 56300 Pontivy", lat: "48.079894", long: "-2.974862",
  remote_photo_url: 'https://images.wwoof.fr/380x253/photos/hosts/800d56e82103249058db06f057314702.jpeg')
maison_ane.user = alexia
maison_ane.save!

champs = Garden.new(name: "L'envie des champs", area: "4000"
  location: "Rue de Bretagne 56300 Pontivy", lat: "48.079894", long: "-2.974862",
  remote_photo_url: 'https://images.wwoof.fr/380x253/photos/hosts/81887dd857cc6e424d37862119dcea26.jpg')
champs.user = damien
champs.save!

# Create 5 zones
zone1 = Zone.new(name: "Zone 1", area: "200")
zone1.save

zone2 = Zone.new(name: "Zone 2", area: "100")
zone2.save

zone3 = Zone.new(name: "Zone 3", area: "300")
zone3.save

zone4 = Zone.new(name: "Zone 4", area: "300")
zone4.save

zone5 = Zone.new(name: "Zone 5", area: "300")
zone5.save

# Create 10 elements
carrot = Element.new(name: "Carrots", quantity: "300")
carrot.zone = zone5
carrot.save

beetroot = Element.new(name: "Beetroot", quantity: "200")
beetroot.zone = zone4
beetroot.save

onion = Element.new(name: "Onion", quantity: "100")
onion.zone = zone2
onion.save

leek = Element.new(name: "Leek", quantity: "10")
leek.zone = zone1
leek.save

donkey = Element.new(name: "Donkey", quantity: "3")
donkey.zone = zone4
donkey.save


# Create a few logs
seedling = Log.new(category: "seed", description: "i did my work today, i'm happy", quantity: "100", status: "done")
seedling.user = damien
seedling.save

watering = Log.new(category: "maintenance", description: "watering the onions", status: "on-going")
watering.user = alexia
watering.save

cutting = Log.new(category: "maintenance", description: "cutting the dead branches", status: "to be done")
cutting.user = bruno
cutting.save

digging = Log.new(category: "preparing ground", description: "preparing the soil", status: "done")
digging.user = damien
digging.save


puts "our first users, gardens, zones, elements and logs have been saved with success. love from the radicl team"

