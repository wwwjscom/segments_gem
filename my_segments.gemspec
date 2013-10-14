# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'my_segments/version'

Gem::Specification.new do |gem|
  gem.name          = "my_segments"
  gem.version       = Segments::VERSION
  gem.authors       = ["Jason Soo"]
  gem.email         = ["wwwjscom@gmail.com"]
  gem.description   = %q{Segments gem}
  gem.summary       = %q{Segments gem}
  gem.homepage      = ""

  gem.add_runtime_dependency "segments_lexicon"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
