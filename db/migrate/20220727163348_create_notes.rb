class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :description
      t.string :referral_agent_name
      t.string :referral_agent_email
      t.references :quotation, foreign_key: true

      t.timestamps
    end
  end
end
