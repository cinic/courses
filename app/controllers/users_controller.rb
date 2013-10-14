class UsersController < ApplicationController
	before_filter :authenticate_user!
	layout "account"
	def index
	  @user = User.find(warden.user.id)
	end

	def show
	  @user = User.find(warden.user.id)
	end
	
end
