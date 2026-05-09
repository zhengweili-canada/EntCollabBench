# Security & Privacy Reviews

_Procurement approval policy — topic `security_privacy`. This document is read by the **procurement_approval_specialist** during reviews involving this topic. 6 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `contingent_worker_security_review`

### Rule `PROC-SEC-0002` — Contingent Worker Security Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requires_gitlab_equipment` | `==` | `true` |  |
| `data_categories` | `contains` | `Orange data` |  |

In plain English: `requires_gitlab_equipment` equals true AND `data_categories` contains `Orange data`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> If the Contingent Worker requires GitLab equipment (i.e. access to Orange or Red data), which will require a [Security Review](https://handbook.gitlab.com/handbook/finance/procurement/#4c-security-review-4-14-days), the Zip purchase requisition will need to be submitted 10 days in advance of the normal approval [timeline](https://handbook.gitlab.com/handbook/finance/procurement/#review-steps-timeline-and-considerations) to account for ordering and shipping of the equipment.

_Notes_: The purchase requisition should be submitted 10 days in advance of the normal approval timeline.

### Rule `PROC-SEC-0003` — Contingent Worker Security Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_categories` | `contains` | `Orange Data` |  |
| `data_categories` | `contains` | `Red Data` |  |
| `data_processed_or_stored_outside_gitlab_systems` | `==` | `true` |  |

In plain English: `data_categories` contains `Orange Data` AND `data_categories` contains `Red Data` AND `data_processed_or_stored_outside_gitlab_systems` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-PRIV-0018`, `LEG-PRIV-0033`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> Contingent Workers that require Orange and Red Data access, that will be processed or stored outside GitLab’s systems, are considered “Professional Services” and are subject to a full security review.

_Notes_: Such contingent workers are considered Professional Services.

## Category: `data_processing_agreement`

### Rule `PROC-PRIV-0003` — Data Processing Agreement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `personal_data_supplier_involvement` | `==` | `shared` | processing_activity |

In plain English: `personal_data_supplier_involvement` equals `shared`.

**Request supporting documents** before deciding.
- Required documents: `Data Processing Agreement (DPA)`, `Standard Contractual Clauses (SCCs)`
- Approver chain: **Privacy**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `data_processing_agreement_dpa`, `standard_contractual_clauses_sccs`.
- Cross-domain refs: `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> **Data Processing Agreement (DPA)/Standard Contractual Clauses (SCCs):** Required when personal data is shared with, accesssed, or collected by the supplier on behalf of GitLab. DPA/SCCs are generally affixed to an agreement but may be required as a separate agreement upon the determination of Privacy (see the Privacy review process below).

_Notes_: DPA/SCCs may be affixed to the agreement or required separately upon Privacy determination.

## Category: `privacy_review`

### Rule `PROC-PRIV-0001` — Privacy Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `SaaS` | category |

In plain English: `purchase_category` equals `SaaS`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Privacy**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `privacy_preapproval`.
- Cross-domain refs: `LEG-PRIV-0018`, `LEG-PURCH-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> A Privacy Review is required for all SaaS purchases and other purchase types where the supplier will receive from GitLab or collect on GitLab’s behalf red/orange data.

_Notes_: Privacy review is required for SaaS purchases.

### Rule `PROC-PRIV-0002` — Privacy Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_status` | `==` | `existing` | status |
| `prior_privacy_review_result` | `==` | `full_and_satisfactory` | review_result |
| `privacy_review_age_months` | `>=` | `24` | months |

In plain English: `vendor_status` equals `existing` AND `prior_privacy_review_result` equals `full_and_satisfactory` AND `privacy_review_age_months` is at least 24 months.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Privacy**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `privacy_preapproval`.
- Cross-domain refs: `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> For existing vendors, a full privacy review is required every 24 months, provided the vendor completed a full and satisfactory privacy review during the prior procurement cycle

_Notes_: Existing vendors require a full privacy review every 24 months if the prior procurement cycle included a full and satisfactory privacy review.

## Category: `vendor_security_review`

### Rule `PROC-SEC-0001` — Vendor Security Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_processing_activity` | `==` | `collect` | processing_activity |
| `data_categories` | `==` | `Orange Data` | data_category |

In plain English: `data_processing_activity` equals `collect` AND `data_categories` equals `Orange Data`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Security Third Party Risk Management**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `security_third_party_risk_management_preapproval`.
- Exceptions (overriding rules): `Excluding field marketing events`
- Cross-domain refs: `LEG-PRIV-0018`, `LEG-PRIV-0019`, `https://handbook.gitlab.com/handbook/security/security-assurance/security-risk/third-party-risk-management/`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> [Security Third Party Risk Management](https://handbook.gitlab.com/handbook/security/security-assurance/security-risk/third-party-risk-management/) reviews are required for vendors that collect, process, or store Orange / Red Data, software providers (SaaS and On-premise), and independent contractors / consultants. (Excluding field marketing events)

_Notes_: Security review is excluded for field marketing events.
