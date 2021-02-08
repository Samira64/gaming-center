require 'rails_helper'

RSpec.describe "GameAccounts", type: :request do
	let!(:user) { FactoryBot.create(:admin)}

	before do	
		sign_in user
	end

	context "Get #index" do
		it 'Shows the list of Game Accounts' do
			get admin_game_accounts_path
			expect(response.body).to include("All Game Accounts");
		end
  end

    context "Get #new" do
		it "Renders a form for creating a new GameAccount" do
			get new_admin_game_account_path
			expect(response.body).to include("Create New Game Account")
		end	
	end

	context "Get #edit" do
		let!(:game_account) { FactoryBot.create(:game_account, { title: 'Tomb Raider' }) }

		it "Displays a page for editing a GameAccount" do
			get edit_admin_game_account_path game_account
			expect(response.body).to include("Edit Game Account")
			expect(response.body).to include(game_account.title)
		end
	end

	context "PUT 'update/:id" do
		let!(:game_account) { FactoryBot.create(:game_account) }
		let!(:new_game_params) { FactoryBot.attributes_for(:game_account) }

	    it "Updates GameAccount details" do
			put admin_game_account_path(game_account), params: { game_account: new_game_params }
			game_account.reload
			expect(response).to redirect_to(admin_game_accounts_path)
			expect(game_account.title).to eql(new_game_params[:title])
		end
		
	end

	context "Delete #destroy" do
		let!(:game_account) { FactoryBot.create(:game_account)}

		it "Deletes a GameAccount" do
			expect { delete "/admin/game_accounts/#{game_account.id}" }.to change(GameAccount, :count).by(-1)		
		end
	end

end





