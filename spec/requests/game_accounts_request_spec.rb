require 'rails_helper'

RSpec.describe "GameAccounts", type: :request do
	before do
		user = Spree.user_class.create(email: "admin@gmail.com", password: "test123", password_confirmation: "test123");
		user.spree_roles << Spree::Role.find_or_create_by(name: 'admin');
		sign_in user
	end

	context "Get #index" do
		it 'returns game_accounts list' do
			get "/admin/game_accounts"
			expect(response.body).to include("All Game Accounts");
		end
	end

	context "Get #new" do
		it "returns game_accounts#new template" do
			get "/admin/game_accounts/new"
			expect(response.body).to include("Create New Game Account")
		end	
	end

	context "Get #edit" do
		let!(:game_account) { FactoryBot.create(:game_account)}
		it "returns game_accounts#edit template" do
			get "/admin/game_accounts/1/edit"
			expect(response.body).to include("Edit Game Account")
		end
	end

	context "PUT 'update/:id" do
		let!(:game_account) { create(:game_account)}

		before(:each) do
			put "/admin/game_accounts/#{game_account.id}", params: { id: game_account.id, title: "my new title" }
			game_account.reload
		end
		
		it { response.should redirect_to("/admin/game_accounts") }
  		it { game_account.title.should eql("my new title") }
		
	end

	context "Delete #destroy" do
		let!(:game_account) { create(:game_account)}

		it "Allows a game_account to be deleted" do
			expect { 
       		 delete "/admin/game_accounts/#{game_account.id}", params: { id: game_account.id } }.to change(GameAccount, :count).by(-1)		
		end
	end

end





