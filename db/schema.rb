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

ActiveRecord::Schema.define(version: 20140306200533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "content_modules", force: true do |t|
    t.string   "title",                  null: false
    t.string   "context",                null: false
    t.integer  "position",   default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_providers", force: true do |t|
    t.string   "type",                            null: false
    t.string   "source_content_type"
    t.integer  "source_content_id"
    t.integer  "content_module_id",               null: false
    t.integer  "position",            default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_providers", ["content_module_id"], name: "index_content_providers_on_content_module_id", using: :btree

  create_table "content_releases", force: true do |t|
    t.integer  "release_date"
    t.integer  "slideshow_id"
    t.integer  "relaxation_audio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_journals", force: true do |t|
    t.integer  "average_stress"
    t.integer  "average_sleep_quality"
    t.text     "meaningful_text"
    t.text     "gratitude_text"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "daily_journals", ["participant_id"], name: "index_daily_journals_on_participant_id", using: :btree

  create_table "daily_relaxation_sessions", force: true do |t|
    t.integer  "pre_stress"
    t.integer  "post_stress"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "participant_id"
  end

  add_index "daily_relaxation_sessions", ["participant_id"], name: "index_daily_relaxation_sessions_on_participant_id", using: :btree

  create_table "group_session_mood_details", force: true do |t|
    t.integer  "hope"
    t.integer  "safety"
    t.integer  "comfort"
    t.integer  "closeness"
    t.integer  "well_being"
    t.integer  "clarity"
    t.integer  "understanding"
    t.integer  "self_confidence"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_session_mood_details", ["participant_id"], name: "index_group_session_mood_details_on_participant_id", using: :btree

  create_table "group_session_mood_summaries", force: true do |t|
    t.integer  "pre_anxious"
    t.integer  "pre_sad"
    t.integer  "pre_confused"
    t.integer  "pre_energy"
    t.integer  "pre_fatigue"
    t.integer  "post_anxious"
    t.integer  "post_sad"
    t.integer  "post_confused"
    t.integer  "post_energy"
    t.integer  "post_fatigue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "participant_id"
  end

  add_index "group_session_mood_summaries", ["participant_id"], name: "index_group_session_mood_summaries_on_participant_id", using: :btree

  create_table "listenings", force: true do |t|
    t.integer  "daily_relaxation_session_id"
    t.integer  "relaxation_audio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listenings", ["daily_relaxation_session_id"], name: "index_listenings_on_daily_relaxation_session_id", using: :btree
  add_index "listenings", ["relaxation_audio_id"], name: "index_listenings_on_relaxation_audio_id", using: :btree

  create_table "participant_statuses", force: true do |t|
    t.string   "context"
    t.integer  "module_position"
    t.integer  "provider_position"
    t.integer  "content_position"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participant_statuses", ["participant_id"], name: "index_participant_statuses_on_participant_id", using: :btree

  create_table "participants", force: true do |t|
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
    t.date     "start_date"
    t.date     "study_start_date"
  end

  add_index "participants", ["email"], name: "index_participants_on_email", unique: true, using: :btree
  add_index "participants", ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true, using: :btree

  create_table "relaxation_audios", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sound_file_file_name"
    t.string   "sound_file_content_type"
    t.integer  "sound_file_file_size"
    t.datetime "sound_file_updated_at"
    t.string   "title"
  end

  create_table "slides", force: true do |t|
    t.string   "title"
    t.text     "body",                            null: false
    t.integer  "position",         default: 1,    null: false
    t.boolean  "is_title_visible", default: true, null: false
    t.string   "type"
    t.text     "options"
    t.integer  "slideshow_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slides", ["position", "slideshow_id"], name: "index_slides_on_position_and_slideshow_id", unique: true, using: :btree
  add_index "slides", ["slideshow_id"], name: "index_slides_on_slideshow_id", using: :btree

  create_table "slideshows", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
