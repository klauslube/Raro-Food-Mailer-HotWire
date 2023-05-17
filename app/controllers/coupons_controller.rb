class CouponsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_coupon, only: %i[show edit update destroy]

  def index
    @coupons = Coupon.all
    render json: @coupons
  end

  def show
    render json: @coupon
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(state_params)
    return render json: @coupon if @coupon.save
    
    render json: @coupon.errors
  end

  def edit; end

  def update
    return render json: @coupon if @coupon.update(coupon_params)

    render json: @coupon.errors
  end

  def destroy
    render json: {message: "Deleted successfully"} if @coupon.destroy
  end

  private
  
  def coupon_params
    params.require(:coupon).permit(:code, :name, :description, :start_date, :end_date, :total_discount, :creator_id)
  end

  def fetch_coupon
    @coupon = Coupon.find(params[:id])
  end
end