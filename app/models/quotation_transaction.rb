class QuotationTransaction < ApplicationRecord
  belongs_to :quotation

  validates_presence_of :language, :home_owner, :type_of_property, :purchase_date
end
