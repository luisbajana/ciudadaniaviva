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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141229011800) do

  create_table "causes", :force => true do |t|
    t.string   "title"
    t.string   "dataset"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "impact"
    t.string   "custom_url"
    t.integer  "goal"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.string   "city"
    t.string   "status"
  end

  create_table "directories", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.string   "category"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.text     "description"
  end

  create_table "locations", :force => true do |t|
    t.float    "latitude"
    t.string   "longitude"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "directory_id"
    t.string   "gmaps"
    t.text     "description"
    t.text     "address"
    t.integer  "user_id"
  end

  create_table "supports", :force => true do |t|
    t.integer  "cause_id"
    t.integer  "user_id"
    t.string   "hour"
    t.string   "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "address"
    t.string   "status"
  end

  create_table "testimonials", :force => true do |t|
    t.string   "title"
    t.text     "testimonial"
    t.integer  "user_id"
    t.integer  "cause_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "picture"
    t.string   "nickname"
  end

end
