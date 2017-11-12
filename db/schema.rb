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

ActiveRecord::Schema.define(version: 20171112035206) do

  create_table "emails", force: :cascade do |t|
    t.string "sender"
    t.string "subject"
    t.text "text"
    t.date "date"
    t.integer "wordcount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metapis", force: :cascade do |t|
    t.string "sender"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pis", force: :cascade do |t|
    t.string "sender"
    t.string "Openness"
    t.string "Adventurousness"
    t.string "Artistic interests"
    t.string "Emotionality"
    t.string "Imagination"
    t.string "Intellect"
    t.string "Authority-challenging"
    t.string "Conscientiousness"
    t.string "Achievement striving"
    t.string "Cautiousness"
    t.string "Dutifulness"
    t.string "Orderliness"
    t.string "Self-discipline"
    t.string "Self-efficacy"
    t.string "Extraversion"
    t.string "Activity level"
    t.string "Assertiveness"
    t.string "Cheerfulness"
    t.string "Excitement-seeking"
    t.string "Outgoing"
    t.string "Gregariousness"
    t.string "Agreeableness"
    t.string "Altruism"
    t.string "Cooperation"
    t.string "Modesty"
    t.string "Uncompromising"
    t.string "Sympathy"
    t.string "Trust"
    t.string "Emotional range"
    t.string "Fiery"
    t.string "Prone to worry"
    t.string "Melancholy"
    t.string "Immoderation"
    t.string "Self-consciousness"
    t.string "Susceptible to stress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
