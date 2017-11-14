json.array!(@reports) do |report|
  json.extract! report, :id, :date, :species_id, :catch_keepers, :catch_total, :trip_summary, :primary_method, :tide, :weather, :wind, :spot, :best_bait, :trip_description
  json.url report_url(report, format: :json)
end
