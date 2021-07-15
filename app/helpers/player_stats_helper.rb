module PlayerStatsHelper
  def longest_rush(player_stat)
    suffix = player_stat.longest_rush_touchdown ? "T" : ""
    player_stat.longest_rush.to_s + suffix
  end

  def sortable_header(header_label, field)
    link_to header_label,
      player_stats_path(
        player_name: params[:player_name],
        sort_by: field,
        order: params[:order] == "desc" ? "asc" : "desc"
      )
  end
end
