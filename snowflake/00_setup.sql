-- ============================================================================
-- Energy Trading & Risk Management
-- Real-time energy trading analytics for Malaysia's LNG and crude markets — Snowpipe Streaming ingests price feeds, ML.ANOMALY_DETECTION catches limit breaches, and Tasks trigger risk recalculation.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS OIL_GAS_TRADING;
CREATE WAREHOUSE IF NOT EXISTS OG_TRADING_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE OIL_GAS_TRADING;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE OG_TRADING_WH;
