class PlayerStatsFilter
  def initialize(player_name: nil, sort_by_field: nil, sort_direction: :asc)
    if sort_by_field.present? && !PlayerStat.column_names.include?(sort_by_field)
      raise ArgumentError.new("Invalid sort field")
    end

    @player_name = player_name
    @sort_by_field = sort_by_field
    @sort_direction = sort_direction
  end

  def find_stats
    player_stats = PlayerStat.all
    player_stats = player_stats.where("name ilike ?", "%#{@player_name}%") if @player_name.present?
    player_stats = player_stats.order(@sort_by_field => @sort_direction) if @sort_by_field.present?
    player_stats
  end
end
