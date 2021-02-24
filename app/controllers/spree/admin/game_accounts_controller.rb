module Spree
  module Admin
    class GameAccountsController < Spree::Admin::BaseController
    	
      def index
      	@game_accounts = GameAccount.all
      end

      def new
      	@game_account = GameAccount.new
      end

      def create
		@game_account = GameAccount.create(game_account_params)

		if @game_account.save
			redirect_to admin_game_accounts_path, 
			notice: "Game account   \"#{@game_account.title}\"   is created successfully"
		else
			render "new"
		end
	end

	def edit
		@game_account= GameAccount.find(params[:id])
		@completed_orders = Spree::Order.all.complete
	end

	def update 
		@game_account= GameAccount.find(params[:id])
		
		if @game_account.update(game_account_params)
			redirect_to admin_game_accounts_url, notice: "Game account \"#{@game_account.title}\" is updated successfully"
		else
			render "edit"
		end
	end

	def destroy
		@game_account= GameAccount.find(params[:id])
		@game_account.delete
		redirect_to admin_game_accounts_url, notice: "Game account \"#{@game_account.title}\" is deleted successfully"
	end

	def game_account_params
		params.require(:game_account).permit(:title, :username, :password, :email_id, :email_password, :cap1_status, :cap2_status, :cap3_status, :remarks)
	end

    end
  end
end