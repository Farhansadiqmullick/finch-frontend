#!/bin/sh
set -e

# Example of injecting environment variables into env.js (optional)
# echo "window.env = { VUE_APP_API_URL: '$VUE_APP_API_URL' };" > /usr/share/nginx/html/env.js

# Start NGINX
exec "$@"
