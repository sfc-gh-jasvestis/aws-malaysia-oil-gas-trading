-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for Energy Trading & Risk Management
-- Country: MALAYSIA | Currency: MYR
-- ============================================================================
USE DATABASE OIL_GAS_TRADING;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- TRADES: 50,000 rows — Physical and derivative trades — LNG, crude, refined products, swaps
-- POSITIONS: 2,000 rows — Open positions by desk, commodity, and tenor bucket
-- PRICE_FEEDS: 500,000 rows — Real-time price ticks — Tapis, Brent, JKM LNG, MOPS, swap curves
-- RISK_LIMITS: 100 rows — VaR limits, position limits, stop-loss triggers by desk and trader
-- MARKET_REPORTS: 60 rows — Daily market commentary, research notes, trading strategy memos
-- COUNTERPARTIES: 150 rows — Counterparty master with credit limits and exposure caps
