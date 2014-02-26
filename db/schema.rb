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

ActiveRecord::Schema.define(version: 20140226223627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clip_playlists", force: true do |t|
    t.integer  "clip_id"
    t.integer  "playlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clip_playlists", ["clip_id"], name: "index_clip_playlists_on_clip_id", using: :btree
  add_index "clip_playlists", ["playlist_id"], name: "index_clip_playlists_on_playlist_id", using: :btree

  create_table "clips", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "transcript"
    t.string   "audio"
    t.text     "description"
    t.boolean  "is_private"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "performer"
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.integer  "mp3_file_size"
    t.datetime "mp3_updated_at"
    t.float    "score",            default: 0.0
    t.float    "latitude"
    t.float    "longitude"
    t.string   "ip_address"
    t.integer  "snippable_id"
    t.string   "snippable_type"
  end

  add_index "clips", ["user_id"], name: "index_clips_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "clip_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["clip_id"], name: "index_comments_on_clip_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "clip_id"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["clip_id"], name: "index_likes_on_clip_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "playlists", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.integer  "clip_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["clip_id"], name: "index_tags_on_clip_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
