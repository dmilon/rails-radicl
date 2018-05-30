User.destroy_all
Garden.destroy_all
Zone.destroy_all
Element.destroy_all
Log.destroy_all

puts "destroying ALL"

# Create 4 users
alexia = User.create!(email: "alexia@gmail.com", password: "password", name: "alexia", avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/uulvf4bsfdnfbnlzn5zl.jpg")
bruno = User.create!(email: "bruno@gmail.com", password: "password", name: "bruno", avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
damien = User.create!(email: "damien@gmail.com", password: "password", name: "damien", avatar: "https://avatars0.githubusercontent.com/u/37899667?v=4")
louisa = User.create!(email: "louisa@gmail.com", password: "password", name: "louisa", avatar: "https://avatars2.githubusercontent.com/u/13285082?v=4")

# Create 4 farms / gardens
ferme_de_quelenne = Garden.new(name: "Ferme maraîchère de Quélénesse", area: "4000",
  address: 'Rue de Bretagne 56300 Pontivy', latitude: "48.079894", longitude: "-2.974862",
  photo: 'https://images.wwoof.fr/815x458/photos/hosts/bc68d91a39f6ad7aaab270ced00d3dac.jpg')
ferme_de_quelenne.save!
bruno.garden = ferme_de_quelenne
bruno.save!


ferme_louley = Garden.new(name: "Ferme forestière Louley Médoc", area: "4000",
  address: "Rue de Bretagne 56300 Pontivy", latitude: "48.079894", longitude: "-2.974862",
  photo: 'https://images.wwoof.fr/380x253/photos/hosts/c695d233ad1898b9e1f76e87787d1439.jpg')
ferme_louley.save!
louisa.garden = ferme_louley
louisa.save!

maison_ane = Garden.new(name: "La maison de l'âne", area: "4000",
  address: "Rue de Bretagne 56300 Pontivy", latitude: "48.079894", longitude: "-2.974862",
  photo: 'https://images.wwoof.fr/380x253/photos/hosts/800d56e82103249058db06f057314702.jpeg')
maison_ane.save!
alexia.garden = maison_ane
alexia.save!

champs = Garden.new(name: "L'envie des champs", area: "4000",
  address: "Rue de Bretagne 56300 Pontivy", latitude: "48.079894", longitude: "-2.974862",
  photo: 'https://images.wwoof.fr/380x253/photos/hosts/81887dd857cc6e424d37862119dcea26.jpg')
champs.save!
damien.garden = champs
damien.save!

# Create 8 zones
zone1 = Zone.new(name: "Zone 1", area: "200")
zone1.garden = ferme_de_quelenne
zone1.save

zone2 = Zone.new(name: "Zone 2", area: "100")
zone2.garden = ferme_de_quelenne
zone2.save

zone3 = Zone.new(name: "Zone 3", area: "300")
zone3.garden = ferme_louley
zone3.save

zone4 = Zone.new(name: "Zone 4", area: "300")
zone4.garden = ferme_louley
zone4.save

zone5 = Zone.new(name: "Zone 5", area: "300")
zone5.garden = maison_ane
zone5.save


zone6 = Zone.new(name: "Zone 6", area: "10")
zone6.garden = maison_ane
zone6.save

zone7 = Zone.new(name: "Zone 7", area: "3")
zone7.garden = champs
zone7.save

zone8 = Zone.new(name: "Zone 8", area: "70")
zone8.garden = champs
zone8.save


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
leek.zone = zone8
leek.save

donkey = Element.new(name: "Donkey", quantity: "3")
donkey.zone = zone7
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

# create log_scope
scope1 = LogScope.new
log_id = seedling.id
scope1.element_id = leek.id
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
