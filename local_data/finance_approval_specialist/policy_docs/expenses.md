# Expenses & Reimbursements

_Finance approval policy — topic `expenses`. This document is read by the **finance_approval_specialist** during reviews involving this topic. 10 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `card_limit_exception_approval`

### Rule `FIN-CARD-0002` — Card Limit Exception Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `monthly_card_limit_usd` | `>` | `10000` | USD |

In plain English: `monthly_card_limit_usd` exceeds 10000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-PRIV-0034`

**Source:**
- doc_id: `gitlab/finance_accounts_payable_corp_credit_cards`
- section: Navan Purchasing Card > 7. Exceptions to the Policy
- url: https://handbook.gitlab.com/handbook/finance/accounts-payable/corp-credit-cards/

Verbatim quote from the policy corpus:

> Card members can be granted a higher limit than the allotted monthly $10K USD (or local currency) limit with an approved issue.

_Notes_: Applies to limits above the allotted monthly limit.

## Category: `corporate_card_receipt_requirement`

### Rule `FIN-EXP-0001` — Corporate Card Receipt Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `payment_method` | `==` | `card` |  |
| `team_member_country` | `!=` | `US` |  |

In plain English: `payment_method` equals `card` AND `team_member_country` is not `US`.

**Request supporting documents** before deciding.
- Required documents: `receipt`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `receipt`.
- Cross-domain refs: `LEG-AC-0009`

**Source:**
- doc_id: `gitlab/finance_accounts_payable_corp_credit_cards`
- section: Navan Purchasing Card > 2. General Guidelines
- url: https://handbook.gitlab.com/handbook/finance/accounts-payable/corp-credit-cards/

Verbatim quote from the policy corpus:

> All card charges require a receipt, with exception of US team members in which receipts are required for
>   anything over $50. Receipts must be uploaded into Navan within 30 days of the transaction date.

_Notes_: Receipts must be uploaded into Navan within 30 days of the transaction date.

## Category: `expenditure_request_documentation`

### Rule `FIN-EXP-0005` — Expenditure Request Documentation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requester_team` | `==` | `LACA` |  |
| `manager_support_status` | `==` | `supported` |  |

In plain English: `requester_team` equals `LACA` AND `manager_support_status` equals `supported`.

**Request supporting documents** before deciding.
- Required documents: `laca-travel-and-expense-request template`
- Approver chain: **manager**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `laca_travel_and_expense_request_template`.

**Source:**
- doc_id: `gitlab/legal_legalops`
- section: Stategy & Legal Operations > Legal & Corporate Affairs Expenditure Request Process > Expenditure Process Overview
- url: https://handbook.gitlab.com/handbook/legal/legalops/

Verbatim quote from the policy corpus:

> If supported by their manager, the team member will complete the [“laca-travel-and-expense-request” template](https://gitlab.com/gitlab-com/legal-and-compliance/-/issues/new?issuable_template=laca-travel-and-expense-request).

_Notes_: Manager-supported requests require completion of the named request template.

## Category: `expenditure_request_preapproval`

### Rule `FIN-EXP-0004` — Expenditure Request Preapproval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requester_team` | `==` | `LACA` |  |
| `request_type` | `==` | `expenditure_request` |  |

In plain English: `requester_team` equals `LACA` AND `request_type` equals `expenditure_request`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **manager**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `manager_preapproval`.

**Source:**
- doc_id: `gitlab/legal_legalops`
- section: Stategy & Legal Operations > Legal & Corporate Affairs Expenditure Request Process > Expenditure Process Overview
- url: https://handbook.gitlab.com/handbook/legal/legalops/

Verbatim quote from the policy corpus:

> LACA team members must first communicate their intended request with their manager.

_Notes_: LACA team members must communicate intended expenditure requests to their manager first.

## Category: `expense_final_approval`

### Rule `FIN-EXP-0006` — Expense Final Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `expense_report_system` | `==` | `Navan` |  |

In plain English: `expense_report_system` equals `Navan`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **team member’s manager** → **Accounts Payable analyst**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `team_member_s_manager_preapproval`, `accounts_payable_analyst_preapproval`.
- Cross-domain refs: `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Expenses > Team Member Reimbursements - Navan
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> Navan will auto sync and record expense reports into NetSuite once the report is “final approved”. “Final approved” means it has been approved by the team member’s manager and completed an audit review by an Accounts Payable analyst or our external contractor, Montgomery Pacific (Montpac).

_Notes_: Final approval requires manager approval and audit review before Navan syncs the expense report into NetSuite.

## Category: `expense_reimbursement_approval`

### Rule `FIN-EXP-0007` — Expense Reimbursement Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `expense_age_days` | `>` | `90` | days |

In plain English: `expense_age_days` exceeds 90 days.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Manager**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `manager_preapproval`.
- Cross-domain refs: `PROC-NEG-0001`, `PROC-URGENT-0002`

**Source:**
- doc_id: `gitlab/finance_spending_company_money`
- section: Spending Company Money > Guidelines
- url: https://handbook.gitlab.com/handbook/finance/spending-company-money/

Verbatim quote from the policy corpus:

> expense claims over 90 days from purchase date will not be reimbursed unless approved by your Manager.

_Notes_: Expense claims older than 90 days require Manager approval to be reimbursed.

## Category: `purchase_requisition_requirement`

### Rule `FIN-EXP-0002` — Purchase Requisition Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_amount_usd` | `>` | `5000` | USD |
| `payment_method` | `==` | `card` |  |

In plain English: `purchase_amount_usd` exceeds 5000 USD AND `payment_method` equals `card`.

**Request supporting documents** before deciding.
- Required documents: `Purchase Requisition in Zip`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `purchase_requisition_in_zip`.
- Cross-domain refs: `PROC-REQ-0001`, `PROC-SOFT-0007`, `PROC-SOFT-0008`

**Source:**
- doc_id: `gitlab/finance_accounts_payable_corp_credit_cards`
- section: Navan Purchasing Card > 2. General Guidelines
- url: https://handbook.gitlab.com/handbook/finance/accounts-payable/corp-credit-cards/

Verbatim quote from the policy corpus:

> If your purchase will be over $5,000 USD, you will need to enter a Purchase Requisition in Zip.

## Category: `purchasing_card_approval`

### Rule `FIN-CARD-0003` — Purchasing Card Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `card_type` | `==` | `navan_purchasing_card` |  |

In plain English: `card_type` equals `navan_purchasing_card`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Finance leadership team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `finance_leadership_team_preapproval`.

**Source:**
- doc_id: `gitlab/finance_accounts_payable_corp_credit_cards`
- section: Navan Purchasing Card > 8. PROCEDURES
- url: https://handbook.gitlab.com/handbook/finance/accounts-payable/corp-credit-cards/

Verbatim quote from the policy corpus:

> Navan Purchasing Cards are limited to team members in certain positions that require a card for the purchase of low value goods and services. These cards are not for company wide use. Cards must be requested via an issue and approved by the Finance leadership team.

_Notes_: Navan Purchasing Cards must be requested via an issue and approved by Finance leadership.

## Category: `purchasing_card_issuance_approval`

### Rule `FIN-CARD-0001` — Purchasing Card Issuance Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `request_type` | `==` | `purchasing_card_issuance` |  |

In plain English: `request_type` equals `purchasing_card_issuance`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Direct Manager** → **VP Accounting Operation**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `direct_manager_preapproval`, `vp_accounting_operation_preapproval`.
- Cross-domain refs: `LEG-RMDR-0002`

**Source:**
- doc_id: `gitlab/finance_accounts_payable_corp_credit_cards`
- section: Navan Purchasing Card > 1. POLICY
- url: https://handbook.gitlab.com/handbook/finance/accounts-payable/corp-credit-cards/

Verbatim quote from the policy corpus:

> To ensure good financial management and sound corporate governance, cards are only provided to team members under their name, and with the request/approval of the Direct Manager, and VP Accounting Operation’s final approval.

_Notes_: Purchasing cards are issued only to team members under their own name.

## Category: `software_reimbursement_denial`

### Rule `FIN-EXP-0003` — Software Reimbursement Denial

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `software` |  |
| `payment_method` | `==` | `personal_credit_card` |  |

In plain English: `purchase_category` equals `software` AND `payment_method` equals `personal_credit_card`.

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-PO-0011`

**Source:**
- doc_id: `gitlab/finance_procurement_individual_use_software`
- section: Individual Use Software > Individual Use Software Overview
- url: https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/

Verbatim quote from the policy corpus:

> Note that **all software purchases charged to either personal or corporate credit cards will be DENIED for reimbursement.**

_Notes_: Software purchases charged to personal credit cards are denied reimbursement.
