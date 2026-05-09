# Vendor Payments & Purchase Orders

_Finance approval policy — topic `vendors_payments`. This document is read by the **finance_approval_specialist** during reviews involving this topic. 4 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `external_supplier_form_approval`

### Rule `FIN-VEND-0001` — External Supplier Form Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `form_type` | `==` | `external_supplier_form` |  |
| `vendor_country` | `==` | `US` |  |

In plain English: `form_type` equals `external_supplier_form` AND `vendor_country` equals `US`.

**Request supporting documents** before deciding.
- Required documents: `W9`, `Bank details in a signed bank letterhead`
- Approver chain: **AP Team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `w9`, `bank_details_in_a_signed_bank_letterhead`.
- Cross-domain refs: `PROC-AGREE-0001`

**Source:**
- doc_id: `gitlab/finance_accounts_payable`
- section: Accounts Payable > Accounts Payable Processing
- url: https://handbook.gitlab.com/handbook/finance/accounts-payable/

Verbatim quote from the policy corpus:

> External Supplier Forms are to be final approved by AP Team so that the vendor will be activated in Coupa, to provide our final approval, the vendor must comply with these two important documents so we can properly check the supplier form in our queue.
>      + W9 for US vendors and W8 for NON US vendors
>      + Bank details in a signed bank letterhead

_Notes_: US vendors must provide W9 and bank details for AP Team final approval.

## Category: `prepaid_expense_exception_preapproval`

### Rule `FIN-PREPAID-0001` — Prepaid Expense Exception Preapproval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `prepaid_expense_policy_exception_requested` | `==` | `true` |  |

In plain English: `prepaid_expense_policy_exception_requested` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Corporate Controller** → **PAO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `corporate_controller_preapproval`, `pao_preapproval`.
- Cross-domain refs: `PROC-PO-0011`, `PROC-PO-0012`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Accounting Policies > Prepaid Expense Policy
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> Any exceptions should be pre-approved by the Corporate Controller or PAO.

_Notes_: Applies to exceptions to prepaid expense recording policy.

## Category: `purchase_order_requirement`

### Rule `FIN-PO-0001` — Purchase Order Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `total_contract_value_usd` | `>` | `5000` | USD |

In plain English: `total_contract_value_usd` exceeds 5000 USD.

**Request supporting documents** before deciding.
- Required documents: `purchase order`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `purchase_order`.
- Exceptions (overriding rules): `unless it falls under the PO Exception Policy`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-RFP-0001`, `PROC-ZIP-0001`, `PROC-ZIP-0005`, `PROC-ZIP-0006`, `PROC-ZIP-0007`, `PROC-ZIP-0008`, `https://handbook.gitlab.com/handbook/finance/procurement/#what-are-the-exceptions-to-the-po-policy`

**Source:**
- doc_id: `gitlab/finance_accounts_payable`
- section: Accounts Payable > General Guidelines
- url: https://handbook.gitlab.com/handbook/finance/accounts-payable/

Verbatim quote from the policy corpus:

> All purchases/services with a total contract value over $5000 are **required** to have a purchase order, unless it falls under the [PO Exception Policy](https://handbook.gitlab.com/handbook/finance/procurement/#what-are-the-exceptions-to-the-po-policy).

_Notes_: Purchase order requirement is subject to the PO Exception Policy.

## Category: `vendor_onboarding_approval`

### Rule `FIN-VEND-0002` — Vendor Onboarding Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `external_supplier_form_status` | `==` | `submitted` |  |

In plain English: `external_supplier_form_status` equals `submitted`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Accounts Payable Approval Group**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `accounts_payable_approval_group_preapproval`.
- Cross-domain refs: `LEG-NDA-0003`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Procure to Pay > Vendor Master Management
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> After supplier submission, the external form will be routed to Accounts Payable Approval Group for review and approval.

_Notes_: External supplier form is routed for Accounts Payable approval after supplier submission.
