class Startup

	attr_accessor :name
	attr_reader :founder
	# attr_writer

	@@all = []

	def initialize(name, founder)
		@name = name
		@founder = founder
		@@all << self
	end

	def self.find_by_founder(founder)
		Startup.all.select { |startup| startup.founder == founder }
	end

	def sign_contract(venture_capitalist, type, amount)
		FundingRound.new(self, venture_capitalist, type, amount)
	end

	def funding_rounds
		FundingRound.all.select { |company| company.startup == self }
	end

	def num_funding_rounds
		self.funding_rounds.length
	end

	def investors
		self.funding_rounds.map { |round| round.venture_capitalist }.uniq
	end

	def big_investors
		self.investors.select { |venture| venture.total_worth > 1000000000 }.uniq
	end

	def self.all
		@@all
	end

end
