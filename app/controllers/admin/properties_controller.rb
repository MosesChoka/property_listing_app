class Admin::PropertiesController < Admin::BaseController
  before_action :set_property, only: [ :approve ]

  def index
    @properties = Property.pending
  end
  def approve
    @property.approved!
    redirect_to admin_properties_path, notice: "Property was successfully approved."
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
end
