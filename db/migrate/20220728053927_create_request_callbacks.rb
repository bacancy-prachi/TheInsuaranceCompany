class CreateRequestCallbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :request_callbacks do |t|
      t.string :phone_number
      t.string :availability
      t.references :quotation, foreign_key: true

      t.timestamps
    end
  end
end
