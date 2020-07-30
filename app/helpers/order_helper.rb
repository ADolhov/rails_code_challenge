module OrderHelper
  def search_by_options(search_by = 'Search by')
    options_for_select([
      'Search by',
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
