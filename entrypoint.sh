#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Make sure a database connection can be made
printf "Waiting for PostgreSQL ... "

while ! psql $DB_CONNECTION_STRING -c '\q'; do
  sleep 0.1
done

echo "done"

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
