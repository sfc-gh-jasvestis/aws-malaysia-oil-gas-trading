# Demo Script: Energy Trading & Risk Management
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake consolidates trade, position, and price data across LNG and crude desks — Snowpipe Streaming ingests 500K price ticks daily, ML.ANOMALY_DETECTION catches limit breaches in real-time, and Tasks trigger automated VaR recalculation on every position change"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Marcus Lee** | Head of Trading | React App (SPCS) | P&L, position limits, market exposure, VaR utilisation, desk performance |
| **Aisha binti Khalid** | Risk Analyst | Amazon QuickSight | Limit monitoring, stress testing, counterparty exposure, regulatory capital |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 6 tables | TRADES (50000), POSITIONS (2000), PRICE_FEEDS (500000), RISK_LIMITS (100), MARKET_REPORTS (60), COUNTERPARTIES (150) |
| **CURATED** | 4 Dynamic Tables | POSITION_SUMMARY, VAR_CALCULATION, LIMIT_UTILISATION, PNL_TIMESERIES |
| **ML** | ML.ANOMALY_DETECTION + ML.FORECAST | Forecasting + anomaly detection |
| **AI** | SUMMARIZE, AI_CLASSIFY | Classification + extraction |
| **Search** | Cortex Search | 60 documents indexed |
| **Agent** | TRADING_INTELLIGENCE_AGENT | Semantic View + Search tools |


---

## The Story

Malaysia is the world's 5th largest LNG exporter and home to the Tapis crude benchmark. An energy trading desk in Kuala Lumpur manages RM 4.7B daily volume across LNG, crude, and refined products — but limit monitoring is end-of-day batch, missing intraday breaches during volatile Asian trading hours.

---

## Script

### [0:00–0:45] TRADING OVERVIEW

**Show**: Trading Overview tab

> "RM 4.7 billion daily trading volume across LNG, Tapis crude, and refined product desks."

**Action**: Point at RM 4.7B daily volume KPI

### [0:45–1:30] RISK MONITORING

**Show**: Risk Monitoring tab

> "VaR at RM 120M (99% confidence, 1-day horizon) — utilisation at 78% of board limit."

**Action**: Click the VaR gauge showing 78% utilisation

### [1:30–2:15] P&L ANALYTICS

**Show**: P&L Analytics tab

> "Daily P&L computed in real-time from Snowpipe Streaming price feeds."

**Action**: Show P&L waterfall by commodity

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Marcus asks: 'Which desks breached limits this week?'"

**Action**: Type: 'Which desks breached limits this week?'

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Seven Snowflake capabilities, five AWS services."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **ML.ANOMALY_DETECTION for limit monitoring** — Only demo using anomaly detection for trading limit breach patterns — not process or yield
2. **Snowpipe Streaming for price feeds** — Only demo ingesting 500K real-time price ticks via Snowpipe Streaming for trading analytics
3. **15-minute VaR recalculation via Tasks** — Only demo showing intraday risk recalculation triggered by Snowflake Tasks — not batch
4. **Malaysian energy trading context** — Malaysia LNG exports, Tapis crude benchmark, JKM pricing, MYR denominated
5. **Market reports searchable via Cortex Search** — Daily market commentary and strategy memos indexed for trader intelligence
6. **AWS Kinesis + EventBridge + SNS** — Only demo combining streaming ingestion with event-driven risk and push notifications


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM OIL_GAS_TRADING.RAW.TRADES` → 50000
- [ ] `SELECT COUNT(*) FROM OIL_GAS_TRADING.RAW.PRICE_FEEDS` → 500000
- [ ] `SELECT COUNT(*) FROM OIL_GAS_TRADING.CURATED.LIMIT_UTILISATION WHERE UTILISATION_PCT > 0.90` → >=5

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM OIL_GAS_TRADING.ML.LIMIT_BREACH_RESULTS` → >0
- [ ] `SELECT SUM(CASE WHEN IS_ANOMALY THEN 1 ELSE 0 END) FROM OIL_GAS_TRADING.ML.LIMIT_BREACH_RESULTS WHERE SERIES = 'LNG_DESK'` → >=3

### AI/Agent Verification
- [ ] `SELECT COUNT(*) FROM OIL_GAS_TRADING.AI.MARKET_REPORT_CLASSIFICATION WHERE SENTIMENT = 'BEARISH'` → >=5

