# Disclosures & Public Statements

_Legal approval policy — topic `disclosure_disclaimers`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 10 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `executive_compensation_approval`

### Rule `LEG-RPT-0005` — Executive Compensation Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `executive_officer_immediate_family_member_of_company_executive_or_director` | `==` | `false` |  |
| `related_compensation_reportable_if_named_executive_officer` | `==` | `true` |  |

In plain English: `executive_officer_immediate_family_member_of_company_executive_or_director` equals false AND `related_compensation_reportable_if_named_executive_officer` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Company’s Compensation and Leadership Development Committee**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `company_s_compensation_and_leadership_development_committee_preapproval`.

**Source:**
- doc_id: `gitlab/legal_gitlab_related_party_transactions_policy`
- section: GitLab Related Party Transactions Policy > PURPOSE > APPROVAL PROCESS
- url: https://handbook.gitlab.com/handbook/legal/gitlab-related-party-transactions-policy/

Verbatim quote from the policy corpus:

> the executive officer is not an immediate family member of another Company executive officer or director, the related compensation would have been reported in our proxy statement if the executive officer were a “named executive officer,” and the Company’s Compensation and Leadership Development Committee approved

_Notes_: Applies to related compensation for employment of an executive officer.

## Category: `foia_request_escalation`

### Rule `LEG-FOIA-0001` — Foia Request Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `request_type` | `==` | `FOIA request` |  |
| `request_source` | `==` | `US federal agency` |  |
| `gitlab_documents_identified_for_release` | `==` | `true` |  |

In plain English: `request_type` equals `FOIA request` AND `request_source` equals `US federal agency` AND `gitlab_documents_identified_for_release` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FOIA@gitlab.com**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `foia_gitlab_com_preapproval`.

**Source:**
- doc_id: `gitlab/legal`
- section: Legal & Corporate Affairs ("LACA") > Freedom of Information Act (FOIA) Requests
- url: https://handbook.gitlab.com/handbook/legal/

Verbatim quote from the policy corpus:

> In the event you receive a notification from a US federal agency pursuant to a FOIA request, indicating that GitLab documents or information have been identified for release by an agency, please immediately forward the request to [FOIA@gitlab.com](mailto:FOIA@gitlab.com).

_Notes_: Forward FOIA-related agency notifications immediately.

## Category: `related_party_transaction_approval`

### Rule `LEG-RPT-0004` — Related Party Transaction Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `audit_committee_member_is_related_party` | `==` | `true` |  |

In plain English: `audit_committee_member_is_related_party` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Nominating and Corporate Governance Committee**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `nominating_and_corporate_governance_committee_preapproval`.

**Source:**
- doc_id: `gitlab/legal_gitlab_related_party_transactions_policy`
- section: GitLab Related Party Transactions Policy > PURPOSE > APPROVAL AUTHORITY
- url: https://handbook.gitlab.com/handbook/legal/gitlab-related-party-transactions-policy/

Verbatim quote from the policy corpus:

> In a situation where a member of our Audit Committee is a Related Party in the proposed transaction, our Nominating and Corporate Governance Committee will be the Approval Authority.

_Notes_: Applies when an Audit Committee member is a Related Party in the proposed transaction.

## Category: `related_party_transaction_ongoing_review`

### Rule `LEG-RPT-0002` — Related Party Transaction Ongoing Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `transaction_with_related_party` | `==` | `true` |  |
| `previously_approved_or_ratified` | `==` | `true` |  |
| `transaction_status` | `==` | `ongoing` |  |
| `remaining_term_months` | `>` | `6` | months |
| `remaining_amount_payable_or_receivable_usd` | `>` | `120000` | USD |

In plain English: `transaction_with_related_party` equals true AND `previously_approved_or_ratified` equals true AND `transaction_status` equals `ongoing` AND `remaining_term_months` exceeds 6 months AND `remaining_amount_payable_or_receivable_usd` exceeds 120000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Approval Authority**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `approval_authority_preapproval`.

**Source:**
- doc_id: `gitlab/legal_gitlab_related_party_transactions_policy`
- section: GitLab Related Party Transactions Policy > PURPOSE > APPROVAL PROCESS
- url: https://handbook.gitlab.com/handbook/legal/gitlab-related-party-transactions-policy/

Verbatim quote from the policy corpus:

> At least annually, the Approval Authority will review any previously approved or ratified transactions with Related Parties that remain ongoing and that have a remaining term of more than six months and remaining amounts payable to or receivable from us of more than $120,000 during the fiscal year. Based on all relevant facts and circumstances, the Approval Authority will determine whether it is in the best interests of the Company and its stockholders to continue, modify or terminate the transaction.

_Notes_: Review is required at least annually.

## Category: `related_party_transaction_preapproval`

### Rule `LEG-RPT-0001` — Related Party Transaction Preapproval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `transaction_with_related_party` | `==` | `true` |  |

In plain English: `transaction_with_related_party` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Chief Legal Officer** → **Approval Authority**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `chief_legal_officer_preapproval`, `approval_authority_preapproval`.
- Exceptions (overriding rules): `transaction is subject to standing pre-approval as provided in this policy`, `pursuant to a resolution adopted by the Approval Authority`
- Cross-domain refs: `PROC-AGREE-0001`

**Source:**
- doc_id: `gitlab/legal_gitlab_related_party_transactions_policy`
- section: GitLab Related Party Transactions Policy > PURPOSE > APPROVAL PROCESS
- url: https://handbook.gitlab.com/handbook/legal/gitlab-related-party-transactions-policy/

Verbatim quote from the policy corpus:

> Any transaction the Company intends to undertake with a Related Party, irrespective of the amounts involved (unless the transaction is subject to standing pre-approval as provided in this policy or pursuant to a resolution adopted by the Approval Authority), must be submitted to the Chief Legal Officer (the “***CLO***”) for their determination of the approvals required under this Policy. The CLO will refer to the Approval Authority any Related Party Transaction, and any other transaction that the CLO otherwise determines should be considered for evaluation by the Approval Authority consistent with the purpose of this Policy.

_Notes_: CLO determines required approvals and refers Related Party Transactions to the Approval Authority.

## Category: `related_party_transaction_ratification`

### Rule `LEG-RPT-0003` — Related Party Transaction Ratification

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `transaction_with_related_party` | `==` | `true` |  |
| `approval_or_ratification_required` | `==` | `true` |  |
| `approval_or_ratification_received` | `==` | `false` |  |

In plain English: `transaction_with_related_party` equals true AND `approval_or_ratification_required` equals true AND `approval_or_ratification_received` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO** → **Approval Authority**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`, `approval_authority_preapproval`.

**Source:**
- doc_id: `gitlab/legal_gitlab_related_party_transactions_policy`
- section: GitLab Related Party Transactions Policy > PURPOSE > APPROVAL PROCESS
- url: https://handbook.gitlab.com/handbook/legal/gitlab-related-party-transactions-policy/

Verbatim quote from the policy corpus:

> If the CLO learns of a transaction with a Related Party that required but did not receive approval or ratification under this Policy, the CLO will promptly submit the transaction to the Approval Authority. The Approval Authority will undertake the review described above.

_Notes_: Applies to transactions that should have received approval or ratification but did not.

## Category: `roadmap_disclaimer_requirement`

### Rule `LEG-DISC-0001` — Roadmap Disclaimer Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `required_disclaimers_guidance_indicates_roadmap_disclaimer` | `==` | `true` |  |

In plain English: `required_disclaimers_guidance_indicates_roadmap_disclaimer` equals true.

**Request supporting documents** before deciding.
- Required documents: `appropriate roadmap disclaimer`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `appropriate_roadmap_disclaimer`.
- Cross-domain refs: `PROC-IT-0001`, `Required Disclaimers guidance`, `appropriate roadmap disclaimer`

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> If indicated by the [Required Disclaimers guidance](https://handbook.gitlab.com/handbook/product/product-processes/product-safe-guidance/#required-disclaimers), the [appropriate roadmap disclaimer](https://docs.google.com/presentation/d/1hbf9AnFj_E5Y_Yg_WWoy_R0WJXZZLV0zWpMUHqnIs3c/edit#slide=id.ge2b39964d2_0_144) is included.

_Notes_: Include the roadmap disclaimer when indicated by the linked guidance.

## Category: `upcoming_feature_disclaimer_requirement`

### Rule `LEG-DISC-0003` — Upcoming Feature Disclaimer Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_references_upcoming_features` | `==` | `true` |  |

In plain English: `material_references_upcoming_features` equals true.

**Request supporting documents** before deciding.
- Required documents: `appropriate disclaimer`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `appropriate_disclaimer`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> If the material references upcoming products, features or functionality, the appropriate disclaimer is included.

_Notes_: Split from products, features, or functionality trigger.

## Category: `upcoming_functionality_disclaimer_requirement`

### Rule `LEG-DISC-0004` — Upcoming Functionality Disclaimer Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_references_upcoming_functionality` | `==` | `true` |  |

In plain English: `material_references_upcoming_functionality` equals true.

**Request supporting documents** before deciding.
- Required documents: `appropriate disclaimer`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `appropriate_disclaimer`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> If the material references upcoming products, features or functionality, the appropriate disclaimer is included.

_Notes_: Split from products, features, or functionality trigger.

## Category: `upcoming_product_disclaimer_requirement`

### Rule `LEG-DISC-0002` — Upcoming Product Disclaimer Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_references_upcoming_products` | `==` | `true` |  |

In plain English: `material_references_upcoming_products` equals true.

**Request supporting documents** before deciding.
- Required documents: `appropriate disclaimer`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `appropriate_disclaimer`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> If the material references upcoming products, features or functionality, the appropriate disclaimer is included.

_Notes_: Split from products, features, or functionality trigger.
