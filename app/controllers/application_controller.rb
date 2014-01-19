class ApplicationController < ActionController::Base
  protect_from_forgery
<<<<<<< HEAD
  layout :layout

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def layout
    if devise_controller? && devise_mapping.name == :user
      "courses"
    else
      "application"
    end
  end
=======
>>>>>>> ab83d1ef940b0a3b251a9f3ad1c3b88f523bcdde
end
