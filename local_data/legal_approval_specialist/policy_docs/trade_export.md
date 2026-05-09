# Trade Compliance & Export Control

_Legal approval policy — topic `trade_export`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 5 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `authorization_modification_approval`

### Rule `LEG-TRADE-0004` — Authorization Modification Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `authorization_modifications_requested_by_third_party` | `==` | `true` |  |

In plain English: `authorization_modifications_requested_by_third_party` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gitlab_legal_preapproval`.
- Cross-domain refs: `PROC-AGREE-0001`

**Source:**
- doc_id: `gitlab/legal_trademarks_at_gitlab`
- section: Trademarks at GitLab > Use of GitLab trademarks by third-parties on marketing materials
- url: https://handbook.gitlab.com/handbook/legal/trademarks-at-gitlab/

Verbatim quote from the policy corpus:

> [Contact GitLab Legal](https://handbook.gitlab.com/handbook/legal/#how-to-reach-us) to obtain approval for any **modifications** the third party requests to the Authorization.

## Category: `export_compliance_clearance`

### Rule `LEG-EXPORT-0001` — Export Compliance Clearance

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `account_flagged_by_export_compliance_tool` | `==` | `true` |  |

In plain English: `account_flagged_by_export_compliance_tool` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `legal_preapproval`.

**Source:**
- doc_id: `gitlab/legal_customer_negotiations`
- section: Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Export Review in SFDC
- url: https://handbook.gitlab.com/handbook/legal/customer-negotiations/

Verbatim quote from the policy corpus:

> Only Legal can clear the accounts that are flagged by the export compliance tool, please do not tag any other groups for assistance with these requests.

_Notes_: Do not tag other groups for assistance with export compliance tool flagged accounts.

## Category: `trademark_use_authorization`

### Rule `LEG-TRADE-0003` — Trademark Use Authorization

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `requester_type` | `==` | `third_party` |  |
| `trademark_material` | `==` | `GitLab’s name` |  |
| `use_context` | `==` | `website` |  |
| `existing_agreement_covers_requested_use` | `==` | `false` |  |

In plain English: `requester_type` equals `third_party` AND `trademark_material` equals `GitLab’s name` AND `use_context` equals `website` AND `existing_agreement_covers_requested_use` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **third party**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `third_party_preapproval`.

**Source:**
- doc_id: `gitlab/legal_trademarks_at_gitlab`
- section: Trademarks at GitLab > Use of GitLab trademarks by third-parties on marketing materials
- url: https://handbook.gitlab.com/handbook/legal/trademarks-at-gitlab/

Verbatim quote from the policy corpus:

> An Authorization to use GitLab Materials must be signed by any third party wanting to include GitLab’s name or logo on their website or other marketing materials, if use of GitLab’s name or logo for the requested purposes is not already covered in an existing agreement.

_Notes_: Split from source alternatives for trademark material and use context.

## Category: `travel_trade_compliance`

### Rule `LEG-TRADE-0001` — Travel Trade Compliance

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `device_ownership` | `==` | `company_owned` |  |
| `travel_destination_trade_control_status` | `==` | `us_embargoed` |  |

In plain English: `device_ownership` equals `company_owned` AND `travel_destination_trade_control_status` equals `us_embargoed`.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/finance_travel`
- section: Travel Safety and Security > Travel Safety and Security > Trade Compliance Considerations
- url: https://handbook.gitlab.com/handbook/finance/travel/

Verbatim quote from the policy corpus:

> team members cannot take company-owned devices to or otherwise work from US-embargoed countries or regions under any circumstances.

_Notes_: Applies under any circumstances.

### Rule `LEG-TRADE-0002` — Travel Trade Compliance

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `device_ownership` | `==` | `company_owned` |  |
| `travel_destination_country` | `==` | `Russia` |  |

In plain English: `device_ownership` equals `company_owned` AND `travel_destination_country` equals `Russia`.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/finance_travel`
- section: Travel Safety and Security > Travel Safety and Security > Trade Compliance Considerations
- url: https://handbook.gitlab.com/handbook/finance/travel/

Verbatim quote from the policy corpus:

> Additionally, team members cannot take company-owned devices to or otherwise work from Russia or Belarus, which are also subject to various restrictions.

_Notes_: Russia is subject to various restrictions.
