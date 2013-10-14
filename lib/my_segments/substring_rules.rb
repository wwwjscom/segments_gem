
class SubstringRules

	def initialize(lexicon)
		@candidates = Candidates.new
    @lex = lexicon
	end

  # Generates substring rules (segments) for the query term
  # and returns them.
  def self.for(query_term)
    segs = []
		segs << self.method_1(query_term)
		segs << self.method_3(query_term)
		segs << self.method_4(query_term)
		segs << self.method_5(query_term)
		segs << self.method_6(query_term)
		segs << self.method_7(query_term)
    segs.flatten
  end

	def find(query)
		@misspelled = query
		
		# First look for an exact match, and return if one is found
		find_candidates([query], true)
    if @candidates.size > 0
  		return @candidates
		end
	end

	# This function cuts off one letter at a time from the start and end of the search term...
	# It then re-searches using the new term.  It continues to do so until the ET is reached,
	# Or the term has become too small to cut off more letters.
	# Example:
	# %Slovakia%
	# %lovaki%
	# %ovak%
	# etc
	def self.method_1(query)
		q = String.new(query)
		@substring_rules = []
		while q.size > 3 do
			q = q[1..-2]
			@substring_rules << "%" + q + "%"
		end
		@substring_rules
	end

	# This function replaces the middle of the search term with %'s
	# MySQL views %'s "match anything".  The function then re-searches
	# The database using the new query until either the ET is reached,
	# Or until the query is too short to continue dividing.
	# Example:
	# %Slovakia%
	# %Slov%kia%
	# %Slo%ia%
	# etc
	def self.method_3(query)
		q = String.new(query)
		@substring_rules =  []
		@length = q.length
		while @length > 3 do
			q.gsub!('%', '')
			q[@length/2] = '%'
			@length = q.length
			@substring_rules << String.new(q)
		end
		@substring_rules
	end


	# This function divides the query in 1/2 and cuts off the front 1/2.
	# It only adds %'s to the BEGINING of the word.
	# Exmaple:
	# %Slovakia%
	# %akia
	def self.method_4(query)
	  if query.length == 1
      return [query]
    else
  		query = ["%" + query[(query.length/2)..-1]]
  		return query
  	end
	end


	# Same as above function, but keeps the latter 1/2 of the query.
	# However, a percent SHOULD be put at the end of the query and NOT
	# at the begining of the query.
	# Example:
	# %Slovakia%
	# Slov%
	def self.method_5(query)
	  if query.length == 1
      return [query]
    else
  		return [query[0..(query.length/2)-1] + "%"]
		end
	end


	# This function cuts everything out of the middle of the query...
	# Only leaving the first and last letters.  It replaces the
	# chars in the middle of the query wiht a %.
	# Example:
	# Slovakia
	# S%a
	def self.method_6(query)
		query = [query[0].chr + "%" + query[-1].chr]
	end

	# Same as above, but it keeps the last two AND first two
	# chars of the query.
	# Example:
	# Slovakia
	# Sl%ia
	def self.method_7(query)
    if query.length == 1
      return [query]
    else
  		return [query[0..1] + "%" + query[-2..-1]]
		end
	end
end
