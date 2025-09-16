# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding database..."

# Clear existing posts
Post.destroy_all

# Create sample posts
10.times do |i|
  Post.create!(
    title: "Post #{i + 1}: #{Faker::Lorem.sentence(word_count: 4)}",
    body: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
    published: [true, false].sample,
    views: rand(0..1000)
  )
end

puts "Created #{Post.count} posts"
