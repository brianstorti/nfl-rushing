require "application_system_test_case"

class PlayerStatsTest < ApplicationSystemTestCase
  setup do
    @player_stat = player_stats(:one)
  end

  test "visiting the index" do
    visit player_stats_url
    assert_selector "h1", text: "Player Stats"
  end

  test "creating a Player stat" do
    visit player_stats_url
    click_on "New Player Stat"

    fill_in "Longest rush", with: @player_stat.longest_rush
    fill_in "Name", with: @player_stat.name
    fill_in "Position", with: @player_stat.position
    fill_in "Rushing 20 yards each", with: @player_stat.rushing_20_yards_each
    fill_in "Rushing 40 yards each", with: @player_stat.rushing_40_yards_each
    fill_in "Rushing attempts", with: @player_stat.rushing_attempts
    fill_in "Rushing attempts per game avg", with: @player_stat.rushing_attempts_per_game_avg
    fill_in "Rushing avg yards per attempt", with: @player_stat.rushing_avg_yards_per_attempt
    fill_in "Rushing first down pct", with: @player_stat.rushing_first_down_pct
    fill_in "Rushing first downs", with: @player_stat.rushing_first_downs
    fill_in "Rushing fumbles", with: @player_stat.rushing_fumbles
    fill_in "Rushing yards per game", with: @player_stat.rushing_yards_per_game
    fill_in "Team", with: @player_stat.team
    fill_in "Total rushing touchdowns", with: @player_stat.total_rushing_touchdowns
    fill_in "Total rushing yards", with: @player_stat.total_rushing_yards
    click_on "Create Player stat"

    assert_text "Player stat was successfully created"
    click_on "Back"
  end

  test "updating a Player stat" do
    visit player_stats_url
    click_on "Edit", match: :first

    fill_in "Longest rush", with: @player_stat.longest_rush
    fill_in "Name", with: @player_stat.name
    fill_in "Position", with: @player_stat.position
    fill_in "Rushing 20 yards each", with: @player_stat.rushing_20_yards_each
    fill_in "Rushing 40 yards each", with: @player_stat.rushing_40_yards_each
    fill_in "Rushing attempts", with: @player_stat.rushing_attempts
    fill_in "Rushing attempts per game avg", with: @player_stat.rushing_attempts_per_game_avg
    fill_in "Rushing avg yards per attempt", with: @player_stat.rushing_avg_yards_per_attempt
    fill_in "Rushing first down pct", with: @player_stat.rushing_first_down_pct
    fill_in "Rushing first downs", with: @player_stat.rushing_first_downs
    fill_in "Rushing fumbles", with: @player_stat.rushing_fumbles
    fill_in "Rushing yards per game", with: @player_stat.rushing_yards_per_game
    fill_in "Team", with: @player_stat.team
    fill_in "Total rushing touchdowns", with: @player_stat.total_rushing_touchdowns
    fill_in "Total rushing yards", with: @player_stat.total_rushing_yards
    click_on "Update Player stat"

    assert_text "Player stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Player stat" do
    visit player_stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Player stat was successfully destroyed"
  end
end
