class FundingRound

	# attr_accessor
	attr_reader :startup, :venture_capitalist, :type, :investment
	# attr_writer

	@@all = []

	def initialize(startup, venture_capitalist, type, investment)
		@startup = startup
		@venture_capitalist = venture_capitalist
		@type = type
		@investment = investment
		@@all << self
	end

	def self.all
		@@all
	end

end