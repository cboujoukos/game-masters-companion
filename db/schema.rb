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

ActiveRecord::Schema.define(version: 20180117165055) do

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "setting"
    t.integer "user_id"
  end

  create_table "characters", force: :cascade do |t|
    t.boolean "is_player"
    t.string "name"
    t.string "notes"
    t.integer "ac"
    t.integer "hp"
    t.integer "xp"
    t.string "stats"
    t.integer "passive_perception"
    t.integer "campaign_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.string "loot"
    t.string "notes"
    t.integer "campaign_id"
  end

  create_table "encounters_characters", force: :cascade do |t|
    t.integer "encounter_id"
    t.integer "character_id"
  end

  create_table "encounters_enemies", force: :cascade do |t|
    t.integer "encounter_id"
    t.integer "enemy_id"
  end

  create_table "enemies", force: :cascade do |t|
    t.string "category"
    t.integer "hp"
    t.integer "ac"
    t.string "notes"
    t.string "damage"
    t.integer "campign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
