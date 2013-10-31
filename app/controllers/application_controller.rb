class ApplicationController < ActionController::Base
  protect_from_forgery
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
end
