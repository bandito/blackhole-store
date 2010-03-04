### Before BlackholeStore###

I was desperate. I couldn't fry an egg without ruining it and my models missed the cache helper. Rails.cache completely ignored the perform_caching setting and my server crashed frequently until it ultimately committed suicide.

### After BlackholeStore ###

My whole life changed. My dog only poops outside and my models can use Rails.cache.fetch under development mode easily.

### Install ###

    gem install blackhole-store

### Usage ###

In your development.rb file add the following lines

    require 'active_support/cache/blackhole_store'
    config.cache_store = :blackhole_store

Then you can use the underlying cache store without worrying about the perform_caching setting

    class Product
        def self.total_products
            Rails.cache.fetch("total_products", :expires_in => 2.hours) do 
                Product.count
            end
        end
    end
