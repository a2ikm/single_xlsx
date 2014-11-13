[![Build Status](https://travis-ci.org/a2ikm/single_xlsx.svg)](https://travis-ci.org/a2ikm/single_xlsx)

# SingleXLSX

SingleXLSX wraps [rubyXL](http://rubygems.org/gems/rubyXL) to treat single-sheet XLSX files like CSV.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'single_xlsx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install single_xlsx

## Usage

### Read

You can read XLSX files into `Array` of `Array`.

| Name     | Age |
|----------|-----|
| Einstein |  76 |
| Feynman  |  69 |

```ruby
require "single_xlsx"

SingleXLSX.read("path/to/xlsx")
#=> [
      ["Name", "Age"],
      ["Einstein", 76],
      ["Feynman", 69]
    ]
```

### Write

You can write XLSX data into `String`.

```ruby
require "single_xlsx"

binary = SingleXLSX.generate do |sheet|
  sheet << ["Name", "Age"]
  sheet << ["Einstein", 76]
  sheet << ["Feynman", 69]
end
```

Currently we don't provide `SingleXLSX.open` as `CSV.open`.
So, if you want to write XLSX files, you need to write this `binary` to files by yourself.

## Contributing

1. Fork it ( https://github.com/a2ikm/single_xlsx/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
