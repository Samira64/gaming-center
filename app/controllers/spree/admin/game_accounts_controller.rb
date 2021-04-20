module Spree
  module Admin
    class GameAccountsController < Spree::Admin::BaseController  
      before_action :set_completed_orders, only: [:edit, :new]

      def set_completed_orders
    		@completed_orders = Spree::Order.complete
      end	

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
		@api_key = spree_current_user.spree_api_key;
		@game_account= GameAccount.find(params[:id])
	end

	def update 
		@game_account= GameAccount.find(params[:id])
		selected_order_ids = params["game_account"]["order_ids"] || []
		if @game_account.update(game_account_params)
			orders = Spree::Order.find(selected_order_ids)
			@game_account.orders.replace(orders)
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