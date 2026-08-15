-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for Energy Trading & Risk Management
-- ============================================================================
USE DATABASE OIL_GAS_TRADING;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_malaysia_oil_gas_trading_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('jonathan.asvestis@snowflake.com');

-- Alert: LIMIT_BREACH_ALERT
CREATE OR REPLACE ALERT APP.LIMIT_BREACH_ALERT
  WAREHOUSE = OG_TRADING_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Position limit approaching breach threshold'
IF (EXISTS (
  SELECT 1 FROM CURATED.POSITION_SUMMARY
  WHERE 1=1 -- Condition: UTILISATION_PCT > 90% for any desk limit
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_malaysia_oil_gas_trading_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Energy Trading & Risk Management: Position limit approaching breach threshold',
    'Position limit approaching breach threshold'
  );

ALTER ALERT APP.LIMIT_BREACH_ALERT RESUME;

-- Alert: VAR_EXCEEDANCE_ALERT
CREATE OR REPLACE ALERT APP.VAR_EXCEEDANCE_ALERT
  WAREHOUSE = OG_TRADING_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'VaR utilisation exceeding warning threshold'
IF (EXISTS (
  SELECT 1 FROM CURATED.POSITION_SUMMARY
  WHERE 1=1 -- Condition: VAR_UTILISATION > 85% of board-approved limit
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_malaysia_oil_gas_trading_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Energy Trading & Risk Management: VaR utilisation exceeding warning threshold',
    'VaR utilisation exceeding warning threshold'
  );

ALTER ALERT APP.VAR_EXCEEDANCE_ALERT RESUME;

-- Alert: STOP_LOSS_ALERT
CREATE OR REPLACE ALERT APP.STOP_LOSS_ALERT
  WAREHOUSE = OG_TRADING_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Stop-loss trigger hit — escalate to Head of Trading'
IF (EXISTS (
  SELECT 1 FROM CURATED.POSITION_SUMMARY
  WHERE 1=1 -- Condition: CUMULATIVE_LOSS > STOP_LOSS_TRIGGER for any trader
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_malaysia_oil_gas_trading_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Energy Trading & Risk Management: Stop-loss trigger hit — escalate to Head of Trading',
    'Stop-loss trigger hit — escalate to Head of Trading'
  );

ALTER ALERT APP.STOP_LOSS_ALERT RESUME;

