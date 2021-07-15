require "test_helper"

class PlayerStatsFilterTest < ActiveSupport::TestCase
  test "returns all players" do
    filter = PlayerStatsFilter.new
    assert_equal PlayerStat.all, filter.find_stats
  end

  test "filters by player name" do
    name = player_stats(:joe).name
    filter = PlayerStatsFilter.new(player_name: name)
    results = filter.find_stats
    assert_equal 1, results.size
    assert_equal name, results.first.name
  end

  test "sorts by given field" do
    filter = PlayerStatsFilter.new(sort_by_field: "longest_rush")
    results = filter.find_stats.pluck(:longest_rush)

    assert_equal [player_stats(:joe).longest_rush, player_stats(:shaun).longest_rush], results
  end

  test "sorts in desc order" do
    filter = PlayerStatsFilter.new(sort_by_field: "longest_rush", sort_direction: :desc)
    results = filter.find_stats.pluck(:longest_rush)

    assert_equal [player_stats(:shaun).longest_rush, player_stats(:joe).longest_rush], results
  end

  test "raises error for invalid sort field" do
    assert_raises ArgumentError do
      PlayerStatsFilter.new(sort_by_field: :invalid)
    end
  end
end
