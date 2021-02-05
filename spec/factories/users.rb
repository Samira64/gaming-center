FactoryBot.define do
	factory :user, class: Spree::User do
		email {Faker::Internet.email}
		password {"somePassword"}
		password_confirmation {"somePassword"}	
	end
end