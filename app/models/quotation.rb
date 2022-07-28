class Quotation < ApplicationRecord
	validates_presence_of :first_name
	has_one :quotation_transaction, dependent: :destroy
	has_one :property_legal_description, dependent: :destroy
	has_one :note, dependent: :destroy
	has_one :property_information, dependent: :destroy
	accepts_nested_attributes_for :quotation_transaction, :property_legal_description, :property_information, :note, allow_destroy: true
end
