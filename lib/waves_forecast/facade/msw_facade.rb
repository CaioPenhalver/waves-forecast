class MSWFacade
  def forecast_by_beach_id(id)
    create_forecast forecast_params(id)
  end

  private

  def forecast_params(id)
    JSON.parse MSWCommand.new(id).execute.body
  end

  def create_forecast(params)
    params.map do |param|
      MSWForecast.new param
    end
  end
end
