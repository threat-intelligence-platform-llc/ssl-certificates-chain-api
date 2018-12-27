$url = 'https://api.threatintelligenceplatform.com/v1/sslCertificatesChain?'

$api_key = 'at_E4ZmlrEW8oe305w0gAuHPyTddqT00'
$domain = 'threatintelligenceplatform.com'

$uri = $url `
     + 'apiKey=' + [uri]::EscapeDataString($api_key) `
     + '&domainName=' + [uri]::EscapeDataString($domain)

$res = Invoke-WebRequest -Uri $uri -UseBasicParsing | ConvertFrom-Json

echo "`nChain length: $($res.Count)"