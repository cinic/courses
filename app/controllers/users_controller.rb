class UsersController < ApplicationController
	before_filter :authenticate_user!
	layout "courses"
	def index
	  @user = User.find(warden.user.id)
	end

	def show
	  @user = User.find(warden.user.id)
	end
	
end
