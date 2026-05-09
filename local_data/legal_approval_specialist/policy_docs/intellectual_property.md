# Intellectual Property

_Legal approval policy — topic `intellectual_property`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 4 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `ai_generated_image_approval`

### Rule `LEG-AIIMG-0001` — Ai Generated Image Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `asset_type` | `==` | `ai_generated_image` |  |

In plain English: `asset_type` equals `ai_generated_image`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Brand**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `brand_preapproval`.

**Source:**
- doc_id: `gitlab/legal_ip_public_materials_guidelines`
- section: Guidelines for Use of Creative Assets and Third-party Content in External Materials > AI-generated images > **General Requirements for AI-generated images:**
- url: https://handbook.gitlab.com/handbook/legal/ip-public-materials-guidelines/

Verbatim quote from the policy corpus:

> All AI-generated images must be reviewed and approved by Brand before use.

_Notes_: Approval is required before use.

## Category: `audio_content_license_review`

### Rule `LEG-IP-0001` — Audio Content License Review

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `audio_content_license_uncertain` | `==` | `true` |  |

In plain English: `audio_content_license_uncertain` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **#legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `legal_preapproval`.

**Source:**
- doc_id: `gitlab/legal_ip_public_materials_guidelines`
- section: Guidelines for Use of Creative Assets and Third-party Content in External Materials > Audio content including music, sounds, and sound effects > Do
- url: https://handbook.gitlab.com/handbook/legal/ip-public-materials-guidelines/

Verbatim quote from the policy corpus:

> If you’re unsure, reach out to [#legal](https://app.slack.com/client/T02592416/C78E74A6L) to review the license covering the content you want to use.

_Notes_: Applies when unsure about the license covering audio content.

## Category: `third_party_logo_approval`

### Rule `LEG-TM-0001` — Third Party Logo Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `asset_type` | `==` | `logo` | type |
| `third_party_relationship` | `==` | `partner` | relationship |

In plain English: `asset_type` equals `logo` AND `third_party_relationship` equals `partner`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **#channel-marketing**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `channel_marketing_preapproval`.

**Source:**
- doc_id: `gitlab/legal_ip_public_materials_guidelines`
- section: Guidelines for Use of Creative Assets and Third-party Content in External Materials > Trademarks - logos and wordmarks > Do
- url: https://handbook.gitlab.com/handbook/legal/ip-public-materials-guidelines/

Verbatim quote from the policy corpus:

> For use of a partner’s logo, discuss with [#channel-marketing](https://app.slack.com/client/T02592416/C013DF4A7QV) to confirm that rights and approvals are in place for your proposed use under the Partner Agreement.

_Notes_: Partner logo use must be discussed with channel marketing to confirm rights and approvals are in place.

## Category: `trademark_approval`

### Rule `LEG-TM-0002` — Trademark Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `trademark_request_type` | `==` | `new_trademark` |  |

In plain English: `trademark_request_type` equals `new_trademark`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Brand Team** → **Legal**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `brand_team_preapproval`, `legal_preapproval`.
- Cross-domain refs: `PROC-RFP-0001`

**Source:**
- doc_id: `gitlab/legal_trademarks_at_gitlab`
- section: Trademarks at GitLab > Process for New GitLab Trademarks
- url: https://handbook.gitlab.com/handbook/legal/trademarks-at-gitlab/

Verbatim quote from the policy corpus:

> If considering a new trademark, review the following:
> 
> * [The naming process at GitLab](https://handbook.gitlab.com/handbook/marketing/brand-and-product-marketing/brand/naming/#the-naming-process)
> * [Product and feature naming guidelines](https://handbook.gitlab.com/handbook/product/product-principles/#product-and-feature-naming-guidelines)
> 
> After reviewing the above guidelines, reach out to the Brand Team in [#brand](https://app.slack.com/client/E03N1RJJX7C/C0119M5HUER), with your proposed mark, whether it’s a logo or wordmark. If Brand approves use of the proposed logo or wordmark, they will reach out to Legal to discuss next steps.

_Notes_: New trademark proposals should be reviewed under naming guidelines and routed to Brand Team before Legal next steps.
