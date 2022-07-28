class PremiumCalculator
	VALUE_1 = 500000
	VALUE_2 = 1000
	VALUE_3 = 1.17
	VALUE_4 = 320
	VALUE_5 = 9
	VALUE_6 = 100
	EMISSION_FEES = 20

	def initialize(quotation)
		@quotation = quotation
	end

	def calculate
		prime_avant_tax = (((@quotation.municiple_evaluation_of_property-(VALUE_1))/VALUE_2)*(VALUE_3))+VALUE_4
    tax = ((prime_avant_tax)*VALUE_5)/VALUE_6

    @quotation&.premium_calculation&.prime_avant_tax = prime_avant_tax
    @quotation&.premium_calculation&.emission_fees = EMISSION_FEES
    @quotation&.premium_calculation&.tax = tax
		@quotation.premium_calculation.save   

    return prime_avant_tax + EMISSION_FEES + tax 

	rescue => e
		return 0
	end
end