require "application_system_test_case"

class PlayerStatsTest < ApplicationSystemTestCase
  test "sorting and filtering stats" do
    joe_name = player_stats(:joe).name
    shaun_name = player_stats(:shaun).name
    first_row_xpath = ".//tbody[1]/tr[1]/td[1]"
    second_row_xpath = ".//tbody[1]/tr[2]/td[1]"

    visit player_stats_url

    first_stat = find(:xpath, first_row_xpath).text
    second_stat = find(:xpath, second_row_xpath).text

    assert_equal joe_name, first_stat
    assert_equal shaun_name, second_stat

    # Sorts asc
    click_on "Total rushing yards"
    sleep 0.1 # waits for page content reload
    first_stat = find(:xpath, first_row_xpath).text
    second_stat = find(:xpath, second_row_xpath).text
    assert_equal shaun_name, first_stat
    assert_equal joe_name, second_stat

    # Sorts desc
    click_on "Total rushing yards"
    sleep 0.1
    first_stat = find(:xpath, first_row_xpath).text
    second_stat = find(:xpath, second_row_xpath).text
    assert_equal joe_name, first_stat
    assert_equal shaun_name, second_stat

    fill_in "player_name", with: joe_name
    click_on "Filter"

    assert_selector :xpath, ".//tr[./td[text()='#{joe_name}']]"
    refute_selector :xpath, ".//tr[./td[text()='#{shaun_name}']]"
  end
end
