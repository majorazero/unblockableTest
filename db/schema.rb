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

ActiveRecord::Schema.define(version: 20191122214254) do

  create_table "boards", force: :cascade do |t|
    t.integer "game_id"
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "coordinates", force: :cascade do |t|
    t.integer "x_coordinate", null: false
    t.integer "y_coordinate", null: false
    t.integer "status", default: 0, null: false
    t.integer "ship_id"
    t.integer "board_id"
    t.index ["board_id"], name: "index_coordinates_on_board_id"
    t.index ["ship_id"], name: "index_coordinates_on_ship_id"
  end

  create_table "games", force: :cascade do |t|
  end

  create_table "ships", force: :cascade do |t|
    t.integer "board_id"
    t.index ["board_id"], name: "index_ships_on_board_id"
  end

end
