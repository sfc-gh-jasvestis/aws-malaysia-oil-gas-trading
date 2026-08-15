-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for Energy Trading & Risk Management
-- ============================================================================
USE DATABASE OIL_GAS_TRADING;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.MARKET_REPORTS_SEARCH
  ON CONTENT
  ATTRIBUTES REPORT_TYPE, COMMODITY, REGION, AUTHOR
  WAREHOUSE = OG_TRADING_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.MARKET_REPORTS
);
