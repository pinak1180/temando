# Temando

[Rdoc](http://rubydoc.info/gems/temando/)

The `temando` gem provides a Ruby interface to the
[Temando](https://www.temando.com/) shipping fulfilment provider.

Currently, it only supports fetching quotes from the API and returning
them.

## Installation

Add this line to your application's Gemfile:

    gem 'temando'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install temando

## Usage

Temando authentication details should be set before calling any methods :

```ruby
 Temando::Api::Base.config.username = 'myuser@example.com'
 Temando::Api::Base.config.password = 'sekrit'
```

Example:

```ruby
request = Temando::Request.new

# Ship an item 40cm x 20cm x 30cm that weights 1kg
request.items << Temando::Item::GeneralGoods.new(length: 0.4, height: 0.2, width: 0.3, quantity: 1, weight: 1)

# Add the details for the actual shipment method and its locations
anywhere = Temando::Delivery::DoorToDoor.new
anywhere.origin      = Temando::Location.new(suburb: 'South Melbourne', postcode: '3205', country: 'AU')
anywhere.destination = Temando::Location.new(suburb: 'Traralgon', postcode: '3844', country: 'AU')

# Ask the server for the quotes
quotes = request.quotes_for(anywhere)

quotes.first # => #<Temando::Quote>
```

## Tests

`rake spec` to run the tests.

`rake spec:remote` to run the remote specs.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
