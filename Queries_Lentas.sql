SELECT
    query,
    calls,
    total_exec_time,
    mean_exec_time,
    (total_exec_time / calls) AS avg_time_ms
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 20;
