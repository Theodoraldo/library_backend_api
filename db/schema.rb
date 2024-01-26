# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_24_143336) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.bigint "library_patron_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_patron_id"], name: "index_attendances_on_library_patron_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.date "published_date"
    t.integer "available_copies"
    t.integer "pages"
    t.string "note"
    t.boolean "removed", default: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_books_on_genre_id"
  end

  create_table "borrow_histories", force: :cascade do |t|
    t.date "borrow_date"
    t.date "returned_date"
    t.string "book_state"
    t.boolean "instore", default: false
    t.string "comment"
    t.bigint "library_patron_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_borrow_histories_on_book_id"
    t.index ["library_patron_id"], name: "index_borrow_histories_on_library_patron_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "library_patrons", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.text "contact"
    t.string "location"
    t.string "city"
    t.string "state"
    t.string "identity_card"
    t.string "identity_no"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendances", "library_patrons"
  add_foreign_key "books", "genres"
  add_foreign_key "borrow_histories", "books"
  add_foreign_key "borrow_histories", "library_patrons"
end
