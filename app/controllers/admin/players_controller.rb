class Admin::PlayersController < Admin::BaseController
    before_action :admin?
    def new
		@player = Player.new
	end

    def create
		@player = Player.scrape_and_add_player_to_database(params[:player][:player_url])

		redirect_to new_admin_player_path
	end

    def edit

    end

    def update

    end
end
