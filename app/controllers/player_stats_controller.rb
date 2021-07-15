require 'csv'

class PlayerStatsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render_html }
      format.csv  { render_csv }
    end
  end

  private

  def render_html
    @player_stats = stats_filter.find_stats.page(params[:page])
  end

  def render_csv
    headers["Content-Type"] = "text/csv"
    headers["Content-Disposition"] = "attachment; filename=\"stats.csv\""
    headers["Cache-Control"] = "no-cache"
    headers['Last-Modified'] = Time.now.ctime.to_s

    # Streaming response
    self.response_body = Enumerator.new do |rows|
      rows << CSV.generate_line(PlayerStat::CSV_FIELDS)

      # Ideally we'd use `find_each` instead of `each` here to avoid loading
      # all the player stats into memory. This would break the order of the
      # results, though, and as the amount of data we're working with (even
      # 10k) is not huge this should work well enough.
      stats_filter.find_stats.each do |stat|
        rows << CSV.generate_line(stat.to_csv_row)
      end
    end

    response.status = 200
  end

  def stats_filter
    PlayerStatsFilter.new(player_name: params[:player_name],
                          sort_by_field: params[:sort_by],
                          sort_direction: params[:order])

  end
end
