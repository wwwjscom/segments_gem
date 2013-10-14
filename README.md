# Segments

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'segments'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install segments

## Usage

Example:

```
require 'segments'

# Setup the lexicon
db_path = '/tmp/foo.sqlite3'
table_name = 'lexicon'
lex = SegmentsLexicon.new(db_path, table_name)

# Setup segments
s = Segments.new(lex)

# Search
candidates = s.suggest('telepone')
puts candidates.to_s
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
