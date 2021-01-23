require 'rails_helper'

RSpec.describe GameAccount, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context 'validation tests' do

  	it "ensures email_id presence" do
  		game_account = GameAccount.new(username: "Kevin", title: "Ruby", password: "123", email_password: "someObj", remarks: "nothing", cap1_status: "sold", cap2_status: "sold", cap3_status: "sold" ).save
  		expect(game_account).to eq(false)
  	end

  end

end
