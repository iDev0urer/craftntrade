# lib/tasks/kill_postgres_connections.rake
desc 'kill pgsql users so database can be dropped'
  task :kill_postgres_connections do
    run 'echo "SELECT pg_terminate_backend(procpid) FROM pg_stat_activity WHERE datname=\'database_name\';" | psql -U postgres'
  end