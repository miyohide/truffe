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

ActiveRecord::Schema.define(:version => 20140125035013) do

  create_table "articles", :force => true do |t|
    t.string   "heading"
    t.text     "content"
    t.date     "published_on"
    t.string   "tags"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "basic_data", :force => true do |t|
    t.string   "site_name"
    t.string   "email"
    t.text     "message"
    t.text     "profile"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blog_entries", :force => true do |t|
    t.integer  "user_id"
    t.date     "blog_date"
    t.string   "heading"
    t.text     "body"
    t.string   "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.text     "body",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "discographies", :force => true do |t|
    t.date     "release_date"
    t.string   "title"
    t.string   "artist"
    t.text     "players"
    t.string   "record_co"
    t.string   "url"
    t.text     "comment"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "gigs", :force => true do |t|
    t.date     "gig_date",                        :null => false
    t.date     "gig_date_end"
    t.string   "gig_title"
    t.string   "group"
    t.string   "location"
    t.integer  "charge"
    t.string   "players"
    t.string   "comment"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "recommend",    :default => 0
    t.time     "start_time"
    t.boolean  "visible",      :default => false
  end

  create_table "photos", :force => true do |t|
    t.date     "photo_date"
    t.string   "file_no"
    t.string   "album_no"
    t.string   "title"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                  :null => false
    t.string   "email"
    t.string   "encrypted_password",                    :null => false
    t.string   "salt"
    t.date     "birthday"
    t.boolean  "administrator",      :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
