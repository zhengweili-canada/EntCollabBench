# Material Review (Internal & External)

_Legal approval policy — topic `material_review`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 35 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `amended_material_legal_review`

### Rule `LEG-MAT-0003` — Amended Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_change_type` | `==` | `substantive` |  |
| `legal_review_completed` | `==` | `true` |  |
| `material_audience` | `==` | `internal` |  |

In plain English: `material_change_type` equals `substantive` AND `legal_review_completed` equals true AND `material_audience` equals `internal`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **@sfriss**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `sfriss_preapproval`.
- Cross-domain refs: `PROC-AGREE-0001`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 1 Single material legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> If **any** substantive changes are made to the material after legal review, another legal review is required. Tag the appropriate reviewers ([`@sfriss`](https://gitlab.com/srissmiller) for internal materials, and [`@sfriss`](https://gitlab.com/srissmiller) and [`@LeeFalc`](https://gitlab.com/LeeFalc) for external materials) in the issue, or issue comment, created in step 1, requesting review of the amended material.

_Notes_: Applies to amended internal materials after prior legal review.

## Category: `amended_material_review`

### Rule `LEG-MATREV-0006` — Amended Material Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `substantive_changes_after_legal_review` | `==` | `true` |  |
| `material_use` | `==` | `internal` |  |

In plain English: `substantive_changes_after_legal_review` equals true AND `material_use` equals `internal`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **@sfriss**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `sfriss_preapproval`.

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 2 Multiple materials legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> If **any** substantive changes are made to the material after legal review, another legal review is required. Tag the appropriate reviewers ([`@sfriss`](https://gitlab.com/srissmiller) for internal materials, and [`@sfriss`](https://gitlab.com/srissmiller) and [`@LeeFalc`](https://gitlab.com/LeeFalc) for external materials) in the issue comment created in step 2, requesting review of the amended material.

_Notes_: Applies to amended internal materials after substantive changes following legal review.

## Category: `evaluation_agreement_approval`

### Rule `LEG-EVAL-0001` — Evaluation Agreement Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `customer_declines_trial_process` | `==` | `true` | boolean |
| `requested_agreement_type` | `==` | `Evaluation Agreement` | type |

In plain English: `customer_declines_trial_process` equals true AND `requested_agreement_type` equals `Evaluation Agreement`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Area Sales Manager or higher**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `area_sales_manager_or_higher_preapproval`.
- Cross-domain refs: `PROC-AGREE-0001`

**Source:**
- doc_id: `gitlab/legal_customer_negotiations`
- section: Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Request for a Trial or Evaluation Agreement
- url: https://handbook.gitlab.com/handbook/legal/customer-negotiations/

Verbatim quote from the policy corpus:

> If a customer declines the trial process and is adamant to have a separate Evaluation Agreement, the sales team member or solutions architect should:
> 
> * Open a Legal Request to request an Evaluation Agreement with Request Form.
> * The Legal Request should (i) include a request for approval from the Area Sales Manager or higher; and (ii) set forth applicable details to complete the Request Form, such as customer contact information, length of evaluation, number of users, etc.

_Notes_: Legal Request for a separate Evaluation Agreement must request approval from the Area Sales Manager or higher.

## Category: `external_disclosure_legal_approval`

### Rule `LEG-SAFE-0008` — External Disclosure Legal Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_categories` | `contains` | `sensitive_information` |  |

In plain English: `data_categories` contains `sensitive_information`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_legal_preapproval`.
- Cross-domain refs: `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **SAFE** > **Why SAFE?** > **WHAT IS SAFE?** > **Sensitive:**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> The **S** in “**S**AFE” serves as a reminder to make sure that team members are not sharing information which could be considered **S**ensitive information without express approval from GitLab Legal.

_Notes_: Sensitive information may not be shared externally without express GitLab Legal approval.

## Category: `external_disclosure_legal_escalation`

### Rule `LEG-SAFE-0007` — External Disclosure Legal Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `disclosure_uncertainty` | `==` | `true` |  |

In plain English: `disclosure_uncertainty` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_of_legal_corporate_preapproval`.
- Cross-domain refs: `FIN-ACCR-0004`

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **SAFE** > **Why SAFE?** > **WHAT IS SAFE?** > **Sensitive:**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> If in doubt, please inquire with the VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel before circulating this type of information externally.

_Notes_: Escalation applies before circulating this type of information externally.

## Category: `external_disclosure_legal_review`

### Rule `LEG-SAFE-0006` — External Disclosure Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_categories` | `contains` | `sensitive_information` |  |

In plain English: `data_categories` contains `sensitive_information`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_legal_preapproval`.
- Cross-domain refs: `FIN-ACCR-0004`

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **SAFE** > **Why SAFE?** > **WHAT IS SAFE?** > **Sensitive:**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> The disclosure of sensitive or material nonpublic information may be harmful to team members or the company. If the content to be disclosed includes any of the above information, team members should seek the GitLab Legal’s review via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel.

_Notes_: Legal review is sought via the #safe Slack channel.

## Category: `external_material_legal_review`

### Rule `LEG-EXTMAT-0001` — External Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_reference_type` | `==` | `quote` |  |
| `material_referenced_person_group` | `==` | `Section 16 Officer and VP, IR` |  |

In plain English: `material_reference_type` equals `quote` AND `material_referenced_person_group` equals `Section 16 Officer and VP, IR`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Examples - is Legal Review Necessary?
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> | Materials which quote, or are in the name of, a Section 16 Officer (namely Board Members, CEO, CFO, CLO, CRO, and CTO) and VP, IR | Yes |

### Rule `LEG-EXTMAT-0002` — External Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_financial_data_status` | `==` | `not_previously_disclosed_publicly` |  |

In plain English: `material_financial_data_status` equals `not_previously_disclosed_publicly`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-VEND-0015`

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Examples - is Legal Review Necessary?
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> | Materials which include financial data that has not been previously disclosed publicly, or a variation of previously disclosed financial data | Yes |

### Rule `LEG-EXTMAT-0003` — External Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `team_member_concern_topic` | `==` | `SAFE` |  |

In plain English: `team_member_concern_topic` equals `SAFE`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-BGSCRN-0002`, `PROC-SEC-0001`

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Examples - is Legal Review Necessary?
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> | Materials with which a Team Member has concerns related to SAFE or third-party IP | Yes |

### Rule `LEG-EXTMAT-0004` — External Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_topic` | `==` | `mergers` |  |

In plain English: `material_topic` equals `mergers`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Examples - is Legal Review Necessary?
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> | Materials related to mergers or acquisitions, including spin out, investment or acqui-hires | Yes |

### Rule `LEG-EXTMAT-0005` — External Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_topic` | `==` | `executive_organizational_changes` |  |

In plain English: `material_topic` equals `executive_organizational_changes`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-PO-0013`

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Examples - is Legal Review Necessary?
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> | Materials related to executive or other material organizational changes | Yes |

### Rule `LEG-EXTMAT-0006` — External Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_topic` | `==` | `quarterly_earnings` |  |

In plain English: `material_topic` equals `quarterly_earnings`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Examples - is Legal Review Necessary?
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> | Materials related to quarterly earnings, including future results and dates of earnings release | Yes |

_Notes_: Includes future results and dates of earnings release.

### Rule `LEG-EXTMAT-0007` — External Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_topic` | `==` | `product_rollout_to_business` |  |

In plain English: `material_topic` equals `product_rollout_to_business`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-PO-0013`

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Examples - is Legal Review Necessary?
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> | Materials related to roll out of products to the business, a new SKU, or changes to an existing SKU | Yes |

### Rule `LEG-EXTMAT-0008` — External Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_topic` | `==` | `crisis_communications` |  |

In plain English: `material_topic` equals `crisis_communications`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Examples - is Legal Review Necessary?
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> | Crisis communications | Yes |

## Category: `financial_information_external_disclosure`

### Rule `LEG-SAFE-0001` — Financial Information External Disclosure

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `data_categories` | `contains` | `financial_information` |  |
| `disclosure_audience` | `==` | `external` |  |

In plain English: `data_categories` contains `financial_information` AND `disclosure_audience` equals `external`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Chief Financial Officer**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `chief_financial_officer_preapproval`.

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **SAFE** > **Why SAFE?**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> The **F** in SA**F**E serves as a reminder that the company’s **F**inancial information is so important to protect that it requires Chief Financial Officer’s approval prior to sharing externally.

_Notes_: Financial information requires CFO approval before external sharing.

## Category: `insurance_certificate_distribution`

### Rule `LEG-INFO-0001` — Insurance Certificate Distribution

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `request_type` | `==` | `insurance_certificate` | request |

In plain English: `request_type` equals `insurance_certificate`.

**Request supporting documents** before deciding.
- Required documents: `insurance_certificate_distribution`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `insurance_certificate_distribution`.
- Cross-domain refs: `PROC-TERMS-0001`

**Source:**
- doc_id: `gitlab/legal_customer_negotiations`
- section: Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Requests for GitLab Financial Information and Insurance Certificates
- url: https://handbook.gitlab.com/handbook/legal/customer-negotiations/

Verbatim quote from the policy corpus:

> For Insurance Certificate requests, please open a Legal case in SFDC. **Note that our Certificate of Insurance is GitLab’s confidential information and either an NDA or agreed to Subscription terms need to be in place prior to distribution.**

_Notes_: Insurance certificate requests require a Legal case in SFDC and distribution only after NDA or agreed Subscription terms are in place.

## Category: `mandatory_materials_legal_review`

### Rule `LEG-MATREV-0008` — Mandatory Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_review_trigger` | `==` | `external_significant_product_offering_or_change` |  |

In plain English: `material_review_trigger` equals `external_significant_product_offering_or_change`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `New Product Introduction Process`, `PROC-RFP-0001`, `PROC-RFP-0002`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > When to use this process > Mandatory review
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> Review is **always** required for:
> 
> * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:
> 
>   + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)
>   + New SKU
> 
>     - E.g.: Materials announcing the general availability of a new SKU
>     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU
>   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)
> 
>     - E.g.: Materials announcing new pricing for an existing SKU
>   + Deprecation of an existing SKU
> 
>     - E.g.: Materials announcing the phasing out of an existing SKU
>   + Repackaging of features or product sets
> 
>     - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier.

_Notes_: Covers external materials tied to significant new product offerings or significant changes to existing product offerings.

### Rule `LEG-MATREV-0009` — Mandatory Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `safe_framework_requires_review` | `==` | `true` |  |

In plain English: `safe_framework_requires_review` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-SEC-0002`, `PROC-SOFT-0005`, `SAFE Framework Flowchart`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > When to use this process > Mandatory review
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart);

_Notes_: Applies when the SAFE Framework Flowchart determines review is required.

### Rule `LEG-MATREV-0010` — Mandatory Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_audience` | `==` | `external` |  |
| `material_review_trigger` | `==` | `leadership_quote_or_byline` |  |

In plain English: `material_audience` equals `external` AND `material_review_trigger` equals `leadership_quote_or_byline`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `GitLab Board of Directors`, `GitLab Executive Group`, `PROC-RFP-0001`, `PROC-RFP-0002`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > When to use this process > Mandatory review
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> Review is **always** required for:
> 
> * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:
> 
>   + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)
>   + New SKU
> 
>     - E.g.: Materials announcing the general availability of a new SKU
>     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU
>   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)
> 
>     - E.g.: Materials announcing new pricing for an existing SKU
>   + Deprecation of an existing SKU
> 
>     - E.g.: Materials announcing the phasing out of an existing SKU
>   + Repackaging of features or product sets
> 
>     - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier.
> * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart);
> * External materials which quote, or are written in the name of, any member of the [GitLab Executive Group](https://about.gitlab.com/company/team/e-group/); VP, Investor Relations; or a member of the [GitLab Board of Directors](https://about.gitlab.com/company/team/board-of-directors/);

_Notes_: Applies to external materials quoting or written in the name of listed leadership roles.

### Rule `LEG-MATREV-0011` — Mandatory Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_review_trigger` | `==` | `earnings_report_or_nonpublic_financial_data` |  |

In plain English: `material_review_trigger` equals `earnings_report_or_nonpublic_financial_data`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-RFP-0001`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > When to use this process > Mandatory review
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> Review is **always** required for:
> 
> * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:
> 
>   + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)
>   + New SKU
> 
>     - E.g.: Materials announcing the general availability of a new SKU
>     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU
>   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)
> 
>     - E.g.: Materials announcing new pricing for an existing SKU
>   + Deprecation of an existing SKU
> 
>     - E.g.: Materials announcing the phasing out of an existing SKU
>   + Repackaging of features or product sets
> 
>     - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier.
> * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart);
> * External materials which quote, or are written in the name of, any member of the [GitLab Executive Group](https://about.gitlab.com/company/team/e-group/); VP, Investor Relations; or a member of the [GitLab Board of Directors](https://about.gitlab.com/company/team/board-of-directors/);
> * Quarterly and year-end earnings reports, and materials which include financial data that has not been publicly disclosed, or a variation previously disclosed financial data;

_Notes_: Applies to earnings reports and materials with non-public or variant previously disclosed financial data.

### Rule `LEG-MATREV-0012` — Mandatory Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_review_trigger` | `==` | `ma_or_material_organizational_management_change` |  |

In plain English: `material_review_trigger` equals `ma_or_material_organizational_management_change`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-RFP-0001`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > When to use this process > Mandatory review
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> Review is **always** required for:
> 
> * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:
> 
>   + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)
>   + New SKU
> 
>     - E.g.: Materials announcing the general availability of a new SKU
>     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU
>   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)
> 
>     - E.g.: Materials announcing new pricing for an existing SKU
>   + Deprecation of an existing SKU
> 
>     - E.g.: Materials announcing the phasing out of an existing SKU
>   + Repackaging of features or product sets
> 
>     - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier.
> * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart);
> * External materials which quote, or are written in the name of, any member of the [GitLab Executive Group](https://about.gitlab.com/company/team/e-group/); VP, Investor Relations; or a member of the [GitLab Board of Directors](https://about.gitlab.com/company/team/board-of-directors/);
> * Quarterly and year-end earnings reports, and materials which include financial data that has not been publicly disclosed, or a variation previously disclosed financial data;
> * Materials relating to:
> 
>   + Mergers and acquisitions, including spin outs, investments, or acqui-hires; or
>   + Executive or other material organizational or management changes

_Notes_: Applies to materials relating to M&A, spin outs, investments, acqui-hires, executive changes, or other material organizational or management changes.

### Rule `LEG-MATREV-0013` — Mandatory Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_channel` | `==` | `social_media` |  |
| `material_review_trigger` | `==` | `mandatory_review_subject_or_material_nonpublic_information` |  |

In plain English: `material_channel` equals `social_media` AND `material_review_trigger` equals `mandatory_review_subject_or_material_nonpublic_information`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-SEC-0001`, `PROC-SEC-0002`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > When to use this process > Mandatory review
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> Review is **always** required for:
> 
> * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:
> 
>   + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)
>   + New SKU
> 
>     - E.g.: Materials announcing the general availability of a new SKU
>     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU
>   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)
> 
>     - E.g.: Materials announcing new pricing for an existing SKU
>   + Deprecation of an existing SKU
> 
>     - E.g.: Materials announcing the phasing out of an existing SKU
>   + Repackaging of features or product sets
> 
>     - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier.
> * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart);
> * External materials which quote, or are written in the name of, any member of the [GitLab Executive Group](https://about.gitlab.com/company/team/e-group/); VP, Investor Relations; or a member of the [GitLab Board of Directors](https://about.gitlab.com/company/team/board-of-directors/);
> * Quarterly and year-end earnings reports, and materials which include financial data that has not been publicly disclosed, or a variation previously disclosed financial data;
> * Materials relating to:
> 
>   + Mergers and acquisitions, including spin outs, investments, or acqui-hires; or
>   + Executive or other material organizational or management changes
> * Social media posts that cover or reference subjects that would normally require review (e.g. earnings reports, mergers and acquisitions, etc.) non-public financial data, or a variation of previously disclosed financial data, or those disclosing information related to anything in this list or any other material nonpublic information.

_Notes_: Applies to social media posts covering normally reviewed subjects, non-public financial data, listed topics, or other material nonpublic information.

## Category: `material_legal_review`

### Rule `LEG-MAT-0002` — Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `mandatory_review_required` | `==` | `true` |  |
| `material_type` | `==` | `video` |  |
| `video_production_status` | `==` | `not_yet_produced` |  |

In plain English: `mandatory_review_required` equals true AND `material_type` equals `video` AND `video_production_status` equals `not_yet_produced`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 1 Single material legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> If the review request is subject to [mandatory review](https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review) for a video not yet produced, review is required in respect of **both** (i) the slide deck, storyboard, and script (as appropriate, and in final form) before recording, **and** (ii) the final cut. Request review at each stage as set out in this process.

_Notes_: Review is required before recording for source materials and again for the final cut.

### Rule `LEG-MATREV-0001` — Material Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_use` | `==` | `external` |  |

In plain English: `material_use` equals `external`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-ACCR-0002`, `FIN-ACCR-0004`, `Guidelines for Use of Third-party IP in External Materials`, `SAFE Framework`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > MNPI and internally-confidential information > External vs Internal use
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> Materials for external use are reviewed (i) against the [SAFE Framework](https://handbook.gitlab.com/handbook/legal/safe-framework/), and (ii) against the [Guidelines for Use of Third-party IP in External Materials](https://handbook.gitlab.com/handbook/legal/ip-public-materials-guidelines/) for compliance with third-party intellectual property (IP) rights;

_Notes_: External-use materials require both SAFE Framework and third-party IP review.

## Category: `material_legal_review_negation`

### Rule `LEG-MAT-9001` — Material Legal Review Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `mandatory_review_required` | `!=` | `true` |  |

In plain English: `mandatory_review_required` is not true.

**Reject** when these conditions hold.
- Cross-domain refs: `LEG-MAT-0002`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 1 Single material legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> If the review request is subject to [mandatory review](https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review) for a video not yet produced, review is required in respect of **both** (i) the slide deck, storyboard, and script (as appropriate, and in final form) before recording, **and** (ii) the final cut. Request review at each stage as set out in this process.

_Notes_: [Synthesized negation sibling of LEG-MAT-0002] When the gating boolean is FALSE the matter falls into the inverse outcome. Review is required before recording for source materials and again for the final cut.

## Category: `materials_legal_review`

### Rule `LEG-MAT-0001` — Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_topic` | `==` | `new_product_offerings` |  |

In plain English: `material_topic` equals `new_product_offerings`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `legal_preapproval`.
- Cross-domain refs: `PROC-PRIV-0003`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Process fundamentals
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> Legal review is [mandatory](https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review) for, amongst other things, materials related to new product offerings, SKU changes, statements by E-Group members, financial data, and M&A activities.

_Notes_: Legal review is mandatory for materials related to new product offerings.

### Rule `LEG-MATREV-0002` — Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `contains_mnpi` | `==` | `true` |  |

In plain English: `contains_mnpi` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `PROC-PRIV-0003`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 1 Single material legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> Does the material contain material non-public information (MNPI) or information with restricted internal access?  If Yes, do not proceed and instead refer to the `MNPI and internally-confidential information` section in the Materials Legal Review Process.

_Notes_: Materials containing MNPI must use the MNPI and internally-confidential information process instead.

### Rule `LEG-MATREV-0003` — Materials Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_use` | `==` | `internal` |  |

In plain English: `material_use` equals `internal`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **@sfriss**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `sfriss_preapproval`.
- Cross-domain refs: `PROC-AGREE-0001`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 1 Single material legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> To obtain the review appropriate to your proposed use, you must tag the correct Legal & Corporate Affairs Team members in the issue description ([`@sfriss`](https://gitlab.com/srissmiller) for internal materials, and [`@sfriss`](https://gitlab.com/srissmiller) and [`@LeeFalc`](https://gitlab.com/LeeFalc) for external materials).

_Notes_: IP review is not required for materials created for internal use; only SAFE review is required.

## Category: `multiple_materials_review_planning`

### Rule `LEG-MATREV-0004` — Multiple Materials Review Planning

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `material_piece_count` | `>` | `5` | pieces |

In plain English: `material_piece_count` exceeds 5 pieces.

**Request supporting documents** before deciding.
- Required documents: `multiple_materials_review_planning`
- Approver chain: **Legal & Corporate Affairs Team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `multiple_materials_review_planning`.
- Cross-domain refs: `PROC-URGENT-0002`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 2 Multiple materials legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> For multiple materials legal review requests involving more than five pieces of material, the DRI must, no less than 5 business days before the materials will be ready for review, (i) notify the Legal & Corporate Affairs Team in [#legal](https://app.slack.com/client/T02592416/C78E74A6L) of the upcoming event, and (ii) arrange a sync with the Team to agree a timeline for the completion of the review.

_Notes_: Notification and sync must occur no less than 5 business days before materials are ready for review.

## Category: `unsafe_information_escalation`

### Rule `LEG-SAFE-0002` — Unsafe Information Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `disclosure_medium` | `==` | `personal_social_media_account` |  |
| `information_fits_safe_framework` | `==` | `false` |  |

In plain English: `disclosure_medium` equals `personal_social_media_account` AND `information_fits_safe_framework` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate** → **Vice President, Investor Relations**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_of_legal_corporate_preapproval`, `vice_president_investor_relations_preapproval`.

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **What if unSAFE information is shared?**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> If you shared or see information which has been shared via a personal social media account that does not fit within the SAFE framework, please immediately message the company’s VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel and include a screenshot when posting your message.
>    * After taking the screenshot, please remove the post immediately if you shared the information. The VP of Legal, Corporate and Vice President, Investor Relations will review it and advise on any further action necessary.

_Notes_: Include a screenshot when posting the message; remove the post immediately if you shared it.

### Rule `LEG-SAFE-0003` — Unsafe Information Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `disclosure_medium` | `==` | `issue` |  |
| `information_fits_safe_framework` | `==` | `false` |  |

In plain English: `disclosure_medium` equals `issue` AND `information_fits_safe_framework` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate** → **Vice President, Investor Relations**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_of_legal_corporate_preapproval`, `vice_president_investor_relations_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **What if unSAFE information is shared?**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> If you shared or see information which has been shared in an Issue or MR that does not fit within the SAFE framework, please immediately message the Company’s VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel and include a link to such Issue or MR when posting your message. Also mark the [MR or Issue “Confidential”](https://www.youtube.com/watch?v=RcaQaWzw2IQ).
>    * The VP of Legal, Corporate and Vice President, Investor Relations will review it and advise on any further action necessary.

_Notes_: Include a link to the Issue and mark the Issue confidential.

### Rule `LEG-SAFE-0004` — Unsafe Information Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `disclosure_medium` | `==` | `gitlab_unfiltered_video` |  |
| `information_fits_safe_framework` | `==` | `false` |  |

In plain English: `disclosure_medium` equals `gitlab_unfiltered_video` AND `information_fits_safe_framework` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate** → **Vice President, Investor Relations**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_of_legal_corporate_preapproval`, `vice_president_investor_relations_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **What if unSAFE information is shared?**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> If you shared or see information which has been shared via GitLab Unfiltered that does not fit within the SAFE framework, please mark the video as private. Once the video is private, please immediately message the VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel.
>    * The VP of Legal, Corporate and Vice President, Investor Relations will review it and determine next steps, which may include contacting the Digital Production team to have it removed.

_Notes_: Mark the video as private before messaging the VP of Legal, Corporate.

### Rule `LEG-SAFE-0005` — Unsafe Information Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `disclosure_medium` | `==` | `other_medium` |  |
| `information_fits_safe_framework` | `==` | `false` |  |

In plain English: `disclosure_medium` equals `other_medium` AND `information_fits_safe_framework` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate** → **Vice President, Investor Relations**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_of_legal_corporate_preapproval`, `vice_president_investor_relations_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **What if unSAFE information is shared?**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> If you shared or see information which has been shared via a another medium that does not fit within the SAFE framework please send a link to the original post immediately via Slack to the VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel.
>    * The VP of Legal, Corporate and Vice President, Investor Relations will review it and, if necessary, contact the appropriate [DRI](https://handbook.gitlab.com/handbook/people-group/directly-responsible-individuals/) to have the information revised to be compliant or if needed, removed.

_Notes_: Send a link to the original post via Slack.

## Category: `video_materials_review`

### Rule `LEG-MATREV-0007` — Video Materials Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `mandatory_review_required` | `==` | `true` |  |
| `material_type` | `==` | `video` |  |
| `video_produced` | `==` | `false` |  |

In plain English: `mandatory_review_required` equals true AND `material_type` equals `video` AND `video_produced` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `mandatory review`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 2 Multiple materials legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> If the review request is subject to [mandatory review](https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review) for a video not yet produced, review is required in respect of **both** the slide deck, storyboard and script (as appropriate) prior to recording **and** the final cut. Request review at each stage as set out in this process.

_Notes_: Review is required before recording and again for the final cut.

## Category: `video_materials_review_negation`

### Rule `LEG-MATREV-9002` — Video Materials Review Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `mandatory_review_required` | `!=` | `true` |  |

In plain English: `mandatory_review_required` is not true.

**Reject** when these conditions hold.
- Cross-domain refs: `LEG-MATREV-0007`

**Source:**
- doc_id: `gitlab/legal_materials_legal_review_process`
- section: Materials Legal Review Process > Track 2 Multiple materials legal review process
- url: https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/

Verbatim quote from the policy corpus:

> If the review request is subject to [mandatory review](https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review) for a video not yet produced, review is required in respect of **both** the slide deck, storyboard and script (as appropriate) prior to recording **and** the final cut. Request review at each stage as set out in this process.

_Notes_: [Synthesized negation sibling of LEG-MATREV-0007] When the gating boolean is FALSE the matter falls into the inverse outcome. Review is required before recording and again for the final cut.
