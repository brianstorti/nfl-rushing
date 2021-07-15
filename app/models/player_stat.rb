class PlayerStat < ApplicationRecord
  CSV_FIELDS = column_names.excluding(%W(id updated_at created_at))

  def self.csv_headers
    CSV_FIELDS.map { |field| field.humanize }
  end

  def to_csv_row
    CSV_FIELDS.map { |field| attributes[field] }
  end
end
