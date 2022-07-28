class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :phone
      t.string :province
      t.bigint :municiple_evaluation_of_property

      t.timestamps
    end
  end
end
