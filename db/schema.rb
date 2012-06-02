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

ActiveRecord::Schema.define(:version => 20120602025902) do

  create_table "bills", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.boolean  "lords"
    t.string   "session"
    t.string   "standingprefix"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "cons_info", :force => true do |t|
    t.string   "constituency"
    t.string   "data_key"
    t.text     "data_value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "constituencies", :force => true do |t|
    t.string   "name"
    t.boolean  "main_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ep_objects", :force => true do |t|
    t.integer  "epobject_id"
    t.string   "title"
    t.text     "body"
    t.integer  "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gid_redirects", :force => true do |t|
    t.string   "gid_from"
    t.string   "gid_to"
    t.date     "hdate"
    t.integer  "major"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hansards", :force => true do |t|
    t.integer  "epobject_id_id"
    t.string   "git"
    t.integer  "htype"
    t.integer  "speaker_id_id"
    t.integer  "major"
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.integer  "hpos"
    t.date     "hdate"
    t.time     "htime"
    t.string   "source_url"
    t.integer  "minor"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "hansards", ["epobject_id_id"], :name => "index_hansards_on_epobject_id_id"
  add_index "hansards", ["speaker_id_id"], :name => "index_hansards_on_speaker_id_id"

  create_table "index_batches", :force => true do |t|
    t.integer  "indexbatch_id"
    t.datetime "created"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "m_offices", :force => true do |t|
    t.integer  "moffice_id"
    t.string   "dept"
    t.string   "position"
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "person_id"
    t.string   "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "m_offices", ["person_id"], :name => "index_m_offices_on_person_id"

  create_table "member_infos", :force => true do |t|
    t.integer  "member_id"
    t.string   "data_key"
    t.text     "data_value"
    t.datetime "lastupdate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "member_infos", ["member_id"], :name => "index_member_infos_on_member_id"

  create_table "members", :force => true do |t|
    t.integer  "member_id"
    t.integer  "house"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "constituency"
    t.string   "party"
    t.date     "entered_house"
    t.date     "left_house"
    t.string   "enetered_reason"
    t.string   "left_reason"
    t.integer  "person_id"
    t.string   "title"
    t.datetime "lastupdate"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "pbc_members", :force => true do |t|
    t.integer  "member_id"
    t.boolean  "chairman"
    t.integer  "bill_id"
    t.string   "sitting"
    t.boolean  "attending"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pbc_members", ["bill_id"], :name => "index_pbc_members_on_bill_id"
  add_index "pbc_members", ["member_id"], :name => "index_pbc_members_on_member_id"

  create_table "person_infos", :force => true do |t|
    t.integer  "person_id"
    t.string   "data_key"
    t.text     "data_value"
    t.datetime "lastupdate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "person_infos", ["person_id"], :name => "index_person_infos_on_person_id"

  create_table "postcode_lookups", :force => true do |t|
    t.string   "postcode"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
