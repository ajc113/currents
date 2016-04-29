json.array!(@reports) do |report|
  json.extract! report, :id, :date, :target_species, :general_location, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :picture, :best_bait, :trip_description
  json.url report_url(report, format: :json)
end
