class Admin::BaseController < ApplicationController
	before_filter :authenticate_user!

	layout "courses"

	#load_and_authorize_resource :admin


	def index
	end

end
