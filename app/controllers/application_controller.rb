class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to properties_path, alert: "Create a landlord account to add your property."
  end
  before_action :authenticate_user!
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
