-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for Energy Trading & Risk Management
-- ============================================================================
USE DATABASE OIL_GAS_TRADING;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.TRADING_ANALYTICS
  COMMENT = 'Energy trading positions, P&L, risk limits, and market analytics'
AS
  TABLES (
    CURATED.POSITION_SUMMARY AS position_summary,CURATED.VAR_CALCULATION AS var_calculation,CURATED.LIMIT_UTILISATION AS limit_utilisation,CURATED.PNL_TIMESERIES AS pnl_timeseries
  );
