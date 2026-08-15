-- ============================================================================
-- 01_MARKETPLACE_INSTALL.SQL — Install marketplace data for Energy Trading & Risk Management
-- ============================================================================
USE DATABASE OIL_GAS_TRADING;
USE SCHEMA RAW;

-- Free listings to install from Snowflake Marketplace:
-- Install: Snowflake Public Data (Free)
--   https://app.snowflake.com/marketplace/listing/GZTSZ290BV255

-- Paid listing (mock): S&P Global Platts Pricing
--   Real data: https://app.snowflake.com/marketplace/listing/GZT0Z5I4XY0
--   Using mock table: PRICE_FEEDS
CREATE TABLE IF NOT EXISTS RAW.PRICE_FEEDS (
  ID INT AUTOINCREMENT, DATA VARIANT, LOADED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

