# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_14_150200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "player_stats", force: :cascade do |t|
    t.string "name"
    t.string "team"
    t.string "position"
    t.decimal "rushing_attempts_per_game_avg"
    t.integer "rushing_attempts"
    t.decimal "total_rushing_yards"
    t.decimal "rushing_avg_yards_per_attempt"
    t.decimal "rushing_yards_per_game"
    t.integer "total_rushing_touchdowns"
    t.integer "longest_rush"
    t.boolean "longest_rush_touchdown"
    t.decimal "rushing_first_downs"
    t.decimal "rushing_first_down_pct"
    t.integer "rushing_20_yards_each"
    t.integer "rushing_40_yards_each"
    t.integer "rushing_fumbles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["longest_rush"], name: "index_player_stats_on_longest_rush"
    t.index ["name"], name: "index_player_stats_on_name"
    t.index ["total_rushing_touchdowns"], name: "index_player_stats_on_total_rushing_touchdowns"
    t.index ["total_rushing_yards"], name: "index_player_stats_on_total_rushing_yards"
  end

end
