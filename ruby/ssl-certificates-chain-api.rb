require 'erb'
require 'json'
require 'net/https'
require 'uri'
require 'yaml'

api_key = 'Your SSL Certificates Chain API key'
domain = 'threatintelligenceplatform.com'

api_url = 'https://api.threatintelligenceplatform.com/v1/sslCertificatesChain'

url = api_url +
      '?apiKey=' + ERB::Util.url_encode(api_key) +
      '&domainName=' + ERB::Util.url_encode(domain)

begin
  buffer = Net::HTTP.get(URI.parse(url))
  json = JSON.parse(buffer)
  puts json.to_yaml
rescue Errno::ECONNRESET, Errno::EINVAL, EOFError, JSON::ParserError,
       Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError,
       OpenSSL::SSL::SSLError, Timeout::Error, URI::InvalidURIError => e
  puts e
end