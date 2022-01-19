class PtxApiService
  # require 'rest-client'
  def initialize
    @time = Time.now.httpdate.to_s
    @headers = {
    'Content-Type'  => 'application/json',
    'Accept'        => 'application/json',
    'X-Date'        => @time,
    'Authorization' => auth_headers,
    }   
  end

  def fentch_static_api(uri)
    response = RestClient.get(uri, @headers)
    # response.body.to_json
  end
  
  private
  def auth_headers
    hmac = Base64.strict_encode64(OpenSSL::HMAC.digest('sha1', ENV['ptx_key'], "x-date: #{@time}"))
    return %Q(hmac username="#{ENV['ptx_id']}", algorithm="hmac-sha1", headers="x-date", signature="#{hmac}")
  end
end
