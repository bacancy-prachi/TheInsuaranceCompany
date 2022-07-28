class PropertyLegalDescription < ApplicationRecord
  belongs_to :quotation

  validates_presence_of :lot_number, :proprty_address, :city, :postal_code
end
