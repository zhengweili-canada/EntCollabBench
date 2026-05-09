# Headcount, Payroll & Leave

_Finance approval policy — topic `headcount_payroll`. This document is read by the **finance_approval_specialist** during reviews involving this topic. 9 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `headcount_hiring_plan_change_approval`

### Rule `FIN-HC-0005` — Headcount Hiring Plan Change Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `hiring_plan_change_type` | `==` | `add` |  |

In plain English: `hiring_plan_change_type` equals `add`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FBP**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `fbp_preapproval`.
- Cross-domain refs: `RLOA`, `rolling forecast`

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Hiring Plan Process
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> Add/remove/exchange positions requires FBP approval via existing process, e.g. RLOA or rolling forecast and submit change request Google Form [here](https://docs.google.com/forms/d/e/1FAIpQLSeHS97lg1Fz_SIQTisg-TOPHsXf6QMGw6vXfuEDkB_GY8pKfA/viewform)

_Notes_: Hiring Plan position additions require FBP approval via the existing process.

## Category: `headcount_position_change_approval`

### Rule `FIN-HC-0001` — Headcount Position Change Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `position_change_type` | `==` | `adding` |  |

In plain English: `position_change_type` equals `adding`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FP&A**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `fp_a_preapproval`.
- Cross-domain refs: `PROC-CW-0001`

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Position ID (PID)
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> Adding/removing/exchanging position(s) requires FP&A’s approval through existing RLOA or rolling forecast. FBP will submit change request Google Form

_Notes_: Change request is submitted by FBP through Google Form.

## Category: `hiring_plan_approval`

### Rule `FIN-HC-0002` — Hiring Plan Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `hiring_plan_cycle` | `==` | `AOP` |  |

In plain English: `hiring_plan_cycle` equals `AOP`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Board of Directors**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `board_of_directors_preapproval`.
- Cross-domain refs: `PROC-EVENT-0001`

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Role Approval and Release Process
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> Hiring Plans are approved by Board of Directors (during AOP) or CFO & e-group (during RLOA).

_Notes_: Hiring Plans during AOP are approved by the Board of Directors.

## Category: `job_offer_approval`

### Rule `FIN-HC-0004` — Job Offer Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `job_offer_status` | `==` | `pending_fill` |  |

In plain English: `job_offer_status` equals `pending_fill`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FP&A**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `fp_a_preapproval`.
- Cross-domain refs: `PROC-CWORK-0001`

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Role Approval and Release Process
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> FP&A is also a required approval on all job offers (before the role is officially filled).

_Notes_: FP&A approval is required before the role is officially filled.

## Category: `payment_batch_segregation_of_duties`

### Rule `FIN-PAY-0001` — Payment Batch Segregation Of Duties

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `batch_creator_is_releasor` | `==` | `true` |  |

In plain English: `batch_creator_is_releasor` equals true.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Procure to Pay > Payment Process
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> **Segregation of Duties:** The creator of the Batch cannot be the releasor of the same batch regardless of the permissions they have.

_Notes_: The same person cannot both create and release a payment batch.

## Category: `payroll_invoice_signoff`

### Rule `FIN-PAYROLL-0001` — Payroll Invoice Signoff

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `invoice_amount_usd` | `>=` | `500000` | USD |

In plain English: `invoice_amount_usd` is at least 500000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Manager** → **Director**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `manager_preapproval`, `director_preapproval`.

**Source:**
- doc_id: `gitlab/finance_accounts_payable`
- section: Accounts Payable > Accounts Payable Processing
- url: https://handbook.gitlab.com/handbook/finance/accounts-payable/

Verbatim quote from the policy corpus:

> Invoices with amounts greater than or equal to USD $500,000 are required to have 2 signatories from the Payroll Team (Manager and Director).

_Notes_: Requires 2 signatories from the Payroll Team.

## Category: `requisition_approval`

### Rule `FIN-HC-0003` — Requisition Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requisition_system` | `==` | `Greenhouse` |  |
| `requisition_status` | `==` | `opened` |  |

In plain English: `requisition_system` equals `Greenhouse` AND `requisition_status` equals `opened`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Total Rewards** → **FP&A** → **Department Lead (VP+)**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `total_rewards_preapproval`, `fp_a_preapproval`, `department_lead_vp_preapproval`.
- Cross-domain refs: `LEG-SIGN-0001`

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Role Approval and Release Process
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> When a requisition is opened in Greenhouse it is routed for approvals. The job approval requires approvals from Total Rewards, FP&A and Department Lead (VP+)

_Notes_: Formal approval is required to open a role.

## Category: `rloa_proposal_approval`

### Rule `FIN-RLOA-0001` — Rloa Proposal Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `proposal_type` | `==` | `RLOA` |  |

In plain English: `proposal_type` equals `RLOA`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CFO** → **e-group**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `cfo_preapproval`, `e_group_preapproval`.
- Cross-domain refs: `LEG-MAT-0001`

**Source:**
- doc_id: `gitlab/finance_financial_planning_and_analysis`
- section: Financial Planning & Analysis > Rolling List of Asks (RLOA) > Detailed Expectations for FP&A
- url: https://handbook.gitlab.com/handbook/finance/financial-planning-and-analysis/

Verbatim quote from the policy corpus:

> At e-group Review Meeting (typically Mon after CFO Variance Meeting),** CFO shares proposal for formal approval and inclusion into investor guidance

_Notes_: RLOA proposal is shared by the CFO at the e-group Review Meeting for formal approval.

## Category: `supplier_payment_account_approval`

### Rule `FIN-PAY-0002` — Supplier Payment Account Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `supplier_onboarding_process` | `==` | `SIM` |  |

In plain English: `supplier_onboarding_process` equals `SIM`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Procure to Pay > Payment Process
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> If the supplier is going through the SIM process, the approval for that supplier payment account will occur directly on the SIM External Form, and AP won’t have to go into the supplier payment accounts to provide approval.

_Notes_: Supplier payment account approval for SIM suppliers occurs on the SIM External Form rather than in supplier payment accounts.
