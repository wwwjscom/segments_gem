# Segments

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'my_segments'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install my_segments

## Usage

Example:

```
require 'my_segments'

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

The sqlite3 table should have at least a "word" and "id" table, where word is a unique word in the lexicon, and id is a primary key.

To create the table/insert, use this sql:

```
create table lexicon(id integer primary key, word text);
insert into lexicon(word) VALUES('telephone');
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
