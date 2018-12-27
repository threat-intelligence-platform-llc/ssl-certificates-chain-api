using System;
using System.Net;

using Newtonsoft.Json;

namespace SslCertificatesChainApiSample
{
    internal class SslCertificatesChainApiSample
    {
        private static void Main()
        {
            var client = new SslCertificatesChainApiClient
            {
                ApiKey = "Your SSL Certificates Chain API key"
            };

            const string domain = "threatintelligenceplatform.com";

            // Download JSON
            var result = client.SendGet(domain);

            // Print a nice informative string
            PrintResponse(result);
        }

        private static void PrintResponse(string response)
        {
            dynamic responseObject = JsonConvert.DeserializeObject(response);

            if (responseObject != null)
            {
                Console.Write("Chain length: " + responseObject.Count);
                Console.WriteLine("\n--------------------------------");
                return;
            }

            Console.WriteLine();
        }
    }

    public class SslCertificatesChainApiClient
    {
        public string ApiKey { private get; set; }

        private const string Url =
            "https://api.threatintelligenceplatform.com/v1/sslCertificatesChain";

        public string SendGet(string domain)
        {
            var requestParams = "?domainName=" + Uri.EscapeDataString(domain)
                                + "&apiKey=" + Uri.EscapeDataString(ApiKey);

            var fullUrl = Url + requestParams;

            Console.Write("Sending request to: " + fullUrl + "\n");

            // Download JSON into a string
            var result = new WebClient().DownloadString(fullUrl);

            return result;
        }
    }
}