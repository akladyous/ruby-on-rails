set -e

if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

bin/rails db:migrate 2>/dev/null || DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:setup

exec bundle exec "$@"
