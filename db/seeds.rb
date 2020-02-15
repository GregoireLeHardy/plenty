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

puts 'Creating 6 fake projects...'
puts 'And some fake articles linked to them'
2.times do
  project = Project.new(
    name:    Faker::Company.name,
    short_description: Faker::Lorem.paragraph(sentence_count: 2),
    long_description: Faker::Lorem.paragraph(sentence_count: 5),
    price_cents: 1500,
    user_id: user.id
  )
  file = URI.open('https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
  project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  project.save!

  article = Article.new(
      title:    Faker::Lorem.words(number: 4),
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
    name:    Faker::Company.name,
    short_description: Faker::Lorem.paragraph(sentence_count: 2),
    long_description: Faker::Lorem.paragraph(sentence_count: 5),
    price_cents: 1500,
    user_id: user.id
  )
  file = URI.open('https://images.unsplash.com/photo-1469125155630-7ed37e065743?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
  project_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  project_1.save!

  project_2 = Project.new(
    name:    Faker::Company.name,
    short_description: Faker::Lorem.paragraph(sentence_count: 2),
    long_description: Faker::Lorem.paragraph(sentence_count: 5),
    price_cents: 1500,
    user_id: user.id
  )
  file = URI.open('https://images.unsplash.com/photo-1550358864-518f202c02ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
  project_2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  project_2.save!

  category = Category.new(
      name: 'humanitary',
    )
    category.save!

  category1 = Category.new(
      name: 'Education',
    )
    category.save!

  category2 = Category.new(
      name: 'Local',
    )
    category.save!

  category3 = Category.new(
      name: 'Environment',
    )
    category.save!

end
puts 'Finished!'



# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
