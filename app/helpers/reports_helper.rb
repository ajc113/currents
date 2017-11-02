module ReportsHelper
  def selected_species(species)
    "selected" if params[:species].to_i == species
  end

  def selected_state(state)
    "selected" if params[:state] == state
  end

  def selected_locations(location)
    "selected" if params[:location].to_i == location
  end

  def selected_tide(tide)
    "selected" if params[:tide] == tide
  end

  def all_species
    Species.where("id in (select species_id from reports)").uniq.sort
  end

  def render_location_option location
    html = '<option value="' + location.id.to_s  + '">' + location.number.to_s.rjust(2, '0') + ' - ' + location.short_name + '</option>'
    return html.html_safe
  end

  def render_location_option_with_state location
    html = '<option value="' + location.id.to_s + '" ' + selected_locations(location.id).to_s + '>' + location.short_name + ' (' + location.state.name + ')' + '</option>'
    return html.html_safe
  end

end
