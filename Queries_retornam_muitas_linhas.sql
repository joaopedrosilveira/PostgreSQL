SELECT
    query,
    calls,
    rows,
    (rows / calls) AS avg_rows_per_call
FROM pg_stat_statements
ORDER BY rows DESC
LIMIT 10;
