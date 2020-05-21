# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Create Users
u1 = User.create!(name: 'Razorblaydes')
u2 = User.create!(name: 'Fire-Marshall')
u3 = User.create!(name: 'Demolition Man')
User.create!(name: 'Highlight')
User.create!(name: 'Grizzly')

# # Create Existing Chats with Messages
# c1 = Chat.new(name: "#{u1.name} <-> #{u2.name}")
# uc1 = UserChat.create!(users: [u1, u2], chat: c1)
# Message.create!(user: u1, chat: c1, text: 'What is up!?', sent_at: Time.now)
