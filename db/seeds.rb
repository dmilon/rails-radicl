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
olivier = User.create(admin: true, email: "olivier@gmail.com", password: "password", name: "olivier", remote_avatar_url: "https://avatars2.githubusercontent.com/u/13285082?v=4")
delphine = User.create(admin: true, email: "delphine@gmail.com", password: "password", name: "delphine", remote_avatar_url: "https://avatars2.githubusercontent.com/u/13285082?v=4")
juliette = User.create(admin: true, email: "juliette@gmail.com", password: "password", name: "juliette", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
denis = User.create(admin: true, email: "denis@gmail.com", password: "password", name: "denis", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
lea = User.create(admin: true, email: "lea@gmail.com", password: "password", name: "denis", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
mohammed = User.create(admin: true, email: "mohammed@gmail.com", password: "password", name: "mohammed", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
arnold = User.create(admin: true, email: "arnold@gmail.com", password: "password", name: "arnold", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")
irene = User.create(admin: true, email: "irene@gmail.com", password: "password", name: "irene", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg")


# Create Damien's farms
champs = Garden.new(name: "L'envie des champs", area: "200",
  address: "La Heslière, 61290 Longny-au-Perche", latitude: 48.530741, longitude: 0.784926,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528190395/photo-1444755303876-9cbab89f863c.jpg')
champs.save
damien.garden = champs
damien.save

# Create zones
aromatics = Zone.new(name: "Aromatics", area: "3", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
aromatics.garden = champs
aromatics.save

veggie = Zone.new(name: "Vegetables", area: "50", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
veggie.garden = champs
veggie.save

hen = Zone.new(name: "Henhouse", area: "20", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528036811/photo-1495696386015-f371820f82a6.jpg")
hen.garden = champs
hen.save


# Create elements & logs & logs scopes for Damien
carrot = Element.new(name: "Carrot", quantity: "50")
carrot.zone = veggie
carrot.save

beetroot1 = Element.new(name: "Beetroot", quantity: "30")
beetroot1.zone = veggie
beetroot1.save

onion1 = Element.new(name: "Onion", quantity: "30")
onion1.zone = veggie
onion1.save

artichoke = Element.new(name: "Artichoke", quantity: "20")
artichoke.zone = veggie
artichoke.save

spinach = Element.new(name: "Spinach", quantity: "20")
spinach.zone = veggie
spinach.save

tomatoe = Element.new(name: "Tomatoe", quantity: "20")
tomatoe.zone = veggie
tomatoe.save


#logs
soil1 = Log.new(category: "preparing soil", description: "preparing soil for my carrots, digging and weeding", status: true, date: '2018-05-04')
soil1.user = damien
soil1.save

scope1 = LogScope.new
scope1.log_id = soil1.id
scope1.element_id = carrot.id
scope1.save

fert1 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-05-15')
fert1.user = damien
fert1.save

scope2 = LogScope.new
scope2.log_id = fert1.id
scope2.element_id = carrot.id
scope2.save

sow1 = Log.new(category: "sowing", description: "spread carrots seeds", status: true, date: '2018-05-25')
sow1.user = damien
sow1.save

scope3 = LogScope.new
scope3.log_id = sow1.id
scope3.element_id = carrot.id
scope3.save

trans1 = Log.new(category: "transplanting", description: "moving carrots into the garden", status: true, date: '2018-05-30')
trans1.user = damien
trans1.save

scope4 = LogScope.new
scope4.log_id = trans1.id
scope4.element_id = carrot.id
scope4.save

wat1 = Log.new(category: "watering", description: "watering the carrots", status: true, date: '2018-05-30')
wat1.user = damien
wat1.save

scope5 = LogScope.new
scope5.log_id = wat1.id
scope5.element_id = carrot.id
scope5.save

soil2 = Log.new(category: "preparing soil", description: "preparing soil for my beetroots, digging and weeding", status: true, date: '2018-06-01')
soil2.user = damien
soil2.save

scope6 = LogScope.new
scope6.log_id = soil2.id
scope6.element_id = beetroot1.id
scope6.save

fert2 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-06-01')
fert2.user = damien
fert2.save

scope7 = LogScope.new
scope7.log_id = fert2.id
scope7.element_id = beetroot1.id
scope7.save

caring1 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring1.user = damien
caring1.save

scope8 = LogScope.new
scope8.log_id = caring1.id
scope8.element_id = onion1.id
scope8.save


soil3 = Log.new(category: "preparing soil", description: "preparing soil for my artichoke, digging and weeding", status: true, date: '2018-06-02')
soil3.user = damien
soil3.save

scope9 = LogScope.new
scope9.log_id = soil3.id
scope9.element_id = artichoke.id
scope9.save

fert3 = Log.new(category: "fertilisating", description: "spread the compost on artichoke", status: true, date: '2018-06-02')
fert3.user = damien
fert3.save

scope10 = LogScope.new
scope10.log_id = fert3.id
scope10.element_id = artichoke.id
scope10.save

sow2 = Log.new(category: "sowing", description: "spread artichoke seeds", status: true, date: '2018-06-03')
sow2.user = damien
sow2.save

scope11 = LogScope.new
scope11.log_id = sow2.id
scope11.element_id = artichoke.id
scope11.save

soil4 = Log.new(category: "preparing soil", description: "preparing soil for my spinach, digging and weeding", status: true, date: '2018-06-01')
soil4.user = damien
soil4.save

scope12 = LogScope.new
scope12.log_id = soil4.id
scope12.element_id = spinach.id
scope12.save

fert4 = Log.new(category: "fertilisating", description: "spread the compost on spinach", status: true, date: '2018-06-03')
fert4.user = damien
fert4.save

scope13 = LogScope.new
scope13.log_id = fert4.id
scope13.element_id = spinach.id
scope13.save


soil5 = Log.new(category: "preparing soil", description: "preparing soil for my spinach, digging and weeding", status: true, date: '2018-06-01')
soil5.user = damien
soil5.save

scope14 = LogScope.new
scope14.log_id = soil5.id
scope14.element_id = tomatoe.id
scope14.save

fert5 = Log.new(category: "fertilisating", description: "spread the compost on tomatoe", status: true, date: '2018-06-03')
fert5.user = damien
fert5.save

scope15 = LogScope.new
scope15.log_id = fert5.id
scope15.element_id = tomatoe.id
scope15.save


#Create Bruno's Farm
ferme_de_quelenne = Garden.new(name: "Ferme maraîchère de Quélénesse", area: "4530",
  address: 'D918, 61290 Longny-au-Perche', latitude: 48.538352, longitude: 0.746001,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1499348287264-a2603bc210c9.jpg')
ferme_de_quelenne.save!
bruno.garden = ferme_de_quelenne
bruno.save!

# Create zones
aromatics2 = Zone.new(name: "Aromatics", area: "4", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
aromatics2.garden = ferme_de_quelenne
aromatics2.save

veggie2 = Zone.new(name: "Vegetables", area: "200", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
veggie2.garden = ferme_de_quelenne
veggie2.save

hen2 = Zone.new(name: "Henhouse", area: "30", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528036811/photo-1495696386015-f371820f82a6.jpg")
hen2.garden = ferme_de_quelenne
hen2.save

beehouse = Zone.new(name: "Beehouse", area: "20", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1498936178812-4b2e558d2937.jpg")
beehouse.garden = ferme_de_quelenne
beehouse.save

sheepfold = Zone.new(name: "Sheepfold", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1520644981554-74cd132a97e8.jpg")
sheepfold.garden = ferme_de_quelenne
sheepfold.save

orchard = Zone.new(name: "Orchard", area: "1000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1505872342847-6dbb5e76cd31.jpg")
orchard.garden = ferme_de_quelenne
orchard.save

crops = Zone.new(name: "Crops", area: "3000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209412/u3hg11kfxoz4g6detvhy.jpg")
crops.garden = ferme_de_quelenne
crops.save

forest = Zone.new(name: "Forest", area: "5000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209412/u3hg11kfxoz4g6detvhy.jpg")
forest.garden = ferme_de_quelenne
forest.save

#create elements
pumpkin1 = Element.new(name: "Pumpkin", quantity: "50")
pumpkin1.zone = veggie2
pumpkin1.save

cucumber1 = Element.new(name: "Cucumber", quantity: "30")
cucumber1.zone = veggie2
cucumber1.save

onion2 = Element.new(name: "Onion", quantity: "30")
onion2.zone = veggie2
onion2.save

artichoke2 = Element.new(name: "Artichoke", quantity: "20")
artichoke2.zone = veggie2
artichoke2.save

spinach2 = Element.new(name: "Spinach", quantity: "20")
spinach2.zone = veggie2
spinach2.save

tomatoe2 = Element.new(name: "Tomatoe", quantity: "20")
tomatoe2.zone = veggie2
tomatoe2.save

carrot2 = Element.new(name: "Carrot", quantity: "60")
carrot2.zone = veggie2
carrot2.save

beetroot2 = Element.new(name: "Beetroot", quantity: "30")
beetroot2.zone = veggie2
beetroot2.save

potatoe1 = Element.new(name: "Potatoe", quantity: "20")
potatoe1.zone = veggie2
potatoe1.save

#create logs and logscopes for Bruno
soil6 = Log.new(category: "preparing soil", description: "preparing soil for my pumpkins, digging and weeding", status: true, date: '2018-01-04')
soil6.user = bruno
soil6.save

scope16 = LogScope.new
scope16.log_id = soil6.id
scope16.element_id = pumpkin1.id
scope16.save

fert6 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-02-15')
fert6.user = bruno
fert6.save

scope17 = LogScope.new
scope17.log_id = fert6.id
scope17.element_id = pumpkin1.id
scope17.save

sow3 = Log.new(category: "sowing", description: "spread pumpkins seeds", status: true, date: '2018-03-25')
sow3.user = bruno
sow3.save

scope18 = LogScope.new
scope18.log_id = sow3.id
scope18.element_id = pumpkin1.id
scope18.save


trans2 = Log.new(category: "transplanting", description: "moving pumpkins into the garden", status: true, date: '2018-03-30')
trans2.user = bruno
trans2.save

scope19 = LogScope.new
scope19.log_id = trans2.id
scope19.element_id = pumpkin1.id
scope19.save

caring2 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring2.user = bruno
caring2.save

scope20 = LogScope.new
scope20.log_id = caring2.id
scope20.element_id = pumpkin1.id
scope20.save

#cucumber
soil7 = Log.new(category: "preparing soil", description: "preparing soil for my cucumbers, digging and weeding", status: true, date: '2018-01-04')
soil7.user = bruno
soil7.save

scope21 = LogScope.new
scope21.log_id = soil7.id
scope21.element_id = cucumber1.id
scope21.save

fert7 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-02-15')
fert7.user = bruno
fert7.save

scope22 = LogScope.new
scope22.log_id = fert7.id
scope22.element_id = cucumber1.id
scope22.save

sow4 = Log.new(category: "sowing", description: "spread cucumber seeds", status: true, date: '2018-03-25')
sow4.user = bruno
sow4.save

scope23 = LogScope.new
scope23.log_id = sow4.id
scope23.element_id = cucumber1.id
scope23.save

trans3 = Log.new(category: "transplanting", description: "moving cucumber into the garden", status: true, date: '2018-03-30')
trans3.user = bruno
trans3.save

scope24 = LogScope.new
scope24.log_id = trans3.id
scope24.element_id = cucumber1.id
scope24.save

caring3 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring3.user = bruno
caring3.save

scope25 = LogScope.new
scope25.log_id = caring3.id
scope25.element_id = cucumber1.id
scope25.save

weeding1 = Log.new(category: "weeding", description: "weeding for my cucumbers", status: true, date: '2018-06-02')
weeding1.user = bruno
weeding1.save

scope26 = LogScope.new
scope26.log_id = weeding1.id
scope26.element_id = cucumber1.id
scope26.save

#tomatoes

soil8 = Log.new(category: "preparing soil", description: "preparing soil for my tomatoes, digging and weeding", status: true, date: '2018-01-04')
soil8.user = bruno
soil8.save

scope27 = LogScope.new
scope27.log_id = soil8.id
scope27.element_id = tomatoe2.id
scope27.save

fert8 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-02-15')
fert8.user = bruno
fert8.save

scope28 = LogScope.new
scope28.log_id = fert8.id
scope28.element_id = tomatoe2.id
scope28.save

sow5 = Log.new(category: "sowing", description: "spread tomatoe seeds", status: true, date: '2018-03-25')
sow5.user = bruno
sow5.save

scope29 = LogScope.new
scope29.log_id = sow5.id
scope29.element_id = tomatoe2.id
scope29.save

trans4 = Log.new(category: "transplanting", description: "moving tomatoe into the garden", status: true, date: '2018-03-30')
trans4.user = bruno
trans4.save

scope30 = LogScope.new
scope30.log_id = trans4.id
scope30.element_id = tomatoe2.id
scope30.save

weeding2 = Log.new(category: "weeding", description: "weeding for my tomatoes", status: true, date: '2018-06-02')
weeding2.user = bruno
weeding2.save

scope31 = LogScope.new
scope31.log_id = weeding2.id
scope31.element_id = tomatoe2.id
scope31.save

#artichoke

soil9 = Log.new(category: "preparing soil", description: "preparing soil for my artichokes, digging and weeding", status: true, date: '2018-03-04')
soil9.user = bruno
soil9.save

scope32 = LogScope.new
scope32.log_id = soil9.id
scope32.element_id = artichoke2.id
scope32.save

fert9 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert9.user = bruno
fert9.save

scope33 = LogScope.new
scope33.log_id = fert9.id
scope33.element_id = artichoke2.id
scope33.save

sow6 = Log.new(category: "sowing", description: "spread artichoke seeds", status: true, date: '2018-03-25')
sow6.user = bruno
sow6.save

scope34 = LogScope.new
scope34.log_id = sow6.id
scope34.element_id = artichoke2.id
scope34.save

trans5 = Log.new(category: "transplanting", description: "moving artichokes into the garden", status: true, date: '2018-06-02')
trans5.user = bruno
trans5.save

scope35 = LogScope.new
scope35.log_id = trans5.id
scope35.element_id = artichoke2.id
scope35.save

#spinach

soil10 = Log.new(category: "preparing soil", description: "preparing soil for my spinach, digging and weeding", status: true, date: '2018-03-04')
soil10.user = bruno
soil10.save

scope36 = LogScope.new
scope36.log_id = soil10.id
scope36.element_id = spinach2.id
scope36.save

fert10 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert10.user = bruno
fert10.save

scope37 = LogScope.new
scope37.log_id = fert10.id
scope37.element_id = spinach2.id
scope37.save

sow7 = Log.new(category: "sowing", description: "spread spinach seeds", status: true, date: '2018-04-25')
sow7.user = bruno
sow7.save

scope38 = LogScope.new
scope38.log_id = sow7.id
scope38.element_id = spinach2.id
scope38.save

trans6 = Log.new(category: "transplanting", description: "moving spinach into the garden", status: true, date: '2018-06-02')
trans6.user = bruno
trans6.save

scope38 = LogScope.new
scope38.log_id = trans6.id
scope38.element_id = spinach2.id
scope38.save

caring4 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring4.user = bruno
caring4.save

scope39 = LogScope.new
scope39.log_id = caring4.id
scope39.element_id = spinach2.id
scope39.save

#onions

soil11 = Log.new(category: "preparing soil", description: "preparing soil for my onion, digging and weeding", status: true, date: '2018-03-04')
soil11.user = bruno
soil11.save

scope40 = LogScope.new
scope40.log_id = soil11.id
scope40.element_id = onion2.id
scope40.save

fert11 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert11.user = bruno
fert11.save

scope41 = LogScope.new
scope41.log_id = fert11.id
scope41.element_id = onion2.id
scope41.save

sow8 = Log.new(category: "sowing", description: "spread onion seeds", status: true, date: '2018-04-25')
sow8.user = bruno
sow8.save

scope42 = LogScope.new
scope42.log_id = sow8.id
scope42.element_id = onion2.id
scope42.save

trans7 = Log.new(category: "transplanting", description: "moving onion into the garden", status: true, date: '2018-06-02')
trans7.user = bruno
trans7.save

scope43 = LogScope.new
scope43.log_id = trans7.id
scope43.element_id = onion2.id
scope43.save

caring5 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring5.user = bruno
caring5.save

scope44 = LogScope.new
scope44.log_id = caring5.id
scope44.element_id = onion2.id
scope44.save

#beetroot

soil12 = Log.new(category: "preparing soil", description: "preparing soil for my beetroot, digging and weeding", status: true, date: '2018-03-04')
soil12.user = bruno
soil12.save

scope45 = LogScope.new
scope45.log_id = soil12.id
scope45.element_id = beetroot2.id
scope45.save

fert12 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert12.user = bruno
fert12.save

scope46 = LogScope.new
scope46.log_id = fert12.id
scope46.element_id = beetroot2.id
scope46.save

sow9 = Log.new(category: "sowing", description: "spread beetroot seeds", status: true, date: '2018-04-25')
sow9.user = bruno
sow9.save

scope47 = LogScope.new
scope47.log_id = sow9.id
scope47.element_id = beetroot2.id
scope47.save

#potatoes
soil13 = Log.new(category: "preparing soil", description: "preparing soil for my potatoe, digging and weeding", status: true, date: '2018-03-04')
soil13.user = bruno
soil13.save

scope48 = LogScope.new
scope48.log_id = soil13.id
scope48.element_id = potatoe1.id
scope48.save

#carrots
soil14 = Log.new(category: "preparing soil", description: "preparing soil for my carrot digging and weeding", status: true, date: '2018-03-04')
soil14.user = bruno
soil14.save

scope49 = LogScope.new
scope49.log_id = soil14.id
scope49.element_id = carrot2.id
scope49.save

fert13 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert13.user = bruno
fert13.save

scope50 = LogScope.new
scope50.log_id = fert13.id
scope50.element_id = carrot2.id
scope50.save

sow10 = Log.new(category: "sowing", description: "spread carrot seeds", status: true, date: '2018-04-25')
sow10.user = bruno
sow10.save

scope51 = LogScope.new
scope51.log_id = sow10.id
scope51.element_id = carrot2.id
scope51.save

trans8 = Log.new(category: "transplanting", description: "moving carrot into the garden", status: true, date: '2018-06-02')
trans8.user = bruno
trans8.save

scope52 = LogScope.new
scope52.log_id = trans8.id
scope52.element_id = carrot2.id
scope52.save

caring6 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring6.user = bruno
caring6.save

scope53 = LogScope.new
scope53.log_id = caring6.id
scope53.element_id = carrot2.id
scope53.save

# Create Juliette's farm
bizou = Garden.new(name: "Ferme du Bizou", area: "4000", address: "La Bellangerie, 61110 Moutiers-au-Perche", latitude: 48.494182, longitude: 0.834733,remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528187374/photo-1473973266408-ed4e27abdd47.jpg" )
bizou.save!
juliette.garden = bizou
juliette.save!

# Create zones
aromatics3 = Zone.new(name: "Aromatics", area: "4", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
aromatics3.garden = bizou
aromatics3.save

veggie3 = Zone.new(name: "Vegetables", area: "200", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
veggie3.garden = bizou
veggie3.save

hen3 = Zone.new(name: "Henhouse", area: "30", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528036811/photo-1495696386015-f371820f82a6.jpg")
hen3.garden = bizou
hen3.save

beehouse1 = Zone.new(name: "Beehouse", area: "20", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1498936178812-4b2e558d2937.jpg")
beehouse1.garden = bizou
beehouse1.save

sheepfold1 = Zone.new(name: "Sheepfold", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1520644981554-74cd132a97e8.jpg")
sheepfold1.garden = bizou
sheepfold1.save

orchard1 = Zone.new(name: "Orchard", area: "1000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1505872342847-6dbb5e76cd31.jpg")
orchard1.garden = bizou
orchard1.save

crops1 = Zone.new(name: "Crops", area: "3000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209412/u3hg11kfxoz4g6detvhy.jpg")
crops1.garden = bizou
crops1.save

forest1 = Zone.new(name: "Forest", area: "5000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209412/u3hg11kfxoz4g6detvhy.jpg")
forest1.garden = bizou
forest1.save

#create elements
pumpkin2 = Element.new(name: "Pumpkin", quantity: "50")
pumpkin2.zone = veggie3
pumpkin2.save

cucumber2 = Element.new(name: "Cucumber", quantity: "30")
cucumber2.zone = veggie3
cucumber2.save

onion3 = Element.new(name: "Onion", quantity: "30")
onion3.zone = veggie3
onion3.save

artichoke3 = Element.new(name: "Artichoke", quantity: "20")
artichoke3.zone = veggie3
artichoke3.save

spinach3 = Element.new(name: "Spinach", quantity: "20")
spinach3.zone = veggie3
spinach3.save

tomatoe3 = Element.new(name: "Tomatoe", quantity: "20")
tomatoe3.zone = veggie3
tomatoe3.save

carrot3 = Element.new(name: "Carrot", quantity: "60")
carrot3.zone = veggie3
carrot3.save

beetroot3 = Element.new(name: "Beetroot", quantity: "30")
beetroot3.zone = veggie3
beetroot3.save

potatoe2 = Element.new(name: "Potatoe", quantity: "20")
potatoe2.zone = veggie3
potatoe2.save

#create logs and logscopes for Juliette
soil15 = Log.new(category: "preparing soil", description: "preparing soil for my pumpkins, digging and weeding", status: true, date: '2018-01-04')
soil15.user = juliette
soil15.save

scope54 = LogScope.new
scope54.log_id = soil15.id
scope54.element_id = pumpkin2.id
scope54.save

fert14 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-02-15')
fert14.user = juliette
fert14.save

scope55 = LogScope.new
scope55.log_id = fert14.id
scope55.element_id = pumpkin2.id
scope55.save

sow11 = Log.new(category: "sowing", description: "spread pumpkins seeds", status: true, date: '2018-03-25')
sow11.user = juliette
sow11.save

scope56 = LogScope.new
scope56.log_id = sow11.id
scope56.element_id = pumpkin2.id
scope56.save

trans9 = Log.new(category: "transplanting", description: "moving pumpkins into the garden", status: true, date: '2018-03-30')
trans9.user = juliette
trans9.save

scope57 = LogScope.new
scope57.log_id = trans9.id
scope57.element_id = pumpkin2.id
scope57.save

caring8 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring8.user = juliette
caring8.save

scope58 = LogScope.new
scope58.log_id = caring8.id
scope58.element_id = pumpkin2.id
scope58.save

#cucumber
soil15 = Log.new(category: "preparing soil", description: "preparing soil for my cucumbers, digging and weeding", status: true, date: '2018-01-04')
soil15.user = juliette
soil15.save

scope59 = LogScope.new
scope59.log_id = soil15.id
scope59.element_id = cucumber2.id
scope59.save

fert15 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-02-15')
fert15.user = juliette
fert15.save

scope60 = LogScope.new
scope60.log_id = fert15.id
scope60.element_id = cucumber2.id
scope60.save

sow12 = Log.new(category: "sowing", description: "spread cucumber seeds", status: true, date: '2018-03-25')
sow12.user = juliette
sow12.save

scope61 = LogScope.new
scope61.log_id = sow12.id
scope61.element_id = cucumber2.id
scope61.save

trans10 = Log.new(category: "transplanting", description: "moving cucumber into the garden", status: true, date: '2018-03-30')
trans10.user = juliette
trans10.save

scope62 = LogScope.new
scope62.log_id = trans10.id
scope62.element_id = cucumber2.id
scope62.save

caring9 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring9.user = juliette
caring9.save

scope63 = LogScope.new
scope63.log_id = caring9.id
scope63.element_id = cucumber2.id
scope63.save

weeding3 = Log.new(category: "weeding", description: "weeding for my cucumbers", status: true, date: '2018-06-02')
weeding3.user = juliette
weeding3.save

scope64 = LogScope.new
scope64.log_id = weeding3.id
scope64.element_id = cucumber2.id
scope64.save

#tomatoes

soil16 = Log.new(category: "preparing soil", description: "preparing soil for my tomatoes, digging and weeding", status: true, date: '2018-01-04')
soil16.user = juliette
soil16.save

scope65 = LogScope.new
scope65.log_id = soil16.id
scope65.element_id = tomatoe3.id
scope65.save

fert16 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-02-15')
fert16.user = juliette
fert16.save

scope66 = LogScope.new
scope66.log_id = fert16.id
scope66.element_id = tomatoe3.id
scope66.save

sow13 = Log.new(category: "sowing", description: "spread tomatoe seeds", status: true, date: '2018-03-25')
sow13.user = juliette
sow13.save

scope67 = LogScope.new
scope67.log_id = sow13.id
scope67.element_id = tomatoe3.id
scope67.save

trans11 = Log.new(category: "transplanting", description: "moving tomatoe into the garden", status: true, date: '2018-03-30')
trans11.user = juliette
trans11.save

scope68 = LogScope.new
scope68.log_id = trans11.id
scope68.element_id = tomatoe3.id
scope68.save

weeding4 = Log.new(category: "weeding", description: "weeding for my tomatoes", status: true, date: '2018-06-02')
weeding4.user = juliette
weeding4.save

scope69 = LogScope.new
scope69.log_id = weeding4.id
scope69.element_id = tomatoe3.id
scope69.save

#artichoke

soil18 = Log.new(category: "preparing soil", description: "preparing soil for my artichokes, digging and weeding", status: true, date: '2018-03-04')
soil18.user = juliette
soil18.save

scope70 = LogScope.new
scope70.log_id = soil18.id
scope70.element_id = artichoke3.id
scope70.save

fert17 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert17.user = juliette
fert17.save

scope71 = LogScope.new
scope71.log_id = fert17.id
scope71.element_id = artichoke3.id
scope71.save

sow14 = Log.new(category: "sowing", description: "spread artichoke seeds", status: true, date: '2018-03-25')
sow14.user = juliette
sow14.save

scope72 = LogScope.new
scope72.log_id = sow14.id
scope72.element_id = artichoke3.id
scope72.save

trans12 = Log.new(category: "transplanting", description: "moving artichokes into the garden", status: true, date: '2018-06-02')
trans12.user = juliette
trans12.save

scope73 = LogScope.new
scope73.log_id = trans12.id
scope73.element_id = artichoke3.id
scope73.save

#spinach

soil19 = Log.new(category: "preparing soil", description: "preparing soil for my spinach, digging and weeding", status: true, date: '2018-03-04')
soil19.user = juliette
soil19.save

scope74 = LogScope.new
scope74.log_id = soil19.id
scope74.element_id = spinach3.id
scope74.save

fert18 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert18.user = juliette
fert18.save

scope75 = LogScope.new
scope75.log_id = fert18.id
scope75.element_id = spinach3.id
scope75.save

sow15 = Log.new(category: "sowing", description: "spread spinach seeds", status: true, date: '2018-04-25')
sow15.user = juliette
sow15.save

scope76 = LogScope.new
scope76.log_id = sow15.id
scope76.element_id = spinach3.id
scope76.save

trans12 = Log.new(category: "transplanting", description: "moving spinach into the garden", status: true, date: '2018-06-02')
trans12.user = juliette
trans12.save

scope77 = LogScope.new
scope77.log_id = trans12.id
scope77.element_id = spinach3.id
scope77.save

caring10 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring10.user = juliette
caring10.save

scope78 = LogScope.new
scope78.log_id = caring10.id
scope78.element_id = spinach3.id
scope78.save

#onions

soil20 = Log.new(category: "preparing soil", description: "preparing soil for my onion, digging and weeding", status: true, date: '2018-03-04')
soil20.user = juliette
soil20.save

scope79 = LogScope.new
scope79.log_id = soil20.id
scope79.element_id = onion3.id
scope79.save

fert19 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert19.user = juliette
fert19.save

scope80 = LogScope.new
scope80.log_id = fert19.id
scope80.element_id = onion3.id
scope80.save

sow16 = Log.new(category: "sowing", description: "spread onion seeds", status: true, date: '2018-04-25')
sow16.user = juliette
sow16.save

scope81 = LogScope.new
scope81.log_id = sow16.id
scope81.element_id = onion3.id
scope81.save

trans13 = Log.new(category: "transplanting", description: "moving onion into the garden", status: true, date: '2018-06-02')
trans13.user = juliette
trans13.save

scope82 = LogScope.new
scope82.log_id = trans13.id
scope82.element_id = onion3.id
scope82.save

caring11 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring11.user = juliette
caring11.save

scope83 = LogScope.new
scope83.log_id = caring11.id
scope83.element_id = onion3.id
scope83.save

#beetroot

soil21 = Log.new(category: "preparing soil", description: "preparing soil for my beetroot, digging and weeding", status: true, date: '2018-03-04')
soil21.user = juliette
soil21.save

scope84 = LogScope.new
scope84.log_id = soil21.id
scope84.element_id = beetroot3.id
scope84.save

fert20 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert20.user = juliette
fert20.save

scope85 = LogScope.new
scope85.log_id = fert20.id
scope85.element_id = beetroot3.id
scope85.save

sow17 = Log.new(category: "sowing", description: "spread beetroot seeds", status: true, date: '2018-04-25')
sow17.user = juliette
sow17.save

scope86 = LogScope.new
scope86.log_id = sow17.id
scope86.element_id = beetroot3.id
scope86.save

#potatoes
soil22 = Log.new(category: "preparing soil", description: "preparing soil for my potatoe, digging and weeding", status: true, date: '2018-03-04')
soil22.user = juliette
soil22.save

scope87 = LogScope.new
scope87.log_id = soil22.id
scope87.element_id = potatoe2.id
scope87.save

#carrots
soil23 = Log.new(category: "preparing soil", description: "preparing soil for my carrot digging and weeding", status: true, date: '2018-03-04')
soil23.user = juliette
soil23.save

scope88 = LogScope.new
scope88.log_id = soil23.id
scope88.element_id = carrot3.id
scope88.save

fert21 = Log.new(category: "fertilisating", description: "spread the compost", status: true, date: '2018-03-15')
fert21.user = juliette
fert21.save

scope89 = LogScope.new
scope89.log_id = fert21.id
scope89.element_id = carrot3.id
scope89.save

sow18 = Log.new(category: "sowing", description: "spread carrot seeds", status: true, date: '2018-04-25')
sow18.user = juliette
sow18.save

scope90 = LogScope.new
scope90.log_id = sow18.id
scope90.element_id = carrot3.id
scope90.save

trans14 = Log.new(category: "transplanting", description: "moving carrot into the garden", status: true, date: '2018-06-02')
trans14.user = juliette
trans14.save

scope91 = LogScope.new
scope91.log_id = trans14.id
scope91.element_id = carrot3.id
scope91.save

caring12 = Log.new(category: "caring crops", description: "protecting the plants", status: true, date: '2018-06-02')
caring12.user = juliette
caring12.save

scope92 = LogScope.new
scope92.log_id = caring12.id
scope92.element_id = carrot3.id
scope92.save


ferme_louley = Garden.new(name: "Ferme forestière Louley Médoc", area: "4000",
  address: "9 Rue du Dr Jean Vivares, 61290 Longny-au-Perche", latitude: 48.529327, longitude: 0.751545,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1506140006527-5ca84877d824.jpg')
ferme_louley.save!
louisa.garden = ferme_louley
louisa.save!

maison_ane = Garden.new(name: "La maison de l'âne", area: "4000",
  address: "La Hutte, 61290 Longny-au-Perche", latitude: 48.543471, longitude: 0.714202,
  remote_photo_url: 'https://res.cloudinary.com/bdmbdm/image/upload/v1528190395/photo-1441749074938-1c6782303919.jpg')
maison_ane.save!
alexia.garden = maison_ane
alexia.save!

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





# # Create 8 zones
# Garden.all.each do |garden|
#   zone = Zone.new(name: "Potager", area: "200", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527863158/m8xrduxuketfvxv9mijw.jpg")
#   zone.garden = garden
#   zone.save!
# end


# a = Zone.new(name: "Aromates", area: "300", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1528209665/photo-1509727841791-40d09ad9b7fc.jpg")
# a.garden = ferme_de_quelenne
# a.save




# c = Zone.new(name: "Chevaux", area: "2500", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1511374322656-82cdd30150c9.jpg")
# c.garden = ferme_de_quelenne
# c.save

# d = Zone.new(name: "Ruches", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843407/photo-1498936178812-4b2e558d2937.jpg")
# d.garden = ferme_de_quelenne
# d.save

# e = Zone.new(name: "Verger", area: "100", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1505872342847-6dbb5e76cd31.jpg")
# e.garden = ferme_de_quelenne
# e.save

# f = Zone.new(name: "Vaches", area: "500", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843408/photo-1500595046743-cd271d694d30.jpg" )
# f.garden = ferme_de_quelenne
# f.save

# g = Zone.new(name: "Moutons", area: "4000", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1520644981554-74cd132a97e8.jpg")
# g.garden = ferme_de_quelenne
# g.save

# h = Zone.new(name: "Cochons", area: "300", remote_photo_url: "https://res.cloudinary.com/bdmbdm/image/upload/v1527843409/photo-1524317818500-ab1fded2ce81.jpg")
# h.garden = ferme_de_quelenne
# h.save

# i = Zone.new(name: "Zone 6", area: "10")
# i.garden = maison_ane
# i.save

# j = Zone.new(name: "Zone 7", area: "3")
# j.garden = maison_ane
# j.save

# k = Zone.new(name: "Zone 8", area: "70")
# k.garden = maison_ane
# k.save

# l = Zone.new(name: "Verger", area: "700")
# l.garden = maison_ane
# l.save

# m = Zone.new(name: "Fruits", area: "30")
# m.garden = maison_ane
# m.save

# n = Zone.new(name: "Ruches", area: "100")
# n.garden = maison_ane
# n.save

# o = Zone.new(name: "Potager", area: "20")
# o.garden = maison_ane
# o.save

# p = Zone.new(name: "Donkeys", area: "200")
# p.garden = maison_ane
# p.save


# # Create 10 elements
# Garden.all.each do |garden|
#   carrot = Element.new(name: "Carrots", quantity: "300")
#   carrot.zone = garden.zones.first
#   carrot.save!
# end

# beetroot = Element.new(name: "Beetroot", quantity: "200")
# beetroot.zone = a
# beetroot.save

# onion = Element.new(name: "Onion", quantity: "100")
# onion.zone = a
# onion.save

# leek = Element.new(name: "Leek", quantity: "10")
# leek.zone = a
# leek.save

# leeks = Element.new(name: "Leeks", quantity: "100")
# leeks.zone = o
# leeks.save

# carrots = Element.new(name: "Carrots", quantity: "300")
# carrots.zone = o
# carrots.save

# beetradish = Element.new(name: "Beetroot", quantity: "200")
# beetradish.zone = o
# beetradish.save

# onions = Element.new(name: "Onion", quantity: "100")
# onions.zone = o
# onions.save

# leeki = Element.new(name: "Leek", quantity: "10")
# leeki.zone = n
# leeki.save

# bees = Element.new(name: "Bees", quantity: "10000")
# bees.zone = m
# bees.save

# donkey = Element.new(name: "Donkey", quantity: "3")
# donkey.zone = n
# donkey.save

# horses = Element.new(name: "Horse", quantity: "18")
# horses.zone = c
# horses.save

follow1 = Follow.new(user: damien, garden: ferme_de_quelenne)
follow1.save

product1 = Product.new(quantity: 10, end_date: "15/06/2018")
product1.element = carrot2
product1.save
product2 = Product.new(quantity: 30, end_date: "15/06/2018")
product2.element = artichoke2
product2.save
product3 = Product.new(quantity: 10, end_date: "20/06/2018")
product3.element = spinach2
product3.save
product4 = Product.new(quantity: 20, end_date: "23/09/2018")
product4.element = tomatoe2
product4.save
product5 = Product.new(quantity: 10, end_date: "15/07/2018")
product5.element = spinach3
product5.save
product6 = Product.new(quantity: 30, end_date: "25/08/2018")
product6.element = tomatoe3
product6.save

# # Create a few logs

# 3.times do
#   log = Log.new(category: "sowing")
#   log.user = alexia
#   log.save!
#   log_scope = LogScope.new
#   log_scope.element = alexia.garden.zones.first.elements.first
#   log_scope.log = log
#   log_scope.save!
# end

# 10.times do
#   log = Log.new(category: "sowing")
#   log.user = bruno
#   log.save!
#   log_scope = LogScope.new
#   log_scope.element = bruno.garden.zones.first.elements.first
#   log_scope.log = log
#   log_scope.save!
# end

# 20.times do
#   log = Log.new(category: "sowing")
#   log.user = louisa
#   log.save!
#   log_scope = LogScope.new
#   log_scope.element = louisa.garden.zones.first.elements.first
#   log_scope.log = log
#   log_scope.save!
# end



# seedling = Log.new(category: "seed", description: "i did my work today, i'm happy", quantity: "100", status: false, date: '21/05/2018')
# seedling.user = bruno
# seedling.save

# watering = Log.new(category: "maintenance", description: "watering the onions", status: false, date: '24/04/2018')
# watering.user = bruno
# watering.save

# cutting = Log.new(category: "sowing", description: "cutting the dead branches", status: false, date: '24/03/2018')
# cutting.user = bruno
# cutting.save

# digging = Log.new(category: "preparing soil", description: "preparing the soil", status: true, date: '24/02/2018')
# digging.user = bruno
# digging.save

# feeding = Log.new(category: "preparing soil", description: "preparing the soil", status: true, date: '24/05/2018')
# feeding.user = bruno
# feeding.save


# # create log_scope
# scope1 = LogScope.new
# log_id = seedling.id
# scope1.element_id = leeki.id
# scope1.save

# scope2 = LogScope.new
# scope2.log_id = watering.id
# scope2.element_id = onion.id
# scope2.save

# scope3 = LogScope.new
# scope3.log_id = cutting.id
# scope3.element_id = carrots.id
# scope3.save


# scope4 = LogScope.new
# scope4.log_id = digging.id
# scope4.element_id = donkey.id
# scope4.save


# create follows



puts "our first users, gardens, zones, elements and logs have been saved with success. love from the radicl team"
puts "zones saved"
puts "Is anybody here? Hellooo ? I'm a tiny ant stuck in the machine"
puts "Bitch better have my money ... OUH LA LA"
puts "ACHETEZ MES BONNES PATATES ! 5 EURO ! 5 EURO LA PATATE BIO"

