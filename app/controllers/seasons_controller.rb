# == Schema Information
#
# Table name: seasons
#
#   id                  :integer            not null, primary key
#   year                :integer
#   created_at          :datetime           not null
#   updated_at          :datetime           not null
#

class SeasonsController < ApplicationController
	before_action :require_login
	
	def index
		@seasons = Season.all
	end

	def show
		@season = Season.find_by(:id => params[:id])
	end
end
