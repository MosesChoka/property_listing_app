class LandlordRolesController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user.landlord?
      redirect_to root_path, alert: "You are already a landlord."
    else
      current_user.add_role :landlord
      redirect_to root_path, notice: "You are now a landlord."
    end
  end
end
