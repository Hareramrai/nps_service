ApiPagination.configure do |config|
  # If you have more than one gem included, you can choose a paginator.
  config.paginator = :kaminari # or :will_paginate

  config.include_total = false 
  config.page_header = 'X-Page'
end