# Purchase Orders & Requisitions

_Procurement approval policy — topic `purchase_orders`. This document is read by the **procurement_approval_specialist** during reviews involving this topic. 15 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `non_cost_agreement_approval`

### Rule `PROC-AGREE-0001` — Non Cost Agreement Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `document_source` | `==` | `vendor` |  |
| `contract_value_usd` | `==` | `0` | USD |
| `document_signature_requested` | `==` | `true` |  |

In plain English: `document_source` equals `vendor` AND `contract_value_usd` equals 0 AND `document_signature_requested` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal** → **Security**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `legal_preapproval`, `security_preapproval`.
- Cross-domain refs: `LEG-NDA-0001`, `LEG-PRIV-0018`

**Source:**
- doc_id: `gitlab/finance_procurement_trial_agreement`
- section: Non-Cost related Agreements
- url: https://handbook.gitlab.com/handbook/finance/procurement/trial-agreement/

Verbatim quote from the policy corpus:

> If you have documents from a vendor that are not cost-related, such as a Trial/Demo Agreement, Engagement Letter, etc., please open a ZIP [request](https://gitlab.ziphq.com/create-workflow-request) selecting a Request a Demo/Trial ($0 Contracts) workflow and proceed with completing the form.
> 
> ![zip-image-2](https://handbook.gitlab.com/images/finance/procurement/ZIP-Start-Request.png)
> 
> On the request, provide received from the vendor documents for Legal and Security review.
> 
> Please, do not sign any document before Legal and Security approvals are collected.

_Notes_: Do not sign non-cost vendor documents before Legal and Security approvals are collected.

## Category: `po_policy_exception`

### Rule `PROC-PO-0001` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_frequency` | `==` | `one_time` |  |
| `purchase_amount_usd` | `<` | `5000` | USD |

In plain English: `purchase_frequency` equals `one_time` AND `purchase_amount_usd` is less than 5000 USD.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)

_Notes_: One-time purchases under $5K are exceptions to the PO Policy.

### Rule `PROC-PO-0002` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `charitable_contribution` |  |

In plain English: `purchase_category` equals `charitable_contribution`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)

_Notes_: Charitable contributions are exceptions to the PO Policy.

### Rule `PROC-PO-0003` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `interview_candidate_reimbursement` |  |

In plain English: `purchase_category` equals `interview_candidate_reimbursement`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement

_Notes_: Interview candidate reimbursements are exceptions to the PO Policy.

### Rule `PROC-PO-0004` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `confidential_outside_counsel_legal_fees` |  |

In plain English: `purchase_category` equals `confidential_outside_counsel_legal_fees`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement
> 4. Confidential outside counsel legal fees

_Notes_: Confidential outside counsel legal fees are exceptions to the PO Policy.

### Rule `PROC-PO-0005` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_category` | `==` | `confidential_recruiting_engagement` |  |

In plain English: `purchase_category` equals `confidential_recruiting_engagement`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement
> 4. Confidential outside counsel legal fees
> 5. Confidential Recruiting Engagements

_Notes_: Confidential recruiting engagements are exceptions to the PO Policy.

### Rule `PROC-PO-0006` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `fee_category` | `==` | `statutory_tax_fees` |  |

In plain English: `fee_category` equals `statutory_tax_fees`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement
> 4. Confidential outside counsel legal fees
> 5. Confidential Recruiting Engagements
> 6. Statutory Tax fees

_Notes_: Statutory tax fees are exceptions to the PO Policy.

### Rule `PROC-PO-0007` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_category` | `==` | `peo_provider` |  |

In plain English: `vendor_category` equals `peo_provider`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`, `LEG-RPT-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement
> 4. Confidential outside counsel legal fees
> 5. Confidential Recruiting Engagements
> 6. Statutory Tax fees
> 7. PEO Providers

_Notes_: PEO providers are exceptions to the PO Policy.

### Rule `PROC-PO-0008` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `payment_category` | `==` | `ar_customer_refund` |  |

In plain English: `payment_category` equals `ar_customer_refund`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement
> 4. Confidential outside counsel legal fees
> 5. Confidential Recruiting Engagements
> 6. Statutory Tax fees
> 7. PEO Providers
> 8. AR/Customer Refunds

_Notes_: AR/customer refunds are exceptions to the PO Policy.

### Rule `PROC-PO-0009` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `payment_category` | `==` | `board_of_director_payment` |  |

In plain English: `payment_category` equals `board_of_director_payment`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement
> 4. Confidential outside counsel legal fees
> 5. Confidential Recruiting Engagements
> 6. Statutory Tax fees
> 7. PEO Providers
> 8. AR/Customer Refunds
> 9. Board of Director Payments

_Notes_: Board of Director payments are exceptions to the PO Policy.

### Rule `PROC-PO-0010` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `payment_category` | `==` | `financing_banking_investing` |  |

In plain English: `payment_category` equals `financing_banking_investing`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement
> 4. Confidential outside counsel legal fees
> 5. Confidential Recruiting Engagements
> 6. Statutory Tax fees
> 7. PEO Providers
> 8. AR/Customer Refunds
> 9. Board of Director Payments
> 10. Financing, Banking and Investing (incl interest, debt, FX, fees)

_Notes_: Financing, banking and investing payments are exceptions to the PO Policy.

### Rule `PROC-PO-0011` — Po Policy Exception

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `payment_method` | `==` | `corporate_credit_card` |  |

In plain English: `payment_method` equals `corporate_credit_card`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Cross-domain refs: `FIN-EXP-0003`, `FIN-PO-0001`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> Exceptions to the PO Policy are:
> 
> 1. One time purchases under $5K (or less than $5K annually)
> 2. Charitable Contributions (Donations)
> 3. Interview Candidate Reimbursement
> 4. Confidential outside counsel legal fees
> 5. Confidential Recruiting Engagements
> 6. Statutory Tax fees
> 7. PEO Providers
> 8. AR/Customer Refunds
> 9. Board of Director Payments
> 10. Financing, Banking and Investing (incl interest, debt, FX, fees)
> 11. Corporate Credit Card

_Notes_: Corporate credit card payments are exceptions to the PO Policy.

## Category: `purchase_order_change_approval`

### Rule `PROC-PO-0013` — Purchase Order Change Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `existing_po_change` | `==` | `true` |  |

In plain English: `existing_po_change` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Finance** → **Functional** → **Executive (if applicable)**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `finance_preapproval`, `functional_preapproval`, `executive_if_applicable_preapproval`.
- Cross-domain refs: `FIN-EXP-0004`, `FIN-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_tips_for_submitting_a_zip_request`
- section: Tips for Submitting a Zip Request > Zip Change Requests
- url: https://handbook.gitlab.com/handbook/finance/procurement/tips-for-submitting-a-zip-request/

Verbatim quote from the policy corpus:

> Note, changes to an existing PO also must be approved by Finance, Functional, and Executive (if applicable) team members in Coupa like a new Purchase Request.

_Notes_: Executive approval applies only if applicable.

## Category: `purchase_request_approval`

### Rule `PROC-REQ-0001` — Purchase Request Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `purchase_request_negotiation_status` | `==` | `completed` |  |

In plain English: `purchase_request_negotiation_status` equals `completed`.

**Approve** outright when these conditions hold.
- Approver chain: **procurement** → **fp&a**
- Cross-domain refs: `LEG-VEND-0001`

**Source:**
- doc_id: `gitlab/finance_procurement_field_marketing_events`
- section: Field Marketing and Events > What Happens after I submit my Request?
- url: https://handbook.gitlab.com/handbook/finance/procurement/field-marketing-events/

Verbatim quote from the policy corpus:

> Once neotiation is completed and/or it is determined that negotiation is not needed, your purchase request will be approved by procurement and will advance to the next approver, which is typically fp&a.

_Notes_: Applies when negotiation has been completed.

## Category: `urgent_payment_approval`

### Rule `PROC-PO-0012` — Urgent Payment Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `payment_category` | `==` | `urgent_payment` |  |
| `payment_in_exception_list` | `==` | `false` |  |

In plain English: `payment_category` equals `urgent_payment` AND `payment_in_exception_list` equals false.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP** → **Corporate Controller** → **PAO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `vp_preapproval`, `corporate_controller_preapproval`, `pao_preapproval`.

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What are the exceptions to the PO Policy?
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> 12. Urgent Payments not included on list above (approval required from VP, Corporate Controller and/or PAO)

_Notes_: Source uses 'and/or' for the named approvers.
