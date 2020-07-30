module ReportHelper
  def coupon_options(coupon_id)
    options_for_select coupons.pluck(:name, :id), coupon_id
  end

  def coupons
    @coupons = Coupon.all
  end
end
