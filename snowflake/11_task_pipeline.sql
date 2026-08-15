-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for Energy Trading & Risk Management
-- ============================================================================
USE DATABASE OIL_GAS_TRADING;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_RECALCULATE_VAR
  WAREHOUSE = OG_TRADING_WH
  SCHEDULE = 'USING CRON */15 * * * * UTC'
  COMMENT = 'Recalculate VaR every 15 minutes from latest positions and prices'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_CHECK_LIMITS
  WAREHOUSE = OG_TRADING_WH
  AFTER APP.TASK_RECALCULATE_VAR
  COMMENT = 'Check all position and VaR limits for breaches'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_SEND_BREACH_NOTIFICATIONS
  WAREHOUSE = OG_TRADING_WH
  AFTER APP.TASK_CHECK_LIMITS
  COMMENT = 'Send notifications for any limit breaches via SNS'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_SEND_BREACH_NOTIFICATIONS RESUME;
ALTER TASK APP.TASK_CHECK_LIMITS RESUME;
ALTER TASK APP.TASK_RECALCULATE_VAR RESUME;
