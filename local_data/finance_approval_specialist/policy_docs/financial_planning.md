# Financial Planning & Forecasting

_Finance approval policy — topic `financial_planning`. This document is read by the **finance_approval_specialist** during reviews involving this topic. 3 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `annual_operating_plan_approval`

### Rule `FIN-AOP-0001` — Annual Operating Plan Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `plan_type` | `==` | `annual_operating_plan` |  |

In plain English: `plan_type` equals `annual_operating_plan`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **board of directors**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `board_of_directors_preapproval`.
- Cross-domain refs: `LEG-RPT-0002`

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > FP&A Processes > Annual Operating Plan (“AOP”)
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> * **Governance**: The AOP is approved by the board of directors every year.

_Notes_: AOP approval occurs every year.

## Category: `forecast_approval`

### Rule `FIN-FCAST-0001` — Forecast Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `forecast_type` | `==` | `FYyyyy-mm` | format |

In plain English: `forecast_type` equals `FYyyyy-mm`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Head of FP&A**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `head_of_fp_a_preapproval`.

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > Quarterly & Monthly Cycle (incl. close, variance, forecast, guidance) > Key Definitions
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> **Governance**: The Forecast at `FYyyyy-mm` is approved by the Head of FP&A and reviewed with the CFO.

_Notes_: Forecast is also reviewed with the CFO.

## Category: `quarterly_forecast_approval`

### Rule `FIN-FCAST-0002` — Quarterly Forecast Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `forecast_cadence` | `==` | `quarterly` | cadence |

In plain English: `forecast_cadence` equals `quarterly`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Head of FP&A**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `head_of_fp_a_preapproval`.

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > Quarterly & Monthly Cycle (incl. close, variance, forecast, guidance) > Key Definitions
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> **Governance**: The quarterly forecast is approved by the Head of FP&A and reviewed with the CFO.

_Notes_: Quarterly forecast is also reviewed with the CFO.
