FactoryBot.define do
	factory :user, class: Spree::User do
		email {Faker::Internet.email}
		password {Faker::Internet.password}	
	end

	factory :admin, parent: :user do
		after(:create) do |user|
			user.spree_roles << Spree::Role.first_or_create(name: 'admin')
		end
	end
end