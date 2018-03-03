require 'net/http'
require 'uri'
require 'json'

class HttpService

  def get(uri_string, header = {})
    uri = URI.parse uri_string
    http = Net::HTTP.new uri.host, uri.port
    request = Net::HTTP::Get.new uri.request_uri, header
    http.request(request)
  end
end
