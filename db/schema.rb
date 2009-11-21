# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091121022028) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "style"
    t.integer  "capacity"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_vouchers", :force => true do |t|
    t.integer  "material_id"
    t.integer  "brand_id"
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.integer  "amount"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "workshop_id"
    t.string   "class"
    t.string   "buy_at"
    t.string   "from"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_items", :force => true do |t|
    t.string   "class"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "class"
    t.integer  "sub_class"
    t.float    "diameter"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "customer_name"
    t.string   "customer_phone"
    t.integer  "class"
    t.integer  "user_id"
    t.float    "predict_fee"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.float    "fee"
    t.datetime "paid_at"
    t.integer  "register_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["user_id"], :name => "index_products_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.text     "roles"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "warehouse_vouchers", :force => true do |t|
    t.integer  "material_id"
    t.integer  "brand_id"
    t.integer  "purchaser_id"
    t.integer  "user_id"
    t.integer  "amount"
    t.float    "unit_price"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_sheets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "workshop_id"
    t.integer  "equipment_id"
    t.text     "task"
    t.datetime "expected_at"
    t.text     "content"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_sheets", ["equipment_id"], :name => "index_work_sheets_on_equipment_id"
  add_index "work_sheets", ["product_id"], :name => "index_work_sheets_on_product_id"
  add_index "work_sheets", ["user_id"], :name => "index_work_sheets_on_user_id"
  add_index "work_sheets", ["workshop_id"], :name => "index_work_sheets_on_workshop_id"

  create_table "workshops", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
