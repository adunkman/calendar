#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

if [[ $RAILS_ENV != 'production' ]]; then
  # Make sure a database connection can be made
  printf "Waiting for PostgreSQL ... "

  until psql $DATABASE_URL -c '\q' > /dev/null 2>&1; do
     sleep 0.1
  done

  echo "done"
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
