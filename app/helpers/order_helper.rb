module OrderHelper
  def search_by_options(params = {})
    options_for_select([
      'Search by',
      'order_number',
      'order_state',
      'user_email',
      'user_name',
      'state',
      'city'
    ],
    params[:search_by])
  end
end
