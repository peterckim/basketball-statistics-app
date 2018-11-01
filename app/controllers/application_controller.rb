class ApplicationController < ActionController::Base
	helper_method :logged_in?, :current_user, :current_season

	private

	def logged_in?
		!!session[:user_id]
	end

	def require_login
		return head(:forbidden) unless session.include? :user_id
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if logged_in?
	end

	def current_season
		Season.find_by(:year => 2018)
	end
end
