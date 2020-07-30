module OrderHelper
  def search_by_options(search_by)
    options_for_select([
      'order_number',
      'order_state',
      'user_email',
      'user_name',
      'state',
      'city'
    ],
    search_by)
  end
end
