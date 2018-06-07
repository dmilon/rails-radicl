User.destroy_all
Garden.destroy_all
Zone.destroy_all
Element.destroy_all
Log.destroy_all
Product.destroy_all
Follow.destroy_all
puts "destroying ALL"

# Create 12 users
alexia = User.create(admin: true, email: "alexia@gmail.com", password: "password", name: "alexia", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/uulvf4bsfdnfbnlzn5zl.jpg")
bruno = User.create(admin: true, email: "bruno@gmail.com", password: "password", name: "bruno", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
damien = User.create(admin: true, email: "damien@gmail.com", password: "password", name: "damien", remote_avatar_url: "https://avatars0.githubusercontent.com/u/37899667?v=4")
louisa = User.create(admin: true, email: "louisa@gmail.com", password: "password", name: "louisa", remote_avatar_url: "https://avatars2.githubusercontent.com/u/13285082?v=4")
olivier = User.create(admin: true, email: "olivier@gmail.com", password: "password", name: "olivier", remote_avatar_url: "https://randomuser.me/api/portraits/men/11.jpg")
delphine = User.create(admin: true, email: "delphine@gmail.com", password: "password", name: "delphine", remote_avatar_url: "https://randomuser.me/api/portraits/women/9.jpg")
juliette = User.create(admin: true, email: "juliette@gmail.com", password: "password", name: "juliette", remote_avatar_url: "https://randomuser.me/api/portraits/women/11.jpg")
denis = User.create(admin: true, email: "denis@gmail.com", password: "password", name: "denis", remote_avatar_url: "https://randomuser.me/api/portraits/men/32.jpg")
lea = User.create(admin: true, email: "lea@gmail.com", password: "password", name: "denis", remote_avatar_url: "https://randomuser.me/api/portraits/men/10.jpg")
mohammed = User.create(admin: true, email: "mohammed@gmail.com", password: "password", name: "mohammed", remote_avatar_url: "https://randomuser.me/api/portraits/men/20.jpg")
arnold = User.create(admin: true, email: "arnold@gmail.com", password: "password", name: "arnold", remote_avatar_url: "https://randomuser.me/api/portraits/men/14.jpg")
irene = User.create(admin: true, email: "irene@gmail.com", password: "password", name: "irene", remote_avatar_url: "https://randomuser.me/api/portraits/women/7.jpg")
robert = User.create(admin: true, email: "robert@gmail.com", password: "password", name: "robert", remote_avatar_url: "https://randomuser.me/api/portraits/men/29.jpg")

# Create Damien's farms
champs = Garden.new(name: "L'envie des champs", area: "200",
  address: "La Heslière, 61290 Longny-au-Perche", latitude: 48.530741, longitude: 0.784926,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528383011/44799499.jpg')
champs.save!
damien.garden = champs
damien.save!

# Create zones
aromates = Zone.new(name: "Aromates", area: "3", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
aromates.garden = champs
aromates.save!

potager = Zone.new(name: "Potager", area: "50", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
potager.garden = champs
potager.save!

hen = Zone.new(name: "Poulailler", area: "20", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528036811/photo-1495696386015-f371820f82a6.jpg")
hen.garden = champs
hen.save!


# Create elements & logs & logs scopes for Damien
carotte = Element.new(name: "carotte", quantity: "50")
carotte.zone = potager
carotte.save!

betterave1 = Element.new(name: "betterave", quantity: "30")
betterave1.zone = potager
betterave1.save!

oignon1 = Element.new(name: "oignon", quantity: "30")
oignon1.zone = potager
oignon1.save!

artichaut = Element.new(name: "artichaut", quantity: "20")
artichaut.zone = potager
artichaut.save!

epinard = Element.new(name: "epinard", quantity: "20")
epinard.zone = potager
epinard.save!

tomate = Element.new(name: "tomate", quantity: "20")
tomate.zone = potager
tomate.save!


#logs
soil1 = Log.new(category: "Labourage", description: "Labourage pour mes carottes, creuser et desherbage", status: true, date: '2018-05-04')
soil1.user = damien
soil1.save!

scope1 = LogScope.new
scope1.log_id = soil1.id
scope1.element_id = carotte.id
scope1.save!

fert1 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-05-15')
fert1.user = damien
fert1.save!

scope2 = LogScope.new
scope2.log_id = fert1.id
scope2.element_id = carotte.id
scope2.save!

sow1 = Log.new(category: "Semis", description: "parsemer les graines de carottes", status: true, date: '2018-05-25')
sow1.user = damien
sow1.save!

scope3 = LogScope.new
scope3.log_id = sow1.id
scope3.element_id = carotte.id
scope3.save!

trans1 = Log.new(category: "Repiquage", description: "déplacer les carottes dans le jardin", status: true, date: '2018-05-30')
trans1.user = damien
trans1.save!

scope4 = LogScope.new
scope4.log_id = trans1.id
scope4.element_id = carotte.id
scope4.save!

wat1 = Log.new(category: "Arrosage", description: "Arrosage des carottes", status: true, date: '2018-05-30')
wat1.user = damien
wat1.save!

scope5 = LogScope.new
scope5.log_id = wat1.id
scope5.element_id = carotte.id
scope5.save!

soil2 = Log.new(category: "Labourage", description: "Labourage pour mes betteraves", status: true, date: '2018-06-01')
soil2.user = damien
soil2.save!

scope6 = LogScope.new
scope6.log_id = soil2.id
scope6.element_id = betterave1.id
scope6.save!

fert2 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-06-01')
fert2.user = damien
fert2.save!

scope7 = LogScope.new
scope7.log_id = fert2.id
scope7.element_id = betterave1.id
scope7.save!

caring1 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring1.user = damien
caring1.save!

scope8 = LogScope.new
scope8.log_id = caring1.id
scope8.element_id = oignon1.id
scope8.save!


soil3 = Log.new(category: "Labourage", description: "Labourage pour mes artichauts, creuser et désherber", status: true, date: '2018-06-02')
soil3.user = damien
soil3.save!

scope9 = LogScope.new
scope9.log_id = soil3.id
scope9.element_id = artichaut.id
scope9.save!

fert3 = Log.new(category: "Fertilisation", description: "étaler le composte pour mes artichauts", status: true, date: '2018-06-02')
fert3.user = damien
fert3.save!

scope10 = LogScope.new
scope10.log_id = fert3.id
scope10.element_id = artichaut.id
scope10.save!

sow2 = Log.new(category: "Semis", description: "semer les graines d'artichaut", status: true, date: '2018-06-03')
sow2.user = damien
sow2.save!

scope11 = LogScope.new
scope11.log_id = sow2.id
scope11.element_id = artichaut.id
scope11.save!

soil4 = Log.new(category: "Labourage", description: "Labourage pour mes épinards", status: true, date: '2018-06-01')
soil4.user = damien
soil4.save!

scope12 = LogScope.new
scope12.log_id = soil4.id
scope12.element_id = epinard.id
scope12.save!

fert4 = Log.new(category: "Fertilisation", description: "étaler le compost sur mes épinards", status: true, date: '2018-06-03')
fert4.user = damien
fert4.save!

scope13 = LogScope.new
scope13.log_id = fert4.id
scope13.element_id = epinard.id
scope13.save!


soil5 = Log.new(category: "Labourage", description: "Labourage pour mes épinards", status: true, date: '2018-06-01')
soil5.user = damien
soil5.save!

scope14 = LogScope.new
scope14.log_id = soil5.id
scope14.element_id = tomate.id
scope14.save!

fert5 = Log.new(category: "Fertilisation", description: "étaler le compost sur mes tomates", status: true, date: '2018-06-03')
fert5.user = damien
fert5.save!

scope15 = LogScope.new
scope15.log_id = fert5.id
scope15.element_id = tomate.id
scope15.save!


#Create Bruno's Farm
ferme_de_quelenne = Garden.new(name: "Ferme maraîchère de Quélénesse", area: "4530",
  address: 'D918, 61290 Longny-au-Perche', latitude: 48.538352, longitude: 0.746001,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528296877/55d1747bcad9cb45ae531a428cf78184.jpg')
ferme_de_quelenne.save!
bruno.garden = ferme_de_quelenne
bruno.save!

# Create zones
aromates2 = Zone.new(name: "aromates", area: "4", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
aromates2.garden = ferme_de_quelenne
aromates2.save!

potager2 = Zone.new(name: "Potager", area: "200", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
potager2.garden = ferme_de_quelenne
potager2.save!

hen2 = Zone.new(name: "Poulailler", area: "30", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528036811/photo-1495696386015-f371820f82a6.jpg")
hen2.garden = ferme_de_quelenne
hen2.save!

ruche = Zone.new(name: "Ruches", area: "20", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1498936178812-4b2e558d2937.jpg")
ruche.garden = ferme_de_quelenne
ruche.save!

bergerie = Zone.new(name: "Bergerie", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1520644981554-74cd132a97e8.jpg")
bergerie.garden = ferme_de_quelenne
bergerie.save!

etable = Zone.new(name: "Etable", area: "1000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1505872342847-6dbb5e76cd31.jpg")
etable.garden = ferme_de_quelenne
etable.save!

graines = Zone.new(name: "Graines", area: "3000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209412/u3hg11kfxoz4g6detvhy.jpg")
graines.garden = ferme_de_quelenne
graines.save!

foret = Zone.new(name: "Forêt", area: "5000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209412/u3hg11kfxoz4g6detvhy.jpg")
foret.garden = ferme_de_quelenne
foret.save!

#create elements
citrouille1 = Element.new(name: "citrouille", quantity: "50")
citrouille1.zone = potager2
citrouille1.save!

concombre1 = Element.new(name: "concombre", quantity: "30")
concombre1.zone = potager2
concombre1.save!

oignon2 = Element.new(name: "oignon", quantity: "30")
oignon2.zone = potager2
oignon2.save!

artichaut2 = Element.new(name: "artichaut", quantity: "20")
artichaut2.zone = potager2
artichaut2.save!

epinard2 = Element.new(name: "epinard", quantity: "20")
epinard2.zone = potager2
epinard2.save!

tomate2 = Element.new(name: "tomate", quantity: "20")
tomate2.zone = potager2
tomate2.save!

carotte2 = Element.new(name: "carotte", quantity: "60")
carotte2.zone = potager2
carotte2.save!

betterave2 = Element.new(name: "betterave", quantity: "30")
betterave2.zone = potager2
betterave2.save!

patate1 = Element.new(name: "patate", quantity: "20")
patate1.zone = potager2
patate1.save!

#create logs and logscopes for Bruno
soil6 = Log.new(category: "Labourage", description: "Labourage pour mes citrouilles, creuser et desherbage", status: true, date: '2018-01-04')
soil6.user = bruno
soil6.save!

scope16 = LogScope.new
scope16.log_id = soil6.id
scope16.element_id = citrouille1.id
scope16.save!

fert6 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-02-15')
fert6.user = bruno
fert6.save!

scope17 = LogScope.new
scope17.log_id = fert6.id
scope17.element_id = citrouille1.id
scope17.save!

sow3 = Log.new(category: "Semis", description: "spread citrouilles seeds", status: true, date: '2018-03-25')
sow3.user = bruno
sow3.save!

scope18 = LogScope.new
scope18.log_id = sow3.id
scope18.element_id = citrouille1.id
scope18.save!


trans2 = Log.new(category: "Repiquage", description: "moving citrouilles into the garden", status: true, date: '2018-03-30')
trans2.user = bruno
trans2.save!

scope19 = LogScope.new
scope19.log_id = trans2.id
scope19.element_id = citrouille1.id
scope19.save!

caring2 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring2.user = bruno
caring2.save!

scope20 = LogScope.new
scope20.log_id = caring2.id
scope20.element_id = citrouille1.id
scope20.save!

#concombre
soil7 = Log.new(category: "Labourage", description: "Labourage pour mes concombres, creuser et desherbage", status: true, date: '2018-01-04')
soil7.user = bruno
soil7.save!

scope21 = LogScope.new
scope21.log_id = soil7.id
scope21.element_id = concombre1.id
scope21.save!

fert7 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-02-15')
fert7.user = bruno
fert7.save!

scope22 = LogScope.new
scope22.log_id = fert7.id
scope22.element_id = concombre1.id
scope22.save!

sow4 = Log.new(category: "Semis", description: "spread concombre seeds", status: true, date: '2018-03-25')
sow4.user = bruno
sow4.save!

scope23 = LogScope.new
scope23.log_id = sow4.id
scope23.element_id = concombre1.id
scope23.save!

trans3 = Log.new(category: "Repiquage", description: "moving concombre into the garden", status: true, date: '2018-03-30')
trans3.user = bruno
trans3.save!

scope24 = LogScope.new
scope24.log_id = trans3.id
scope24.element_id = concombre1.id
scope24.save!

caring3 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring3.user = bruno
caring3.save!

scope25 = LogScope.new
scope25.log_id = caring3.id
scope25.element_id = concombre1.id
scope25.save!

desherbage1 = Log.new(category: "Désherbage", description: "désherbage pour mes concombres", status: true, date: '2018-06-02')
desherbage1.user = bruno
desherbage1.save!

scope26 = LogScope.new
scope26.log_id = desherbage1.id
scope26.element_id = concombre1.id
scope26.save!

#tomates

soil8 = Log.new(category: "Labourage", description: "Labourage pour mes tomates, creuser et desherbage", status: true, date: '2018-01-04')
soil8.user = bruno
soil8.save!

scope27 = LogScope.new
scope27.log_id = soil8.id
scope27.element_id = tomate2.id
scope27.save!

fert8 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-02-15')
fert8.user = bruno
fert8.save!

scope28 = LogScope.new
scope28.log_id = fert8.id
scope28.element_id = tomate2.id
scope28.save!

sow5 = Log.new(category: "Semis", description: "étaler les graines de tomates", status: true, date: '2018-03-25')
sow5.user = bruno
sow5.save!

scope29 = LogScope.new
scope29.log_id = sow5.id
scope29.element_id = tomate2.id
scope29.save!

trans4 = Log.new(category: "Repiquage", description: "déplacer les tomates dans le jardin", status: true, date: '2018-03-30')
trans4.user = bruno
trans4.save!

scope30 = LogScope.new
scope30.log_id = trans4.id
scope30.element_id = tomate2.id
scope30.save!

desherbage2 = Log.new(category: "Désherbage", description: "désherbage pour mes tomates", status: true, date: '2018-06-02')
desherbage2.user = bruno
desherbage2.save!

scope31 = LogScope.new
scope31.log_id = desherbage2.id
scope31.element_id = tomate2.id
scope31.save!

#artichaut

soil9 = Log.new(category: "Labourage", description: "Labourage pour mes artichauts, creuser et desherbage", status: true, date: '2018-03-04')
soil9.user = bruno
soil9.save!

scope32 = LogScope.new
scope32.log_id = soil9.id
scope32.element_id = artichaut2.id
scope32.save!

fert9 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert9.user = bruno
fert9.save!

scope33 = LogScope.new
scope33.log_id = fert9.id
scope33.element_id = artichaut2.id
scope33.save!

sow6 = Log.new(category: "Semis", description: "étaler les graines d'artichaut", status: true, date: '2018-03-25')
sow6.user = bruno
sow6.save!

scope34 = LogScope.new
scope34.log_id = sow6.id
scope34.element_id = artichaut2.id
scope34.save!

trans5 = Log.new(category: "Repiquage", description: "déplacer les artichauts dans le jardin", status: true, date: '2018-06-02')
trans5.user = bruno
trans5.save!

scope35 = LogScope.new
scope35.log_id = trans5.id
scope35.element_id = artichaut2.id
scope35.save!

#epinard

soil10 = Log.new(category: "Labourage", description: "Labourage pour mes épinards", status: true, date: '2018-03-04')
soil10.user = bruno
soil10.save!

scope36 = LogScope.new
scope36.log_id = soil10.id
scope36.element_id = epinard2.id
scope36.save!

fert10 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert10.user = bruno
fert10.save!

scope37 = LogScope.new
scope37.log_id = fert10.id
scope37.element_id = epinard2.id
scope37.save!

sow7 = Log.new(category: "Semis", description: "étaler les graines pour mes épinards", status: true, date: '2018-04-25')
sow7.user = bruno
sow7.save!

scope38 = LogScope.new
scope38.log_id = sow7.id
scope38.element_id = epinard2.id
scope38.save!

trans6 = Log.new(category: "Repiquage", description: "déplacer les épinards dans le jardin", status: true, date: '2018-06-02')
trans6.user = bruno
trans6.save!

scope38 = LogScope.new
scope38.log_id = trans6.id
scope38.element_id = epinard2.id
scope38.save!

caring4 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring4.user = bruno
caring4.save!

scope39 = LogScope.new
scope39.log_id = caring4.id
scope39.element_id = epinard2.id
scope39.save!

#oignons

soil11 = Log.new(category: "Labourage", description: "Labourage pour mes oignons, creuser et desherbage", status: true, date: '2018-03-04')
soil11.user = bruno
soil11.save!

scope40 = LogScope.new
scope40.log_id = soil11.id
scope40.element_id = oignon2.id
scope40.save!

fert11 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert11.user = bruno
fert11.save!

scope41 = LogScope.new
scope41.log_id = fert11.id
scope41.element_id = oignon2.id
scope41.save!

sow8 = Log.new(category: "Semis", description: "étaler les graines d'oignon", status: true, date: '2018-04-25')
sow8.user = bruno
sow8.save!

scope42 = LogScope.new
scope42.log_id = sow8.id
scope42.element_id = oignon2.id
scope42.save!

trans7 = Log.new(category: "Repiquage", description: "déplacer les oignons dans le jardin", status: true, date: '2018-06-02')
trans7.user = bruno
trans7.save!

scope43 = LogScope.new
scope43.log_id = trans7.id
scope43.element_id = oignon2.id
scope43.save!

caring5 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring5.user = bruno
caring5.save!

scope44 = LogScope.new
scope44.log_id = caring5.id
scope44.element_id = oignon2.id
scope44.save!

#betterave

soil12 = Log.new(category: "Labourage", description: "Labourage pour mes betteraves", status: true, date: '2018-03-04')
soil12.user = bruno
soil12.save!

scope45 = LogScope.new
scope45.log_id = soil12.id
scope45.element_id = betterave2.id
scope45.save!

fert12 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert12.user = bruno
fert12.save!

scope46 = LogScope.new
scope46.log_id = fert12.id
scope46.element_id = betterave2.id
scope46.save!

sow9 = Log.new(category: "Semis", description: "étaler les graines de betterave", status: true, date: '2018-04-25')
sow9.user = bruno
sow9.save!

scope47 = LogScope.new
scope47.log_id = sow9.id
scope47.element_id = betterave2.id
scope47.save!

#patates
soil13 = Log.new(category: "Labourage", description: "Labourage pour mes patates", status: true, date: '2018-03-04')
soil13.user = bruno
soil13.save!

scope48 = LogScope.new
scope48.log_id = soil13.id
scope48.element_id = patate1.id
scope48.save!

#carottes
soil14 = Log.new(category: "Labourage", description: "Labourage pour mes carottes", status: true, date: '2018-03-04')
soil14.user = bruno
soil14.save!

scope49 = LogScope.new
scope49.log_id = soil14.id
scope49.element_id = carotte2.id
scope49.save!

fert13 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert13.user = bruno
fert13.save!

scope50 = LogScope.new
scope50.log_id = fert13.id
scope50.element_id = carotte2.id
scope50.save!

sow10 = Log.new(category: "Semis", description: "étaler les graines de carottes", status: true, date: '2018-04-25')
sow10.user = bruno
sow10.save!

scope51 = LogScope.new
scope51.log_id = sow10.id
scope51.element_id = carotte2.id
scope51.save!

trans8 = Log.new(category: "Repiquage", description: "déplacer les carottes dans le jardin", status: true, date: '2018-06-02')
trans8.user = bruno
trans8.save!

scope52 = LogScope.new
scope52.log_id = trans8.id
scope52.element_id = carotte2.id
scope52.save!

caring6 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring6.user = bruno
caring6.save!

scope53 = LogScope.new
scope53.log_id = caring6.id
scope53.element_id = carotte2.id
scope53.save!

# Create Juliette's farm
bizou = Garden.new(name: "Ferme de Bizou", area: "4000", address: "La Bellangerie, 61110 Moutiers-au-Perche", latitude: 48.494182, longitude: 0.834733,remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528296878/a20eabfcaaa2a6fd9f1d15125b51ee4f.jpg" )
bizou.save!
juliette.garden = bizou
juliette.save!

# Create zones
aromates3 = Zone.new(name: "aromates", area: "4", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
aromates3.garden = bizou
aromates3.save!

potager3 = Zone.new(name: "Potager", area: "200", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
potager3.garden = bizou
potager3.save!

hen3 = Zone.new(name: "Poulailler", area: "30", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528036811/photo-1495696386015-f371820f82a6.jpg")
hen3.garden = bizou
hen3.save!

ruche1 = Zone.new(name: "ruche", area: "20", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1498936178812-4b2e558d2937.jpg")
ruche1.garden = bizou
ruche1.save!

bergerie1 = Zone.new(name: "bergerie", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1520644981554-74cd132a97e8.jpg")
bergerie1.garden = bizou
bergerie1.save!

etable1 = Zone.new(name: "etable", area: "1000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1505872342847-6dbb5e76cd31.jpg")
etable1.garden = bizou
etable1.save!

graines1 = Zone.new(name: "graines", area: "3000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209412/u3hg11kfxoz4g6detvhy.jpg")
graines1.garden = bizou
graines1.save!

foret1 = Zone.new(name: "foret", area: "5000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209412/u3hg11kfxoz4g6detvhy.jpg")
foret1.garden = bizou
foret1.save!

#create elements
citrouille2 = Element.new(name: "citrouille", quantity: "50")
citrouille2.zone = potager3
citrouille2.save!

concombre2 = Element.new(name: "concombre", quantity: "30")
concombre2.zone = potager3
concombre2.save!

oignon3 = Element.new(name: "oignon", quantity: "30")
oignon3.zone = potager3
oignon3.save!

artichaut3 = Element.new(name: "artichaut", quantity: "20")
artichaut3.zone = potager3
artichaut3.save!

epinard3 = Element.new(name: "epinard", quantity: "20")
epinard3.zone = potager3
epinard3.save!

tomate3 = Element.new(name: "tomate", quantity: "20")
tomate3.zone = potager3
tomate3.save!

carotte3 = Element.new(name: "carotte", quantity: "60")
carotte3.zone = potager3
carotte3.save!

betterave3 = Element.new(name: "betterave", quantity: "30")
betterave3.zone = potager3
betterave3.save!

patate2 = Element.new(name: "patate", quantity: "20")
patate2.zone = potager3
patate2.save!

#create logs and logscopes for Juliette
soil15 = Log.new(category: "Labourage", description: "Labourage pour mes citrouilles, creuser et desherbage", status: true, date: '2018-01-04')
soil15.user = juliette
soil15.save!

scope54 = LogScope.new
scope54.log_id = soil15.id
scope54.element_id = citrouille2.id
scope54.save!

fert14 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-02-15')
fert14.user = juliette
fert14.save!

scope55 = LogScope.new
scope55.log_id = fert14.id
scope55.element_id = citrouille2.id
scope55.save!

sow11 = Log.new(category: "Semis", description: "étaler les graines de citrouilles", status: true, date: '2018-03-25')
sow11.user = juliette
sow11.save!

scope56 = LogScope.new
scope56.log_id = sow11.id
scope56.element_id = citrouille2.id
scope56.save!

trans9 = Log.new(category: "Repiquage", description: "déplacer les citrouilles dans le jardin", status: true, date: '2018-03-30')
trans9.user = juliette
trans9.save!

scope57 = LogScope.new
scope57.log_id = trans9.id
scope57.element_id = citrouille2.id
scope57.save!

caring8 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring8.user = juliette
caring8.save!

scope58 = LogScope.new
scope58.log_id = caring8.id
scope58.element_id = citrouille2.id
scope58.save!

#concombre
soil15 = Log.new(category: "Labourage", description: "Labourage pour mes concombres, creuser et desherbage", status: true, date: '2018-01-04')
soil15.user = juliette
soil15.save!

scope59 = LogScope.new
scope59.log_id = soil15.id
scope59.element_id = concombre2.id
scope59.save!

fert15 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-02-15')
fert15.user = juliette
fert15.save!

scope60 = LogScope.new
scope60.log_id = fert15.id
scope60.element_id = concombre2.id
scope60.save!

sow12 = Log.new(category: "Semis", description: "étaler les graines de concombre", status: true, date: '2018-03-25')
sow12.user = juliette
sow12.save!

scope61 = LogScope.new
scope61.log_id = sow12.id
scope61.element_id = concombre2.id
scope61.save!

trans10 = Log.new(category: "Repiquage", description: "déplacer les concombres dans le jardin", status: true, date: '2018-03-30')
trans10.user = juliette
trans10.save!

scope62 = LogScope.new
scope62.log_id = trans10.id
scope62.element_id = concombre2.id
scope62.save!

caring9 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring9.user = juliette
caring9.save!

scope63 = LogScope.new
scope63.log_id = caring9.id
scope63.element_id = concombre2.id
scope63.save!

desherbage3 = Log.new(category: "Désherbage", description: "désherbage pour mes concombres", status: true, date: '2018-06-02')
desherbage3.user = juliette
desherbage3.save!

scope64 = LogScope.new
scope64.log_id = desherbage3.id
scope64.element_id = concombre2.id
scope64.save!

#tomates

soil16 = Log.new(category: "Labourage", description: "Labourage pour mes tomates, creuser et desherbage", status: true, date: '2018-01-04')
soil16.user = juliette
soil16.save!

scope65 = LogScope.new
scope65.log_id = soil16.id
scope65.element_id = tomate3.id
scope65.save!

fert16 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-02-15')
fert16.user = juliette
fert16.save!

scope66 = LogScope.new
scope66.log_id = fert16.id
scope66.element_id = tomate3.id
scope66.save!

sow13 = Log.new(category: "Semis", description: "étaler les graines de tomate ", status: true, date: '2018-03-25')
sow13.user = juliette
sow13.save!

scope67 = LogScope.new
scope67.log_id = sow13.id
scope67.element_id = tomate3.id
scope67.save!

trans11 = Log.new(category: "Repiquage", description: "moving tomate into the garden", status: true, date: '2018-03-30')
trans11.user = juliette
trans11.save!

scope68 = LogScope.new
scope68.log_id = trans11.id
scope68.element_id = tomate3.id
scope68.save!

desherbage4 = Log.new(category: "Désherbage", description: "désherbage pour mes tomates", status: true, date: '2018-06-02')
desherbage4.user = juliette
desherbage4.save!

scope69 = LogScope.new
scope69.log_id = desherbage4.id
scope69.element_id = tomate3.id
scope69.save!

#artichaut

soil18 = Log.new(category: "Labourage", description: "Labourage pour mes artichauts, creuser et desherbage", status: true, date: '2018-03-04')
soil18.user = juliette
soil18.save!

scope70 = LogScope.new
scope70.log_id = soil18.id
scope70.element_id = artichaut3.id
scope70.save!

fert17 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert17.user = juliette
fert17.save!

scope71 = LogScope.new
scope71.log_id = fert17.id
scope71.element_id = artichaut3.id
scope71.save!

sow14 = Log.new(category: "Semis", description: "étaler les graines d'artichaut", status: true, date: '2018-03-25')
sow14.user = juliette
sow14.save!

scope72 = LogScope.new
scope72.log_id = sow14.id
scope72.element_id = artichaut3.id
scope72.save!

trans12 = Log.new(category: "Repiquage", description: "déplacer les artichauts dans le jardin", status: true, date: '2018-06-02')
trans12.user = juliette
trans12.save!

scope73 = LogScope.new
scope73.log_id = trans12.id
scope73.element_id = artichaut3.id
scope73.save!

#epinard

soil19 = Log.new(category: "Labourage", description: "Labourage pour mes épinards, creuser et desherbage", status: true, date: '2018-03-04')
soil19.user = juliette
soil19.save!

scope74 = LogScope.new
scope74.log_id = soil19.id
scope74.element_id = epinard3.id
scope74.save!

fert18 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert18.user = juliette
fert18.save!

scope75 = LogScope.new
scope75.log_id = fert18.id
scope75.element_id = epinard3.id
scope75.save!

sow15 = Log.new(category: "Semis", description: "étaler les graines d'épinard", status: true, date: '2018-04-25')
sow15.user = juliette
sow15.save!

scope76 = LogScope.new
scope76.log_id = sow15.id
scope76.element_id = epinard3.id
scope76.save!

trans12 = Log.new(category: "Repiquage", description: "déplacer les épinards dans le jardin", status: true, date: '2018-06-02')
trans12.user = juliette
trans12.save!

scope77 = LogScope.new
scope77.log_id = trans12.id
scope77.element_id = epinard3.id
scope77.save!

caring10 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring10.user = juliette
caring10.save!

scope78 = LogScope.new
scope78.log_id = caring10.id
scope78.element_id = epinard3.id
scope78.save!

#oignons

soil20 = Log.new(category: "Labourage", description: "Labourage pour mes oignons, creuser et desherbage", status: true, date: '2018-03-04')
soil20.user = juliette
soil20.save!

scope79 = LogScope.new
scope79.log_id = soil20.id
scope79.element_id = oignon3.id
scope79.save!

fert19 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert19.user = juliette
fert19.save!

scope80 = LogScope.new
scope80.log_id = fert19.id
scope80.element_id = oignon3.id
scope80.save!

sow16 = Log.new(category: "Semis", description: "étaler les graines d'oignon", status: true, date: '2018-04-25')
sow16.user = juliette
sow16.save!

scope81 = LogScope.new
scope81.log_id = sow16.id
scope81.element_id = oignon3.id
scope81.save!

trans13 = Log.new(category: "Repiquage", description: "déplacer les oignons dans le jardin", status: true, date: '2018-06-02')
trans13.user = juliette
trans13.save!

scope82 = LogScope.new
scope82.log_id = trans13.id
scope82.element_id = oignon3.id
scope82.save!

caring11 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring11.user = juliette
caring11.save!

scope83 = LogScope.new
scope83.log_id = caring11.id
scope83.element_id = oignon3.id
scope83.save!

#betterave

soil21 = Log.new(category: "Labourage", description: "Labourage pour mes betteraves", status: true, date: '2018-03-04')
soil21.user = juliette
soil21.save!

scope84 = LogScope.new
scope84.log_id = soil21.id
scope84.element_id = betterave3.id
scope84.save!

fert20 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert20.user = juliette
fert20.save!

scope85 = LogScope.new
scope85.log_id = fert20.id
scope85.element_id = betterave3.id
scope85.save!

sow17 = Log.new(category: "Semis", description: "étaler les graines de betterave", status: true, date: '2018-04-25')
sow17.user = juliette
sow17.save!

scope86 = LogScope.new
scope86.log_id = sow17.id
scope86.element_id = betterave3.id
scope86.save!

#patates
soil22 = Log.new(category: "Labourage", description: "Labourage pour mes patates, creuser et desherbage", status: true, date: '2018-03-04')
soil22.user = juliette
soil22.save!

scope87 = LogScope.new
scope87.log_id = soil22.id
scope87.element_id = patate2.id
scope87.save!

#carottes
soil23 = Log.new(category: "Labourage", description: "Labourage pour mes carottes, creuser et desherbage", status: true, date: '2018-03-04')
soil23.user = juliette
soil23.save!

scope88 = LogScope.new
scope88.log_id = soil23.id
scope88.element_id = carotte3.id
scope88.save!

fert21 = Log.new(category: "Fertilisation", description: "étaler le compost", status: true, date: '2018-03-15')
fert21.user = juliette
fert21.save!

scope89 = LogScope.new
scope89.log_id = fert21.id
scope89.element_id = carotte3.id
scope89.save!

sow18 = Log.new(category: "Semis", description: "étaler les graines de carotte", status: true, date: '2018-04-25')
sow18.user = juliette
sow18.save!

scope90 = LogScope.new
scope90.log_id = sow18.id
scope90.element_id = carotte3.id
scope90.save!

trans14 = Log.new(category: "Repiquage", description: "déplacer les carottes dans le jardin", status: true, date: '2018-06-02')
trans14.user = juliette
trans14.save!

scope91 = LogScope.new
scope91.log_id = trans14.id
scope91.element_id = carotte3.id
scope91.save!

caring12 = Log.new(category: "Protection", description: "protéger les plants", status: true, date: '2018-06-02')
caring12.user = juliette
caring12.save!

scope92 = LogScope.new
scope92.log_id = caring12.id
scope92.element_id = carotte3.id
scope92.save!


ferme_louley = Garden.new(name: "Ferme foretière Louley Médoc", area: "4000",
  address: "9 Rue du Dr Jean Vivares, 61290 Longny-au-Perche", latitude: 48.529327, longitude: 0.751545,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528296878/279595dedb42f5a0e9f951e42c0d3b14.jpg')
ferme_louley.save!
louisa.garden = ferme_louley
louisa.save!

maison_ane = Garden.new(name: "La maison de l'âne", area: "4000",
  address: "La Hutte, 61290 Longny-au-Perche", latitude: 48.543471, longitude: 0.714202,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528296878/95d8529f7a4321e2bea3dae6d8926f38.jpg')
maison_ane.save!
alexia.garden = maison_ane
alexia.save!

bonnePatate = Garden.new(name: "À La bonne patate", area: "4000", address: "La Ferme de Ronne, 61110 Moutiers-au-Perche", latitude: 48.451338, longitude: 0.826649,
  remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528296878/c6903d08c0beb1ed4f1e124b9ec88e2c.jpg" )
bonnePatate.save!
denis.garden = bonnePatate
denis.save!

champi = Garden.new(name: "L'étang Chiot", area: "3020",
  address: "L'Étang Chiot, 61290 Longny-au-Perche", latitude: 48.546360, longitude: 0.730251,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528296877/7aec9578bb499b585126c6b2be5c5d6f.jpg')
champi.save!
olivier.garden = champi
olivier.save!

champil = Garden.new(name: "Moulin de la Vigne", area: "420",
  address: "Moulin de la Vigne, 61400 Feings", latitude: 48.546587, longitude: 0.688022,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528296879/cda6a6b69f3b443c2c2306535c502b13.jpg')
champil.save!
delphine.garden = champil
delphine.save!

champilo = Garden.new(name: "Ferme de Ronne", area: "300",
  address: "61110 Moutiers-au-Perche", latitude: 48.454412, longitude: 0.826934,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528365126/deee211ef211b34cfd53977edbb642bb_1.jpg')
champilo.save!
mohammed.garden = champilo
mohammed.save!

fhampiluo = Garden.new(name: "Ferme du Perché", area: "300",
  address: "61110 Moutiers-au-Perche", latitude: 48.454412, longitude: 0.826934,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528366875/5f4bda9b5fca0af8d14b33a2a3a48790.jpg')
fhampiluo.save!
arnold.garden = fhampiluo
arnold.save!

champiloi = Garden.new(name: "Chateau Moutier", area: "3000",
  address: "61110 Moutiers-au-Perche", latitude: 48.496264, longitude: 0.835350,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528365298/8a91cc1659d5f3209a84924903c426a8.jpg')
champiloi.save!
lea.garden = champiloi
lea.save!

champiloiu = Garden.new(name: "Domaine de la bergerie", area: "400",
  address: "61110 Moutiers-au-Perche", latitude: 48.496264, longitude: 0.835350,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528366313/1f4ca72d670031f93e70fb5083db6fd9.jpg')
champiloiu.save!
irene.garden = champiloiu
irene.save!



# # Create 8 zones
# Garden.all.each do |garden|
#   zone = Zone.new(name: "Potager", area: "200", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
#   zone.garden = garden
#   zone.save!
# end


# a = Zone.new(name: "Aromates", area: "300", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
# a.garden = ferme_de_quelenne
# a.save!




# c = Zone.new(name: "Chevaux", area: "2500", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1511374322656-82cdd30150c9.jpg")
# c.garden = ferme_de_quelenne
# c.save!

# d = Zone.new(name: "Ruches", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1498936178812-4b2e558d2937.jpg")
# d.garden = ferme_de_quelenne
# d.save!

# e = Zone.new(name: "Verger", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1505872342847-6dbb5e76cd31.jpg")
# e.garden = ferme_de_quelenne
# e.save!

# f = Zone.new(name: "Vaches", area: "500", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1500595046743-cd271d694d30.jpg" )
# f.garden = ferme_de_quelenne
# f.save!

# g = Zone.new(name: "Moutons", area: "4000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1520644981554-74cd132a97e8.jpg")
# g.garden = ferme_de_quelenne
# g.save!

# h = Zone.new(name: "Cochons", area: "300", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1524317818500-ab1fded2ce81.jpg")
# h.garden = ferme_de_quelenne
# h.save!

# i = Zone.new(name: "Zone 6", area: "10")
# i.garden = maison_ane
# i.save!

# j = Zone.new(name: "Zone 7", area: "3")
# j.garden = maison_ane
# j.save!

# k = Zone.new(name: "Zone 8", area: "70")
# k.garden = maison_ane
# k.save!

# l = Zone.new(name: "Verger", area: "700")
# l.garden = maison_ane
# l.save!

# m = Zone.new(name: "Fruits", area: "30")
# m.garden = maison_ane
# m.save!

# n = Zone.new(name: "Ruches", area: "100")
# n.garden = maison_ane
# n.save!

# o = Zone.new(name: "Potager", area: "20")
# o.garden = maison_ane
# o.save!

# p = Zone.new(name: "Donkeys", area: "200")
# p.garden = maison_ane
# p.save!


# # Create 10 elements
# Garden.all.each do |garden|
#   carotte = Element.new(name: "carottes", quantity: "300")
#   carotte.zone = garden.zones.first
#   carotte.save!
# end

# betterave = Element.new(name: "betterave", quantity: "200")
# betterave.zone = a
# betterave.save!

# oignon = Element.new(name: "oignon", quantity: "100")
# oignon.zone = a
# oignon.save!

# leek = Element.new(name: "Leek", quantity: "10")
# leek.zone = a
# leek.save!

# leeks = Element.new(name: "Leeks", quantity: "100")
# leeks.zone = o
# leeks.save!

# carottes = Element.new(name: "carottes", quantity: "300")
# carottes.zone = o
# carottes.save!

# beetradish = Element.new(name: "betterave", quantity: "200")
# beetradish.zone = o
# beetradish.save!

# oignons = Element.new(name: "oignon", quantity: "100")
# oignons.zone = o
# oignons.save!

# leeki = Element.new(name: "Leek", quantity: "10")
# leeki.zone = n
# leeki.save!

# bees = Element.new(name: "Bees", quantity: "10000")
# bees.zone = m
# bees.save!

# donkey = Element.new(name: "Donkey", quantity: "3")
# donkey.zone = n
# donkey.save!

# horses = Element.new(name: "Horse", quantity: "18")
# horses.zone = c
# horses.save!

follow1 = Follow.new(user: damien, garden: ferme_de_quelenne)
follow1.save!

product1 = Product.new(quantity: 10, end_date: "15/06/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528363257/23654-jaune_blanche_rouge_et_violette_decouvrez_les_varietes_oubliees_de_la_carotte_2.jpg")
product1.element = carotte2
product1.save!
product2 = Product.new(quantity: 30, end_date: "15/06/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528364093/artichokes-1024x597.png")
product2.element = artichaut2
product2.save!
product3 = Product.new(quantity: 10, end_date: "20/06/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528363257/te%CC%81le%CC%81chargement.jpg")
product3.element = epinard2
product3.save!
product4 = Product.new(quantity: 20, end_date: "23/09/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528363257/tomato.jpg")
product4.element = tomate2
product4.save!
product5 = Product.new(quantity: 10, end_date: "15/07/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528363363/epinard-eb081013-100-l750-h512.jpg")
product5.element = epinard3
product5.save!
product6 = Product.new(quantity: 30, end_date: "25/08/2018", photo: "https://res.cloudinary.com/bdmbdm/image/upload/v1528363417/467_481_graines-tomate-poire-jaune.jpg")
product6.element = tomate3
product6.save!

# # Create a few logs

# 3.times do
#   log = Log.new(category: "Semis")
#   log.user = alexia
#   log.save!
#   log_scope = LogScope.new
#   log_scope.element = alexia.garden.zones.first.elements.first
#   log_scope.log = log
#   log_scope.save!
# end

# 10.times do
#   log = Log.new(category: "Semis")
#   log.user = bruno
#   log.save!
#   log_scope = LogScope.new
#   log_scope.element = bruno.garden.zones.first.elements.first
#   log_scope.log = log
#   log_scope.save!
# end

# 20.times do
#   log = Log.new(category: "Semis")
#   log.user = louisa
#   log.save!
#   log_scope = LogScope.new
#   log_scope.element = louisa.garden.zones.first.elements.first
#   log_scope.log = log
#   log_scope.save!
# end



# seedling = Log.new(category: "seed", description: "i did my work today, i'm happy", quantity: "100", status: false, date: '21/05/2018')
# seedling.user = bruno
# seedling.save!

# Arrosage = Log.new(category: "maintenance", description: "Arrosage the oignons", status: false, date: '24/04/2018')
# Arrosage.user = bruno
# Arrosage.save!

# cutting = Log.new(category: "Semis", description: "cutting the dead branches", status: false, date: '24/03/2018')
# cutting.user = bruno
# cutting.save!

# digging = Log.new(category: "Labourage", description: "preparing the soil", status: true, date: '24/02/2018')
# digging.user = bruno
# digging.save!

# feeding = Log.new(category: "Labourage", description: "preparing the soil", status: true, date: '24/05/2018')
# feeding.user = bruno
# feeding.save!


# # create log_scope
# scope1 = LogScope.new
# log_id = seedling.id
# scope1.element_id = leeki.id
# scope1.save!

# scope2 = LogScope.new
# scope2.log_id = Arrosage.id
# scope2.element_id = oignon.id
# scope2.save!

# scope3 = LogScope.new
# scope3.log_id = cutting.id
# scope3.element_id = carottes.id
# scope3.save!


# scope4 = LogScope.new
# scope4.log_id = digging.id
# scope4.element_id = donkey.id
# scope4.save!


# create follows


puts "our first users, gardens, zones, elements and logs have been save!d with success. love from the radicl team"
puts "zones save!d"
puts "Is anybody here? Hellooo ? I'm a tiny ant stuck in the machine"
puts "Bitch better have my money ... OUH LA LA"
puts "ACHETEZ MES BONNES PATATES ! 5 EURO ! 5 EURO LA PATATE BIO"
