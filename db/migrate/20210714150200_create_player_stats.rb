class CreatePlayerStats < ActiveRecord::Migration[6.1]
  def change
    create_table :player_stats do |t|
      t.string :name, index: true
      t.string :team
      t.string :position
      t.decimal :rushing_attempts_per_game_avg
      t.integer :rushing_attempts
      t.decimal :total_rushing_yards, index: true
      t.decimal :rushing_avg_yards_per_attempt
      t.decimal :rushing_yards_per_game
      t.integer :total_rushing_touchdowns, index: true
      t.integer :longest_rush, index: true
      t.boolean :longest_rush_touchdown
      t.decimal :rushing_first_downs
      t.decimal :rushing_first_down_pct
      t.integer :rushing_20_yards_each
      t.integer :rushing_40_yards_each
      t.integer :rushing_fumbles

      t.timestamps
    end
  end
end
