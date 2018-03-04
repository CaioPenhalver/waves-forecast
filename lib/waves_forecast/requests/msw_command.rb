class MSWCommand
  attr_reader :id
  YOURAPIKEY = 'dkfjsa'

  def initialize(id, http_service = HttpService.new)
    @http_service = http_service
    @id = id
  end

  def host
    'magicseaweed.com'
  end

  def path
    "/api/#{YOURAPIKEY}/forecast/?spot_id=#{id}"
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
