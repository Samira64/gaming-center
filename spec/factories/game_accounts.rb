FactoryBot.define do
	factory :game_account do
		title {Faker::Game.title}
		username {Faker::Internet.username}
		password {Faker::Internet.password}
		email_id {Faker::Internet.email}
		email_password {Faker::Internet.password}
		platform {Faker::Game.platform}
		remarks {Faker::TvShows::FamilyGuy.quote}
		cap1_status {'sold'}
		cap2_status {'available'}
		cap3_status {'unavailable'}
	end
end

# created_game_accounts = Factorybot.create_list(:game_account, 25)