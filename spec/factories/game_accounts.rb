FactoryBot.define do
	factory :game_account do
		title {Faker::Game.title}
		username {Faker::Internet.username}
		email_id {Faker::Internet.email}
		password {Faker::Internet.password}
		platform {Faker::Game.platform}
		remarks {"SomeRemarks"}
		cap1_status {'sold'}
		cap2_status {'available'}
		cap3_status {'unavailable'}
	end

end
