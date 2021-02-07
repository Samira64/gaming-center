require 'rails_helper'

RSpec.describe "GameAccounts", type: :request do
	let!(:user) { FactoryBot.create(:admin)}

	before do	
		sign_in user
	end

	context "Get #index" do
		it 'shows the list of Game Accounts' do
			get admin_game_accounts_path
			expect(response.body).to include("All Game Accounts");
		end
  end

    context "Get #new" do
		it "renders a form creating a new GameAccount" do
			get new_admin_game_account_path
			expect(response.body).to include("Create New Game Account")
		end	
	end

	context "Get #edit" do
		let!(:game_account) { FactoryBot.create(:game_account)}

		it "returns game_accounts#edit template" do
			get edit_admin_game_account_path game_account
			expect(response.body).to include("Edit Game Account")
		end
	end

	context "PUT 'update/:id" do
		let!(:game_account) { create(:game_account)}

		before(:each) do
			put admin_game_account_path(game_account), params: {game_account:{ id: game_account.id, title: "my new title" }}
			game_account.reload
		end
		
	    it { expect(response).to redirect_to(admin_game_accounts_path) }
	    it { expect(game_account.title).to eql("my new title") }
		
	end

	context "Delete #destroy" do
		let!(:game_account) { create(:game_account)}

		it "Allows a game_account to be deleted" do
			expect { 
      		 delete "/admin/game_accounts/#{game_account.id}", params: { id: game_account.id } }.to change(GameAccount, :count).by(-1)		
		end
	end

end





