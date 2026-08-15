-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for Energy Trading & Risk Management
-- ============================================================================
USE DATABASE OIL_GAS_TRADING;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.TRADING_INTELLIGENCE_AGENT
  COMMENT = 'Energy Trading & Risk Management AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'OIL_GAS_TRADING.APP.TRADING_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'OIL_GAS_TRADING.SEARCH.MARKET_REPORTS_SEARCH', TOOL_DESCRIPTION => 'Search documents for Oil & Gas — Energy Trading information')
  )
  SYSTEM_PROMPT = 'You are the Trading Intelligence Agent for an energy trading desk in Kuala Lumpur, managing LNG, Tapis crude, and refined product positions across Asian markets.';
