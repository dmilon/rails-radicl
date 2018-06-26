Action.destroy_all
Element.destroy_all
Farm.destroy_all
Follow.destroy_all
Product.destroy_all
User.destroy_all
Zone.destroy_all
puts "Destroyed all data"

# Create 4 users
alexia = User.create(email: "alexia@gmail.com", password: "password", name: "Alexia", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/uulvf4bsfdnfbnlzn5zl.jpg")
bruno = User.create(email: "bruno@gmail.com", password: "password", name: "Bruno", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
damien = User.create(email: "damien@gmail.com", password: "password", name: "Damien", remote_avatar_url: "https://avatars0.githubusercontent.com/u/37899667?v=4")
louisa = User.create(email: "louisa@gmail.com", password: "password", name: "Louisa", remote_avatar_url: "https://avatars2.githubusercontent.com/u/13285082?v=4")

# Create 1 farm and assign it to all users
champs = Farm.new(name: "L'envie des champs", area: 200,
  address: "La Heslière, 61290 Longny-au-Perche", latitude: 48.530741, longitude: 0.784926,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528383011/44799499.jpg')
champs.save!
User.all.each do |user|
  user.farm = champs
  user.save!
end

# Create another user and another farm for following
george = User.create(email: "george@gmail.com", password: "password", name: "George")
ferme_de_quelenne = Farm.new(name: "Ferme maraîchère de Quélénesse", area: 4530,
  address: 'D918, 61290 Longny-au-Perche', latitude: 48.538352, longitude: 0.746001,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528296877/55d1747bcad9cb45ae531a428cf78184.jpg')
ferme_de_quelenne.save!
george.farm = ferme_de_quelenne
george.save!

# Create 1 follow
follow = Follow.new(user: george, farm: champs)
follow.save!

# Create 3 zones
aromates = Zone.new(name: "Aromates", area: 3, remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
aromates.farm = champs
aromates.save!

potager = Zone.new(name: "Potager", area: 50)
potager.farm = champs
potager.save!

poulailler = Zone.new(name: "Poulailler", area: 20, remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528036811/photo-1495696386015-f371820f82a6.jpg")
poulailler.farm = champs
poulailler.save!


# Create 4 elements
carottes = Element.new(name: "Carottes")
carottes.zone = potager
carottes.save!

betteraves = Element.new(name: "Betteraves")
betteraves.zone = potager
betteraves.save!

poule = Element.new(name: "Poule")
poule.zone = poulailler
poule.save!

basilic = Element.new(name: "Basilic")
basilic.zone = aromates
basilic.save!

# Create 5 actions
action_carottes1 = Action.new(category: "Semis", description: "Semis de carottes", date: '2018-04-15')
action_carottes1.user = damien
action_carottes1.element = carottes
action_carottes1.save!

action_carottes2 = Action.new(category: "Labourage", description: "Labourage de la terre pour les carottes", status: true, date: '2018-04-01')
action_carottes2.user = alexia
action_carottes2.element = carottes
action_carottes2.save!

action_betteraves = Action.new(category: "Paillage", description: "Paillage du sol pour les betteraves", date: '2018-06-15')
action_betteraves.user = bruno
action_betteraves.element = betteraves
action_betteraves.save!

action_poule = Action.new(category: "Autres", description: "Nettoyage de la cage à poule", date: '2018-07-15')
action_poule.user = damien
action_poule.element = poule
action_poule.save!

action_basilic = Action.new(category: "Labourage", description: "Préparation du sol pour le basilic", status: true, date: '2018-05-22')
action_basilic.user = louisa
action_basilic.element = basilic
action_basilic.save!

# Create 3 products
product1 = Product.new(quantity: 10, name: "Carottes", end_date: "15/06/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528363257/23654-jaune_blanche_rouge_et_violette_decouvrez_les_varietes_oubliees_de_la_carotte_2.jpg")
product1.farm = champs
product1.save!

product2 = Product.new(quantity: 30, name: "Basilic", end_date: "15/06/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528364093/artichokes-1024x597.png")
product2.farm = champs
product2.save!

product3 = Product.new(quantity: 10, name: "Concombres", end_date: "20/06/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528363257/te%CC%81le%CC%81chargement.jpg")
product3.farm = ferme_de_quelenne
product3.save!

puts "Seeding went well!"
