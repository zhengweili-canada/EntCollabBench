# Sales, Revenue & GTM

_Legal approval policy — topic `sales_revenue`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 7 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `accuracy_dri_approval`

### Rule `LEG-ACC-0001` — Accuracy Dri Approval
_Severity: recommended_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `has_citable_reference` | `==` | `false` |  |

In plain English: `has_citable_reference` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **DRI**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `dri_preapproval`.
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-SEC-0001`, `PROC-SEC-0002`, `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/legal_safe_framework`
- section: GitLab SAFE Framework > **SAFE** > **Why SAFE?** > **WHAT IS SAFE?** > **Accurate:**
- url: https://handbook.gitlab.com/handbook/legal/safe-framework/

Verbatim quote from the policy corpus:

> If you are not able to cite a reference or you are not the [DRI](https://handbook.gitlab.com/handbook/people-group/directly-responsible-individuals/) for this information, did you receive approval from the [DRI](https://handbook.gitlab.com/handbook/people-group/directly-responsible-individuals/) to share this data?

_Notes_: Extracted from a 'Things to consider before disclosing' accuracy checklist.

## Category: `external_materials_claim_substantiation`

### Rule `LEG-CLAIM-0001` — External Materials Claim Substantiation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `materials_include_express_or_implied_claims` | `==` | `true` |  |

In plain English: `materials_include_express_or_implied_claims` equals true.

**Request supporting documents** before deciding.
- Required documents: `Backup materials and data verifying any express or implied claims`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `backup_materials_and_data_verifying_any_express_or_implied_claims`.

**Source:**
- doc_id: `gitlab/legal_external_materials_compliance_tips`
- section: External Materials Compliance Tips > Compliance checklist
- url: https://handbook.gitlab.com/handbook/legal/external-materials-compliance-tips/

Verbatim quote from the policy corpus:

> Backup materials and data verifying any express or implied claims in the materials are saved and accessible.

_Notes_: Backup materials and data must be saved and accessible.

## Category: `laca_expenditure_approval`

### Rule `LEG-EXP-0001` — Laca Expenditure Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `funding_source` | `==` | `LACA funds` |  |

In plain English: `funding_source` equals `LACA funds`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **applicable stakeholders**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `applicable_stakeholders_preapproval`.
- Cross-domain refs: `FIN-EXP-0004`, `FIN-EXP-0005`

**Source:**
- doc_id: `gitlab/legal_legalops`
- section: Stategy & Legal Operations > Legal & Corporate Affairs Expenditure Request Process
- url: https://handbook.gitlab.com/handbook/legal/legalops/

Verbatim quote from the policy corpus:

> All requests for use of LACA funds require approval from applicable stakeholders within the LACA Expenditure Request Issue Template.

## Category: `non_standard_gtm_pricing_approval`

### Rule `LEG-GTM-0001` — Non Standard Gtm Pricing Approval
_Severity: recommended_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `sales_related_request` | `==` | `true` |  |
| `non_standard_gtm_structure` | `==` | `true` |  |

In plain English: `sales_related_request` equals true AND `non_standard_gtm_structure` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **appropriate stakeholders**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `appropriate_stakeholders_preapproval`.
- Cross-domain refs: `PROC-IT-0001`, `PROC-RFP-0001`

**Source:**
- doc_id: `gitlab/legal_customer_negotiations`
- section: Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Request for Non-Standard Go-To-Market and Pricing From Legal
- url: https://handbook.gitlab.com/handbook/legal/customer-negotiations/

Verbatim quote from the policy corpus:

> All sales-related requests for a non-standard GTM structure, including pricing and packaging variations (e.g. OEM), will likely require Legal assistance but should begin with an Issue opened by the requestor on the Product board [here](https://gitlab.com/gitlab-com/Product/-/issues/new) to properly vet the monetization request with the appropriate cross-functional stakeholders. Please choose either the **monetization-intake** template or the **monetization-intake-simple** template. Once created, the issue will alert the appropriate stakeholders for internal review, comments, and approvals.

_Notes_: Request should begin with a Product board issue using the monetization intake template.

## Category: `purchase_legal_review`

### Rule `LEG-PURCH-0001` — Purchase Legal Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_made` | `==` | `true` |  |

In plain English: `purchase_made` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_legal_preapproval`.
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-TERMS-0001`, `PROC-VEND-0008`, `The Procurement Handbook Page`

**Source:**
- doc_id: `gitlab/legal_procurement_guide_collaborating_with_gitlab_legal`
- section: Procurement Guide: Collaborating with GitLab Legal > When is Legal involved
- url: https://handbook.gitlab.com/handbook/legal/procurement-guide-collaborating-with-gitlab-legal/

Verbatim quote from the policy corpus:

> GitLab Legal will review any and all purchases made to ensure adequate legal terms are present for GitLab to ensure alignment with GitLab’s risk standards.

_Notes_: Applies to all purchases made.

## Category: `quote_rights_approval`

### Rule `LEG-QUOTE-0001` — Quote Rights Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `quote_references_gitlab_customer_by_name` | `==` | `true` | boolean |

In plain English: `quote_references_gitlab_customer_by_name` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **#customer-advocacy-and-references**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `customer_advocacy_and_references_preapproval`.
- Cross-domain refs: `PROC-ENGAGE-0001`

**Source:**
- doc_id: `gitlab/legal_ip_public_materials_guidelines`
- section: Guidelines for Use of Creative Assets and Third-party Content in External Materials > Quotes > Do
- url: https://handbook.gitlab.com/handbook/legal/ip-public-materials-guidelines/

Verbatim quote from the policy corpus:

> If using a quote that references a GitLab customer or partner by name, confirm with [#customer-advocacy-and-references](https://app.slack.com/client/T02592416/CLFCPMF8E) (for customers) or [#channel-marketing](https://app.slack.com/client/T02592416/C013DF4A7QV) (for partners) that sufficient rights and approvals are in place for the proposed use.

_Notes_: Applies when the named reference is a GitLab customer.

## Category: `settlement_signoff`

### Rule `LEG-SETTLE-0001` — Settlement Signoff

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `settlement_payment_commitment` | `==` | `true` |  |

In plain English: `settlement_payment_commitment` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **member of the Legal and Corporate Affairs team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `member_of_the_legal_and_corporate_affairs_team_preapproval`.
- Cross-domain refs: `PROC-PO-0011`

**Source:**
- doc_id: `gitlab/legal_risk_management_dispute_resolution`
- section: Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR
- url: https://handbook.gitlab.com/handbook/legal/risk-management-dispute-resolution/

Verbatim quote from the policy corpus:

> A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.

_Notes_: Team members may not commit the company to pay settlement money without Legal and Corporate Affairs signoff.
