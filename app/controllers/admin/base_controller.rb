# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
  before_action :authenticate_user!       # ensure only logged-in users
  before_action :check_admin_role         # restrict access to admins only

  private

  def check_admin_role
    unless current_user.has_role?(:admin)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
