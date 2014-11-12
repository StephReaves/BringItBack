require 'faker'

user = User.create(email: 'steph@steph.com', username: 'steph', password: '123456')

9.times do
  User.create(email: Faker::Internet.email, username: Faker::Name.name, password: '123456')
end

campaign = Campaign.create(title: "Bring back Munch'ems!", what: "Those delicious little baked snacks from the 90s", why: "Because snacks today are underwhelming...", user_id: 1)

10.times do
  Campaign.create(title: Faker::Lorem.sentence, what: Faker::Lorem.sentence(3), why: Faker::Lorem.sentence(3), user_id: User.all.sample.id)
end

comment = Comment.create(text: Faker::Lorem.sentence, user_id: 1, campaign_id: 1)

20.times do
  Comment.create(text: Faker::Lorem.sentence, user_id: User.all.sample.id, campaign_id: Campaign.all.sample.id)
end


Vote.create(votable: user)
Vote.create(votable: campaign)
Vote.create(votable: comment)

