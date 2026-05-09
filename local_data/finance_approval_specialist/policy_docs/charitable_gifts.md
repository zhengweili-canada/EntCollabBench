# Charitable Contributions & Gifts

_Finance approval policy — topic `charitable_gifts`. This document is read by the **finance_approval_specialist** during reviews involving this topic. 2 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `charitable_contribution_payment`

### Rule `FIN-CHAR-0001` — Charitable Contribution Payment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `donation_amount_usd` | `>` | `5000` | USD |

In plain English: `donation_amount_usd` exceeds 5000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-SOFT-0007`, `PROC-SOFT-0008`, `PROC-ZIP-0002`, `PROC-ZIP-0003`, `PROC-ZIP-0004`, `PROC-ZIP-0005`, `PROC-ZIP-0006`, `PROC-ZIP-0007`, `PROC-ZIP-0008`

**Source:**
- doc_id: `gitlab/finance_procurement_charitable_contributions`
- section: Charitable Contribution Requests
- url: https://handbook.gitlab.com/handbook/finance/procurement/charitable-contributions/

Verbatim quote from the policy corpus:

> if the donation is >$5,000, we will need to set the recipient up in Coupa and follow the PO process in order to issue payment. Please [create a purchase request in Zip](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request) to get the organization registered and to process payment.

_Notes_: Recipient must be set up in Coupa and a purchase request created in Zip.

### Rule `FIN-CHAR-0002` — Charitable Contribution Payment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `donation_amount_usd` | `<` | `5000` | USD |

In plain English: `donation_amount_usd` is less than 5000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Exceptions (overriding rules): `exception to the PO process`
- Cross-domain refs: `PROC-SOFT-0007`, `PROC-SOFT-0008`

**Source:**
- doc_id: `gitlab/finance_procurement_charitable_contributions`
- section: Charitable Contribution Requests
- url: https://handbook.gitlab.com/handbook/finance/procurement/charitable-contributions/

Verbatim quote from the policy corpus:

> If the donation is <$5,000, please contact [AP@gitlab.com](mailto:AP@gitlab.com) to process payment as an exception to the PO process.

_Notes_: Contact AP@gitlab.com to process payment.
