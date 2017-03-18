reports_list = [
  {
    specie_id: 1,
    user_id: 1,
    date: 23.days.ago,
    catch_keepers: 
    catch_total:
    trip_summary:
    primary_method:
    tide:
    weather:
    wind:
    spot:
    best_bait:
    trip_description:
    lattitude:
    longitude:
  }
]

reports_list.each do |report|
  begin
    Report.create!(report)
    print '.'
  rescue
    ActiveRecord::InvalidRecord
    print 'F'
  end
end

puts "#{Report.count} reports created"