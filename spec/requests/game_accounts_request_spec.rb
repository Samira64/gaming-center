require 'rails_helper'

RSpec.describe "GameAccounts", type: :request do
	context "Get #index" do
		it 'returns a success response' do
			get "/admin/game_accounts"
			expect(response).to be_success
		end
	end

	context "update #edit" do
		it "returns a success response" do
			get "/admin/game_accounts/1/edit"
			expect(response).to be_success
		end

		it "returns a success response" do
			game_account = GameAccount.new(username: "Kevin", title: "Ruby", password: "123", email_password: "someObj", remarks: "nothing", cap1_status: "sold", cap2_status: "sold", cap3_status: "sold" ).save
			account = GameAccount.update(game_account)
			get :index
			expect(response).to be_success
		end

	end
end
