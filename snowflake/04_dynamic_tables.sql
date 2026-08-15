-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for Energy Trading & Risk Management
-- ============================================================================
USE DATABASE OIL_GAS_TRADING;
USE SCHEMA CURATED;

-- POSITION_SUMMARY: Real-time position aggregation by desk, commodity, and tenor
-- Source: TRADES, POSITIONS
CREATE OR REPLACE DYNAMIC TABLE CURATED.POSITION_SUMMARY
  TARGET_LAG = '5 minutes'
  WAREHOUSE = OG_TRADING_WH
AS
SELECT * FROM RAW.TRADES;
-- TODO: Replace with actual join/aggregation logic per demo

-- VAR_CALCULATION: Value-at-Risk computed from positions and price volatility
-- Source: POSITIONS, PRICE_FEEDS
CREATE OR REPLACE DYNAMIC TABLE CURATED.VAR_CALCULATION
  TARGET_LAG = '5 minutes'
  WAREHOUSE = OG_TRADING_WH
AS
SELECT * FROM RAW.POSITIONS;
-- TODO: Replace with actual join/aggregation logic per demo

-- LIMIT_UTILISATION: Real-time limit utilisation and breach detection
-- Source: POSITIONS, RISK_LIMITS
CREATE OR REPLACE DYNAMIC TABLE CURATED.LIMIT_UTILISATION
  TARGET_LAG = '5 minutes'
  WAREHOUSE = OG_TRADING_WH
AS
SELECT * FROM RAW.POSITIONS;
-- TODO: Replace with actual join/aggregation logic per demo

-- PNL_TIMESERIES: Daily mark-to-market P&L by desk and commodity
-- Source: TRADES, POSITIONS, PRICE_FEEDS
CREATE OR REPLACE DYNAMIC TABLE CURATED.PNL_TIMESERIES
  TARGET_LAG = '5 minutes'
  WAREHOUSE = OG_TRADING_WH
AS
SELECT * FROM RAW.TRADES;
-- TODO: Replace with actual join/aggregation logic per demo

