# Accounting Close & Reporting

_Finance approval policy — topic `accounting_close`. This document is read by the **finance_approval_specialist** during reviews involving this topic. 13 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `account_reconciliation_auto_certification`

### Rule `FIN-ACCT-0005` — Account Reconciliation Auto Certification

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `account_activity_status` | `==` | `none` | activity_status |

In plain English: `account_activity_status` equals `none`.

**Approve** outright when these conditions hold.
- Approver chain: **BlackLine**

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Account Reconciliation Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> If there is no activity and/or the account balance is zero the reconciliation will be auto certified by BlackLine.

_Notes_: Split from an and/or source condition.

## Category: `account_reconciliation_auto_signoff`

### Rule `FIN-ACCT-0001` — Account Reconciliation Auto Signoff

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `account_balance_usd` | `==` | `0` | currency |

In plain English: `account_balance_usd` equals 0.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FloQast**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `floqast_preapproval`.

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Account Reconciliation Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> FloQast will auto sign-off the recon on our behalf if the following is met:
> 
> * Balance is zero

_Notes_: FloQast auto sign-off applies when the account balance is zero.

## Category: `account_reconciliation_review`

### Rule `FIN-ACCT-0002` — Account Reconciliation Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `account_risk_rating` | `==` | `High` | risk_rating |

In plain English: `account_risk_rating` equals `High`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **accounting manager or above** → **CFO or PAO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `accounting_manager_or_above_preapproval`, `cfo_or_pao_preapproval`.
- Exceptions (overriding rules): `tax and equity related accounts will be reconciled quarterly`
- Cross-domain refs: `LEG-RPT-0002`, `LEG-RPT-0003`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Account Reconciliation Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> High Risk Accounts will be reconciled by the preparer monthly (for the exception of tax and equity related accounts which will be reconciled quarterly) and will require 1st level review by an accounting manager or above and 2nd level review by the CFO or PAO.

_Notes_: High risk account reconciliations require two levels of review.

### Rule `FIN-ACCT-0003` — Account Reconciliation Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `account_risk_rating` | `==` | `Medium` | risk_rating |

In plain English: `account_risk_rating` equals `Medium`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **accounting manager or above**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `accounting_manager_or_above_preapproval`.
- Cross-domain refs: `LEG-RPT-0003`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Account Reconciliation Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> Medium Risk Accounts will be reconciled by the preparer monthly and will require 1st level review by an accounting manager or above.

_Notes_: Medium risk account reconciliations require first-level review.

### Rule `FIN-ACCT-0004` — Account Reconciliation Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `account_risk_rating` | `==` | `Low` | risk_rating |

In plain English: `account_risk_rating` equals `Low`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **accounting manager or above**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `accounting_manager_or_above_preapproval`.

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Account Reconciliation Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> Low Risk Accounts will be reconciled by the preparer monthly or quarterly and will require 1st level review by an accounting manager or above.

_Notes_: Low risk account reconciliations require first-level review.

## Category: `accrued_liability_recording`

### Rule `FIN-ACCR-0001` — Accrued Liability Recording

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `expense_amount_usd` | `>=` | `5000` | USD |

In plain English: `expense_amount_usd` is at least 5000 USD.

**Request supporting documents** before deciding.
- Required documents: `accrued_liability_recording`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `accrued_liability_recording`.

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> We require that all expenses be recorded where expense exceeds $5K USD or above, in the period the expense was incurred.

_Notes_: Expenses at or above the stated threshold must be recorded in the period incurred.

## Category: `chart_of_accounts_approval`

### Rule `FIN-COA-0001` — Chart Of Accounts Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `coa_change_type` | `==` | `new` |  |
| `coa_element_type` | `==` | `segment` |  |

In plain English: `coa_change_type` equals `new` AND `coa_element_type` equals `segment`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Finance team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `finance_team_preapproval`.

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Chart of Accounts Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> All requests for new or modified (including closure/deactivation) COA segments, hierarchies, and configuration attributes are subject to approval by the Finance team.

### Rule `FIN-COA-0002` — Chart Of Accounts Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `coa_change_type` | `==` | `new` |  |
| `coa_element_type` | `==` | `account` |  |

In plain English: `coa_change_type` equals `new` AND `coa_element_type` equals `account`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Accounting Manager**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `accounting_manager_preapproval`.

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Chart of Accounts Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> All requests for new or modified accounts must be submitted to the Accounting Manager for review and approval through a request using the Finance issue tracker.

_Notes_: Request must use the Finance issue tracker.

## Category: `invoice_write_off_approval`

### Rule `FIN-AR-0001` — Invoice Write Off Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `invoice_collectibility` | `==` | `uncollectible` |  |

In plain English: `invoice_collectibility` equals `uncollectible`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-ENGAGE-0001`, `signature auhorization matrix`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Quote to cash > Accounts Receivable Process for Non-Payment of Invoices
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> On a quarterly basis, Senior Billing Manager and Revenue Director will determine the aged invoices that are uncollectible. They will create an issue ten (10) days before the end of the quarter to seek approval according to the [signature auhorization matrix](https://handbook.gitlab.com/handbook/finance/authorization-matrix/) to write off invoices and to also notify the Sr. Director of Sales Operations.

_Notes_: Approval is sought according to the signature authorization matrix; specific approvers are not named in the chunk.

## Category: `legal_contingency_accrual`

### Rule `FIN-ACCR-0004` — Legal Contingency Accrual

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `liability_category` | `==` | `legal_contingency` |  |

In plain English: `liability_category` equals `legal_contingency`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal - Commercial, IP & Compliance**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_of_legal_commercial_ip_compliance_preapproval`.
- Cross-domain refs: `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> Legal Contingencies: Pending or threatened litigation, and actual or probable settlement. Legal contingencies should be determined with the help of GitLab’s VP of Legal - Commercial, IP & Compliance.

_Notes_: Legal contingencies require involvement from the named Legal role.

### Rule `FIN-ACCR-0005` — Legal Contingency Accrual

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `liability_category` | `==` | `legal_contingency` |  |
| `loss_probability` | `==` | `probable` |  |
| `amount_reasonably_estimable` | `==` | `true` |  |

In plain English: `liability_category` equals `legal_contingency` AND `loss_probability` equals `probable` AND `amount_reasonably_estimable` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_of_legal_preapproval`.

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> In addition, any potential legal contingencies are discussed during the monthly meeting with the VP of Legal and an accrual is recorded if the loss is deemed probable and the amount can be reasonably estimated.

_Notes_: Accrual is required only when both probability and estimability conditions are met.

## Category: `professional_fee_accrual`

### Rule `FIN-ACCR-0002` — Professional Fee Accrual

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `professional_fee_category` | `==` | `legal` |  |

In plain English: `professional_fee_category` equals `legal`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal - Commercial, IP & Compliance**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_of_legal_commercial_ip_compliance_preapproval`.
- Cross-domain refs: `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> Legal Professional Fees: Monthly templates are e-mailed by the 1st to all legal firms requesting them to complete with all outstanding bills and unbilled services as of that month end (ex. e-mails are sent by April 1st requesting services as of March 31st). The responses from all legal firms are complied and reviewed with the VP of Legal - Commercial, IP & Compliance by the 5th, and accruals are made based on the responses and review.

_Notes_: Legal firm responses are reviewed with the named Legal role before accruals are made.

### Rule `FIN-ACCR-0003` — Professional Fee Accrual

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `professional_fee_category` | `==` | `tax` |  |

In plain English: `professional_fee_category` equals `tax`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Director of Tax**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `director_of_tax_preapproval`.

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> Tax and Audit Professional Fees: Similarly e-mails with the template are sent to the tax and audit firms and the tax responses are compiled and reviewed with the Director of Tax and the audit firm responses are reviewed with the Accounting and External Reporting Manager by the 5th and appropriate accruals are made based on the review.

_Notes_: Tax responses are reviewed with the named Tax role before appropriate accruals are made.
