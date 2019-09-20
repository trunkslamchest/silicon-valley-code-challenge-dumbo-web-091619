class VentureCapitalist

	attr_accessor :total_worth
	attr_reader :name
	# attr_writer

	@@all = []

	def initialize(name, total_worth)
		@name = name
		@total_worth = total_worth
		@@all << self
	end

	def worth
		self.total_worth()
	end

	def offer_contract(startup, type, amount)
		FundingRound.new(self, startup, type, amount)
	end

	def self.tres_commas_club
		VentureCapitalist.all.select { |company| company.total_worth > 1000000000 }
	end

	def funding_rounds
		FundingRound.all.select { |company| company.venture_capitalist == self }
	end

	def portfolio
		self.funding_rounds.map { |company| company.startup.name }.uniq
	end

	def biggest_investment
		self.funding_rounds.map { |investment| investment.investment }.sort[-1]
	end

	def self.all
		@@all
	end

end