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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110616193656) do

  create_table "considerations", :force => true do |t|
    t.integer  "place_id",    :null => false
    t.integer  "interest_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "considerations", ["interest_id"], :name => "index_considerations_on_interest_id"
  add_index "considerations", ["place_id", "interest_id"], :name => "index_considerations_on_place_id_and_interest_id"
  add_index "considerations", ["place_id"], :name => "index_considerations_on_place_id"

  create_table "interests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "considerations_count", :default => 0
  end

  add_index "interests", ["considerations_count"], :name => "index_interests_on_considerations_count"
  add_index "interests", ["name"], :name => "index_interests_on_name"

  create_table "places", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["name"], :name => "index_places_on_name"

end
