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

ActiveRecord::Schema.define(:version => 20130729211252) do

  create_table "course_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postal"
    t.integer  "course_type_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "gmaps"
    t.string   "phone"
    t.text     "price"
    t.text     "hours"
  end

  add_index "courses", ["course_type_id"], :name => "index_courses_on_course_type_id"

  create_table "holes", :force => true do |t|
    t.integer  "course_id"
    t.integer  "hole_number"
    t.integer  "par"
    t.integer  "yards"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "blue"
    t.integer  "red"
  end

  add_index "holes", ["course_id"], :name => "index_holes_on_course_id"

  create_table "scorecards", :force => true do |t|
    t.integer  "course_id"
    t.date     "played_on"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "scorecards", ["course_id"], :name => "index_scorecards_on_course_id"

  create_table "scores", :force => true do |t|
    t.integer  "hole_id"
    t.integer  "user_id"
    t.integer  "score"
    t.date     "played_on"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "scorecard_id"
    t.integer  "user_score_id"
  end

  add_index "scores", ["hole_id"], :name => "index_scores_on_hole_id"
  add_index "scores", ["scorecard_id"], :name => "index_scores_on_scorecard_id"
  add_index "scores", ["user_id"], :name => "index_scores_on_user_id"
  add_index "scores", ["user_score_id"], :name => "index_scores_on_user_score_id"

  create_table "user_scores", :force => true do |t|
    t.integer  "user_id"
    t.integer  "scorecard_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "user_scores", ["scorecard_id"], :name => "index_user_scores_on_scorecard_id"
  add_index "user_scores", ["user_id"], :name => "index_user_scores_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.datetime "confirmed_at"
    t.string   "name"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
