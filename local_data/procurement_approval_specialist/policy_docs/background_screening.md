# Background Screening

_Procurement approval policy — topic `background_screening`. This document is read by the **procurement_approval_specialist** during reviews involving this topic. 7 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `contractor_background_screening`

### Rule `PROC-BGSCRN-0001` — Contractor Background Screening

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `worker_type` | `==` | `contingent_worker` |  |
| `contingent_worker_employer_type` | `==` | `vendor` |  |

In plain English: `worker_type` equals `contingent_worker` AND `contingent_worker_employer_type` equals `vendor`.

**Request supporting documents** before deciding.
- Required documents: `proof of a completed background screening`, `signed attestation stating a background screening that meets GitLab’s requirements has been completed`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `proof_of_a_completed_background_screening`, `signed_attestation_stating_a_background_screening_that_meets_gitlab_s_requirements_has_been_completed`.

**Source:**
- doc_id: `gitlab/finance_procurement_contingent_worker_policy`
- section: Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING
- url: https://handbook.gitlab.com/handbook/finance/procurement/contingent-worker-policy/

Verbatim quote from the policy corpus:

> If a contingent worker is employed by a vendor, agency, professional services provider, or other entity GitLab will seek proof of a completed background screening or a signed attestation stating a background screening that meets GitLab’s requirements has been completed.

_Notes_: Source permits either listed document.

### Rule `PROC-BGSCRN-0002` — Contractor Background Screening

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `background_screening_results_of_concern` | `==` | `true` |  |

In plain English: `background_screening_results_of_concern` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-AC-0009`, `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_contingent_worker_policy`
- section: Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING
- url: https://handbook.gitlab.com/handbook/finance/procurement/contingent-worker-policy/

Verbatim quote from the policy corpus:

> Should any results of concern return, GitLab will review these results to determine if there is a security and/or safety related risk posed to GitLab’s team members, customers, vendors, and/or overall business.

### Rule `PROC-BGSCRN-0003` — Contractor Background Screening

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `worker_type` | `==` | `contingent_worker` |  |
| `requires_sso_access` | `==` | `true` |  |

In plain English: `worker_type` equals `contingent_worker` AND `requires_sso_access` equals true.

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `contractor_background_screening`.
- Cross-domain refs: `LEG-PURCH-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_contingent_worker_policy`
- section: Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING
- url: https://handbook.gitlab.com/handbook/finance/procurement/contingent-worker-policy/

Verbatim quote from the policy corpus:

> GitLab will complete or verify a background screening for all contingent workers requiring single sign-on access (SSO).

### Rule `PROC-BGSCRN-0004` — Contractor Background Screening

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `worker_type` | `==` | `contingent_worker` |  |
| `employer_background_screening_completed` | `==` | `false` |  |

In plain English: `worker_type` equals `contingent_worker` AND `employer_background_screening_completed` equals false.

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `contractor_background_screening`.

**Source:**
- doc_id: `gitlab/finance_procurement_contingent_worker_policy`
- section: Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING
- url: https://handbook.gitlab.com/handbook/finance/procurement/contingent-worker-policy/

Verbatim quote from the policy corpus:

> In the event a contingent worker’s employer has not completed a background screening, or the background screening does not meet GitLab’s minimum standards, GitLab will require the contingent worker to complete a background screening with GitLab’s background screening vendor Sterling, and will ensure background screenings are completed in compliance with local laws and regulations and seek the appropriate consent as needed.

_Notes_: Required screening is with GitLab’s background screening vendor Sterling.

### Rule `PROC-BGSCRN-0006` — Contractor Background Screening
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `employer_tprm_assessment_completed` | `==` | `true` |  |
| `employer_tprm_results` | `==` | `favorable` |  |

In plain English: `employer_tprm_assessment_completed` equals true AND `employer_tprm_results` equals `favorable`.

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `contractor_background_screening`.
- Cross-domain refs: `FIN-PO-0001`, `LEG-ETHICS-0001`, `Third Party Risk Management`

**Source:**
- doc_id: `gitlab/finance_procurement_contingent_worker_policy`
- section: Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING
- url: https://handbook.gitlab.com/handbook/finance/procurement/contingent-worker-policy/

Verbatim quote from the policy corpus:

> If GitLab has completed an assessment on a contingent worker’s employer in accordance with our [Third Party Risk Management](https://handbook.gitlab.com/handbook/security/security-assurance/security-risk/third-party-risk-management/) (TPRM) program and has received favorable results, additional verification of a background screening may not be required.

_Notes_: Discretionary waiver indicated by “may not be required.”

### Rule `PROC-BGSCRN-0007` — Contractor Background Screening

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `worker_type` | `==` | `contingent_worker` |  |
| `returning_to_service_at_gitlab` | `==` | `true` |  |
| `days_since_contract_completion` | `<=` | `90` | days |

In plain English: `worker_type` equals `contingent_worker` AND `returning_to_service_at_gitlab` equals true AND `days_since_contract_completion` is at most 90 days.

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `contractor_background_screening`.

**Source:**
- doc_id: `gitlab/finance_procurement_contingent_worker_policy`
- section: Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING
- url: https://handbook.gitlab.com/handbook/finance/procurement/contingent-worker-policy/

Verbatim quote from the policy corpus:

> Contingent worker’s returning to service at GitLab within 90 days of completion of their contract and contingent workers that receive a contract extension will not require an additional background screening or re-verification of background screening results.

## Category: `contractor_background_screening_negation`

### Rule `PROC-BGSCRN-9001` — Contractor Background Screening Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `employer_tprm_assessment_completed` | `!=` | `true` |  |

In plain English: `employer_tprm_assessment_completed` is not true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Cross-domain refs: `PROC-BGSCRN-0006`

**Source:**
- doc_id: `gitlab/finance_procurement_contingent_worker_policy`
- section: Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING
- url: https://handbook.gitlab.com/handbook/finance/procurement/contingent-worker-policy/

Verbatim quote from the policy corpus:

> If GitLab has completed an assessment on a contingent worker’s employer in accordance with our [Third Party Risk Management](https://handbook.gitlab.com/handbook/security/security-assurance/security-risk/third-party-risk-management/) (TPRM) program and has received favorable results, additional verification of a background screening may not be required.

_Notes_: [Synthesized negation sibling of PROC-BGSCRN-0006] When the gating boolean is FALSE the matter falls into the inverse outcome. Discretionary waiver indicated by “may not be required.”
