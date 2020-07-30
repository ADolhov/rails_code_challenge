class ReportsController < ApplicationController
  def index
  end

  def coupon_users
    @coupon = params[:coupon_id] && Coupon.find(params[:coupon_id])
  end

  def sales_by_product
    @products = OrderItem
      .with_product
      .where(order_id: arrived_order_ids)
      .group("products.id")
      .select("products.id, products.name, products.sku, SUM(order_items.quantity) as sold_quantity, SUM(order_items.price) as sold_revenue")
  end

  private

  def arrived_order_ids
    @arrived_order_ids = params[:from_date] &&
      params[:to_date] &&
      Order.where('arrived_at > ? and arrived_at < ?', params[:from_date], params[:to_date]).pluck(:id) ||
      []
  end
end
