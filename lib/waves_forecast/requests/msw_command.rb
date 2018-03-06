class MSWCommand
  attr_reader :id

  def initialize(id, http_service = HttpService.new)
    @http_service = http_service
    @id = id
  end

  def host
    ENV['MSW_URL']
  end

  def path
    "/api/#{ENV['MSW_KEY']}/forecast/?spot_id=#{id}"
  end

  def header
    {}
  end

  def execute
    http_service.get "#{host}#{path}"
  end

  private

  attr_accessor :http_service

end
