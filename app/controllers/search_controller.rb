class SearchController < ApplicationController

  def index
    conn = Faraday.new("https://developer.nrel.gov")
    response = conn.get '/api/alt-fuel-stations/v1/nearest.json', { location: params[:location], radius: params[:radius], fuel_type: params[:fuel_type], limit: params[:limit], api_key: params[:api_key] }
    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    # byebug
  end

end
