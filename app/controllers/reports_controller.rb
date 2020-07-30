class ReportsController < ApplicationController
  def index
  end

  def coupon_users
    @coupon = params[:coupon_id] && Coupon.find(params[:coupon_id])
  end

  def sales_by_product
  end

  private

end
