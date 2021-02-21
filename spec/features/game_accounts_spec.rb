require 'rails_helper'

RSpec.feature "GameAccounts", type: :feature do
	let!(:user) { FactoryBot.create(:admin)}
	let!(:game_accounts) {FactoryBot.create_list(:game_account, 5)}
	let!(:game_account_attrs) { FactoryBot.attributes_for(:game_account)}
	before :each do
		login_as(user)
		visit admin_orders_url
		click_link("Game Accounts")
	end

	after :each do
		Warden.test_reset!
	end

	context "Show game accounts" do
		scenario "Should list all the existing game accounts" do
			expect(page).to have_selector("tbody tr", count: GameAccount.count)
			page.should have_selector(:link_or_button, 'Edit')
			page.should have_selector(:link_or_button, 'Delete')	
		end
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
         
        scenario "Should display edit form" do
        	visit current_path		
        	click_link('Edit', href: "#{edit_admin_game_account_path(game_account)}")
        	expect(current_path).to eql(edit_admin_game_account_path(game_account)) 

        end  

		scenario "Should update the game account" do
			visit edit_admin_game_account_path(game_account)

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
			expect { click_link('Delete', href: "/admin/game_accounts/#{game_account.id}") }.to change(GameAccount, :count).by(-1)	
		end

	end


end
