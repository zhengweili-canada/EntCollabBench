# Software & IT Procurement

_Procurement approval policy — topic `software`. This document is read by the **procurement_approval_specialist** during reviews involving this topic. 12 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `contingent_worker_it_approval`

### Rule `PROC-IT-0002` — Contingent Worker It Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `access_systems` | `contains` | `Okta` |  |

In plain English: `access_systems` contains `Okta`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT Ops**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `it_ops_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> If the Contingent Worker requires access to Okta and/or core GitLab core applications, a GitLab laptop must be issued followed by a Zip approval from IT Ops validating laptop issuance.

_Notes_: A GitLab laptop must be issued before IT Ops Zip approval validates laptop issuance.

### Rule `PROC-IT-0003` — Contingent Worker It Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `worker_location_requires_it_approval` | `==` | `true` |  |

In plain English: `worker_location_requires_it_approval` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `it_preapproval`.
- Cross-domain refs: `LEG-NDA-0001`, `LEG-NDA-0003`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> [Certain locations](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/127746#note_1497241068) will require IT Approval before providing the equipment.

_Notes_: IT approval is required before providing equipment in locations identified by the linked source.

## Category: `individual_use_software_approval`

### Rule `PROC-SOFT-0006` — Individual Use Software Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `individual_use_software_request_received` | `==` | `true` | boolean |

In plain English: `individual_use_software_request_received` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your manager** → **Security** → **Privacy**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_manager_preapproval`, `security_preapproval`, `privacy_preapproval`.
- Cross-domain refs: `LEG-PRIV-0020`

**Source:**
- doc_id: `gitlab/finance_procurement_individual_use_software`
- section: Individual Use Software > What Happens When I Request Individual Use Software?
- url: https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/

Verbatim quote from the policy corpus:

> Upon receipt, the Procurement team will open a GitLab Issue based on your responses and will route for the necessary approvals, including your manager, Security, and Privacy.

_Notes_: Procurement routes individual use software requests for necessary approvals.

## Category: `individual_use_software_approval_negation`

### Rule `PROC-SOFT-9005` — Individual Use Software Approval Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `individual_use_software_request_received` | `!=` | `true` | boolean |

In plain English: `individual_use_software_request_received` is not true.

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-SOFT-0006`

**Source:**
- doc_id: `gitlab/finance_procurement_individual_use_software`
- section: Individual Use Software > What Happens When I Request Individual Use Software?
- url: https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/

Verbatim quote from the policy corpus:

> Upon receipt, the Procurement team will open a GitLab Issue based on your responses and will route for the necessary approvals, including your manager, Security, and Privacy.

_Notes_: [Synthesized negation sibling of PROC-SOFT-0006] When the gating boolean is FALSE the matter falls into the inverse outcome. Procurement routes individual use software requests for necessary approvals.

## Category: `individual_use_software_procurement`

### Rule `PROC-SOFT-0007` — Individual Use Software Procurement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `individual_use_software` |  |
| `annual_software_expenditure_usd` | `>` | `5000` | USD |

In plain English: `purchase_category` equals `individual_use_software` AND `annual_software_expenditure_usd` exceeds 5000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`, `LEG-PRIV-0018`, `https://handbook.gitlab.com/handbook/finance/procurement/#how-to-start-the-procurement-process`

**Source:**
- doc_id: `gitlab/finance_procurement_individual_use_software`
- section: Individual Use Software > Individual Use Software Overview
- url: https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/

Verbatim quote from the policy corpus:

> An individual’s annual expenditure on Individual Use software should not surpass $5,000. Should the cost of your software exceed this threshold, or if multiple people on your team need access, please follow the [Procurement process](https://handbook.gitlab.com/handbook/finance/procurement/#how-to-start-the-procurement-process) for submitting a new purchase request.

_Notes_: Cost above the individual annual expenditure threshold requires the Procurement process for a new purchase request.

### Rule `PROC-SOFT-0008` — Individual Use Software Procurement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `individual_use_software` |  |
| `software_access_user_count` | `>` | `1` | headcount |

In plain English: `purchase_category` equals `individual_use_software` AND `software_access_user_count` exceeds 1 headcount.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0003`, `LEG-PRIV-0018`, `https://handbook.gitlab.com/handbook/finance/procurement/#how-to-start-the-procurement-process`

**Source:**
- doc_id: `gitlab/finance_procurement_individual_use_software`
- section: Individual Use Software > Individual Use Software Overview
- url: https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/

Verbatim quote from the policy corpus:

> Should the cost of your software exceed this threshold, or if multiple people on your team need access, please follow the [Procurement process](https://handbook.gitlab.com/handbook/finance/procurement/#how-to-start-the-procurement-process) for submitting a new purchase request.

_Notes_: Multiple team members needing access requires the Procurement process for a new purchase request.

## Category: `individual_use_software_request_routing`

### Rule `PROC-SOFT-0003` — Individual Use Software Request Routing

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_in_tech_stack` | `==` | `true` |  |

In plain English: `vendor_in_tech_stack` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-NDA-0003`

**Source:**
- doc_id: `gitlab/finance_procurement_individual_use_software`
- section: Individual Use Software > I Need Individual Use Software- Where Do I Start?
- url: https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/

Verbatim quote from the policy corpus:

> If your vendor is listed in the tech stack, please submit an [access request](https://gitlab.com/gitlab-com/team-member-epics/access-requests/-/issues/new?issuable_template=Individual_Bulk_Access_Request) using the Individual Bulk Access Request template.

_Notes_: Individual use software vendors already in the tech stack require an access request.

### Rule `PROC-SOFT-0004` — Individual Use Software Request Routing

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_in_tech_stack` | `==` | `false` |  |

In plain English: `vendor_in_tech_stack` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement_individual_use_software`
- section: Individual Use Software > I Need Individual Use Software- Where Do I Start?
- url: https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/

Verbatim quote from the policy corpus:

> If your vendor does not appear in the tech stack, requests must be submitted via [this Google Form](https://docs.google.com/forms/d/e/1FAIpQLSfWp2lnSKp0gTKBfZxol-YEkTst4gtOYpRJQvnVvDzhcGuxwg/viewform) to ensure appropriate routing.

_Notes_: Individual use software vendors not in the tech stack must be routed through the Google Form.

## Category: `individual_use_software_security_approval`

### Rule `PROC-SOFT-0005` — Individual Use Software Security Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `software_listing` | `==` | `Pre-Approved Individual Use Software and Freeware` |  |

In plain English: `software_listing` equals `Pre-Approved Individual Use Software and Freeware`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Security**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `security_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_individual_use_software`
- section: Individual Use Software > I Need Individual Use Software- Where Do I Start?
- url: https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/

Verbatim quote from the policy corpus:

> Note** that commonly requested Individual Use Software is documented within the [Pre-Approved Individual Use Software and Freeware](https://internal.gitlab.com/handbook/finance/procurement/pre-approved-individual-use-software/) listing and is subject to expedited Security approval.

_Notes_: Commonly requested individual use software in the pre-approved listing is subject to expedited Security approval.

## Category: `it_purchase_review_documentation`

### Rule `PROC-IT-0001` — It Purchase Review Documentation
_Severity: recommended_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `new_software` |  |

In plain English: `purchase_category` equals `new_software`.

**Request supporting documents** before deciding.
- Required documents: `IT New Software Questionnaire`
- Approver chain: **IT**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `it_new_software_questionnaire`.
- Cross-domain refs: `LEG-CNTRCT-0001`, `LEG-NDA-0001`, `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> #### 3.B. IT Review: 2 days if purchasing new software or for contractors
> 
> * Requester should have vendor complete the [IT New Software Questionnaire](https://docs.google.com/spreadsheets/d/1SgyzxDDiTbig0VtZ5RPgX92U_VlQu1mq/edit?usp=sharing&ouid=115328509315203543998&rtpof=true&sd=true) and submit with the purchase request so IT can complete their review

_Notes_: Soft requirement uses “should” in the source.

## Category: `software_purchase_it_review`

### Rule `PROC-SOFT-0001` — Software Purchase It Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `new_software` |  |

In plain English: `purchase_category` equals `new_software`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `it_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Submitting a request for New Software
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> All new software purchases also need reviewed by [IT](https://handbook.gitlab.com/handbook/finance/procurement/#3b-it-review-2-days-if-purchasing-new-software-or-for-contractors)

_Notes_: Applies to all new software purchases submitted through Zip.

## Category: `software_vendor_questionnaire`

### Rule `PROC-SOFT-0002` — Software Vendor Questionnaire

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `new_software` |  |

In plain English: `purchase_category` equals `new_software`.

**Request supporting documents** before deciding.
- Required documents: `IT Questionnaire tab`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `it_questionnaire_tab`.
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PRIV-0017`, `LEG-PRIV-0019`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Submitting a request for New Software
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> New software vendors will need to complete the [IT Questionnaire tab](https://docs.google.com/spreadsheets/d/17-NdZF0SeOS_b59XE9lLg9cuCD9iKKlO/edit#gid=392482466).

_Notes_: Vendor must complete the IT Questionnaire tab for new software.
