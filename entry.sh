#!/usr/bin/env bash

# Start the sql proxy
cloud_sql_proxy -instances=sensotest-278921:europe-west3:sensocms=tcp:3306 -credential_file=/var/directus/credentials.json &

# Execute the rest of your ENTRYPOINT and CMD as expected.
exec "$@"