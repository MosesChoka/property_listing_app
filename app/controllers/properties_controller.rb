class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
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
    redirect_to properties_url, notice: "Property was successfully destroyes."
  end

  private

  def set_property
    @property = Property.find(property_params[:id])
  end

  def params
    property_params.require(:property).permit(:title,:price,:location,:property_type,:description,images: [])  
  end


end
