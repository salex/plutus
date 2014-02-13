# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140213180905) do

  create_table "plutus_accounts", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.boolean  "contra",     default: false
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plutus_accounts", ["name", "type"], name: "index_plutus_accounts_on_name_and_type"
  add_index "plutus_accounts", ["tenant_id"], name: "index_plutus_accounts_on_tenant_id"

  create_table "plutus_amounts", force: true do |t|
    t.string  "type"
    t.integer "account_id"
    t.integer "transaction_id"
    t.decimal "amount",         precision: 20, scale: 10
    t.integer "tenant_id"
  end

  add_index "plutus_amounts", ["account_id", "transaction_id"], name: "index_plutus_amounts_on_account_id_and_transaction_id"
  add_index "plutus_amounts", ["tenant_id"], name: "index_plutus_amounts_on_tenant_id"
  add_index "plutus_amounts", ["transaction_id", "account_id"], name: "index_plutus_amounts_on_transaction_id_and_account_id"
  add_index "plutus_amounts", ["type"], name: "index_plutus_amounts_on_type"

  create_table "plutus_transactions", force: true do |t|
    t.string   "description"
    t.integer  "commercial_document_id"
    t.string   "commercial_document_type"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plutus_transactions", ["commercial_document_id", "commercial_document_type"], name: "index_transactions_on_commercial_doc"
  add_index "plutus_transactions", ["tenant_id"], name: "index_plutus_transactions_on_tenant_id"

  create_table "tenants", force: true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
