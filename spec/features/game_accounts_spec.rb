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
			expect(click_button 'Submit').to change(GameAccount, :count).by(1) 
		end
		
		scenario "Should fail to create new game account" do
			visit new_admin_game_account_path
			within('form') do
				fill_in 'Email ID', with: ""
			end
			click_button "Submit"
			expect(page).to have_content("Create New Game Account")
		end
	end

	context "Update game account" do
		let!(:game_account) { FactoryBot.create(:game_account) }

		before do
			visit edit_admin_game_account_path(game_account)
		end

		scenario "Should update the game account" do	
			within('form') do
				fill_in 'Title', with: Faker::Game.title
				fill_in 'Username', with: Faker::Internet.username
			end
			expect(page).to have_content("is updated successfully")
		end
		
		scenario "Should fail to update game account" do
		end	
		
	end

	context "Destroy game account" do
		scenario "Should destroy the game account" do
			game_account = FactoryBot.create(:game_account)
			visit admin_game_accounts_path
			expect(click_link "Delete"). to change(GameAccount, :count).by(-1)	
		end

	end


end
