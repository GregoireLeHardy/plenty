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

category = Category.new(
    name: 'humanitary'
  )
category.save!

category1 = Category.new(
    name: 'Education'
  )
category1.save!

category2 = Category.new(
    name: 'Local'
  )
category2.save!

category3 = Category.new(
    name: 'Environment'
  )
category3.save!

puts 'categories successfully created'


puts 'Creating 6 fake projects...'
puts 'And some fake articles linked to them'

project = Project.new(
  name:    "Provide Gift & food to 700 Street Children",
  short_description: "With a small donation of 10€ per months, you can enable a child to got to school",
  long_description: Faker::Lorem.paragraph(sentence_count: 10),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project.save!

article = Article.new(
    title:    "Act against illegal logging of protected rainforests",
    description: Faker::Lorem.paragraph(sentence_count: 10),
    project_id: project.id
  )
  file = URI.open('https://images.unsplash.com/photo-1470240731273-7821a6eeb6bd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
  article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  article.save!

article = Article.new(
    title:    Faker::Lorem.words(number: 4),
    description: Faker::Lorem.paragraph(sentence_count: 10),
    project_id: project.id
  )
  file = URI.open('https://images.unsplash.com/photo-1515961896317-adf9e14bdcc0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
  article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  article.save!

project_1 = Project.new(
  name:    "Improving primary forest proection",
  short_description: "Act against illegal logging of protected rainforests in the ",
  long_description: Faker::Lorem.paragraph(sentence_count: 10),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1469125155630-7ed37e065743?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
project_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_1.save!

project_2 = Project.new(
  name:    "Protecting endangered species in China",
  short_description: "The vast growth in recent years of the Chinese population, has driven governments to reduce the atural habitaot of endangered species. ",
  long_description: Faker::Lorem.paragraph(sentence_count: 10),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1550358864-518f202c02ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
project_2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_2.save!

project_3 = Project.new(
  name:    "Helping teenagers reconnect to nature",
  short_description: "With live of teenagers being increasingly tied to screens, the availability of outdoor activities in urban spaces gets ever more important.",
  long_description: Faker::Lorem.paragraph(sentence_count: 10),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1541580621-cb65cc53084b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
project_3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_3.save!

project_4 = Project.new(
  name:    "Desaster recovery: saving Australia from wildfires.",
  short_description: "High winds and drought conditions are causing wildfires to spread rapidly through Australia, prompting mass evacuations, destroying homes and killing millions of animals.",
  long_description: Faker::Lorem.paragraph(sentence_count: 10),
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
  long_description: Faker::Lorem.paragraph(sentence_count: 10),
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
  long_description: Faker::Lorem.paragraph(sentence_count: 10),
  price_cents: 1500,
  user_id: user.id,
  published: true
)
file = URI.open('https://images.unsplash.com/photo-1498661367879-c2085689eed4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
project_6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project_6.save!


category_project1 = ProjectCategory.new(
    project_id: project_1.id,
    category_id: category.id
)
category_project1.save!

category_project2 = ProjectCategory.new(
    project_id: project_2.id,
    category_id: category3.id
)
category_project2.save!

category_project3 = ProjectCategory.new(
    project_id: project_3.id,
    category_id: category1.id
)
category_project3.save!

category_project4 = ProjectCategory.new(
    project_id: project_4.id,
    category_id: category2.id
)
category_project4.save!

category_project5 = ProjectCategory.new(
    project_id: project_5.id,
    category_id: category3.id
)
category_project5.save!

category_project6 = ProjectCategory.new(
    project_id: project_6.id,
    category_id: category2.id
)
category_project6.save!
puts 'Finished!'



# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
