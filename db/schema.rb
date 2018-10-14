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

ActiveRecord::Schema.define(version: 2018_10_14_053700) do

  create_table "games", force: :cascade do |t|
    t.string "home"
    t.string "away"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "game_url"
    t.string "date"
    t.integer "home_score"
    t.integer "away_score"
  end

  create_table "player_games", force: :cascade do |t|
    t.integer "field_goal_made"
    t.integer "field_goal_attempted"
    t.integer "free_throw_made"
    t.integer "free_throw_attempted"
    t.integer "three_point_made"
    t.integer "three_point_attempted"
    t.integer "points"
    t.integer "rebounds"
    t.integer "assists"
    t.integer "steals"
    t.integer "blocks"
    t.integer "turnovers"
    t.integer "player_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_player_games_on_game_id"
    t.index ["player_id"], name: "index_player_games_on_player_id"
  end

  create_table "player_season_projections", force: :cascade do |t|
    t.float "field_goal_percentage"
    t.float "free_throw_percentage"
    t.float "three_point_per_game"
    t.float "rebounds_per_game"
    t.float "assists_per_game"
    t.float "steals_per_game"
    t.float "blocks_per_game"
    t.float "turnovers_per_game"
    t.integer "user_id"
    t.integer "player_id"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "points_per_game"
    t.index ["player_id"], name: "index_player_season_projections_on_player_id"
    t.index ["season_id"], name: "index_player_season_projections_on_season_id"
    t.index ["user_id"], name: "index_player_season_projections_on_user_id"
  end

  create_table "player_seasons", force: :cascade do |t|
    t.float "field_goal_percentage"
    t.float "free_throw_percentage"
    t.float "three_point_per_game"
    t.float "rebounds_per_game"
    t.float "assists_per_game"
    t.float "steals_per_game"
    t.float "blocks_per_game"
    t.float "turnovers_per_game"
    t.integer "player_id"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "points_per_game"
    t.index ["player_id"], name: "index_player_seasons_on_player_id"
    t.index ["season_id"], name: "index_player_seasons_on_season_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "player_url"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "uid"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
