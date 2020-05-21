# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Create Users
u1 = User.create!(name: 'Razorblaydes')
u2 = User.create!(name: 'Fire-Marshall')
u3 = User.create!(name: 'Demolition Man')
User.create!(name: 'Highlight')
User.create!(name: 'Grizzly')

# Create Chats Messages
ChatCreator.call([u1.id, u2.id], 'Chat #1')
ChatCreator.call([u1.id, u2.id, u3.id], 'Chat Group')

# Do some chatting
c1 = Chat.first
Message.create!(user: u1, chat: c1, text: 'What is up!?')
Message.create!(user: u2, chat: c1, text: 'Hey bud, it is a great day to be alive!')
Message.create!(user: u1, chat: c1, text: 'Right? Lez kick it!')

# Group chatting
c2 = Chat.last
Message.create!(user: u1, chat: c2, text: 'What is up super COOL group!?')
Message.create!(user: u2, chat: c2, text: 'Guten Tag group, it is a great day to be alive!')
Message.create!(user: u3, chat: c2, text: 'Right? Lez kick it as a group!')



