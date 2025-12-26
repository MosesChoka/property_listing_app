class PropertiesController < ApplicationController
  before_action :set_property, only: [ :show, :edit, :update, :destroy ]
  def index
    @properties = Property.all
    .by_location(params[:location])
    .by_property_type(params[:property_type])
    .by_price_range(params[:price_range])
  end
  def new
    @property = Property.new
  end



  def show
  end

  def edit
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to @property, notice: "Property was successfully created."
    else
      puts @property.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Property was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @property.destroy
    redirect_to root_path, notice: "Property was successfully destroyed."
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :price, :location, :property_type, :bedrooms, :bathrooms, :description, images: [])
  end
end
