# == Schema Information
#
# Table name: users
#
#   id                  :integer            not null, primary key
#   name                :string     
#   email               :string
#   image               :string
#   uid                 :string
#   password            :string
#   created_at          :datetime           not null
#   updated_at          :datetime           not null
#

class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to seasons_path
		else
			render :new
		end
	end

	def show
		@user = current_user
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end