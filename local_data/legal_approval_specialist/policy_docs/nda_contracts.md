# NDAs & Contracts

_Legal approval policy — topic `nda_contracts`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 12 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `agreement_signature_approval`

### Rule `LEG-SIGN-0001` — Agreement Signature Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `document_type` | `==` | `agreement` | document_type |

In plain English: `document_type` equals `agreement`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal team member**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `legal_team_member_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`, `PROC-EVENT-0001`

**Source:**
- doc_id: `gitlab/legal_customer_negotiations`
- section: Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > How do I get an Agreement Signed
- url: https://handbook.gitlab.com/handbook/legal/customer-negotiations/

Verbatim quote from the policy corpus:

> All agreements require a Legal approval stamp in order to be signed. This stamp is placed on the agreement by a Legal team member when an executable version is reached.

_Notes_: Legal approval stamp is required before an agreement can be signed.

## Category: `contract_document_format`

### Rule `LEG-CONTR-0001` — Contract Document Format

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `document_type` | `==` | `contract_documents` | document_type |

In plain English: `document_type` equals `contract_documents`.

**Request supporting documents** before deciding.
- Required documents: `Word (.docx) format in English`
- Approver chain: **legal team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `word_docx_format_in_english`.
- Exceptions (overriding rules): `PDF versions are not acceptable for legal review`
- Cross-domain refs: `PROC-IT-0001`, `PROC-TERMS-0001`, `PROC-URGENT-0002`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> **All contract documents must be provided in Word (.docx) format in English.** PDF versions are not acceptable for legal review as they cannot be efficiently redlined. Contact the vendor to request the Word version before submitting your request.

_Notes_: Contract documents must be submitted in editable English Word format for legal review.

## Category: `contract_execution_approval`

### Rule `LEG-CONTR-0002` — Contract Execution Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `contract_execution_requested` | `==` | `true` |  |

In plain English: `contract_execution_requested` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal Team Member**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `legal_team_member_preapproval`.
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-NEG-0001`, `PROC-URGENT-0002`

**Source:**
- doc_id: `gitlab/legal_procurement_guide_collaborating_with_gitlab_legal`
- section: Procurement Guide: Collaborating with GitLab Legal > Signing Contracts
- url: https://handbook.gitlab.com/handbook/legal/procurement-guide-collaborating-with-gitlab-legal/

Verbatim quote from the policy corpus:

> In order to be executed, all Contracts must include the GitLab Legal stamp. This stamp confirms that the Contract has been reviewed and approved by a Legal Team Member.

_Notes_: Contract execution requires a GitLab Legal stamp confirming Legal Team Member review and approval.

## Category: `industry_analyst_content_approval`

### Rule `LEG-CONT-0001` — Industry Analyst Content Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `content_source_type` | `==` | `industry_analyst_content` |  |

In plain English: `content_source_type` equals `industry_analyst_content`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Analyst Relations**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `analyst_relations_preapproval`.

**Source:**
- doc_id: `gitlab/legal_ip_public_materials_guidelines`
- section: Guidelines for Use of Creative Assets and Third-party Content in External Materials > Industry Analyst Content Use
- url: https://handbook.gitlab.com/handbook/legal/ip-public-materials-guidelines/

Verbatim quote from the policy corpus:

> Any use of industry analyst content from firms such as Forrester Research, Gartner, and International Data Corporation (IDC) must be submitted for review and approval to Analyst Relations by filling out this [issue template](https://gitlab.com/gitlab-com/marketing/strategic-marketing/product-marketing/-/issues/new?issuable_template=AR-CitationReview).

_Notes_: Applies to any use of industry analyst content, including examples from Forrester Research, Gartner, and IDC.

## Category: `nda_before_vendor_disclosure`

### Rule `LEG-NDA-0001` — Nda Before Vendor Disclosure

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `sharing_gitlab_business_need_details` | `==` | `true` |  |
| `recipient_type` | `==` | `potential_vendor` |  |

In plain English: `sharing_gitlab_business_need_details` equals true AND `recipient_type` equals `potential_vendor`.

**Request supporting documents** before deciding.
- Required documents: `Mutual Non-Disclosure Agreement`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `mutual_non_disclosure_agreement`.
- Cross-domain refs: `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Before sharing details and/or confidential information regarding GitLab business needs, obtain a [Mutual Non-Disclosure Agreement](https://handbook.gitlab.com/handbook/legal/nda/) from the potential vendor(s).

_Notes_: NDA must be obtained before sharing GitLab business need details.

## Category: `nda_execution`

### Rule `LEG-NDA-0007` — Nda Execution

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `confidential_information_exchange` | `==` | `true` | boolean |

In plain English: `confidential_information_exchange` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `Non-Disclosure Agreement process`, `PROC-AGREE-0001`, `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/legal_procurement_guide_collaborating_with_gitlab_legal`
- section: Procurement Guide: Collaborating with GitLab Legal > NDA Process
- url: https://handbook.gitlab.com/handbook/legal/procurement-guide-collaborating-with-gitlab-legal/

Verbatim quote from the policy corpus:

> Prior to exchanging any confidential information, GitLab and a potential Vendor should execute a Mutual Non-Disclosure Agreement.

_Notes_: Mutual NDA should be executed before exchanging confidential information.

## Category: `nda_execution_authority`

### Rule `LEG-NDA-0002` — Nda Execution Authority

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `agreement_type` | `==` | `Non-Disclosure Agreement (NDA)` |  |

In plain English: `agreement_type` equals `Non-Disclosure Agreement (NDA)`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **team members with signature authority**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `team_members_with_signature_authority_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_nda`
- section: Non-Disclosure Agreement Process
- url: https://handbook.gitlab.com/handbook/legal/nda/

Verbatim quote from the policy corpus:

> Only team members with signature authority can execute agreements on behalf of GitLab, including Non-Disclosure Agreements (NDAs).

_Notes_: Only team members with signature authority may execute NDAs on behalf of GitLab.

## Category: `third_party_confidential_information_approval`

### Rule `LEG-NDA-0006` — Third Party Confidential Information Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_categories` | `contains` | `confidential_information` |  |
| `recipient_type` | `==` | `third_party` |  |

In plain English: `data_categories` contains `confidential_information` AND `recipient_type` equals `third_party`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Security Risk** → **Privacy teams**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `security_risk_preapproval`, `privacy_teams_preapproval`.
- Cross-domain refs: `GitLab’s Safe Framework Handbook`, `PROC-PRIV-0003`, `PROC-SEC-0001`, `PROC-VEND-0002`, `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/legal_nda`
- section: Non-Disclosure Agreement Process > Vendors or Other Third-Party NDAs
- url: https://handbook.gitlab.com/handbook/legal/nda/

Verbatim quote from the policy corpus:

> All confidential information shared with third parties must be reviewed and approved by Security Risk and Privacy teams prior to disclosure.

_Notes_: Approval is required prior to disclosure.

## Category: `third_party_nda_execution`

### Rule `LEG-NDA-0005` — Third Party Nda Execution

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `counterparty_type` | `==` | `third_party` |  |
| `counterparty_is_new` | `==` | `true` |  |

In plain English: `counterparty_type` equals `third_party` AND `counterparty_is_new` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-TERMS-0001`, `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/legal_nda`
- section: Non-Disclosure Agreement Process > Vendors or Other Third-Party NDAs
- url: https://handbook.gitlab.com/handbook/legal/nda/

Verbatim quote from the policy corpus:

> If a team member is engaging a new vendor or third party, GitLab’s NDA **must** be executed with them first before sharing any type of confidential information.

_Notes_: NDA must be executed before sharing confidential information.

## Category: `vendor_contract_required`

### Rule `LEG-CNTRCT-0001` — Vendor Contract Required

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_work` | `==` | `true` |  |

In plain English: `vendor_work` equals true.

**Request supporting documents** before deciding.
- Required documents: `completed contract`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `completed_contract`.
- Cross-domain refs: `FIN-PO-0001`, `PROC-AGREE-0001`, `PROC-LEGAL-0001`, `PROC-RFP-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> All work that is done with a vendor must have a completed contract to be compliant and work may not be started until a contract is in place.

_Notes_: Vendor work may not start until a contract is in place.

## Category: `vendor_nda_execution`

### Rule `LEG-NDA-0004` — Vendor Nda Execution

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `counterparty_type` | `==` | `vendor` |  |
| `counterparty_is_new` | `==` | `true` |  |

In plain English: `counterparty_type` equals `vendor` AND `counterparty_is_new` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-VEND-0001`, `PROC-AGREE-0001`, `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/legal_nda`
- section: Non-Disclosure Agreement Process > Vendors or Other Third-Party NDAs
- url: https://handbook.gitlab.com/handbook/legal/nda/

Verbatim quote from the policy corpus:

> If a team member is engaging a new vendor or third party, GitLab’s NDA **must** be executed with them first before sharing any type of confidential information.

_Notes_: NDA must be executed before sharing confidential information.

## Category: `vendor_nda_template_review`

### Rule `LEG-NDA-0003` — Vendor Nda Template Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_requires_own_nda_template` | `==` | `true` | boolean |
| `gitlab_template_sought` | `==` | `true` | boolean |

In plain English: `vendor_requires_own_nda_template` equals true AND `gitlab_template_sought` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `legal_preapproval`.
- Cross-domain refs: `PROC-ZIP-0007`, `PROC-ZIP-0008`, `Procurement Page`

**Source:**
- doc_id: `gitlab/legal_procurement_guide_collaborating_with_gitlab_legal`
- section: Procurement Guide: Collaborating with GitLab Legal > NDA Process
- url: https://handbook.gitlab.com/handbook/legal/procurement-guide-collaborating-with-gitlab-legal/

Verbatim quote from the policy corpus:

> If a potential vendor requires the use of their NDA template after seeking use of the GitLab template, please follow the process located on the [Procurement Page](https://handbook.gitlab.com/handbook/finance/procurement/) which will initiate the legal review process.

_Notes_: Vendor NDA templates require following the Procurement Page process to initiate legal review.
