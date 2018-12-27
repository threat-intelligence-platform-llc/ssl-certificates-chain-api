let https = require('https');
let querystring = require('querystring');

const apiUrl = 'https://api.threatintelligenceplatform.com/v1/sslCertificatesChain';

const parameters = {
    apiKey: 'Your SSL Certificates Chain API key',
    domainName: 'threatintelligenceplatform.com'
};

let url = apiUrl + '?' + querystring.stringify(parameters);

https.get(url, function (res) {
    let rawData = '';

    res.on('data', function(chunk) {
        rawData += chunk;
    });

    res.on('end', function () {
        try {
            let parsedData = JSON.parse(rawData);

            if (parsedData.constructor.name === 'Array')
                console.log(
                    'Chain length: ' + parsedData.length);
            else
                console.dir(parsedData, {colors: true});
        }
        catch (e) {
            console.log(e.message);
        }
    });
}).on('error', function(e) {
    console.log('Error: ' + e.message);
});