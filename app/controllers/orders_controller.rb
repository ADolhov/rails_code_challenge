class OrdersController < ApplicationController
  before_action :find_order!, only: :show

  def index
    if search_by && params[:query].present?
      @orders ||= Order.joins([:user, :address]).where("#{search_by} LIKE ?", "%#{params[:query]}%")
    else
      @orders ||= Order.preload([:user, :address])
    end
  end

  def show
  end

  private
  def find_order!
    @order = Order.find_by!(number: params[:number])
  end

  def search_by
    case params[:search_by].to_sym
    when :order_number
      'orders.number'
    when :order_state
      'orders.state'
    when :user_email
      'users.email'
    when :user_name
      'users.name'
    when :state
      'addresses.state'
    when :city
      'addresses.city'
    else
      nil
    end
  end
end
