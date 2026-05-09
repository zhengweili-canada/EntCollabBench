# Privacy & Personal Data

_Legal approval policy — topic `privacy`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 30 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `confidential_team_member_data_request_approval`

### Rule `LEG-PRIV-0034` — Confidential Team Member Data Request Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_confidentiality` | `==` | `confidential` | classification |
| `data_subject` | `==` | `team_member` | subject_type |
| `requester_affiliation` | `==` | `outside_company` | affiliation |

In plain English: `data_confidentiality` equals `confidential` AND `data_subject` equals `team_member` AND `requester_affiliation` equals `outside_company`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-VEND-0008`, `applicable local laws`

**Source:**
- doc_id: `gitlab/legal_privacy_employee_privacy_policy`
- section: Team Member Privacy Policy > How Does GitLab Handle Personal Data After Collection? > Storage of Personal Data
- url: https://handbook.gitlab.com/handbook/legal/privacy/employee-privacy-policy/

Verbatim quote from the policy corpus:

> Requests for confidential Team Member data from anyone outside our company under any circumstances must be approved in accordance with applicable local laws.

_Notes_: Approval is required for external requests for confidential Team Member data.

## Category: `data_processing_agreement_required`

### Rule `LEG-PRIV-0017` — Data Processing Agreement Required

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `personal_data_shared` | `==` | `true` | boolean |

In plain English: `personal_data_shared` equals true.

**Request supporting documents** before deciding.
- Required documents: `DPA`, `SCC’s`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `dpa`, `scc_s`.
- Cross-domain refs: `PROC-PRIV-0003`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Other Tips for Submitting Requests
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> If any personal data will be shared, the Vendor will need to sign our DPA and SCC’s as directed by state and/or country statutory requirements.

_Notes_: DPA and SCC requirements depend on applicable state and/or country statutory requirements.

## Category: `data_protection_impact_assessment`

### Rule `LEG-PRIV-0001` — Data Protection Impact Assessment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `processing_risk_level` | `==` | `high` | risk_level |

In plain English: `processing_risk_level` equals `high`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-PRIV-0001`

**Source:**
- doc_id: `gdpr/article-35`
- section: __prelude__
- url: https://gdpr-info.eu/art-35-gdpr/

Verbatim quote from the policy corpus:

> Where a type of processing in particular using new technologies, and taking into account the nature, scope, context and purposes of the processing, is likely to result in a high risk to the rights and freedoms of natural persons, the controller shall, prior to the processing, carry out an assessment of the impact of the envisaged processing operations on the protection of personal data.

_Notes_: DPIA must be carried out prior to processing likely to result in high risk.

### Rule `LEG-PRIV-0002` — Data Protection Impact Assessment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `processing_type` | `==` | `systematic_extensive_evaluation_of_personal_aspects` | processing_type |
| `automated_processing` | `==` | `true` | boolean |
| `decision_effect` | `==` | `legal_or_similarly_significant_effect` | effect_type |

In plain English: `processing_type` equals `systematic_extensive_evaluation_of_personal_aspects` AND `automated_processing` equals true AND `decision_effect` equals `legal_or_similarly_significant_effect`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-PRIV-0003`, `PROC-SEC-0001`

**Source:**
- doc_id: `gdpr/article-35`
- section: __prelude__
- url: https://gdpr-info.eu/art-35-gdpr/

Verbatim quote from the policy corpus:

> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of:
>    1. a systematic and extensive evaluation of personal aspects relating to natural persons which is based on automated processing, including profiling, and on which decisions are based that produce legal effects concerning the natural person or similarly significantly affect the natural person;

_Notes_: Includes profiling where decisions produce legal or similarly significant effects.

### Rule `LEG-PRIV-0003` — Data Protection Impact Assessment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `processing_scale` | `==` | `large_scale` | scale |
| `data_categories` | `contains` | `special_categories_article_9` | data_category |

In plain English: `processing_scale` equals `large_scale` AND `data_categories` contains `special_categories_article_9`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `Article 9(1)`, `PROC-SEC-0001`

**Source:**
- doc_id: `gdpr/article-35`
- section: __prelude__
- url: https://gdpr-info.eu/art-35-gdpr/

Verbatim quote from the policy corpus:

> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of:
>    1. a systematic and extensive evaluation of personal aspects relating to natural persons which is based on automated processing, including profiling, and on which decisions are based that produce legal effects concerning the natural person or similarly significantly affect the natural person;
>    2. processing on a large scale of special categories of data referred to in [Article 9](https://gdpr-info.eu/art-9-gdpr/)(1), or of personal data relating to criminal convictions and offences referred to in [Article 10](https://gdpr-info.eu/art-10-gdpr/);

_Notes_: Rule split from an OR condition covering special categories of data and criminal-conviction/offence data.

### Rule `LEG-PRIV-0004` — Data Protection Impact Assessment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `monitoring_area_accessibility` | `==` | `publicly_accessible` | area_accessibility |
| `monitoring_systematic` | `==` | `true` | boolean |
| `monitoring_scale` | `==` | `large_scale` | scale |

In plain English: `monitoring_area_accessibility` equals `publicly_accessible` AND `monitoring_systematic` equals true AND `monitoring_scale` equals `large_scale`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-SEC-0001`, `PROC-SEC-0002`

**Source:**
- doc_id: `gdpr/article-35`
- section: __prelude__
- url: https://gdpr-info.eu/art-35-gdpr/

Verbatim quote from the policy corpus:

> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of:
>    1. a systematic and extensive evaluation of personal aspects relating to natural persons which is based on automated processing, including profiling, and on which decisions are based that produce legal effects concerning the natural person or similarly significantly affect the natural person;
>    2. processing on a large scale of special categories of data referred to in [Article 9](https://gdpr-info.eu/art-9-gdpr/)(1), or of personal data relating to criminal convictions and offences referred to in [Article 10](https://gdpr-info.eu/art-10-gdpr/); or
>    3. a systematic monitoring of a publicly accessible area on a large scale.

_Notes_: DPIA is required for large-scale systematic monitoring of publicly accessible areas.

### Rule `LEG-PRIV-0020` — Data Protection Impact Assessment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `privacy_risk_level` | `==` | `high` |  |

In plain English: `privacy_risk_level` equals `high`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-SOFT-0006`

**Source:**
- doc_id: `gitlab/legal_privacy_dpia`
- section: Data Protection Impact Assessment (DPIA) > How are DPIAs Conducted?
- url: https://handbook.gitlab.com/handbook/legal/privacy/dpia/

Verbatim quote from the policy corpus:

> When a high level of risk is identified, the Privacy Team will collaborate with the relevant stakeholders to initiate and complete a DPIA. This typically will involve a Product Manager, business/technical owner, and the appropriate risk owner for the team.

_Notes_: High privacy risk triggers initiation and completion of a DPIA with relevant stakeholders.

## Category: `data_protection_impact_assessment_review`

### Rule `LEG-PRIV-0005` — Data Protection Impact Assessment Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `processing_risk_changed` | `==` | `true` | boolean |

In plain English: `processing_risk_changed` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-VEND-0002`, `PROC-VEND-0008`

**Source:**
- doc_id: `gdpr/article-35`
- section: __prelude__
- url: https://gdpr-info.eu/art-35-gdpr/

Verbatim quote from the policy corpus:

> Where necessary, the controller shall carry out a review to assess if processing is performed in accordance with the data protection impact assessment at least when there is a change of the risk represented by processing operations.

_Notes_: Review is required at least when processing risk changes.

## Category: `data_subprocessor_approval`

### Rule `LEG-PRIV-0006` — Data Subprocessor Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `engages_another_processor` | `==` | `true` |  |

In plain English: `engages_another_processor` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **controller**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `controller_preapproval`.

**Source:**
- doc_id: `gdpr/article-28`
- section: __prelude__
- url: https://gdpr-info.eu/art-28-gdpr/

Verbatim quote from the policy corpus:

> 2. 1The processor shall not engage another processor without prior specific or general written authorisation of the controller.

_Notes_: Prior authorisation may be specific or general written authorisation.

## Category: `data_subprocessor_change_notice`

### Rule `LEG-PRIV-0007` — Data Subprocessor Change Notice

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `subprocessor_authorisation_type` | `==` | `general_written` |  |
| `subprocessor_change_type` | `==` | `addition` |  |

In plain English: `subprocessor_authorisation_type` equals `general_written` AND `subprocessor_change_type` equals `addition`.

**Request supporting documents** before deciding.
- Required documents: `data_subprocessor_change_notice`
- Approver chain: **controller**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `data_subprocessor_change_notice`.

**Source:**
- doc_id: `gdpr/article-28`
- section: __prelude__
- url: https://gdpr-info.eu/art-28-gdpr/

Verbatim quote from the policy corpus:

> 2In the case of general written authorisation, the processor shall inform the controller of any intended changes concerning the addition or replacement of other processors, thereby giving the controller the opportunity to object to such changes.

_Notes_: Notification must give the controller the opportunity to object.

## Category: `data_transfer_safeguard_authorization`

### Rule `LEG-PRIV-0009` — Data Transfer Safeguard Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `appropriate_safeguard_mechanism` | `==` | `legally_binding_enforceable_public_authority_instrument` |  |

In plain English: `appropriate_safeguard_mechanism` equals `legally_binding_enforceable_public_authority_instrument`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:
>    1. a legally binding and enforceable instrument between public authorities or bodies;

_Notes_: Specific authorisation from a supervisory authority is not required for this safeguard mechanism.

### Rule `LEG-PRIV-0010` — Data Transfer Safeguard Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `appropriate_safeguard_mechanism` | `==` | `binding_corporate_rules` |  |

In plain English: `appropriate_safeguard_mechanism` equals `binding_corporate_rules`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `Article 47`

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:
>    1. a legally binding and enforceable instrument between public authorities or bodies;
>    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);

_Notes_: Specific authorisation from a supervisory authority is not required for this safeguard mechanism.

### Rule `LEG-PRIV-0011` — Data Transfer Safeguard Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `appropriate_safeguard_mechanism` | `==` | `commission_standard_data_protection_clauses` |  |

In plain English: `appropriate_safeguard_mechanism` equals `commission_standard_data_protection_clauses`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `Article 93(2)`, `PROC-PRIV-0001`, `PROC-PRIV-0003`

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:
>    1. a legally binding and enforceable instrument between public authorities or bodies;
>    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);
>    3. standard data protection clauses adopted by the Commission in accordance with the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);

_Notes_: Specific authorisation from a supervisory authority is not required for this safeguard mechanism.

### Rule `LEG-PRIV-0012` — Data Transfer Safeguard Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `appropriate_safeguard_mechanism` | `==` | `supervisory_authority_standard_data_protection_clauses_approved_by_commission` |  |

In plain English: `appropriate_safeguard_mechanism` equals `supervisory_authority_standard_data_protection_clauses_approved_by_commission`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `Article 93(2)`, `PROC-PRIV-0003`

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:
>    1. a legally binding and enforceable instrument between public authorities or bodies;
>    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);
>    3. standard data protection clauses adopted by the Commission in accordance with the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);
>    4. standard data protection clauses adopted by a supervisory authority and approved by the Commission pursuant to the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);

_Notes_: Specific authorisation from a supervisory authority is not required for this safeguard mechanism.

### Rule `LEG-PRIV-0013` — Data Transfer Safeguard Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `appropriate_safeguard_mechanism` | `==` | `approved_code_of_conduct_with_binding_enforceable_commitments` |  |

In plain English: `appropriate_safeguard_mechanism` equals `approved_code_of_conduct_with_binding_enforceable_commitments`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `Article 40`, `PROC-PRIV-0003`

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:
>    1. a legally binding and enforceable instrument between public authorities or bodies;
>    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);
>    3. standard data protection clauses adopted by the Commission in accordance with the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);
>    4. standard data protection clauses adopted by a supervisory authority and approved by the Commission pursuant to the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);
>    5. an approved code of conduct pursuant to [Article 40](https://gdpr-info.eu/art-40-gdpr/) together with binding and enforceable commitments of the controller or processor in the third country to apply the appropriate safeguards, including as regards data subjects’ rights; or

_Notes_: Specific authorisation from a supervisory authority is not required for this safeguard mechanism.

### Rule `LEG-PRIV-0014` — Data Transfer Safeguard Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `appropriate_safeguard_mechanism` | `==` | `approved_certification_mechanism_with_binding_enforceable_commitments` |  |

In plain English: `appropriate_safeguard_mechanism` equals `approved_certification_mechanism_with_binding_enforceable_commitments`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `Article 42`, `PROC-PRIV-0003`, `PROC-SEC-0001`

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:
>    1. a legally binding and enforceable instrument between public authorities or bodies;
>    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);
>    3. standard data protection clauses adopted by the Commission in accordance with the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);
>    4. standard data protection clauses adopted by a supervisory authority and approved by the Commission pursuant to the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);
>    5. an approved code of conduct pursuant to [Article 40](https://gdpr-info.eu/art-40-gdpr/) together with binding and enforceable commitments of the controller or processor in the third country to apply the appropriate safeguards, including as regards data subjects’ rights; or
>    6. an approved certification mechanism pursuant to [Article 42](https://gdpr-info.eu/art-42-gdpr/) together with binding and enforceable commitments of the controller or processor in the third country to apply the appropriate safeguards, including as regards data subjects’ rights.

_Notes_: Specific authorisation from a supervisory authority is not required for this safeguard mechanism.

## Category: `data_transfer_safeguards`

### Rule `LEG-PRIV-0008` — Data Transfer Safeguards

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_transfer_type` | `==` | `personal_data` |  |
| `adequacy_decision_article_45_3_present` | `==` | `false` |  |
| `recipient_location_type` | `==` | `third_country` |  |
| `appropriate_safeguards_provided` | `==` | `true` |  |
| `enforceable_data_subject_rights_available` | `==` | `true` |  |
| `effective_legal_remedies_available` | `==` | `true` |  |

In plain English: `data_transfer_type` equals `personal_data` AND `adequacy_decision_article_45_3_present` equals false AND `recipient_location_type` equals `third_country` AND `appropriate_safeguards_provided` equals true AND `enforceable_data_subject_rights_available` equals true AND `effective_legal_remedies_available` equals true.

**Request supporting documents** before deciding.
- Required documents: `data_transfer_safeguards`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `data_transfer_safeguards`.
- Cross-domain refs: `Article 45(3)`

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 1. In the absence of a decision pursuant to [Article 45](https://gdpr-info.eu/art-45-gdpr/)(3), a controller or processor may transfer personal data to a third country or an international organisation only if the controller or processor has provided appropriate safeguards, and on condition that enforceable data subject rights and effective legal remedies for data subjects are available.

_Notes_: Applies to transfers to a third country in the absence of an Article 45(3) decision.

## Category: `data_transfer_supervisory_authorization`

### Rule `LEG-PRIV-0015` — Data Transfer Supervisory Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `appropriate_safeguard_mechanism` | `==` | `contractual_clauses_with_third_country_or_international_organisation_recipient` |  |

In plain English: `appropriate_safeguard_mechanism` equals `contractual_clauses_with_third_country_or_international_organisation_recipient`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **competent supervisory authority**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `competent_supervisory_authority_preapproval`.
- Cross-domain refs: `PROC-PRIV-0003`

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 3. Subject to the authorisation from the competent supervisory authority, the appropriate safeguards referred to in paragraph 1 may also be provided for, in particular, by:
>    1. contractual clauses between the controller or processor and the controller, processor or the recipient of the personal data in the third country or international organisation; or

_Notes_: This safeguard mechanism is subject to authorisation from the competent supervisory authority.

### Rule `LEG-PRIV-0016` — Data Transfer Supervisory Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `appropriate_safeguard_mechanism` | `==` | `administrative_arrangements_with_enforceable_effective_data_subject_rights` |  |

In plain English: `appropriate_safeguard_mechanism` equals `administrative_arrangements_with_enforceable_effective_data_subject_rights`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **competent supervisory authority**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `competent_supervisory_authority_preapproval`.
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-PRIV-0003`, `PROC-SEC-0001`

**Source:**
- doc_id: `gdpr/article-46`
- section: __prelude__
- url: https://gdpr-info.eu/art-46-gdpr/

Verbatim quote from the policy corpus:

> 3. Subject to the authorisation from the competent supervisory authority, the appropriate safeguards referred to in paragraph 1 may also be provided for, in particular, by:
>    1. contractual clauses between the controller or processor and the controller, processor or the recipient of the personal data in the third country or international organisation; or
>    2. provisions to be inserted into administrative arrangements between public authorities or bodies which include enforceable and effective data subject rights.

_Notes_: This safeguard mechanism is subject to authorisation from the competent supervisory authority.

## Category: `law_enforcement_emergency_disclosure`

### Rule `LEG-PRIV-0029` — Law Enforcement Emergency Disclosure
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requester_type` | `==` | `law_enforcement` |  |
| `good_faith_belief` | `==` | `true` |  |
| `emergency_circumstance` | `==` | `imminent_danger_of_death_or_serious_physical_injury` |  |

In plain English: `requester_type` equals `law_enforcement` AND `good_faith_belief` equals true AND `emergency_circumstance` equals `imminent_danger_of_death_or_serious_physical_injury`.

**Request supporting documents** before deciding.
- Required documents: `law_enforcement_emergency_disclosure`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `law_enforcement_emergency_disclosure`.
- Cross-domain refs: `PROC-SOFT-0006`

**Source:**
- doc_id: `gitlab/legal_privacy_law_enforcement_guidelines`
- section: Guidelines for Law Enforcement Requests > Emergency Requests
- url: https://handbook.gitlab.com/handbook/legal/privacy/law-enforcement-guidelines/

Verbatim quote from the policy corpus:

> If, based on information provided by law enforcement, GitLab has a good faith belief that there is a legitimate emergency involving imminent danger of death or serious physical injury to any person, or other exigent circumstances, GitLab may provide information necessary to prevent that harm if we are in a position to do so, consistent with applicable law.

_Notes_: Emergency disclosures are evaluated case-by-case.

## Category: `law_enforcement_emergency_request_review`

### Rule `LEG-PRIV-0035` — Law Enforcement Emergency Request Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requester_type` | `==` | `foreign_law_enforcement` |  |
| `request_urgency` | `==` | `emergency` |  |

In plain English: `requester_type` equals `foreign_law_enforcement` AND `request_urgency` equals `emergency`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-VEND-0002`, `PROC-VEND-0005`

**Source:**
- doc_id: `gitlab/legal_privacy_law_enforcement_guidelines`
- section: Guidelines for Law Enforcement Requests > International Law Enforcement and Public Authority Requests
- url: https://handbook.gitlab.com/handbook/legal/privacy/law-enforcement-guidelines/

Verbatim quote from the policy corpus:

> We will evaluate emergency requests from foreign law enforcement on a case-by-case basis consistent with U.S. laws and the laws of other countries if applicable.

_Notes_: Evaluation must be consistent with U.S. laws and other countries' laws where applicable.

## Category: `law_enforcement_preservation_extension`

### Rule `LEG-PRIV-0030` — Law Enforcement Preservation Extension

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requestor_type` | `==` | `law_enforcement` |  |
| `request_type` | `==` | `preservation_extension_request` |  |
| `preservation_extension_request_count` | `<=` | `1` | requests |

In plain English: `requestor_type` equals `law_enforcement` AND `request_type` equals `preservation_extension_request` AND `preservation_extension_request_count` is at most 1 requests.

**Approve** outright when these conditions hold.

**Source:**
- doc_id: `gitlab/legal_privacy_law_enforcement_guidelines`
- section: Guidelines for Law Enforcement Requests > Preservation Requests
- url: https://handbook.gitlab.com/handbook/legal/privacy/law-enforcement-guidelines/

Verbatim quote from the policy corpus:

> Law enforcement may request one (1) extension of the preservation request for an additional ninety (90) days.

_Notes_: Only one preservation extension may be requested.

## Category: `law_enforcement_preservation_request_documentation`

### Rule `LEG-PRIV-0031` — Law Enforcement Preservation Request Documentation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `request_type` | `==` | `preservation_request` |  |

In plain English: `request_type` equals `preservation_request`.

**Request supporting documents** before deciding.
- Required documents: `official law enforcement letterhead`, `signature by a law enforcement official`, `required identifiers for the user whose information is requested to be preserved`, `statement that steps are being taken to obtain a court order or other legal process for the data sought to be preserved`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `official_law_enforcement_letterhead`, `signature_by_a_law_enforcement_official`, `required_identifiers_for_the_user_whose_information_is_requested_to_be_preserved`, `statement_that_steps_are_being_taken_to_obtain_a_court_order_or_other_legal_process_for_the_data_sought_to_be_preserved`.
- Cross-domain refs: `PROC-PRIV-0001`

**Source:**
- doc_id: `gitlab/legal_privacy_law_enforcement_guidelines`
- section: Guidelines for Law Enforcement Requests > Preservation Requests
- url: https://handbook.gitlab.com/handbook/legal/privacy/law-enforcement-guidelines/

Verbatim quote from the policy corpus:

> Preservation requests must be sent on official law enforcement letterhead, signed by a law enforcement official and must include:
> 
> * Required identifiers for the user whose information is requested to be preserved;
> * A statement that steps are being taken to obtain a court order or other legal process for the data sought to be preserved.

_Notes_: Preservation requests must include the listed documentation and signature elements.

## Category: `law_enforcement_request_response`

### Rule `LEG-PRIV-0032` — Law Enforcement Request Response

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `request_type` | `==` | `MLAT_request` |  |
| `request_properly_served` | `==` | `true` |  |
| `request_appropriately_scoped` | `==` | `true` |  |
| `request_within_authority_power` | `==` | `true` |  |
| `applicable_law_compliance` | `==` | `true` |  |

In plain English: `request_type` equals `MLAT_request` AND `request_properly_served` equals true AND `request_appropriately_scoped` equals true AND `request_within_authority_power` equals true AND `applicable_law_compliance` equals true.

**Request supporting documents** before deciding.
- Required documents: `law_enforcement_request_response`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `law_enforcement_request_response`.

**Source:**
- doc_id: `gitlab/legal_privacy_law_enforcement_guidelines`
- section: Guidelines for Law Enforcement Requests > International Law Enforcement and Public Authority Requests
- url: https://handbook.gitlab.com/handbook/legal/privacy/law-enforcement-guidelines/

Verbatim quote from the policy corpus:

> GitLab will respond to MLAT requests only when they are properly served, appropriately scoped, within the power of the requesting authority or agency, and otherwise in accordance with applicable laws.

_Notes_: Applies to Mutual Legal Assistance Treaty requests.

## Category: `law_enforcement_user_information_request`

### Rule `LEG-PRIV-0022` — Law Enforcement User Information Request

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_categories` | `contains` | `Customer support records` | category |

In plain English: `data_categories` contains `Customer support records`.

**Request supporting documents** before deciding.
- Required documents: `Subpoena`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `subpoena`.

**Source:**
- doc_id: `gitlab/legal_privacy_law_enforcement_guidelines`
- section: Guidelines for Law Enforcement Requests > Available GitLab User Information
- url: https://handbook.gitlab.com/handbook/legal/privacy/law-enforcement-guidelines/

Verbatim quote from the policy corpus:

> **User Information Responsive to a Subpoena**
> 
> * Basic subscriber information available under ECPA; and
> * Customer support records.

_Notes_: Customer support records are responsive to a subpoena.

### Rule `LEG-PRIV-0027` — Law Enforcement User Information Request

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_categories` | `contains` | `Billing invoices` | category |

In plain English: `data_categories` contains `Billing invoices`.

**Request supporting documents** before deciding.
- Required documents: `2703(d) Court Order`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `2703_d_court_order`.

**Source:**
- doc_id: `gitlab/legal_privacy_law_enforcement_guidelines`
- section: Guidelines for Law Enforcement Requests > Available GitLab User Information
- url: https://handbook.gitlab.com/handbook/legal/privacy/law-enforcement-guidelines/

Verbatim quote from the policy corpus:

> **User Information Responsive to a 2703(d) Court Order**
> 
> * Basic subscriber information available under ECPA;
> * Customer support records;
> * Metadata related to services usage activity;
> * Metadata related to website usage; and
> * Billing invoices.

_Notes_: Billing invoices are responsive to a 2703(d) Court Order.

### Rule `LEG-PRIV-0028` — Law Enforcement User Information Request

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_categories` | `==` | `All other User Information` | category |

In plain English: `data_categories` equals `All other User Information`.

**Request supporting documents** before deciding.
- Required documents: `search warrant`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `search_warrant`.

**Source:**
- doc_id: `gitlab/legal_privacy_law_enforcement_guidelines`
- section: Guidelines for Law Enforcement Requests > Available GitLab User Information
- url: https://handbook.gitlab.com/handbook/legal/privacy/law-enforcement-guidelines/

Verbatim quote from the policy corpus:

> All other User Information requires a search warrant.

_Notes_: User information not otherwise listed requires a search warrant.

## Category: `vendor_data_subprocessor_documentation`

### Rule `LEG-PRIV-0033` — Vendor Data Subprocessor Documentation
_Severity: recommended_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_service_includes_accessing_gitlab_data` | `==` | `true` | boolean |

In plain English: `vendor_service_includes_accessing_gitlab_data` equals true.

**Request supporting documents** before deciding.
- Required documents: `list of sub-processors`
- Approver chain: **GitLab Legal team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `list_of_sub_processors`.
- Cross-domain refs: `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/legal_procurement_guide_collaborating_with_gitlab_legal`
- section: Procurement Guide: Collaborating with GitLab Legal > Negotiating Terms
- url: https://handbook.gitlab.com/handbook/legal/procurement-guide-collaborating-with-gitlab-legal/

Verbatim quote from the policy corpus:

> In the event a vendor is providing services which include accessing, processing or controlling GitLab data, the GitLab Legal team may require the vendor to provide the list of sub-processors relevant to the services provided to GitLab.

_Notes_: The source uses discretionary language: may require.

## Category: `vendor_privacy_review`

### Rule `LEG-PRIV-0018` — Vendor Privacy Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_handles_personal_data` | `==` | `true` | boolean |

In plain English: `vendor_handles_personal_data` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-PRIV-0002`, `PROC-PRIV-0003`, `Procurement process`

**Source:**
- doc_id: `gitlab/legal_privacy`
- section: GitLab Privacy > Privacy Review Process
- url: https://handbook.gitlab.com/handbook/legal/privacy/

Verbatim quote from the policy corpus:

> Every vendor that handles personal data is required to go through a Privacy Review prior to being onboarded, which includes completion and approval of the privacy due diligence questionnaires detailed in the [Procurement process](https://handbook.gitlab.com/handbook/finance/procurement/#privacy-review-4-14-days).

_Notes_: Privacy Review is required before onboarding and includes completion and approval of privacy due diligence questionnaires.

### Rule `LEG-PRIV-0019` — Vendor Privacy Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_classification` | `==` | `red` | classification |

In plain English: `data_classification` equals `red`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `Data Classification Standards`, `PROC-BGSCRN-0006`, `PROC-SEC-0001`

**Source:**
- doc_id: `gitlab/legal_privacy`
- section: GitLab Privacy > Privacy Review Process
- url: https://handbook.gitlab.com/handbook/legal/privacy/

Verbatim quote from the policy corpus:

> Certain vendors who are classified as handling red or orange data under our [Data Classification Standards](https://handbook.gitlab.com/handbook/security/policies_and_standards/data-classification-standard/) are reviewed annually.

_Notes_: Split from source phrase covering red or orange data.
