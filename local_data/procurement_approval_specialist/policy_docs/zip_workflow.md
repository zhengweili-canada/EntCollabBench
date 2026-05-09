# Zip Intake Workflow

_Procurement approval policy — topic `zip_workflow`. This document is read by the **procurement_approval_specialist** during reviews involving this topic. 8 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `procurement_intake`

### Rule `PROC-ZIP-0002` — Procurement Intake

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `request_type` | `==` | `renewal_existing_vendor_services` |  |

In plain English: `request_type` equals `renewal_existing_vendor_services`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0003`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Submit a Zip Request for
>    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)

_Notes_: Use Zip to initiate renewal purchase requests for existing vendor services.

### Rule `PROC-ZIP-0003` — Procurement Intake

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_type` | `==` | `new_spend` |  |
| `purchase_amount_usd` | `<` | `25000` | USD |

In plain English: `purchase_type` equals `new_spend` AND `purchase_amount_usd` is less than 25000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0003`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Submit a Zip Request for
>    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)

_Notes_: Use Zip for new spend under $25k.

### Rule `PROC-ZIP-0004` — Procurement Intake

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `request_type` | `==` | `change_request_existing_po` |  |

In plain English: `request_type` equals `change_request_existing_po`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Submit a Zip Request for
>    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)

_Notes_: Use Zip for change requests to existing purchase orders.

### Rule `PROC-ZIP-0005` — Procurement Intake

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `contract_value_usd` | `==` | `0` | USD |
| `request_type` | `==` | `contract_review` |  |

In plain English: `contract_value_usd` equals 0 AND `request_type` equals `contract_review`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Submit a Zip Request for
>    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)
>    4. [$0 contract reviews including demos and trials](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-request-a-signature-on-a-poc-agreement)

_Notes_: Use Zip for $0 contract reviews, including demos and trials.

### Rule `PROC-ZIP-0006` — Procurement Intake

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `partner_revenue_payments` |  |

In plain English: `purchase_category` equals `partner_revenue_payments`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-CHAR-0001`, `FIN-PO-0001`, `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`, `LEG-AC-0013`, `LEG-AC-0014`, `LEG-AC-0015`, `LEG-AC-0016`, `LEG-AC-0017`, `LEG-ETHICS-0001`, `LEG-NDA-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Submit a Zip Request for
>    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)
>    4. [$0 contract reviews including demos and trials](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-request-a-signature-on-a-poc-agreement)
>    5. Partner Revenue Payments

_Notes_: Use Zip for Partner Revenue Payments.

### Rule `PROC-ZIP-0007` — Procurement Intake

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `individual_use_software` |  |

In plain English: `purchase_category` equals `individual_use_software`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0001`, `LEG-NDA-0003`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Submit a Zip Request for
>    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)
>    4. [$0 contract reviews including demos and trials](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-request-a-signature-on-a-poc-agreement)
>    5. Partner Revenue Payments
>    6. [Individual Use Software](https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/)

_Notes_: Use Zip for Individual Use Software.

### Rule `PROC-ZIP-0008` — Procurement Intake

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `request_type` | `==` | `termination_or_non_renewal_notice` |  |

In plain English: `request_type` equals `termination_or_non_renewal_notice`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-NDA-0001`, `LEG-NDA-0003`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Submit a Zip Request for
>    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)
>    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)
>    4. [$0 contract reviews including demos and trials](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-request-a-signature-on-a-poc-agreement)
>    5. Partner Revenue Payments
>    6. [Individual Use Software](https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/)
>    7. [Providing Termination or Non-Renewal Notice](https://handbook.gitlab.com/handbook/finance/procurement/#6-cancellation)

_Notes_: Use Zip for providing termination or non-renewal notice.

## Category: `zip_purchase_request_requirement`

### Rule `PROC-ZIP-0001` — Zip Purchase Request Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `home_office_equipment` |  |
| `purchase_purpose` | `==` | `individual_work_use` |  |
| `purchase_amount_usd` | `<` | `5000` | USD |

In plain English: `purchase_category` equals `home_office_equipment` AND `purchase_purpose` equals `individual_work_use` AND `purchase_amount_usd` is less than 5000 USD.

**Approve** outright when these conditions hold.
- Cross-domain refs: `FIN-PO-0001`, `Other Services`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> If purchasing Home Office Equipment and/or Software for your individual work use that is <$5K USD, see [Other Services](https://handbook.gitlab.com/handbook/finance/procurement/#other-services) since a Zip Purchase Request is not required in these instances.

_Notes_: Applies when the purchase is for individual work use.
