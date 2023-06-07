puts "🌱 Seeding spices..."
puts "🌱 Seeding spices..."

# Delete all existing data

# Create new users
puts "Creating new users..."
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
end

# Create new posts for each user
puts "Creating posts for each user..."
User.all.each do |user|
  5.times do
    Post.create(
      title: Faker::Book.title,
      body: Faker::Quote.most_interesting_man_in_the_world,
      user_id: user.id
    )
  end
end

puts "✅ Done seeding!"


# # Delete all existing data
# puts "Deleting existing data..."
# User.delete_all
# Post.delete_all

# # Create new users
# puts "Creating new users..."
# john = User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'johnspassword')
# jane = User.create(name: 'Jane Smith', email: 'jane.smith@example.com', password: 'janespassword')

# # Create new posts for John
# puts "Creating posts for John..."
# Post.create(
#   title: 'My First Blog Post', 
#   body: 'Welcome to my blog! This is my first post and I am really excited to share my thoughts with you.', 
#   user_id: john.id
# )

# Post.create(
#   title: 'Understanding Ruby', 
#   body: 'Ruby is an object-oriented language that is easy to learn and write. It offers a great amount of flexibility and expressiveness...', 
#   user_id: john.id
# )

# # Create new posts for Jane
# puts "Creating posts for Jane..."
# Post.create(
#   title: 'Web Development 101', 
#   body: 'Web development is an exciting field with a lot of opportunities. In this post, I will share some basic concepts about web development...', 
#   user_id: jane.id
# )

# Post.create(
#   title: 'Why I Love React', 
#   body: 'React is a popular JavaScript library for building user interfaces, and I absolutely love it. Here’s why...', 
#   user_id: jane.id
# )

puts "✅ Done seeding!"

