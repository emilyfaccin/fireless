class FireReport < ApplicationRecord
  scope :to_present, -> { select(FireReport.attribute_names - ["updated_at"]) }
end
