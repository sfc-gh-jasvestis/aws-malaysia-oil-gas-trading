-- Generated from generator/demo_specs/aws-malaysia-oil-gas-trading.json
-- Regenerate with: python3 generator/gen_repo_docs.py aws-malaysia-oil-gas-trading
-- This is the schema that is actually deployed for MY_OIL_GAS_TRADING.

-- MY_OIL_GAS_TRADING  (Energy Trading & Risk Management)
-- generated from generator/demo_specs/aws-malaysia-oil-gas-trading.json - do not hand-edit
CREATE DATABASE IF NOT EXISTS MY_OIL_GAS_TRADING;
CREATE SCHEMA IF NOT EXISTS MY_OIL_GAS_TRADING.RAW;
CREATE SCHEMA IF NOT EXISTS MY_OIL_GAS_TRADING.CURATED;
CREATE SCHEMA IF NOT EXISTS MY_OIL_GAS_TRADING.APP;
USE DATABASE MY_OIL_GAS_TRADING;

-- 5 real regions; entity names carry their region so the two always agree
