# Vendor Management & Onboarding

_Procurement approval policy — topic `vendor_management`. This document is read by the **procurement_approval_specialist** during reviews involving this topic. 17 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `procurement_engagement`

### Rule `PROC-ENGAGE-0001` — Procurement Engagement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `suppliers_being_evaluated` | `==` | `true` |  |
| `purchase_category` | `in` | `["services", "goods"]` |  |

In plain English: `suppliers_being_evaluated` equals true AND `purchase_category` is one of ["services", "goods"].

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `procurement_preapproval`.
- Cross-domain refs: `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Anytime a group of suppliers are being evaluated for services/goods or a purchase is being made on behalf of GitLab that does not qualify as a [personal expense](https://handbook.gitlab.com/handbook/finance/expenses/) or meet the list of [exceptions](https://handbook.gitlab.com/handbook/finance/procurement/#what-are-the-exceptions-to-the-po-policy), Procurement must be engaged BEFORE a purchase and/or work can begin.

_Notes_: Applies when evaluating a group of suppliers for services or goods.

## Category: `usage_based_software_review`

### Rule `PROC-VEND-0009` — Usage Based Software Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `software_renewal` | category |
| `usage_based` | `==` | `true` | boolean |

In plain English: `purchase_category` equals `software_renewal` AND `usage_based` equals true.

**Request supporting documents** before deciding.
- Required documents: `usage report`
- Approver chain: **Procurement**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `usage_report`.
- Cross-domain refs: `LEG-PRIV-0018`, `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Other Tips for Submitting Requests
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> For any software renewal/add-on that is based on usage (e.g. user quantities), a usage report is required for Procurement’s review.

_Notes_: Split from renewal/add-on wording to avoid an OR-condition.

## Category: `vendor_cancellation_notification`

### Rule `PROC-VEND-0004` — Vendor Cancellation Notification

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `cancellation_determined_outside_quarterly_cadence` | `==` | `true` | boolean |

In plain English: `cancellation_determined_outside_quarterly_cadence` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement Category Manager**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `procurement_category_manager_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> If a cancellation is determined outside of this quarterly cadence, notify your Procurement Category Manager and complete the above process as soon as possible.

_Notes_: Outside-cadence cancellations require notification to the Procurement Category Manager.

## Category: `vendor_cancellation_request`

### Rule `PROC-VEND-0001` — Vendor Cancellation Request

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_cancellation_desired` | `==` | `true` | boolean |

In plain English: `vendor_cancellation_desired` equals true.

**Request supporting documents** before deciding.
- Required documents: `Termination/Non-Renewal Request`, `copies of the existing contract(s)`
- Approver chain: **Procurement** → **Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `termination_non_renewal_request`, `copies_of_the_existing_contract_s`.
- Cross-domain refs: `LEG-PRIV-0018`, `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> For each of the above, if a cancellation is desired (which include terminations and/or non-renewals) please follow the “Cancellation Process” outlined below:
> 
> 1. Submit a **Termination/Non-Renewal Request** through Zip by completing the intake form and providing copies of the existing contract(s) that you are canceling.
> 2. Through Zip, Procurement and Legal will work with the requester to provide instructions on how, when, and who should notify the vendor.

_Notes_: Cancellation requests must be submitted through Zip with the existing contract copies.

## Category: `vendor_commitment_procurement_engagement`

### Rule `PROC-VEND-0007` — Vendor Commitment Procurement Engagement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `commitment_type` | `==` | `business` | type |

In plain English: `commitment_type` equals `business`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement Team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `procurement_team_preapproval`.
- Cross-domain refs: `LEG-AC-0009`, `LEG-NDA-0001`, `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_field_marketing_events`
- section: Field Marketing and Events > Important to Know
- url: https://handbook.gitlab.com/handbook/finance/procurement/field-marketing-events/

Verbatim quote from the policy corpus:

> Do NOT agree to ANY business, legal, and or pricing prior to engaging the Procurement Team.

_Notes_: Business commitments must not be agreed before engaging Procurement Team.

## Category: `vendor_data_return_deletion_review`

### Rule `PROC-VEND-0002` — Vendor Data Return Deletion Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_data_shared` | `==` | `true` | boolean |

In plain English: `vendor_data_shared` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Security** → **Privacy**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `security_preapproval`, `privacy_preapproval`.
- Cross-domain refs: `LEG-NDA-0006`, `LEG-PRIV-0017`, `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Security and Privacy will also be added for awareness and review if data is being shared with the vendor to determine the requirements of returning or deleting the data.

_Notes_: Security and Privacy review determines data return or deletion requirements.

## Category: `vendor_financial_viability_check`

### Rule `PROC-VEND-0011` — Vendor Financial Viability Check

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_entity_type` | `==` | `private_company` |  |

In plain English: `vendor_entity_type` equals `private_company`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> 1. Vendor is a private company, LLC or self-employed

_Notes_: Decision inferred from section heading.

### Rule `PROC-VEND-0012` — Vendor Financial Viability Check

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `services_required_for_continued_operations` | `==` | `true` |  |

In plain English: `services_required_for_continued_operations` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> 2. Services provided are required for continued operations

_Notes_: Decision inferred from section heading.

### Rule `PROC-VEND-0013` — Vendor Financial Viability Check

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `cloud_hosting_services` |  |

In plain English: `purchase_category` equals `cloud_hosting_services`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> 3. Cloud hosting services

_Notes_: Decision inferred from section heading.

### Rule `PROC-VEND-0014` — Vendor Financial Viability Check

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `service_customer_uptime_requirement` | `==` | `true` |  |

In plain English: `service_customer_uptime_requirement` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> 4. Services directly related to servicing customers with an uptime requirement

_Notes_: Decision inferred from section heading.

### Rule `PROC-VEND-0015` — Vendor Financial Viability Check

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `stores_nonrecoverable_data` | `==` | `true` |  |

In plain English: `stores_nonrecoverable_data` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-CNTRCT-0001`, `LEG-NDA-0001`, `LEG-PRIV-0008`, `LEG-PRIV-0017`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> 5. Storage of data that is not recoverable if vendor goes out of business

_Notes_: Decision inferred from section heading.

### Rule `PROC-VEND-0016` — Vendor Financial Viability Check

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_replacement_time_days` | `>` | `7` | days |

In plain English: `vendor_replacement_time_days` exceeds 7 days.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> 6. Software or services where it would take over 1 week to replace or swap

_Notes_: Decision inferred from section heading.

## Category: `vendor_onboarding_for_payment`

### Rule `PROC-VEND-0010` — Vendor Onboarding For Payment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_payment_requested` | `==` | `true` |  |

In plain English: `vendor_payment_requested` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-CHAR-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> In order for vendors to be paid, they need to complete their onboarding in our systems.

_Notes_: Vendor onboarding must be completed before payment.

## Category: `vendor_sanctions_screening`

### Rule `PROC-VEND-0005` — Vendor Sanctions Screening

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `sanctions_match_detected` | `==` | `false` |  |
| `vendor_country_risk_tier` | `!=` | `high_risk` |  |

In plain English: `sanctions_match_detected` equals false AND `vendor_country_risk_tier` is not `high_risk`.

**Approve** outright when these conditions hold.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> If Risk Rate detects no matches between the vendor and applicable sanctions lists AND the vendor is not located in a high-risk country, the vendor will be auto-approved.

_Notes_: Auto-approval applies after Risk Rate sanctions screening.

### Rule `PROC-VEND-0006` — Vendor Sanctions Screening

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `sanctions_match_detected` | `==` | `true` |  |

In plain English: `sanctions_match_detected` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab’s Trade Compliance Counsel**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_s_trade_compliance_counsel_preapproval`.
- Cross-domain refs: `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> If Risk Rate detects a potential match or is located in a high risk country, the vendor may require escalation to and manual review by GitLab’s Trade Compliance Counsel.

_Notes_: Source states the vendor may require escalation.

## Category: `vendor_security_review`

### Rule `PROC-VEND-0008` — Vendor Security Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_shared` | `==` | `true` | boolean |

In plain English: `data_shared` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab’s Security Risk Team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_s_security_risk_team_preapproval`.
- Cross-domain refs: `LEG-NDA-0001`, `LEG-NDA-0003`, `LEG-RMDR-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Other Tips for Submitting Requests
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> If any data will be shared, a Vendor Security Review will be completed. The vendor will receive an email communication from GitLab’s Security Risk Team requesting information regarding their security protocols.

_Notes_: Applies when vendor data sharing is indicated in the Zip request.

## Category: `vendor_software_offboarding`

### Rule `PROC-VEND-0003` — Vendor Software Offboarding

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `cancellation_request_type` | `==` | `software_offboarding` | category |

In plain English: `cancellation_request_type` equals `software_offboarding`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `it_preapproval`.
- Cross-domain refs: `Tech Stack Update`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> For certain cancellation requests—such as software offboarding—IT will be included in the Zip workflow to determine and complete the required deprovisioning and system offboarding steps.

_Notes_: IT inclusion applies to certain cancellation requests such as software offboarding.
