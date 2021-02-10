require 'rails_helper'

RSpec.feature "GameAccounts", type: :feature do
	let!(:user) { FactoryBot.create(:admin)}
	before :each do
		login_as(user)
	end

	after :each do
		Warden.test_reset!
	end

	context "Create new game account" do
		scenario "Should create a new game_account" do
			visit new_admin_game_account_path
			within('form') do
				fill_in 'Title', with: 'test 1'
				fill_in 'Username', with: 'test 1'
				fill_in 'Password', with: 'test 1'
				fill_in 'Email ID', with: 'test 1'
				fill_in 'Email password', with: 'test 1'
				fill_in 'Remarks', with: 'test 1'
				select('Available', from: 'game_account_cap1_status')
				select('Available', from: 'game_account_cap2_status')
				select('Available', from: 'game_account_cap3_status')
			end
			click_button "Submit"
			expect(page).to have_content("is created successfully.")	
		end
		
		scenario "Should fail to create new game account" do
			visit new_admin_game_account_path
			within('form') do
				fill_in 'Title', with: Faker::Game.title
				fill_in 'Username', with: Faker::Internet.username
				fill_in 'Password', with: Faker::Internet.password
				fill_in 'Email password', with: Faker::Internet.password
				fill_in 'Remarks', with: Faker::TvShows::FamilyGuy.quote
				select('Available', from: 'game_account_cap1_status')
				select('Available', from: 'game_account_cap2_status')
				select('Available', from: 'game_account_cap3_status')
			end
			click_button "Submit"
			expect(page).to have_content("Create New Game Account")
		end
	end

	context "Update game account" do
	end

	context "Destroy game account" do
	end


end
