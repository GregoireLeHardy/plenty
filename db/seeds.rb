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

puts 'user successfully created'

puts 'Creating 5 fake projects...'
puts 'And 2 fake articles per project'
5.times do
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

end
puts 'Finished!'



# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
