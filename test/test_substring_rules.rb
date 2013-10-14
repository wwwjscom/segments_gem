require_relative '../lib/segments/substring_rules'
require 'test/unit'

class TestSubstringRules < Test::Unit::TestCase

  def test_substrings
    segs = SubstringRules.for('telephone')
    assert_instance_of(Array, segs)
    assert_equal(14, segs.size)
  end
end
