#!/bin/bash

# Set the variables for the Cloudflare API key, email, and zone ID
AUTH_EMAIL="your_cloudflare_email"
AUTH_KEY="your_cloudflare_api_key"
ZONE_ID="your_zone_id"

# Make a request to the Cloudflare API to clear the cache for the specified zone
curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/purge_cache" \
     -H "X-Auth-Email: $AUTH_EMAIL" \
     -H "X-Auth-Key: $AUTH_KEY" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'
