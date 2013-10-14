require 'segments_lexicon'
require "my_segments/version"
require "my_segments/candidates"
require 'my_segments/substring_rules'

class Segments
  # Initializes with a segments lexicon
  def initialize(segments_lexicon)
    @lex = segments_lexicon
  end

  # Returns the query_term broken down into
  # the substring rules (segments) we'll use
  # for searching
  def for_term(query_term)
    SubstringRules.for(query_term)
  end

  # Takes a query_term, generates the segments
  # for that term, and searches for those segment
  # matches in the lexicon.
  #
  # Returns a ranked ordered list of candidates
  def suggest(query_term)
    @qt = query_term
    @candidates = Candidates.new
    srs = for_term(@qt)

    srs.each do |seg|
      @lex.search(seg).each do |result|
        found(result)
      end
    end

    # Run substring rules
    # Check confidence
    #   Run ngrams
    # Return most confident candidate set
    return @candidates
  end

  private #------

  def found(result)
    word = result["word"]
    id   = result["id"]
    if @candidates.has_id?(id)
      @candidates.vote_for(id, 1.0)
    else
      c = Candidate.new(@qt, word, id)					
      @candidates.add(c)
    end
  end
end
