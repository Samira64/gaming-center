FactoryBot.define do	
	factory :admin, parent: :user do
		after(:create) do |user|
			user.spree_roles << Spree::Role.first_or_create(name: 'admin')
		end
	end
end