# Escalation, Investigations & Special Cases

_Legal approval policy — topic `escalation_ethics`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 16 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `case_study_publication_approval`

### Rule `LEG-CASE-0001` — Case Study Publication Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `materials_include_case_studies` | `==` | `true` |  |

In plain English: `materials_include_case_studies` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **customer** → **partner featured**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `customer_preapproval`, `partner_featured_preapproval`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> Case studies included are accurate, not misleading, and necessary approvals for publication from the customer or partner featured are in place and documented.

_Notes_: Necessary publication approvals must be documented.

## Category: `customer_negotiation_escalation`

### Rule `LEG-ESC-0001` — Customer Negotiation Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requester_type` | `==` | `customer` |  |
| `requested_material_non_standard_terms` | `==` | `true` |  |
| `transaction_merits_additional_consideration` | `==` | `true` |  |

In plain English: `requester_type` equals `customer` AND `requested_material_non_standard_terms` equals true AND `transaction_merits_additional_consideration` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab’s leadership**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_s_leadership_preapproval`.
- Cross-domain refs: `GitLab Escalation Process`, `PROC-AGREE-0001`, `PROC-ZIP-0006`

**Source:**
- doc_id: `gitlab/legal_customer_negotiations`
- section: Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Escalation Process
- url: https://handbook.gitlab.com/handbook/legal/customer-negotiations/

Verbatim quote from the policy corpus:

> If a customer or partner has requested material non-standard terms, and the transaction merits additional consideration by GitLab’s leadership, please follow the [GitLab Escalation Process](https://internal.gitlab.com/handbook/legal-and-corporate-affairs/legal-commercial/index.html/) (the “Process”).

_Notes_: Customer requests for material non-standard terms requiring leadership consideration must follow the GitLab Escalation Process.

## Category: `external_party_materials_approval`

### Rule `LEG-EXT-0001` — External Party Materials Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `uses_external_party_materials` | `==` | `true` |  |

In plain English: `uses_external_party_materials` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **external party**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `external_party_preapproval`.
- Cross-domain refs: `PROC-PRIV-0002`, `PROC-SEC-0001`

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> All required external approvals have been obtained prior to using an external party’s materials (e.g., Gartner, Forrester, etc.).

_Notes_: External approvals must be obtained before use.

## Category: `job_material_removal_permission`

### Rule `LEG-RET-0002` — Job Material Removal Permission

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_relation` | `==` | `job_related` |  |
| `record_action` | `==` | `remove` |  |

In plain English: `material_relation` equals `job_related` AND `record_action` equals `remove`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_record_retention_policy`
- section: Record Retention Policy
- url: https://handbook.gitlab.com/handbook/legal/record-retention-policy/

Verbatim quote from the policy corpus:

> Team members are reminded that materials relating to their jobs cannot be removed without GitLab’s permission.

_Notes_: Job-related materials require GitLab permission before removal.

## Category: `loa_legal_request`

### Rule `LEG-LOA-0001` — Loa Legal Request

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `loa_terms_type` | `==` | `non_standard` |  |
| `custom_terms_requested` | `==` | `true` |  |

In plain English: `loa_terms_type` equals `non_standard` AND `custom_terms_requested` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/legal_customer_negotiations`
- section: Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Letters of Authorization (LOA)
- url: https://handbook.gitlab.com/handbook/legal/customer-negotiations/

Verbatim quote from the policy corpus:

> If a partner requests a non-standard LOA with custom terms, please open a Legal Request in SFDC as outlined above.

## Category: `policy_change_management`

### Rule `LEG-POLICY-0001` — Policy Change Management

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `policy_action` | `==` | `implement_new_policy` |  |

In plain English: `policy_action` equals `implement_new_policy`.

**Request supporting documents** before deciding.
- Required documents: `issue template`
- Approver chain: **DRI** → **Board**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `issue_template`.

**Source:**
- doc_id: `gitlab/legal_ethics_compliance_program`
- section: GitLab's Ethics and Compliance Program > Compliance Standards, Guidelines & Other Resources > Policy Change Management
- url: https://handbook.gitlab.com/handbook/legal/ethics-compliance-program/

Verbatim quote from the policy corpus:

> Team members who wish to implement new policies and/or amendments to policies identified [here](https://docs.google.com/spreadsheets/d/1p5_02x6nBy1ftLYwhzTvm1lk47ijVdhlGVEJvU7M4xI/edit?usp=sharing) must document all necessary approvals (including DRI and Board, when necessary) using this [issue template](https://gitlab.com/gitlab-com/legal-and-compliance/-/blob/master/.gitlab/issue_templates/policy-requests.md?ref_type=heads) prior to that policy’s implementation.

_Notes_: DRI and Board approvals are included when necessary.

## Category: `publicity_waiver_release_requirement`

### Rule `LEG-WAIVER-0001` — Publicity Waiver Release Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `publicity_waiver_release_required` | `==` | `true` |  |

In plain English: `publicity_waiver_release_required` equals true.

**Request supporting documents** before deciding.
- Required documents: `signed Publicity Waiver and Release agreements`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `signed_publicity_waiver_and_release_agreements`.
- Cross-domain refs: `PROC-ENGAGE-0001`, `PROC-EVENT-0001`, `Publicity Waiver and Release`

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> Where [necessary](https://handbook.gitlab.com/handbook/legal/publicity-waiver-release/), signed Publicity Waiver and Release agreements are in place with named individuals, and individuals appearing in audio or visual content.

_Notes_: Signed agreements must be in place where necessary.

## Category: `publicity_waiver_release_requirement_negation`

### Rule `LEG-WAIVER-9004` — Publicity Waiver Release Requirement Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `publicity_waiver_release_required` | `!=` | `true` |  |

In plain English: `publicity_waiver_release_required` is not true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Cross-domain refs: `LEG-WAIVER-0001`

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> Where [necessary](https://handbook.gitlab.com/handbook/legal/publicity-waiver-release/), signed Publicity Waiver and Release agreements are in place with named individuals, and individuals appearing in audio or visual content.

_Notes_: [Synthesized negation sibling of LEG-WAIVER-0001] When the gating boolean is FALSE the matter falls into the inverse outcome. Signed agreements must be in place where necessary.

## Category: `record_destruction_transfer_review`

### Rule `LEG-RET-0001` — Record Destruction Transfer Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `record_scope` | `==` | `all_other_records` |  |
| `record_action` | `==` | `destruction` |  |

In plain English: `record_scope` equals `all_other_records` AND `record_action` equals `destruction`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal Department**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `legal_department_preapproval`.
- Cross-domain refs: `FIN-ACCR-0002`, `FIN-ACCR-0004`, `PROC-ENGAGE-0001`

**Source:**
- doc_id: `gitlab/legal_record_retention_policy`
- section: Record Retention Policy
- url: https://handbook.gitlab.com/handbook/legal/record-retention-policy/

Verbatim quote from the policy corpus:

> All other records must continue to be managed in accordance with GitLab Records Retention Policy. To ensure this, the Legal Department must be involved in all decisions concerning the destruction or transfer of such records.

_Notes_: Applies to decisions concerning destruction of all other records.

## Category: `rmdr_consultation`

### Rule `LEG-RMDR-0001` — Rmdr Consultation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_communication_accuses_wrongdoing` | `==` | `true` |  |

In plain English: `third_party_communication_accuses_wrongdoing` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `rmdr_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_risk_management_dispute_resolution`
- section: Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR
- url: https://handbook.gitlab.com/handbook/legal/risk-management-dispute-resolution/

Verbatim quote from the policy corpus:

> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:
> 
> * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company.

_Notes_: Third-party accusation of company wrongdoing requires immediate RMDR consultation.

### Rule `LEG-RMDR-0002` — Rmdr Consultation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `attorney_communication_received` | `==` | `true` |  |

In plain English: `attorney_communication_received` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `rmdr_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_risk_management_dispute_resolution`
- section: Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR
- url: https://handbook.gitlab.com/handbook/legal/risk-management-dispute-resolution/

Verbatim quote from the policy corpus:

> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:
> 
> * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company. **A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.**
> * If a team member receives a communication from an attorney representing a third party of any type, or other similar legal notice.

_Notes_: Communication from an attorney representing a third party requires immediate RMDR consultation.

### Rule `LEG-RMDR-0003` — Rmdr Consultation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `internal_wrongdoing_suspected` | `==` | `true` |  |

In plain English: `internal_wrongdoing_suspected` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `rmdr_preapproval`.
- Cross-domain refs: `FIN-ACCR-0002`, `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_risk_management_dispute_resolution`
- section: Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR
- url: https://handbook.gitlab.com/handbook/legal/risk-management-dispute-resolution/

Verbatim quote from the policy corpus:

> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:
> 
> * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company. **A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.**
> * If a team member receives a communication from an attorney representing a third party of any type, or other similar legal notice. **If another party involves an attorney, GitLab must involve its RMDR team.**
> * If a team member suspects wrongdoing within GitLab.

_Notes_: Suspected wrongdoing within GitLab requires immediate RMDR consultation.

### Rule `LEG-RMDR-0004` — Rmdr Consultation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `emergency_legal_implications` | `==` | `true` |  |

In plain English: `emergency_legal_implications` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `rmdr_preapproval`.
- Cross-domain refs: `PROC-AC-0002`, `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_risk_management_dispute_resolution`
- section: Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR
- url: https://handbook.gitlab.com/handbook/legal/risk-management-dispute-resolution/

Verbatim quote from the policy corpus:

> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:
> 
> * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company. **A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.**
> * If a team member receives a communication from an attorney representing a third party of any type, or other similar legal notice. **If another party involves an attorney, GitLab must involve its RMDR team.**
> * If a team member suspects wrongdoing within GitLab. **RMDR can confidentially discuss such matters with the appropriate legal resources, as necessary.**
> * If a team member has questions about the legal or regulatory landscape.
> * In the case of an emergency that may have legal implications, such as a cybersecurity incident or major system failure.

_Notes_: Emergencies that may have legal implications require immediate RMDR consultation.

## Category: `rmdr_consultation_negation`

### Rule `LEG-RMDR-9003` — Rmdr Consultation Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `attorney_communication_received` | `!=` | `true` |  |

In plain English: `attorney_communication_received` is not true.

**Reject** when these conditions hold.
- Cross-domain refs: `LEG-RMDR-0002`

**Source:**
- doc_id: `gitlab/legal_risk_management_dispute_resolution`
- section: Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR
- url: https://handbook.gitlab.com/handbook/legal/risk-management-dispute-resolution/

Verbatim quote from the policy corpus:

> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:
> 
> * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company. **A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.**
> * If a team member receives a communication from an attorney representing a third party of any type, or other similar legal notice.

_Notes_: [Synthesized negation sibling of LEG-RMDR-0002] When the gating boolean is FALSE the matter falls into the inverse outcome. Communication from an attorney representing a third party requires immediate RMDR consultation.

## Category: `third_party_risk_acceptance_approval`

### Rule `LEG-VEND-0002` — Third Party Risk Acceptance Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_risk_tier` | `==` | `Moderate` | tier |

In plain English: `vendor_risk_tier` equals `Moderate`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP and/or above**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_and_or_above_preapproval`.
- Cross-domain refs: `PROC-AC-0002`, `PROC-BGSCRN-0006`, `PROC-SEC-0001`, `PROC-SEC-0002`

**Source:**
- doc_id: `gitlab/legal_privacy`
- section: GitLab Privacy > Vendor Privacy Review
- url: https://handbook.gitlab.com/handbook/legal/privacy/

Verbatim quote from the policy corpus:

> For Third-Party Risk Acceptance, any Moderate/High risk requires VP and/or above approval

_Notes_: Applies to Third-Party Risk Acceptance.

## Category: `vendor_contract_review`

### Rule `LEG-VEND-0001` — Vendor Contract Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_procurement` | `==` | `true` |  |
| `contract_required` | `==` | `true` |  |

In plain English: `third_party_procurement` equals true AND `contract_required` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal Procurement team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_legal_procurement_team_preapproval`.
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-CONTR-0001`, `PROC-LEGAL-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > Third Party Risk Management > How do we ensure terms to establish GitLab (and our Vendors) rights and responsibilities?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Any time GitLab engages with a third party for the procurement of goods and/or services, which require GitLab to engage in a contract, the GitLab Legal Procurement team will review the terms and conditions.

_Notes_: Legal Procurement reviews terms and conditions for third-party procurement contracts.
