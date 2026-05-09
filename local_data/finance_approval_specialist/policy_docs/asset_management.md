# Asset & Capital Management

_Finance approval policy — topic `asset_management`. This document is read by the **finance_approval_specialist** during reviews involving this topic. 1 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `asset_disposition_approval`

### Rule `FIN-ASSET-0001` — Asset Disposition Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `asset_purchased_by_employee` | `==` | `true` | boolean |
| `employee_termination` | `==` | `true` | boolean |

In plain English: `asset_purchased_by_employee` equals true AND `employee_termination` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT Ops**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `it_ops_preapproval`.
- Cross-domain refs: `PROC-IT-0003`

**Source:**
- doc_id: `gitlab/finance_accounting`
- section: Accounting and Reporting > Property, Plant and Equipment > Disposition of an Asset
- url: https://handbook.gitlab.com/handbook/finance/accounting/

Verbatim quote from the policy corpus:

> Assets will be disposed of if purchased by an employee upon termination (if approved by IT Ops) or if the item is no longer useful before the useful life.

_Notes_: Asset disposal for employee purchase upon termination requires IT Ops approval.
