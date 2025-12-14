class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [ :show, :edit ]
  def new
    @inquiry = Inquiry.new
  end

  def show
  end

  def edit
  end



  private

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

  def inquiry_params
    params.require(:inquiry).permit(:name, :phone, :message)
  end
end
