require 'test_helper'

class PlayerStatsHelperTest < ActionView::TestCase
  include PlayerStatsHelper

  test "formats longest_rush" do
    joe = player_stats(:joe)

    joe.update!(longest_rush: 10, longest_rush_touchdown: false)
    assert_equal "10", longest_rush(joe)

    joe.update!(longest_rush: 10, longest_rush_touchdown: true)
    assert_equal "10T", longest_rush(joe)
  end

  test "creates link for sortable header" do
    link = sortable_header("label", "field")
    expected_link = '<a href="/player_stats?order=desc&amp;sort_by=field">label</a>'

    assert_equal expected_link, link
  end
end
