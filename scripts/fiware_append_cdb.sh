curl --insecure -i https://195.235.93.224:10027/NGSI10/updateContext -s -S --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Fiware-Service: sc_smart_region_andalucia' --header 'Fiware-ServicePath: /and_sr_cdm' --header 'x-auth-token: MIIC8wYJKoZIhvcNAQcCoIIC5DCCAuACAQExCTAHBgUrDgMCGjCCAUkGCSqGSIb3DQEHAaCCAToEggE2eyJ0b2tlbiI6IHsiaXNzdWVkX2F0IjogIjIwMTYtMDItMjRUMTY6MTk6NTguNTg2ODkyWiIsICJleHRyYXMiOiB7fSwgIm1ldGhvZHMiOiBbInBhc3N3b3JkIl0sICJleHBpcmVzX2F0IjogIjIwMTYtMDItMjRUMTc6MTk6NTguNTg2ODA5WiIsICJ1c2VyIjogeyJkb21haW4iOiB7ImlkIjogIjBjZjJmMDYxMTg4YzRjODliNjgyMGViMmVmODAwY2JhIiwgIm5hbWUiOiAic2Nfc21hcnRfcmVnaW9uX2FuZGFsdWNpYSJ9LCAiaWQiOiAiZjE0MWRhYWUzMzRiNDI3NGFjMmI1NTc4MjNjNTBjNDgiLCAibmFtZSI6ICJhbmRfc3JfY2RtX2FkbWluIn19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQALKHi+TXkMptQDSNmpNO0WfNLdsTnPxoOZeFMEtkP8WG2FE++MZNTJxclfOqdHAh9wAVpH6Hii3DhTmeFRP+u0rHLCzxRYiIr4Oqx8XclN1ca5cXS59Jz9XZ-ohswZK+lJUH7K9n7aGP9NmzJrp0ArVhrPwiDU-QwE48Q8+XozgAjZCPrx1UOG19b9Ex0qn-NtI+Poe8+4ozi3XaYm2mK7zQK3EUzvG-Y5SbQpQTODexuBc7bX3gW05u4U48j9jCQn-xUGXp99waUoMdAom-D9hWS3OVwlHAW0dKOikti+2YbuZVA-cbytwziF979WHDrNXI8ZG9UxEziIMti0Pj1J' -d '
{
    "contextElements": [
      {
          "type": "geoEntTest",
          "isPattern": "false",
          "id": "10029",
          "attributes": [
          {
              "name": "position",
              "type": "coords",
              "value": "41.5,-1.2"
          }
          ]
      }
    ],
    "updateAction": "APPEND"
}'
