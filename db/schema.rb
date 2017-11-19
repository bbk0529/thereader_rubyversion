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

ActiveRecord::Schema.define(version: 20171117041517) do

  create_table "emails", force: :cascade do |t|
    t.string "sender"
    t.string "subject"
    t.text "text"
    t.date "date"
    t.integer "wordcount"
    t.string "language"
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
    t.float "개방성"
    t.float "모험성"
    t.float "예술적 흥미"
    t.float "정서성"
    t.float "상상력"
    t.float "지력"
    t.float "권력에 저항"
    t.float "성실성"
    t.float "성취 추구"
    t.float "신중함"
    t.float "순종성"
    t.float "질서 정연함"
    t.float "자기 훈련"
    t.float "자기 효능감"
    t.float "외향성"
    t.float "활동 레벨"
    t.float "자신만만함"
    t.float "쾌활"
    t.float "자극 탐색"
    t.float "외향적"
    t.float "사교적"
    t.float "친화성"
    t.float "이타성"
    t.float "협동성"
    t.float "겸손함"
    t.float "비타협성"
    t.float "동정"
    t.float "신뢰"
    t.float "감정의 기복"
    t.float "급한"
    t.float "걱정이 많은"
    t.float "우울한"
    t.float "극단적인"
    t.float "자의식이 강한"
    t.float "스트레스에 민감한"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
