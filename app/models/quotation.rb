class Quotation < ApplicationRecord
	has_one :quotation_transaction, dependent: :destroy
	has_one :property_legal_description, dependent: :destroy
	has_one :note, dependent: :destroy
	has_one :property_information, dependent: :destroy
	has_one :request_callback, dependent: :destroy
	has_one :premium_calculation, dependent: :destroy
	accepts_nested_attributes_for :quotation_transaction, :property_legal_description, :property_information, :note, :request_callback, :premium_calculation,  allow_destroy: true

	validates_presence_of :email, :first_name, :last_name, :address, :postal_code, :city, :phone, :province, :municiple_evaluation_of_property
	# validates :phone, numericality: { only_integer: true }
end
