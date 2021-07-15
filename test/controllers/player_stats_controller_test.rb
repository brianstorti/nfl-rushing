require "test_helper"

class PlayerStatsControllerTest < ActionDispatch::IntegrationTest
  test "returns all players stats" do
    get player_stats_url

    assert_response :success
    assert_match player_stats(:joe).name, response.body
    assert_match player_stats(:shaun).name, response.body
  end

  test "applies filter" do
    get player_stats_url, params: { player_name: player_stats(:joe).name }

    assert_response :success
    assert_match player_stats(:joe).name, response.body
    refute_match player_stats(:shaun).name, response.body
  end

  test "streams csv response" do
    get player_stats_url, params: { format: :csv }

    assert_match PlayerStat.csv_headers.join(","), response.body
    assert_match player_stats(:joe).to_csv_row.join(","), response.body
    assert_match player_stats(:shaun).to_csv_row.join(","), response.body

    assert_equal "text/csv", headers["Content-Type"]
    assert_equal "attachment; filename=\"stats.csv\"", headers["Content-Disposition"]
    assert_equal "no-cache", headers["Cache-Control"]
    assert_not_nil headers["Last-Modified"]
    assert_response :success
  end
end
