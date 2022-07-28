# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_28_064444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.text "description"
    t.string "referral_agent_name"
    t.string "referral_agent_email"
    t.bigint "quotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quotation_id"], name: "index_notes_on_quotation_id"
  end

  create_table "premium_calculations", force: :cascade do |t|
    t.string "prime_avant_tax"
    t.string "emission_fees"
    t.string "tax"
    t.bigint "quotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quotation_id"], name: "index_premium_calculations_on_quotation_id"
  end

  create_table "property_informations", force: :cascade do |t|
    t.boolean "bound_by_water"
    t.boolean "ensure_municipal_water_sewer"
    t.boolean "ensure_property"
    t.boolean "client_knowledge"
    t.bigint "quotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quotation_id"], name: "index_property_informations_on_quotation_id"
  end

  create_table "property_legal_descriptions", force: :cascade do |t|
    t.integer "lot_number"
    t.string "proprty_address"
    t.string "city"
    t.string "postal_code"
    t.bigint "quotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quotation_id"], name: "index_property_legal_descriptions_on_quotation_id"
  end

  create_table "quotation_transactions", force: :cascade do |t|
    t.bigint "insuarance_premium"
    t.boolean "language"
    t.string "home_owner"
    t.string "second_home_owner"
    t.string "third_home_owner"
    t.string "type_of_property"
    t.string "present_owner"
    t.datetime "purchase_date"
    t.string "municiple_evaluation_of_property"
    t.bigint "quotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quotation_id"], name: "index_quotation_transactions_on_quotation_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "postal_code"
    t.string "city"
    t.string "phone"
    t.string "province"
    t.bigint "municiple_evaluation_of_property"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_callbacks", force: :cascade do |t|
    t.string "phone_number"
    t.string "availability"
    t.bigint "quotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quotation_id"], name: "index_request_callbacks_on_quotation_id"
  end

  add_foreign_key "notes", "quotations"
  add_foreign_key "premium_calculations", "quotations"
  add_foreign_key "property_informations", "quotations"
  add_foreign_key "property_legal_descriptions", "quotations"
  add_foreign_key "quotation_transactions", "quotations"
  add_foreign_key "request_callbacks", "quotations"
end
