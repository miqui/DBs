#Dynamic Management Views
#
#There are some useful Dynamic Management Views (DMVs) to check CPU bottlenecks. The sys.dm_exec_query_stats DMV shows you the currently cached batches or procedures which are using the CPU. The following query can be used to check the CPU consumption per plan_handle.

select plan_handle,
      sum(total_worker_time) as total_worker_time, 
      sum(execution_count) as total_execution_count,
      count(*) as  number_of_statements 
from sys.dm_exec_query_stats
group by plan_handle
order by sum(total_worker_time), sum(execution_count) desc
