# RFP & Strategic Sourcing

_Procurement approval policy — topic `rfp_sourcing`. This document is read by the **procurement_approval_specialist** during reviews involving this topic. 17 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `procurement_team_alignment`

### Rule `PROC-ALIGN-0001` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `annual_spend_usd` | `>` | `25000` | USD/year |
| `business_division` | `==` | `Marketing` |  |

In plain English: `annual_spend_usd` exceeds 25000 USD/year AND `business_division` equals `Marketing`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Ashley Abbate**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `ashley_abbate_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Division alignment for spend over >$25k USD / year:
> 
> * Marketing - Ashley Abbate

_Notes_: Source states procurement alignment, not approval authority.

### Rule `PROC-ALIGN-0002` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `annual_spend_usd` | `>` | `25000` | USD/year |
| `business_division` | `==` | `Sales` |  |

In plain English: `annual_spend_usd` exceeds 25000 USD/year AND `business_division` equals `Sales`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Ashley Abbate**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `ashley_abbate_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Division alignment for spend over >$25k USD / year:
> 
> * Marketing - Ashley Abbate
> * Sales - Ashley Abbate

_Notes_: Source states procurement alignment, not approval authority.

### Rule `PROC-ALIGN-0003` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `annual_spend_usd` | `>` | `25000` | USD/year |
| `business_division` | `==` | `Product` |  |

In plain English: `annual_spend_usd` exceeds 25000 USD/year AND `business_division` equals `Product`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Adrienne Ruhaak**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `adrienne_ruhaak_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Division alignment for spend over >$25k USD / year:
> 
> * Marketing - Ashley Abbate
> * Sales - Ashley Abbate
> * Product - Adrienne Ruhaak

_Notes_: Source states procurement alignment, not approval authority.

### Rule `PROC-ALIGN-0004` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `annual_spend_usd` | `>` | `25000` | USD/year |
| `business_division` | `==` | `Engineering` |  |

In plain English: `annual_spend_usd` exceeds 25000 USD/year AND `business_division` equals `Engineering`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Adrienne Ruhaak**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `adrienne_ruhaak_preapproval`.
- Cross-domain refs: `LEG-TM-0002`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Division alignment for spend over >$25k USD / year:
> 
> * Marketing - Ashley Abbate
> * Sales - Ashley Abbate
> * Product - Adrienne Ruhaak
> * Engineering - Adrienne Ruhaak

_Notes_: Source states procurement alignment, not approval authority.

### Rule `PROC-ALIGN-0005` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `annual_spend_usd` | `>` | `25000` | USD/year |
| `business_division` | `==` | `People` |  |

In plain English: `annual_spend_usd` exceeds 25000 USD/year AND `business_division` equals `People`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Adrienne Ruhaak**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `adrienne_ruhaak_preapproval`.
- Cross-domain refs: `LEG-TM-0002`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Division alignment for spend over >$25k USD / year:
> 
> * Marketing - Ashley Abbate
> * Sales - Ashley Abbate
> * Product - Adrienne Ruhaak
> * Engineering - Adrienne Ruhaak
> * People - Adrienne Ruhaak

_Notes_: Source states procurement alignment, not approval authority.

### Rule `PROC-ALIGN-0006` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `annual_spend_usd` | `>` | `25000` | USD/year |
| `business_division` | `==` | `Finance` |  |

In plain English: `annual_spend_usd` exceeds 25000 USD/year AND `business_division` equals `Finance`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Adrienne Ruhaak**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `adrienne_ruhaak_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Division alignment for spend over >$25k USD / year:
> 
> * Marketing - Ashley Abbate
> * Sales - Ashley Abbate
> * Product - Adrienne Ruhaak
> * Engineering - Adrienne Ruhaak
> * People - Adrienne Ruhaak
> * Finance - Adrienne Ruhaak

_Notes_: Source states procurement alignment, not approval authority.

### Rule `PROC-ALIGN-0007` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `annual_spend_usd` | `>` | `25000` | USD/year |
| `business_division` | `==` | `Legal` |  |

In plain English: `annual_spend_usd` exceeds 25000 USD/year AND `business_division` equals `Legal`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Adrienne Ruhaak**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `adrienne_ruhaak_preapproval`.
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PURCH-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Division alignment for spend over >$25k USD / year:
> 
> * Marketing - Ashley Abbate
> * Sales - Ashley Abbate
> * Product - Adrienne Ruhaak
> * Engineering - Adrienne Ruhaak
> * People - Adrienne Ruhaak
> * Finance - Adrienne Ruhaak
> * Legal - Adrienne Ruhaak

_Notes_: Source states procurement alignment, not approval authority.

### Rule `PROC-ALIGN-0008` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `spend_amount_usd` | `<` | `25000` | USD |

In plain English: `spend_amount_usd` is less than 25000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Dasha Yarmusik**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `dasha_yarmusik_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> * All division spend <$25k USD - Dasha Yarmusik

_Notes_: Source states procurement alignment, not approval authority.

### Rule `PROC-ALIGN-0009` — Procurement Team Alignment
_Severity: informational_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `individual_software_purchases` |  |

In plain English: `purchase_category` equals `individual_software_purchases`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Anam Shaikh**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `anam_shaikh_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> * Individual Software Purchases - Anam Shaikh

_Notes_: Source states procurement alignment, not approval authority.

## Category: `rfp_bid_requirement`

### Rule `PROC-RFP-0003` — Rfp Bid Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `rfp_process_required` | `==` | `true` |  |
| `purchase_amount_usd` | `>` | `250000` | USD |

In plain English: `rfp_process_required` equals true AND `purchase_amount_usd` exceeds 250000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Over $250K: Procurement led RFP, typically 5+ vendor bids

_Notes_: Bid count is described as typical.

### Rule `PROC-RFP-0004` — Rfp Bid Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `rfp_process_required` | `==` | `true` |  |
| `purchase_amount_usd` | `>=` | `100000` | USD |
| `purchase_amount_usd` | `<=` | `250000` | USD |

In plain English: `rfp_process_required` equals true AND `purchase_amount_usd` is at least 100000 USD AND `purchase_amount_usd` is at most 250000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-NDA-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> $100K - $250K: Business led RFP, 2-3 vendor bids required

_Notes_: Business-led RFP requires 2-3 vendor bids.

### Rule `PROC-RFP-0005` — Rfp Bid Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `rfp_process_required` | `==` | `true` |  |
| `purchase_amount_usd` | `>=` | `25000` | USD |
| `purchase_amount_usd` | `<=` | `100000` | USD |

In plain English: `rfp_process_required` equals true AND `purchase_amount_usd` is at least 25000 USD AND `purchase_amount_usd` is at most 100000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> $25K - $100K: Business led quick-bid, 2 vendor bids required

_Notes_: Business-led quick-bid requires 2 vendor bids.

## Category: `rfp_bid_requirement_negation`

### Rule `PROC-RFP-9002` — Rfp Bid Requirement Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `rfp_process_required` | `!=` | `true` |  |

In plain English: `rfp_process_required` is not true.

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-RFP-0003`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Over $250K: Procurement led RFP, typically 5+ vendor bids

_Notes_: [Synthesized negation sibling of PROC-RFP-0003] When the gating boolean is FALSE the matter falls into the inverse outcome. Bid count is described as typical.

### Rule `PROC-RFP-9003` — Rfp Bid Requirement Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `rfp_process_required` | `!=` | `true` |  |

In plain English: `rfp_process_required` is not true.

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-RFP-0004`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> $100K - $250K: Business led RFP, 2-3 vendor bids required

_Notes_: [Synthesized negation sibling of PROC-RFP-0004] When the gating boolean is FALSE the matter falls into the inverse outcome. Business-led RFP requires 2-3 vendor bids.

### Rule `PROC-RFP-9004` — Rfp Bid Requirement Negation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `rfp_process_required` | `!=` | `true` |  |

In plain English: `rfp_process_required` is not true.

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-RFP-0005`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> $25K - $100K: Business led quick-bid, 2 vendor bids required

_Notes_: [Synthesized negation sibling of PROC-RFP-0005] When the gating boolean is FALSE the matter falls into the inverse outcome. Business-led quick-bid requires 2 vendor bids.

## Category: `rfp_process_requirement`

### Rule `PROC-RFP-0002` — Rfp Process Requirement

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_type` | `==` | `new_spend` |  |

In plain English: `purchase_type` equals `new_spend`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> For new spend, changing vendors for existing services, or after 3 years of renewing a service, follow the [RFP Process](https://internal.gitlab.com/handbook/finance/procurement/)

_Notes_: New spend follows the RFP Process.

## Category: `rfp_vendor_selection`

### Rule `PROC-RFP-0001` — Rfp Vendor Selection

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `new_spend` | `==` | `true` |  |

In plain English: `new_spend` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement Category Manager**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `procurement_category_manager_preapproval`.
- Exceptions (overriding rules): `unless approved by your Procurement Category Manager`
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> All new spend, changing of vendors for existing services, and market reviews every 3 years for existing contracts should follow the [RFP and Vendor Selection process](https://internal.gitlab.com/handbook/finance/procurement/), unless approved by your Procurement Category Manager, to ensure we are choosing the best partner for GitLab with the best commercial terms. This must be done prior to verbally agreeing to terms or contracting with any new or existing vendor.

_Notes_: RFP must occur before verbally agreeing to terms or contracting.
