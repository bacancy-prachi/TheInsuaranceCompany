class CreateQuotationTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :quotation_transactions do |t|
      t.bigint :insuarance_premium
      t.boolean :language
      t.string :home_owner
      t.string :second_home_owner
      t.string :third_home_owner
      t.string :type_of_property
      t.string :present_owner
      t.datetime :purchase_date
      t.string :municiple_evaluation_of_property
      t.references :quotation, foreign_key: true

      t.timestamps
    end
  end
end
