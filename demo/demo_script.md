# Energy Trading & Risk Management

**Malaysia - Oil & Gas — Energy Trading**
Use case: Trading & Risk Management

> Real-time energy trading analytics for Malaysia's LNG and crude markets — Snowpipe Streaming ingests price feeds, ML.ANOMALY_DETECTION catches limit breaches, and Tasks trigger risk recalculation.

## Why Snowflake

Snowflake consolidates trade, position, and price data across LNG and crude desks — Snowpipe Streaming ingests 500K price ticks daily, ML.ANOMALY_DETECTION catches limit breaches in real-time, and Tasks trigger automated VaR recalculation on every position change

- **ML.ANOMALY_DETECTION for limit monitoring** - Only demo using anomaly detection for trading limit breach patterns — not process or yield
- **Snowpipe Streaming for price feeds** - Only demo ingesting 500K real-time price ticks via Snowpipe Streaming for trading analytics
- **15-minute VaR recalculation via Tasks** - Only demo showing intraday risk recalculation triggered by Snowflake Tasks — not batch
- **Malaysian energy trading context** - Malaysia LNG exports, Tapis crude benchmark, JKM pricing, MYR denominated
- **Market reports searchable via Cortex Search** - Daily market commentary and strategy memos indexed for trader intelligence
- **AWS Kinesis + EventBridge + SNS** - Only demo combining streaming ingestion with event-driven risk and push notifications

## What is deployed

| | |
|---|---|
| Database | `MY_OIL_GAS_TRADING` |
| Service | `MY_OIL_GAS_TRADING_APP` |
| Compute pool | `SEA_DEMOS_MALAYSIA_POOL` |
| Dimension table | `RAW.MARKET_REPORTS` (20 rows) |
| Fact table | `RAW.PRICE_FEEDS` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | MYR (RM) |

Regions in play: Selangor, Johor, Penang, Sabah, Sarawak
Segments: Crude Cargo, Refined Product, LNG, Paper Hedge

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh MY_OIL_GAS_TRADING
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| Trading Revenue | `RM 4.8B` | total across Market Reports |
| Avg Brent | `$82/bbl` | average per event |
| Cargo Movements | `124` | total across Market Reports |
| Open Positions | `RM 847M` | total across Market Reports |
| Tapis Premium | `+$2.40/bbl` | average per event |
| Storage Contango | `$0.84/bbl` | average per event |
| Freight Rate | `WS 84` | fixed label (not numeric) |

## Demo flow

1. Trading Overview
2. Risk Monitoring
3. P&L Analytics
4. Ask AI
5. Architecture & Data

## Talking points

- **RM 4.7B** - daily trading volume across LNG, crude, and products
- **2,000 open positions** - across all desks and tenor buckets
- **5 limit breaches** - this week (3 on LNG desk during JKM rally)
- **VaR: RM 120M** - 99% confidence, 1-day horizon (78% of board limit)
- **500K price ticks/day** - ingested via Snowpipe Streaming (Tapis, JKM, MOPS)
- **60 market reports** - searchable via Cortex Search
- **15-minute VaR cycles** - intraday recalculation via Snowflake Tasks

## Business impact

- Malaysia is the world's 5th largest LNG exporter with 38.4 MT capacity in 2023 (GIIGNL)
- Tapis crude is the key Asian light sweet benchmark used in regional pricing (Platts)
- Real-time risk monitoring reduces trading losses by 15-25% vs end-of-day batch processes (McKinsey Risk)
- PETRONAS Trading revenue exceeded RM 200B in 2023 across global energy markets (PETRONAS Annual Report)

---
Generated from `generator/demo_specs/aws-malaysia-oil-gas-trading.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-malaysia-oil-gas-trading` instead.
