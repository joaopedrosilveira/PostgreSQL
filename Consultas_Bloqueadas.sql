SELECT 
    blocked_activity.pid AS bloqueado_pid,
    blocked_activity.query AS consulta_bloqueada,
    blocking_activity.pid AS bloqueador_pid,
    blocking_activity.query AS consulta_bloqueadora,
    age(now(), blocking_activity.query_start) AS tempo_bloqueio
FROM pg_catalog.pg_locks blocked_locks
JOIN pg_catalog.pg_stat_activity blocked_activity ON blocked_activity.pid = blocked_locks.pid
JOIN pg_catalog.pg_locks blocking_locks ON blocking_locks.locktype = blocked_locks.locktype
    AND blocking_locks.pid != blocked_locks.pid
JOIN pg_catalog.pg_stat_activity blocking_activity ON blocking_activity.pid = blocking_locks.pid
WHERE NOT blocked_locks.granted;
