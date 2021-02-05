FactoryBot.define do
	factory :user, class: Spree::User do
		email {Faker::Internet.email}
		password {Faker::Internet.password}	
	end
end

FactoryBot.define do
	factory :admin, parent: :user do
		spree_roles { association :admin_role }	
	end
	
end