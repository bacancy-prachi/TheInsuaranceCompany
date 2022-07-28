class CreatePropertyLegalDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :property_legal_descriptions do |t|
      t.integer :lot_number
      t.string :proprty_address
      t.string :city
      t.string :postal_code
      t.references :quotation, foreign_key: true

      t.timestamps
    end
  end
end
