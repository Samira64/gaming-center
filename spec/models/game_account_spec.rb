require 'rails_helper'

RSpec.describe GameAccount, type: :model do

  	context "Validation tests" do
		let(:game_account) { build(:game_account) }

		it 'Ensures email_id presence' do
			game_account.email_id = nil
			expect(game_account.save).to eq(false)
		end
	end

 
end
