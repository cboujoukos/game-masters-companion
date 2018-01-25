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

ActiveRecord::Schema.define(version: 20180125192503) do

  create_table "attacks", force: :cascade do |t|
    t.string "name"
    t.string "to_hit"
    t.string "damage"
    t.integer "character_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "setting"
    t.integer "user_id"
    t.text "notes"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.string "ac"
    t.string "hp"
    t.string "xp"
    t.text "stats"
    t.string "passive_perception"
    t.integer "campaign_id"
    t.string "category"
    t.string "cr"
  end

  create_table "characters_encounters", force: :cascade do |t|
    t.integer "encounter_id"
    t.integer "character_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.string "loot"
    t.text "notes"
    t.integer "campaign_id"
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
