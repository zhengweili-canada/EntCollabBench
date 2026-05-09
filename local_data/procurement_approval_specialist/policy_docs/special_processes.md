# Special Processes (Card, Contingent Work, Urgent, Anti-Corruption)

_Procurement approval policy — topic `special_processes`. This document is read by the **procurement_approval_specialist** during reviews involving this topic. 12 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `anticorruption_compliance_review`

### Rule `PROC-AC-0002` — Anticorruption Compliance Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `anticorruption_gating_any_yes` | `==` | `true` | boolean |

In plain English: `anticorruption_gating_any_yes` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Ethics & Compliance team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `ethics_compliance_team_preapproval`.
- Cross-domain refs: `LEG-AC-0009`, `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`, `LEG-AC-0013`, `LEG-AC-0014`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> If the answer to any of these questions is “yes,” the Ethics & Compliance team must consider whether the vendor presents unacceptably high compliance risk.

_Notes_: Applies to anticorruption gating questions on the first page of the Zip request.

## Category: `contingent_worker_internal_approval`

### Rule `PROC-CWORK-0001` — Contingent Worker Internal Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `Contingent Worker` |  |

In plain English: `purchase_category` equals `Contingent Worker`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FP&A** → **your management**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `fp_a_preapproval`, `your_management_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> Before submitting a Zip request for a Contingent Worker:
> 
>    * Confirm you have internal approval from FP&A and your management to hire a contingent worker

_Notes_: Internal approval is required before submitting a Zip request for a contingent worker.

## Category: `contractor_extension_approval`

### Rule `PROC-CW-0001` — Contractor Extension Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `worker_type` | `==` | `staff_augmentation_worker` |  |
| `extension_beyond_initial_term` | `==` | `true` |  |

In plain English: `worker_type` equals `staff_augmentation_worker` AND `extension_beyond_initial_term` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FP&A Business Partner**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `fp_a_business_partner_preapproval`.
- Cross-domain refs: `Section 7`

**Source:**
- doc_id: `gitlab/finance_procurement_contingent_worker_policy`
- section: Contingent Worker Policy > 8. CONTRACTOR EXTENSION PROCESS (FOR CONTRACT LABOR CONTINGENT WORKERS ONLY)
- url: https://handbook.gitlab.com/handbook/finance/procurement/contingent-worker-policy/

Verbatim quote from the policy corpus:

> If there is a need to extend the engagement of a staff augmentation worker beyond the initial term, the following process must be followed:
> 
> 1. Request budget approval for extension to your FP&A Business Partner
> 2. Provide justification for the extension, including the project or task that the worker will be completing.
> 3. Once approval is obtained, then submit a Change Request in Zip to the existing Agreement/PO which is when Procurement would be notified to review.

_Notes_: After budget approval, requester must submit a Change Request in Zip to the existing Agreement/PO for Procurement review.

## Category: `independent_contractor_agreement`

### Rule `PROC-CW-0002` — Independent Contractor Agreement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `worker_type` | `==` | `independent_contractor` |  |

In plain English: `worker_type` equals `independent_contractor`.

**Request supporting documents** before deciding.
- Required documents: `Independent Contractor Service Agreement`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `independent_contractor_service_agreement`.
- Cross-domain refs: `LEG-ETHICS-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > Independent Contractor (option not preferred, used by exception only)
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> All Independent Contractors must be contracted using the [Independent Contractor Service Agreement](https://docs.google.com/document/d/1KDkv6oWv6V-6k9v5GhjF7WPMoQJOV5iubCZzLGn7xfY/edit#heading=h.b9kk7pr94mid) (ICSA).

_Notes_: Independent contractor use is described as by exception only.

## Category: `large_internal_event_approval`

### Rule `PROC-EVENT-0001` — Large Internal Event Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `event_total_cost_usd` | `>` | `1000000` | USD |

In plain English: `event_total_cost_usd` exceeds 1000000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **E Group DRI (CRO/CMO)** → **VP of Finance** → **CFO** → **Board**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `e_group_dri_cro_cmo_preapproval`, `vp_of_finance_preapproval`, `cfo_preapproval`, `board_preapproval`.
- Cross-domain refs: `LEG-AC-0017`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > Large Internal Events Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> For any large internal events with a total cost greater than $1M, such as SKO, President’s Club, Commit, etc, the following should be completed before any contracts are executed or any work is conducted.
> 
> The planning stages for events of this size should be completed at least 18-24 months prior to the actual event. This allows for ample time to get the necessary internal approvals, run any RFPs needed, and book large hotel blocks or buyouts.
> 
> 1. Connect with your Procurement Category Manager and FP&A Business Partner to determine the various vendors needed to run the event and line item detail in the total event budget. This would include lodging, food & beverage, event planning, on-site support, excursions, travel, etc.
> 2. Determine with your Procurement contact how these vendors will be selected and the timeline to run any necessary [RFPs](https://internal.gitlab.com/handbook/finance/procurement/). RFPs should be conducted at least 20 months prior to the event dates.
> 3. Upon completion of RFPs, the top 2-3 location options and their total pricing will be presented to the E Group DRI (CRO/CMO) and VP of Finance to determine the preferred location choice and corresponding budget. All information should be summarized in an issue where these approvals may be documented.
> 4. Once preferred location and budget are tentatively chosen, this information will be presented to the CFO for approval, and will then be presented to the Board for approval at their quarterly meeting, or via email as necessary. Please note that Board approvals may take multiple weeks. CFO and Board approvals should be obtained no less than 18 months prior to the event dates.

_Notes_: Applies to large internal events before contracts are executed or work is conducted.

## Category: `legal_redline_vendor_communication`

### Rule `PROC-LEGAL-0001` — Legal Redline Vendor Communication

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `contract_value_usd` | `>` | `100000` | USD |

In plain English: `contract_value_usd` exceeds 100000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `procurement_preapproval`.
- Cross-domain refs: `LEG-CONTR-0001`, `LEG-RMDR-0001`, `LEG-RMDR-0002`, `LEG-RMDR-0003`, `LEG-VEND-0001`, `https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#legal-approval--redlines`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> If the contract value is >$100k or Procurement is already actively negotiating or communicating with the vendor, Procurement will take responsibility for sending any legal redlines to the vendor.

_Notes_: Procurement sends legal redlines to the vendor for qualifying requests.

## Category: `purchase_request_escalation`

### Rule `PROC-PROC-0001` — Purchase Request Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `escalation_reason` | `==` | `Supplier wants it signed today` |  |

In plain English: `escalation_reason` equals `Supplier wants it signed today`.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > What if I have an Urgent Request?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> “Supplier wants it signed today” does not qualify as a reason for escalation and these requests will be denied.

_Notes_: Supplier desire for same-day signature is not a qualifying escalation reason.

## Category: `purchase_terms_required`

### Rule `PROC-TERMS-0001` — Purchase Terms Required

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_made_by_gitlab` | `==` | `true` | boolean |

In plain English: `purchase_made_by_gitlab` equals true.

**Request supporting documents** before deciding.
- Required documents: `executed terms and conditions`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `executed_terms_and_conditions`.
- Cross-domain refs: `LEG-CONTR-0002`, `LEG-PURCH-0001`, `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/legal_procurement_guide_collaborating_with_gitlab_legal`
- section: Procurement Guide: Collaborating with GitLab Legal > Negotiating Terms
- url: https://handbook.gitlab.com/handbook/legal/procurement-guide-collaborating-with-gitlab-legal/

Verbatim quote from the policy corpus:

> For any purchases made by GitLab, there must be executed terms and conditions in place before a purchase can be made or before services can be provided.

_Notes_: Executed terms and conditions must be in place before purchase or service provision.

## Category: `unauthorized_contract_signature_escalation`

### Rule `PROC-CONTR-0001` — Unauthorized Contract Signature Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `contract_signed_without_authority` | `==` | `true` |  |

In plain English: `contract_signed_without_authority` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/legal_procurement_guide_collaborating_with_gitlab_legal`
- section: Procurement Guide: Collaborating with GitLab Legal > Signing Contracts
- url: https://handbook.gitlab.com/handbook/legal/procurement-guide-collaborating-with-gitlab-legal/

Verbatim quote from the policy corpus:

> If you accidentally sign a contract or become aware of a contract that was signed by someone without authority, please immediately report it to the GitLab Procurement Team so that GitLab Legal can be engaged.

_Notes_: Report accidental or unauthorized contract signatures so GitLab Legal can be engaged.

## Category: `urgent_request_escalation`

### Rule `PROC-URGENT-0001` — Urgent Request Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `approval_lead_time_business_days` | `<` | `5` | business_days |

In plain English: `approval_lead_time_business_days` is less than 5 business_days.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-MATREV-0004`

**Source:**
- doc_id: `gitlab/finance_procurement_field_marketing_events`
- section: Field Marketing and Events > What if I have an Urgent Request?
- url: https://handbook.gitlab.com/handbook/finance/procurement/field-marketing-events/

Verbatim quote from the policy corpus:

> Urgent requests that need approval in less than 5 business days, need to be escalated in the #procurement channel for expediting per the below.

_Notes_: Urgent approval requests with less than 5 business days lead time require escalation in the procurement channel.

## Category: `urgent_request_escalation_documentation`

### Rule `PROC-URGENT-0002` — Urgent Request Escalation Documentation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `approval_lead_time_business_days` | `<` | `5` | business_days |

In plain English: `approval_lead_time_business_days` is less than 5 business_days.

**Request supporting documents** before deciding.
- Required documents: `Link to your Coupa Request`, `Date needed`, `Specific and quantifiable impact to the business if date is missed`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `link_to_your_coupa_request`, `date_needed`, `specific_and_quantifiable_impact_to_the_business_if_date_is_missed`.
- Exceptions (overriding rules): `Contracts should not be posted directly in slack`
- Cross-domain refs: `LEG-MATREV-0004`

**Source:**
- doc_id: `gitlab/finance_procurement_field_marketing_events`
- section: Field Marketing and Events > What if I have an Urgent Request?
- url: https://handbook.gitlab.com/handbook/finance/procurement/field-marketing-events/

Verbatim quote from the policy corpus:

> Urgent requests that need approval in less than 5 business days, need to be escalated in the #procurement channel for expediting per the below.
> * In your slack message you MUST include:
>   + Link to your Coupa Request
>     - Contracts should not be posted directly in slack
>   + Date needed
>   + Specific and quantifiable impact to the business if date is missed.

_Notes_: Escalation Slack messages must include the listed request details.

## Category: `vendor_anticorruption_review`

### Rule `PROC-AC-0001` — Vendor Anticorruption Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_recommended_to_gitlab` | `==` | `true` |  |

In plain English: `vendor_recommended_to_gitlab` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Ethics and Compliance team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `ethics_and_compliance_team_preapproval`.
- Cross-domain refs: `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`, `LEG-AC-0013`, `LEG-AC-0014`, `LEG-AC-0015`, `LEG-AC-0016`, `LEG-AC-0017`, `LEG-AC-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Depending on nature of vendor’s services and/or whether the vendor has been recommended to us, the Ethics and Compliance team will need to complete an anticorruption/antibribery review and, potentially, recommend additional measures to mitigate that risk.

_Notes_: The team may recommend additional measures to mitigate anticorruption or antibribery risk.
