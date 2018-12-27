<?php

$apiUrl = 'https://api.threatintelligenceplatform.com/v1/sslCertificatesChain';

$params = array(
    'apiKey' => 'Your SSL Certificates Chain API key',
    'domainName' => 'threatintelligenceplatform.com'
);

$url = $apiUrl . '?' . http_build_query($params, '', '&');

print($url . PHP_EOL . PHP_EOL);

$response = file_get_contents($url);

$res = json_decode($response);

if (! $res)
    return;

$length = count($res);
if (! $length > 0)
    return;

echo 'Chain length: ' . $length . PHP_EOL;