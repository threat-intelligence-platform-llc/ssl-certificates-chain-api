try:
    from urllib.request import urlopen, pathname2url
except ImportError:
    from urllib import pathname2url
    from urllib2 import urlopen

import json


def print_response(txt):
    response_json = json.loads(txt)
    print('Chain length: ' + str(len(response_json)))


api_key = 'Your SSL Certificates Chain API key'
domain = 'threatintelligenceplatform.com'

url = 'https://api.threatintelligenceplatform.com/v1/sslCertificatesChain'\
    + '?apiKey=' + pathname2url(api_key)\
    + '&domainName=' + pathname2url(domain)

try:
    response = urlopen(url).read().decode('utf8')
    print_response(urlopen(url).read().decode('utf8'))
except Exception as e:
    print(e)
