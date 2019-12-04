class InquiriesController < ApplicationController

  def index 
    @inquiries = Inquiry.all
  end

  def show 
    @inquiry = Inquiry.find(params[:id])
  end

  def new 
    @inquiry = Inquiry.new
  end

  def create 
    inquiry = Inquiry.new(inquiry_params)
    binding.pry
  end

  def edit

  end 

  def update 
    inquiry = Inquiry.find_by_id(params[:id])
    inquiry.update(inquiry_params)
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email_address, :phone_number, :content)
  end
end
