require 'rails_helper'

RSpec.feature "GameAccounts", type: :feature do
	let!(:user) { FactoryBot.create(:admin)}
	let!(:game_account_attrs) { FactoryBot.attributes_for(:game_account)}
	before :each do
		login_as(user)
	end

	after :each do
		Warden.test_reset!
	end

	context "Show display game accounts" do
		pending('show check if existing game accounts are listed')
		pending('show check if New, Edit and Delete buttons exist')
		# make sure all the following scenarios start from the Game Account page. 
		#For instance, to Edit a game account you shoulf first visit home page, then click on a game account
		#Then check you are the right page, then fill the fields etc
		#For Delete and Edit, we must make sure we are clicking the right button and not a button that may 
		#belong to another game account. How can we do that? Let me know before implementing it
	end

	context "Create new game account" do
		scenario "Should create a new game_account" do
			visit new_admin_game_account_path
			within('form') do
				fill_in 'Title', with: game_account_attrs[:title]
				fill_in 'Username', with: game_account_attrs[:username]
				fill_in 'Password', with: game_account_attrs[:password]
				fill_in 'Email ID', with: game_account_attrs[:email_id]
				fill_in 'Email password', with: game_account_attrs[:email_password]
				fill_in 'Remarks', with: game_account_attrs[:remarks]
				select('Available', from: 'game_account_cap1_status')
				select('Available', from: 'game_account_cap2_status')
				select('Available', from: 'game_account_cap3_status')
			end
			expect{ click_button 'Submit' }.to change(GameAccount, :count).by(1) 
			expect(page.current_path).to eql(admin_game_accounts_path)
			expect(page).to have_selector('td', text: game_account_attrs[:title])
			expect(page).to have_selector('td', text: game_account_attrs[:username])
			expect(page).to have_content('is created successfully')
		end
		
		scenario "Should fail to create new game account" do
			visit new_admin_game_account_path
			within('form') do
				fill_in 'Email ID', with: ""
			end
			expect {click_button "Submit"}.not_to change(GameAccount, :count)
			expect(page).not_to have_content('is created successfully')
			expect(page).to have_content("Create New Game Account")
		end
	end

	context "Update game account" do
		let!(:game_account) { FactoryBot.create(:game_account) }
		let!(:game_account_attrs) { FactoryBot.attributes_for(:game_account)}

		before do
			visit edit_admin_game_account_path(game_account)
		end

		scenario "Should update the game account" do	
			within('form') do
				fill_in 'Title', with: game_account_attrs[:title]
				fill_in 'Username', with: game_account_attrs[:username]
			end
			click_button 'Submit'
			expect(page.current_path).to eql(admin_game_accounts_path)
			expect(page).to have_selector('td', text: game_account_attrs[:title])
			expect(page).to have_selector('td', text: game_account_attrs[:username])
			expect(page).to have_content('is updated successfully')
        end
	end

	context "Destroy game account" do
		let! (:game_account) { FactoryBot.create(:game_account)}
		scenario "Should destroy the game account" do
			visit admin_game_accounts_path
			expect { click_link "Delete" }. to change(GameAccount, :count).by(-1)	
		end

	end


end
