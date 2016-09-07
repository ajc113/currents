class ReportSerializer < ActiveModel::Serializer
  attributes :location, :target_species, :location_json
end
