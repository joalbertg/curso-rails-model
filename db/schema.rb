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

ActiveRecord::Schema.define(version: 20170326031822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre",                                             null: false
    t.string   "codigo",                              default: "CF"
    t.text     "direccion"
    t.decimal  "saldo",      precision: 10, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "pais_id"
  end

  add_index "clientes", ["codigo"], name: "index_clientes_on_codigo", using: :btree
  add_index "clientes", ["pais_id"], name: "index_clientes_on_pais_id", using: :btree

  create_table "facturas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.date     "fecha"
    t.decimal  "monto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "facturas", ["cliente_id"], name: "index_facturas_on_cliente_id", using: :btree

  create_table "paises", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clientes", "paises"
  add_foreign_key "facturas", "clientes"
end
