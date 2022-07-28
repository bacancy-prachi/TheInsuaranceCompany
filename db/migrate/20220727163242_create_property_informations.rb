class CreatePropertyInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :property_informations do |t|
      t.boolean :bound_by_water
      t.boolean :ensure_municipal_water_sewer
      t.boolean :ensure_property
      t.boolean :client_knowledge
      t.references :quotation, foreign_key: true

      t.timestamps
    end
  end
end
