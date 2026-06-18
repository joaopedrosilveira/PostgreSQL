SELECT
    query,
    calls,
    shared_blks_read + shared_blks_written AS total_io,
    shared_blks_read,
    shared_blks_written
FROM pg_stat_statements
ORDER BY (shared_blks_read + shared_blks_written) DESC
LIMIT 20;
