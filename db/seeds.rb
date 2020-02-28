require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create!(
  email: 'worldsaver@testing.com',
  password: 'password'
)

admin = User.create!(
  email: 'admin@plenty.com',
  password: 'password',
  admin: true
)

user_1 = User.create!(
  email: 'user@testing.com',
  password: 'password'
)

puts 'user successfully created'

puts 'creating categories'

humanitary = Category.new(
    name: 'Humanitary'
  )
humanitary.save!

education = Category.new(
    name: 'Education'
  )
education.save!

local = Category.new(
    name: 'Local'
  )
local.save!

environment = Category.new(
    name: 'Environment'
  )
environment.save!

puts 'categories successfully created'


puts 'Creating 22 fake projects...'
puts 'And some fake articles linked to them'
start_time = Time.now



project = Project.new(
  name:    "Provide food to 700 Street Children",
  short_description: "With a small donation of 10€ per months/ child, you can finance 2 meals a day for an entire month.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project.save!

article_project = Article.new(
    title:    "700 hundred meals served on Christmas Eve.",
    description: "We are thrilled to announce that Kenya Connect is a Runner Up Prizewinner of the 2019 Pan-African Award for Entrepreneurship in Education. With an emphasis on sustainability, the awards offer monetary prizes as an investment in organisations whose inspirational work is transforming the futures of African Youth.
 Supported by The Saville Foundation and managed by Teach A Man To Fish, the Pan-African Awards combine the aims and expertise of both organisations. Kenya Connect was selected out of 340 organizations and the only NGO in Kenya to win this prestigious award. Read more about the award and other winners HERE
 As a Runner Up, Kenya Connect will receive $5,000 plus Co-Founder and Executive Director, Kenya James Musyoka will travel to London in March to accept the award and participate in engaging seminars and programs. The award prize will help us launch the Mighty Moringa Tree project at six partner schools. ""We are honored and humbled by this award,"" commented James Musyoka. ""This distinction recognizes the work of Kenya Connect as a leader in innovative programs to strengthen education in rural Kenya.""
 The Mighty Moringa Tree will be launched in January as a project that incorporates environmental stewardship and micro enterprise through planting the drought resistant moringa tree that produces a highly nutritious leaves and seeds that can be brewed as a drink or added to soups and stews. Students will follow in the tradition of Wangari Maathai by planting the trees to help mitigate climate change while creating a highly nutrious food source.
 As a donor to Kenya Connect we thought you'd be excited to hear our news. Your support means that we can continue to provide dynamic programs that prepare our students to be engaged citizens and learners.
 We will keep you posted as this project gets underway. Thanks for being a part of our Kenya Connect family!",
    project_id: project.id
  )
  file = URI.open('https://www.globalgiving.org/pfil/13015/unnamed112_Large.jpg')
  article_project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  article_project.save!

project_1 = Project.new(
  name:    "Improving primary forest protection",
  short_description: "Act against illegal logging of protected rainforests in the ",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1469125155630-7ed37e065743?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=100vw&q=80')
project_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_1.save!

article_project_1 = Article.new(
    title:    "Seedlings are continuing to Grow.",
    description: "We are excited that the seedlings planted over the summer are continuing to grow. These seedlings while still not very big, are the start of reforestation, which is crucial in Sierra Leone. Your ongoing support is helping reverse deforestation in Freetown, Sierra Leone. By restoring vegetation and the forest, we are helping to combat global warming and helping to reduce runoff water from the hills. The trees will help to reduce landslides and rockslides that have resulted in the loss of life. Reforestation is essential for the overall health and quality of life in the community. Your support is much appreciated as we continue to follow the steps recommended by the local Environmental Protection Agency for reforestation. We encourage you to consider starting a monthly recurring donation here. Even a few dollars a month will go a long way. Please also share this with your contacts and invite them to consider supporting this ongoing project.",
    project_id: project_1.id
  )
  file = URI.open("https://www.globalgiving.org/pfil/13015/unnamed112_Large.jpg")
  article_project_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  article_project_1.save!


project_2 = Project.new(
  name:    "Protecting endangered species in China",
  short_description: "The vast growth in recent years of the Chinese population, has driven governments to reduce the atural habitaot of endangered species. ",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1550358864-518f202c02ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=100vw&q=80')
project_2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_2.save!

article_project_2 = Article.new(
    title:    "Cooking Stoves help in reduce of gas emission and environment pollution",
    description: "AHD fuel efficient model cooking stove helping rural women to cook safe and secure cooking at household level and their utensils are not more blackish and save cutting tress and wood sue less 50% which helps to reduce women burden to collect more and more wood for cooking purposes. AHD model cooking stove not only helping rural women to cook safe and secure but also reducing gas emissions and making environment safe and secure.
 Green Pakistan project aims to help 1,500 families with tree plantation and cooking stove installation to save women health, we are looking support and donations at YEAR END campaign to help this project to raise 15,000 US $ quickly",
    project_id: project_2.id
  )
  file = URI.open('https://images.unsplash.com/photo-1514241393572-57228eeefa4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=100vw&q=80')
  article_project_2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  article_project_2.save!


project_3 = Project.new(
  name:    "Helping teenagers reconnect to nature",
  short_description: "With life of teenagers being increasingly tied to screens, the availability of outdoor activities in urban spaces gets ever more important.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1541580621-cb65cc53084b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
project_3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_3.save!


project_4 = Project.new(
  name:    "Disaster recovery: saving Australia from wildfires.",
  short_description: "High winds and drought conditions are causing wildfires to spread rapidly through Australia, prompting mass evacuations, destroying homes and killing millions of animals.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1507680465142-ef2223e23308?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
project_4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_4.save!


project_5 = Project.new(
  name:    "Cleaning the atlantic ocean of micro-plastics",
  short_description: "Our plastic addiction and waste mismanagement are condemning countless marine birds and animals to death by entanglement or poisoning, and even leading to chemical contamination of the fish we eat.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
project_5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_5.save!


project_6 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1498661367879-c2085689eed4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
project_6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_6.save!

project_7 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1536859975388-b5e6623e9223?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_7.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_7.save!


project_8 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1534406315430-4d7cf92bc690?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_8.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_8.save!


project_9 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1539335869962-651be7807d01?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_9.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_9.save!

project_10 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1521158422-e44de3484714?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_10.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_10.save!

project_11 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1508138221679-760a23a2285b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_11.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_11.save!

project_12 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1571060366844-f075a4648b11?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_12.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_12.save!

project_13 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1498757581981-8ddb3c0b9b07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_13.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_13.save!

project_14 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1580639810245-f68e0ef3876a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_14.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_14.save!

project_15 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1526162626259-702cf07fd07b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_15.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_15.save!

project_16 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1579469536553-e26715b13172?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
project_16.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_16.save!

project_17 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1540479859555-17af45c78602?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
project_17.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_17.save!

project_18 = Project.new(
  name:    "Empowering women in post-war regions.",
  short_description: "The Free Women Foundation has established a women's center in an IDP camp in the Kurdistan Region of Iraq.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1472162072942-cd5147eb3902?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
project_18.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_18.save!

project_19 = Project.new(
  name:    "Replanting Rainforest in Sumatra, Indonesia",
  short_description: "We are working to restore vital orangutan habitat that has been destroyed by illegal oil palm plantations within the Gunung Leuser National Park. ",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://www.sustainability-times.com/wp-content/uploads/2019/07/planting-trees-community142-1.jpg')
project_19.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_19.save!


project_20 = Project.new(
  name:    "Reconnect the Atlantic Forest with 20.000 Trees",
  short_description: "The Brazilian Atlantic is one of the most biodiverse spots in the world yet deforestation has led to many small and isolated fragments and the loss of many native species.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://www.carbonbrief.org/wp-content/uploads/2019/08/amazon-rainforest-FF2BA3-1550x804.jpg')
project_20.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_20.save!


project_21 = Project.new(
  name:    "Forests4Water Brazil: Community forest restoration",
  short_description: "Here in Brazil we've already planted 100,000 native rainforest trees and this year we aim to plant another 10,000! Why? Because springs are running dry, farmers are losing their crops and city water supplies are threatened.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://www.thisiscolossal.com/wp-content/uploads/2019/04/rainwater-chandelier-og.jpg')
project_21.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_21.save!


project_22 = Project.new(
  name:    "Young EcoLeaders of the Brazilian Rainforest",
  short_description: "Children in our remote rural area live in one of the world's top biodiversity hotspots, yet their level of understanding and appreciation for the forests is very low.",
  long_description: Faker::Lorem.paragraph(sentence_count: 20),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1436303892196-e039f81a04aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=996&q=80')
project_22.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_22.save!


category_project1 = ProjectCategory.new(
    project_id: project_1.id,
    category_id: humanitary.id
)
category_project1.save!

category_project2 = ProjectCategory.new(
    project_id: project_2.id,
    category_id: environment.id
)
category_project2.save!

category_project3 = ProjectCategory.new(
    project_id: project_3.id,
    category_id: education.id
)
category_project3.save!

category_project4 = ProjectCategory.new(
    project_id: project_4.id,
    category_id: local.id
)
category_project4.save!

category_project5 = ProjectCategory.new(
    project_id: project_5.id,
    category_id: environment.id
)
category_project5.save!

category_project6 = ProjectCategory.new(
    project_id: project_6.id,
    category_id: local.id
)
category_project6.save!

category_project7 = ProjectCategory.new(
    project_id: project_7.id,
    category_id: humanitary.id
)
category_project7.save!

category_project8 = ProjectCategory.new(
    project_id: project_8.id,
    category_id: environment.id
)
category_project8.save!

category_project9 = ProjectCategory.new(
    project_id: project_9.id,
    category_id: environment.id
)
category_project9.save!

category_project10 = ProjectCategory.new(
    project_id: project_10.id,
    category_id: environment.id
)
category_project10.save!

category_project11 = ProjectCategory.new(
    project_id: project_11.id,
    category_id: environment.id
)
category_project11.save!

category_project12 = ProjectCategory.new(
    project_id: project_12.id,
    category_id: local.id
)
category_project12.save!

category_project13 = ProjectCategory.new(
    project_id: project_16.id,
    category_id: humanitary.id
)
category_project13.save!

category_project14 = ProjectCategory.new(
    project_id: project_14.id,
    category_id: humanitary.id
)
category_project14.save!

category_project15 = ProjectCategory.new(
    project_id: project_15.id,
    category_id: humanitary.id
)
category_project15.save!

category_project16 = ProjectCategory.new(
    project_id: project_17.id,
    category_id: education.id
)
category_project16.save!

category_project17 = ProjectCategory.new(
    project_id: project_18.id,
    category_id: education.id
)
category_project17.save!

category_project18 = ProjectCategory.new(
    project_id: project_19.id,
    category_id: education.id
)
category_project18.save!

category_project19 = ProjectCategory.new(
    project_id: project_20.id,
    category_id: environment.id
)
category_project19.save!

category_project20 = ProjectCategory.new(
    project_id: project_21.id,
    category_id: environment.id
)
category_project20.save!

category_project21 = ProjectCategory.new(
    project_id: project_22.id,
    category_id: environment.id
)
category_project21.save!



Project.all.each do |pr|
  (0..5).to_a.sample.times do
    price = (0..10000).to_a.sample
    donation = pr.donations.create(user: User.all.sample, state: :approved, price_cents: price, doner_price: price/100.0)
    Payment.create(donation: donation, cent: price)
  end
end
puts 'Finished!'
time_required = Time.now - start_time

puts "Time required: #{time_required}"


# Project.joins(:payment).select('count(payments.id)').group_by('projects.id')

# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
