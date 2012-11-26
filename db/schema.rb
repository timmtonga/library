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

ActiveRecord::Schema.define(:version => 20121116122358) do

  create_table "book_checkouts", :force => true do |t|
    t.integer "book_id",                   :null => false
    t.integer "employee_id"
    t.string  "borrow_date", :limit => 45
  end

  add_index "book_checkouts", ["book_id"], :name => "fk_book_cheackouts_1"
  add_index "book_checkouts", ["employee_id"], :name => "fk_book_cheackouts_2"

  create_table "books", :force => true do |t|
    t.string "title",     :limit => 25, :null => false
    t.string "author",    :limit => 25
    t.string "classmark", :limit => 10
    t.string "category",  :limit => 45
  end

  create_table "employees", :force => true do |t|
    t.string "fname", :limit => 15, :null => false
    t.string "lname", :limit => 15, :null => false
    t.string "dept",  :limit => 45
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
