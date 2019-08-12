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

ActiveRecord::Schema.define(version: 2019_08_10_081843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active_status"
    t.float "total"
    t.index ["profile_id"], name: "index_carts_on_profile_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "color_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fandoms", force: :cascade do |t|
    t.string "fandom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "size_id"
    t.bigint "color_id"
    t.integer "stock_QTY"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_product_variants_on_color_id"
    t.index ["product_id"], name: "index_product_variants_on_product_id"
    t.index ["size_id"], name: "index_product_variants_on_size_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "fandom_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["fandom_id"], name: "index_products_on_fandom_id"
    t.index ["profile_id"], name: "index_products_on_profile_id"
  end

  create_table "products_purchaseds", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_variant_id"
    t.integer "purchase_QTY"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_products_purchaseds_on_cart_id"
    t.index ["product_variant_id"], name: "index_products_purchaseds_on_product_variant_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.text "about"
    t.string "location"
    t.date "joindate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "privilege"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "category"
    t.string "sizing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "wishlist_products", force: :cascade do |t|
    t.bigint "wishlist_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wishlist_products_on_product_id"
    t.index ["wishlist_id"], name: "index_wishlist_products_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "profile_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_wishlists_on_profile_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carts", "profiles"
  add_foreign_key "product_variants", "colors"
  add_foreign_key "product_variants", "products"
  add_foreign_key "product_variants", "sizes"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "fandoms"
  add_foreign_key "products", "profiles"
  add_foreign_key "products_purchaseds", "carts"
  add_foreign_key "products_purchaseds", "product_variants"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "wishlist_products", "products"
  add_foreign_key "wishlist_products", "wishlists"
  add_foreign_key "wishlists", "profiles"
end
