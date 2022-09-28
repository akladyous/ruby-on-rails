# postgres

# https://learn.co/lessons/node-js-intro-to-postgresql
$ brew update
$ brew install postgresql

rm -rf /usr/local/var/postgres 
----------------------------------------------------------------
start_server:
pg_ctl -D /usr/local/var/postgres -l logfile start

stop_server:
pg_ctl -D /usr/local/var/postgres stop
----------------------------------------------------------------
To start PostgreSQL server now and relaunch at login:
brew services start postgresql
And stop PostgreSQL:
brew services stop postgresql
----------------------------------------------------------------
pg_ctl status -D /usr/local/var/postgres
pg_ctl: server is running (PID: 715)
force kill it..

kill -9 715