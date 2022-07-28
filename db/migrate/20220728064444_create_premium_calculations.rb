class CreatePremiumCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :premium_calculations do |t|
      t.string :prime_avant_tax
      t.string :emission_fees
      t.string :tax
      t.references :quotation, foreign_key: true
      t.timestamps
    end
  end
end
