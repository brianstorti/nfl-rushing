# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

task import_data: :environment do
  file_path = File.join(Rails.root, "data", "rushing.json")

  JSON.parse(File.read(file_path)).each do |player_stats|
    PlayerStat.create!(
      name: player_stats["Player"],
      team: player_stats["Team"],
      position: player_stats["Pos"],
      rushing_attempts_per_game_avg: player_stats["Att"],
      rushing_attempts: player_stats["Att/G"],
      total_rushing_yards:  player_stats["Yds"],
      rushing_avg_yards_per_attempt: player_stats["Avg"],
      rushing_yards_per_game:  player_stats["Yds/G"],
      total_rushing_touchdowns: player_stats["TD"],
      longest_rush: player_stats["Lng"],
      longest_rush_touchdown: player_stats["Lng"].to_s.include?("T"),
      rushing_first_downs: player_stats["1st"],
      rushing_first_down_pct: player_stats["1st%"],
      rushing_20_yards_each:player_stats["20+"],
      rushing_40_yards_each: player_stats["40+"],
      rushing_fumbles: player_stats["FUM"],
    )
  end
end
