# Procurement Approval Rulebook

This rulebook is the authoritative reference for the **procurement_approval_specialist**. It contains 85 rules across 47 categories, derived from the company's policy corpus. When adjudicating an approval request:

1. Read the request and supporting evidence.
2. Identify which rules below have **all conditions** matching the request.
3. **Check fulfillment**: if a rule lists `Fulfilled by: <items>` and the submission already contains evidence of EVERY listed item (e.g. a pre-approval email, a signed NDA, a completed assessment report), treat that rule as already satisfied — its effective decision becomes `approve` for this case.
4. Apply the highest-priority decision among the (effective) firing rules: reject > require_preapproval > require_docs > approve.
5. Cite each rule_id you relied on. If no rule fires for your role, answer with `not_applicable` and explain why.

---

## Category: `anticorruption_compliance_review`

### Rule `PROC-AC-0002` — Anticorruption Compliance Review

**Conditions** (all must hold):
- `anticorruption_gating_any_yes` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Ethics & Compliance team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `ethics_compliance_team_preapproval`
- Cross-domain refs: `LEG-AC-0009`, `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`, `LEG-AC-0013`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> If the answer to any of these questions is “yes,” the Ethics & Compliance team must consider whether the vendor presents unacceptably high compliance risk.

## Category: `contingent_worker_internal_approval`

### Rule `PROC-CWORK-0001` — Contingent Worker Internal Approval

**Conditions** (all must hold):
- `purchase_category` equals `Contingent Worker`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FP&A** → **your management**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `fp_a_preapproval`, `your_management_preapproval`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor_
> Before submitting a Zip request for a Contingent Worker:     * Confirm you have internal approval from FP&A and your management to hire a contingent worker

## Category: `contingent_worker_it_approval`

### Rule `PROC-IT-0002` — Contingent Worker It Approval

**Conditions** (all must hold):
- `access_systems` contains `Okta`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT Ops**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `it_ops_preapproval`
- Cross-domain refs: `LEG-RMDR-0001`, `LEG-RMDR-0002`, `LEG-RMDR-0003`, `LEG-RMDR-0004`, `LEG-RMDR-0005`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor_
> If the Contingent Worker requires access to Okta and/or core GitLab core applications, a GitLab laptop must be issued followed by a Zip approval from IT Ops validating laptop issuance.

### Rule `PROC-IT-0003` — Contingent Worker It Approval

**Conditions** (all must hold):
- `worker_location_requires_it_approval` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `it_preapproval`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor_
> [Certain locations](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/127746#note_1497241068) will require IT Approval before providing the equipment.

## Category: `contingent_worker_security_review`

### Rule `PROC-SEC-0002` — Contingent Worker Security Review

**Conditions** (all must hold):
- `requires_gitlab_equipment` equals true
- `data_categories` contains `Orange data`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-PRIV-0019`, `LEG-VEND-0001`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor_
> If the Contingent Worker requires GitLab equipment (i.e. access to Orange or Red data), which will require a [Security Review](https://handbook.gitlab.com/handbook/finance/procurement/#4c-security-review-4-14-days), the Zip purchase requisition will need to be submitted 10 days in advance of the normal approval [timeline](https://handbook.gitlab.com/handbook/finance/procurement/#review-steps-timeline-and-considerations) to account for ordering and shipping of the equipment.

### Rule `PROC-SEC-0003` — Contingent Worker Security Review

**Conditions** (all must hold):
- `data_categories` contains `Orange Data`
- `data_categories` contains `Red Data`
- `data_processed_or_stored_outside_gitlab_systems` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-PRIV-0019`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > How to Submit a Zip Request for a Contractor_
> Contingent Workers that require Orange and Red Data access, that will be processed or stored outside GitLab’s systems, are considered “Professional Services” and are subject to a full security review.

## Category: `contractor_background_screening`

### Rule `PROC-BGSCRN-0001` — Contractor Background Screening

**Conditions** (all must hold):
- `worker_type` equals `contingent_worker`
- `contingent_worker_employer_type` equals `vendor`

**Request supporting documents** before deciding.
- Required documents: `proof of a completed background screening`, `signed attestation stating a background screening that meets GitLab’s requirements has been completed`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `proof_of_a_completed_background_screening`, `signed_attestation_stating_a_background_screening_that_meets_gitlab_s_requirements_has_been_completed`
- Cross-domain refs: `LEG-AC-0009`

_Source: gitlab/finance_procurement_contingent_worker_policy · Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING_
> If a contingent worker is employed by a vendor, agency, professional services provider, or other entity GitLab will seek proof of a completed background screening or a signed attestation stating a background screening that meets GitLab’s requirements has been completed.

### Rule `PROC-BGSCRN-0002` — Contractor Background Screening

**Conditions** (all must hold):
- `background_screening_results_of_concern` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-AC-0009`, `LEG-ETHICS-0001`

_Source: gitlab/finance_procurement_contingent_worker_policy · Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING_
> Should any results of concern return, GitLab will review these results to determine if there is a security and/or safety related risk posed to GitLab’s team members, customers, vendors, and/or overall business.

### Rule `PROC-BGSCRN-0003` — Contractor Background Screening

**Conditions** (all must hold):
- `worker_type` equals `contingent_worker`
- `requires_sso_access` equals true

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `contractor_background_screening`
- Cross-domain refs: `LEG-VEND-0001`

_Source: gitlab/finance_procurement_contingent_worker_policy · Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING_
> GitLab will complete or verify a background screening for all contingent workers requiring single sign-on access (SSO).

### Rule `PROC-BGSCRN-0004` — Contractor Background Screening

**Conditions** (all must hold):
- `worker_type` equals `contingent_worker`
- `employer_background_screening_completed` equals false

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `contractor_background_screening`
- Cross-domain refs: `LEG-VEND-0001`

_Source: gitlab/finance_procurement_contingent_worker_policy · Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING_
> In the event a contingent worker’s employer has not completed a background screening, or the background screening does not meet GitLab’s minimum standards, GitLab will require the contingent worker to complete a background screening with GitLab’s background screening vendor Sterling, and will ensure background screenings are completed in compliance with local laws and regulations and seek the appropriate consent as needed.

### Rule `PROC-BGSCRN-0005` — Contractor Background Screening

**Conditions** (all must hold):
- `worker_type` equals `contingent_worker`
- `onboarding_with_gitlab` equals true

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `contractor_background_screening`
- Cross-domain refs: `LEG-AC-0009`, `LEG-ETHICS-0001`

_Source: gitlab/finance_procurement_contingent_worker_policy · Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING_
> Contingent workers must have a completed or verfied background screening before onboarding with GitLab.

### Rule `PROC-BGSCRN-0006` — Contractor Background Screening
_Severity: informational_

**Conditions** (all must hold):
- `employer_tprm_assessment_completed` equals true
- `employer_tprm_results` equals `favorable`

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `contractor_background_screening`
- Cross-domain refs: `Third Party Risk Management`

_Source: gitlab/finance_procurement_contingent_worker_policy · Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING_
> If GitLab has completed an assessment on a contingent worker’s employer in accordance with our [Third Party Risk Management](https://handbook.gitlab.com/handbook/security/security-assurance/security-risk/third-party-risk-management/) (TPRM) program and has received favorable results, additional verification of a background screening may not be required.

### Rule `PROC-BGSCRN-0007` — Contractor Background Screening

**Conditions** (all must hold):
- `worker_type` equals `contingent_worker`
- `returning_to_service_at_gitlab` equals true
- `days_since_contract_completion` is at most 90 days

**Request supporting documents** before deciding.
- Required documents: `contractor_background_screening`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `contractor_background_screening`

_Source: gitlab/finance_procurement_contingent_worker_policy · Contingent Worker Policy > 9. CONTRACTOR BACKGROUND SCREENING_
> Contingent worker’s returning to service at GitLab within 90 days of completion of their contract and contingent workers that receive a contract extension will not require an additional background screening or re-verification of background screening results.

## Category: `contractor_extension_approval`

### Rule `PROC-CW-0001` — Contractor Extension Approval

**Conditions** (all must hold):
- `worker_type` equals `staff_augmentation_worker`
- `extension_beyond_initial_term` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FP&A Business Partner**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `fp_a_business_partner_preapproval`
- Cross-domain refs: `Section 7`

_Source: gitlab/finance_procurement_contingent_worker_policy · Contingent Worker Policy > 8. CONTRACTOR EXTENSION PROCESS (FOR CONTRACT LABOR CONTINGENT WORKERS ONLY)_
> If there is a need to extend the engagement of a staff augmentation worker beyond the initial term, the following process must be followed:  1. Request budget approval for extension to your FP&A Business Partner 2. Provide justification for the extension, including the project or task that the worker will be completing. 3. Once approval is obtained, then submit a Change Request in Zip to the existing Agreement/PO which is when Procurement would be notified to review.

## Category: `data_processing_agreement`

### Rule `PROC-PRIV-0003` — Data Processing Agreement

**Conditions** (all must hold):
- `personal_data_supplier_involvement` equals `shared`

**Request supporting documents** before deciding.
- Required documents: `Data Processing Agreement (DPA)`, `Standard Contractual Clauses (SCCs)`
- Approver chain: **Privacy**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `data_processing_agreement_dpa`, `standard_contractual_clauses_sccs`
- Cross-domain refs: `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> **Data Processing Agreement (DPA)/Standard Contractual Clauses (SCCs):** Required when personal data is shared with, accesssed, or collected by the supplier on behalf of GitLab. DPA/SCCs are generally affixed to an agreement but may be required as a separate agreement upon the determination of Privacy (see the Privacy review process below).

## Category: `independent_contractor_agreement`

### Rule `PROC-CW-0002` — Independent Contractor Agreement

**Conditions** (all must hold):
- `worker_type` equals `independent_contractor`

**Request supporting documents** before deciding.
- Required documents: `Independent Contractor Service Agreement`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `independent_contractor_service_agreement`
- Cross-domain refs: `LEG-ETHICS-0001`, `LEG-NDA-0001`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Submitting a request for a Contingent Worker > Independent Contractor (option not preferred, used by exception only)_
> All Independent Contractors must be contracted using the [Independent Contractor Service Agreement](https://docs.google.com/document/d/1KDkv6oWv6V-6k9v5GhjF7WPMoQJOV5iubCZzLGn7xfY/edit#heading=h.b9kk7pr94mid) (ICSA).

## Category: `individual_use_software_approval`

### Rule `PROC-SOFT-0006` — Individual Use Software Approval

**Conditions** (all must hold):
- `individual_use_software_request_received` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your manager** → **Security** → **Privacy**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_manager_preapproval`, `security_preapproval`, `privacy_preapproval`
- Cross-domain refs: `LEG-PRIV-0020`

_Source: gitlab/finance_procurement_individual_use_software · Individual Use Software > What Happens When I Request Individual Use Software?_
> Upon receipt, the Procurement team will open a GitLab Issue based on your responses and will route for the necessary approvals, including your manager, Security, and Privacy.

## Category: `individual_use_software_procurement`

### Rule `PROC-SOFT-0007` — Individual Use Software Procurement

**Conditions** (all must hold):
- `purchase_category` equals `individual_use_software`
- `annual_software_expenditure_usd` exceeds 5000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`, `LEG-PRIV-0018`, `https://handbook.gitlab.com/handbook/finance/procurement/#how-to-start-the-procurement-process`

_Source: gitlab/finance_procurement_individual_use_software · Individual Use Software > Individual Use Software Overview_
> An individual’s annual expenditure on Individual Use software should not surpass $5,000. Should the cost of your software exceed this threshold, or if multiple people on your team need access, please follow the [Procurement process](https://handbook.gitlab.com/handbook/finance/procurement/#how-to-start-the-procurement-process) for submitting a new purchase request.

### Rule `PROC-SOFT-0008` — Individual Use Software Procurement

**Conditions** (all must hold):
- `purchase_category` equals `individual_use_software`
- `software_access_user_count` exceeds 1 headcount

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0003`, `LEG-PRIV-0018`, `https://handbook.gitlab.com/handbook/finance/procurement/#how-to-start-the-procurement-process`

_Source: gitlab/finance_procurement_individual_use_software · Individual Use Software > Individual Use Software Overview_
> Should the cost of your software exceed this threshold, or if multiple people on your team need access, please follow the [Procurement process](https://handbook.gitlab.com/handbook/finance/procurement/#how-to-start-the-procurement-process) for submitting a new purchase request.

## Category: `individual_use_software_request_routing`

### Rule `PROC-SOFT-0003` — Individual Use Software Request Routing

**Conditions** (all must hold):
- `vendor_in_tech_stack` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-NDA-0003`

_Source: gitlab/finance_procurement_individual_use_software · Individual Use Software > I Need Individual Use Software- Where Do I Start?_
> If your vendor is listed in the tech stack, please submit an [access request](https://gitlab.com/gitlab-com/team-member-epics/access-requests/-/issues/new?issuable_template=Individual_Bulk_Access_Request) using the Individual Bulk Access Request template.

### Rule `PROC-SOFT-0004` — Individual Use Software Request Routing

**Conditions** (all must hold):
- `vendor_in_tech_stack` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/finance_procurement_individual_use_software · Individual Use Software > I Need Individual Use Software- Where Do I Start?_
> If your vendor does not appear in the tech stack, requests must be submitted via [this Google Form](https://docs.google.com/forms/d/e/1FAIpQLSfWp2lnSKp0gTKBfZxol-YEkTst4gtOYpRJQvnVvDzhcGuxwg/viewform) to ensure appropriate routing.

## Category: `individual_use_software_security_approval`

### Rule `PROC-SOFT-0005` — Individual Use Software Security Approval

**Conditions** (all must hold):
- `software_listing` equals `Pre-Approved Individual Use Software and Freeware`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Security**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `security_preapproval`

_Source: gitlab/finance_procurement_individual_use_software · Individual Use Software > I Need Individual Use Software- Where Do I Start?_
> Note** that commonly requested Individual Use Software is documented within the [Pre-Approved Individual Use Software and Freeware](https://internal.gitlab.com/handbook/finance/procurement/pre-approved-individual-use-software/) listing and is subject to expedited Security approval.

## Category: `it_purchase_review_documentation`

### Rule `PROC-IT-0001` — It Purchase Review Documentation
_Severity: recommended_

**Conditions** (all must hold):
- `purchase_category` equals `new_software`

**Request supporting documents** before deciding.
- Required documents: `IT New Software Questionnaire`
- Approver chain: **IT**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `it_new_software_questionnaire`
- Cross-domain refs: `LEG-CNTRCT-0001`, `LEG-NDA-0001`, `LEG-NDA-0003`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> #### 3.B. IT Review: 2 days if purchasing new software or for contractors  * Requester should have vendor complete the [IT New Software Questionnaire](https://docs.google.com/spreadsheets/d/1SgyzxDDiTbig0VtZ5RPgX92U_VlQu1mq/edit?usp=sharing&ouid=115328509315203543998&rtpof=true&sd=true) and submit with the purchase request so IT can complete their review

## Category: `large_internal_event_approval`

### Rule `PROC-EVENT-0001` — Large Internal Event Approval

**Conditions** (all must hold):
- `event_total_cost_usd` exceeds 1000000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **E Group DRI (CRO/CMO)** → **VP of Finance** → **CFO** → **Board**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `e_group_dri_cro_cmo_preapproval`, `vp_of_finance_preapproval`, `cfo_preapproval`, `board_preapproval`
- Cross-domain refs: `LEG-AC-0017`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > Large Internal Events Process_
> For any large internal events with a total cost greater than $1M, such as SKO, President’s Club, Commit, etc, the following should be completed before any contracts are executed or any work is conducted.  The planning stages for events of this size should be completed at least 18-24 months prior to the actual event. This allows for ample time to get the necessary internal approvals, run any RFPs needed, and book large hotel blocks or buyouts.  1. Connect with your Procurement Category Manager and FP&A Business Partner to determine the various vendors needed to run the event and line item detail in the total event budget. This would include lodging, food & beverage, event planning, on-site support, excursions, travel, etc. 2. Determine with your Procurement contact how these vendors will be selected and the timeline to run any necessary [RFPs](https://internal.gitlab.com/handbook/finance/procurement/). RFPs should be conducted at least 20 months prior to the event dates. 3. Upon completion of RFPs, the top 2-3 location options and their total pricing will be presented to the E Group DRI (CRO/CMO) and VP of Finance to determine the preferred location choice and corresponding budget. All information should be summarized in an issue where these approvals may be documented. 4. Once preferred location and budget are tentatively chosen, this information will be presented to the CFO for approval, and will then be presented to the Board for approval at their quarterly meeting, or via email as necessary. Please note that Board approvals may take multiple weeks. CFO and Board approvals should be obtained no less than 18 months prior to the event dates.

## Category: `legal_redline_vendor_communication`

### Rule `PROC-LEGAL-0001` — Legal Redline Vendor Communication

**Conditions** (all must hold):
- `contract_value_usd` exceeds 100000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `procurement_preapproval`
- Cross-domain refs: `LEG-CONTR-0001`, `LEG-VEND-0001`, `https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#legal-approval--redlines`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> If the contract value is >$100k or Procurement is already actively negotiating or communicating with the vendor, Procurement will take responsibility for sending any legal redlines to the vendor.

## Category: `non_cost_agreement_approval`

### Rule `PROC-AGREE-0001` — Non Cost Agreement Approval

**Conditions** (all must hold):
- `document_source` equals `vendor`
- `contract_value_usd` equals 0
- `document_signature_requested` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal** → **Security**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `legal_preapproval`, `security_preapproval`
- Cross-domain refs: `LEG-NDA-0001`, `LEG-NDA-0003`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement_trial_agreement · Non-Cost related Agreements_
> If you have documents from a vendor that are not cost-related, such as a Trial/Demo Agreement, Engagement Letter, etc., please open a ZIP [request](https://gitlab.ziphq.com/create-workflow-request) selecting a Request a Demo/Trial ($0 Contracts) workflow and proceed with completing the form.  ![zip-image-2](https://handbook.gitlab.com/images/finance/procurement/ZIP-Start-Request.png)  On the request, provide received from the vendor documents for Legal and Security review.  Please, do not sign any document before Legal and Security approvals are collected.

## Category: `po_policy_exception`

### Rule `PROC-PO-0001` — Po Policy Exception

**Conditions** (all must hold):
- `purchase_frequency` equals `one_time`
- `purchase_amount_usd` is less than 5000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually)

### Rule `PROC-PO-0002` — Po Policy Exception

**Conditions** (all must hold):
- `purchase_category` equals `charitable_contribution`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations)

### Rule `PROC-PO-0003` — Po Policy Exception

**Conditions** (all must hold):
- `purchase_category` equals `interview_candidate_reimbursement`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement

### Rule `PROC-PO-0004` — Po Policy Exception

**Conditions** (all must hold):
- `purchase_category` equals `confidential_outside_counsel_legal_fees`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement 4. Confidential outside counsel legal fees

### Rule `PROC-PO-0005` — Po Policy Exception

**Conditions** (all must hold):
- `purchase_category` equals `confidential_recruiting_engagement`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`, `LEG-RPT-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement 4. Confidential outside counsel legal fees 5. Confidential Recruiting Engagements

### Rule `PROC-PO-0006` — Po Policy Exception

**Conditions** (all must hold):
- `fee_category` equals `statutory_tax_fees`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement 4. Confidential outside counsel legal fees 5. Confidential Recruiting Engagements 6. Statutory Tax fees

### Rule `PROC-PO-0007` — Po Policy Exception

**Conditions** (all must hold):
- `vendor_category` equals `peo_provider`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement 4. Confidential outside counsel legal fees 5. Confidential Recruiting Engagements 6. Statutory Tax fees 7. PEO Providers

### Rule `PROC-PO-0008` — Po Policy Exception

**Conditions** (all must hold):
- `payment_category` equals `ar_customer_refund`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement 4. Confidential outside counsel legal fees 5. Confidential Recruiting Engagements 6. Statutory Tax fees 7. PEO Providers 8. AR/Customer Refunds

### Rule `PROC-PO-0009` — Po Policy Exception

**Conditions** (all must hold):
- `payment_category` equals `board_of_director_payment`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement 4. Confidential outside counsel legal fees 5. Confidential Recruiting Engagements 6. Statutory Tax fees 7. PEO Providers 8. AR/Customer Refunds 9. Board of Director Payments

### Rule `PROC-PO-0010` — Po Policy Exception

**Conditions** (all must hold):
- `payment_category` equals `financing_banking_investing`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement 4. Confidential outside counsel legal fees 5. Confidential Recruiting Engagements 6. Statutory Tax fees 7. PEO Providers 8. AR/Customer Refunds 9. Board of Director Payments 10. Financing, Banking and Investing (incl interest, debt, FX, fees)

### Rule `PROC-PO-0011` — Po Policy Exception

**Conditions** (all must hold):
- `payment_method` equals `corporate_credit_card`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-EXP-0003`, `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> Exceptions to the PO Policy are:  1. One time purchases under $5K (or less than $5K annually) 2. Charitable Contributions (Donations) 3. Interview Candidate Reimbursement 4. Confidential outside counsel legal fees 5. Confidential Recruiting Engagements 6. Statutory Tax fees 7. PEO Providers 8. AR/Customer Refunds 9. Board of Director Payments 10. Financing, Banking and Investing (incl interest, debt, FX, fees) 11. Corporate Credit Card

## Category: `privacy_review`

### Rule `PROC-PRIV-0001` — Privacy Review

**Conditions** (all must hold):
- `purchase_category` equals `SaaS`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Privacy**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `privacy_preapproval`
- Cross-domain refs: `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> A Privacy Review is required for all SaaS purchases and other purchase types where the supplier will receive from GitLab or collect on GitLab’s behalf red/orange data.

### Rule `PROC-PRIV-0002` — Privacy Review

**Conditions** (all must hold):
- `vendor_status` equals `existing`
- `prior_privacy_review_result` equals `full_and_satisfactory`
- `privacy_review_age_months` is at least 24 months

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Privacy**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `privacy_preapproval`
- Cross-domain refs: `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> For existing vendors, a full privacy review is required every 24 months, provided the vendor completed a full and satisfactory privacy review during the prior procurement cycle

## Category: `procurement_engagement`

### Rule `PROC-ENGAGE-0001` — Procurement Engagement

**Conditions** (all must hold):
- `suppliers_being_evaluated` equals true
- `purchase_category` is one of ["services", "goods"]

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `procurement_preapproval`
- Cross-domain refs: `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process_
> Anytime a group of suppliers are being evaluated for services/goods or a purchase is being made on behalf of GitLab that does not qualify as a [personal expense](https://handbook.gitlab.com/handbook/finance/expenses/) or meet the list of [exceptions](https://handbook.gitlab.com/handbook/finance/procurement/#what-are-the-exceptions-to-the-po-policy), Procurement must be engaged BEFORE a purchase and/or work can begin.

## Category: `procurement_intake`

### Rule `PROC-ZIP-0002` — Procurement Intake

**Conditions** (all must hold):
- `request_type` equals `renewal_existing_vendor_services`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0003`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> Submit a Zip Request for    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)

### Rule `PROC-ZIP-0003` — Procurement Intake

**Conditions** (all must hold):
- `purchase_type` equals `new_spend`
- `purchase_amount_usd` is less than 25000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0001`, `LEG-NDA-0003`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> Submit a Zip Request for    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)

### Rule `PROC-ZIP-0004` — Procurement Intake

**Conditions** (all must hold):
- `request_type` equals `change_request_existing_po`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0003`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> Submit a Zip Request for    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)

### Rule `PROC-ZIP-0005` — Procurement Intake

**Conditions** (all must hold):
- `contract_value_usd` equals 0
- `request_type` equals `contract_review`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`, `LEG-AC-0010`, `LEG-ETHICS-0001`, `LEG-NDA-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> Submit a Zip Request for    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)    4. [$0 contract reviews including demos and trials](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-request-a-signature-on-a-poc-agreement)

### Rule `PROC-ZIP-0006` — Procurement Intake

**Conditions** (all must hold):
- `purchase_category` equals `partner_revenue_payments`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-CHAR-0001`, `FIN-PO-0001`, `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`, `LEG-AC-0013`, `LEG-AC-0014`, `LEG-AC-0015`, `LEG-AC-0016`, `LEG-AC-0017`, `LEG-ETHICS-0001`, `LEG-NDA-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> Submit a Zip Request for    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)    4. [$0 contract reviews including demos and trials](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-request-a-signature-on-a-poc-agreement)    5. Partner Revenue Payments

### Rule `PROC-ZIP-0007` — Procurement Intake

**Conditions** (all must hold):
- `purchase_category` equals `individual_use_software`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-NDA-0003`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> Submit a Zip Request for    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)    4. [$0 contract reviews including demos and trials](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-request-a-signature-on-a-poc-agreement)    5. Partner Revenue Payments    6. [Individual Use Software](https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/)

### Rule `PROC-ZIP-0008` — Procurement Intake

**Conditions** (all must hold):
- `request_type` equals `termination_or_non_renewal_notice`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-NDA-0003`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> Submit a Zip Request for    1. [Purchase Requests for renewals of existing vendor’s services](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    2. [Purchase Requests for new spend **under $25k**](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request)    3. [Change Requests to existing POs](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-do-a-request-change)    4. [$0 contract reviews including demos and trials](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-request-a-signature-on-a-poc-agreement)    5. Partner Revenue Payments    6. [Individual Use Software](https://handbook.gitlab.com/handbook/finance/procurement/individual-use-software/)    7. [Providing Termination or Non-Renewal Notice](https://handbook.gitlab.com/handbook/finance/procurement/#6-cancellation)

## Category: `procurement_negotiation`

### Rule `PROC-NEG-0001` — Procurement Negotiation

**Conditions** (all must hold):
- `purchase_category` equals `SaaS`
- `contract_value_usd` exceeds 25000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `procurement_team_preapproval`
- Cross-domain refs: `LEG-VEND-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> The Procurement team negotiates SaaS contracts >$25k and one-time contracts >$100K   + **If this step is not taken, purchase orders will not be approved until Procurement is able to negotiate**

## Category: `procurement_team_alignment`

### Rule `PROC-ALIGN-0007` — Procurement Team Alignment
_Severity: informational_

**Conditions** (all must hold):
- `annual_spend_usd` exceeds 25000 USD/year
- `business_division` equals `Legal`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Adrienne Ruhaak**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `adrienne_ruhaak_preapproval`
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PURCH-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment_
> Division alignment for spend over >$25k USD / year:  * Marketing - Ashley Abbate * Sales - Ashley Abbate * Product - Adrienne Ruhaak * Engineering - Adrienne Ruhaak * People - Adrienne Ruhaak * Finance - Adrienne Ruhaak * Legal - Adrienne Ruhaak

### Rule `PROC-ALIGN-0008` — Procurement Team Alignment
_Severity: informational_

**Conditions** (all must hold):
- `spend_amount_usd` is less than 25000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Dasha Yarmusik**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `dasha_yarmusik_preapproval`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment_
> * All division spend <$25k USD - Dasha Yarmusik

### Rule `PROC-ALIGN-0009` — Procurement Team Alignment
_Severity: informational_

**Conditions** (all must hold):
- `purchase_category` equals `individual_software_purchases`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Anam Shaikh**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `anam_shaikh_preapproval`
- Cross-domain refs: `FIN-EXP-0003`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Procurement Team Alignment_
> * Individual Software Purchases - Anam Shaikh

## Category: `purchase_order_change_approval`

### Rule `PROC-PO-0013` — Purchase Order Change Approval

**Conditions** (all must hold):
- `existing_po_change` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Finance** → **Functional** → **Executive (if applicable)**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `finance_preapproval`, `functional_preapproval`, `executive_if_applicable_preapproval`
- Cross-domain refs: `FIN-EXP-0004`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Zip Change Requests_
> Note, changes to an existing PO also must be approved by Finance, Functional, and Executive (if applicable) team members in Coupa like a new Purchase Request.

## Category: `purchase_request_approval`

### Rule `PROC-REQ-0001` — Purchase Request Approval

**Conditions** (all must hold):
- `purchase_request_negotiation_status` equals `completed`

**Approve** outright when these conditions hold.
- Approver chain: **procurement** → **fp&a**
- Cross-domain refs: `LEG-VEND-0001`

_Source: gitlab/finance_procurement_field_marketing_events · Field Marketing and Events > What Happens after I submit my Request?_
> Once neotiation is completed and/or it is determined that negotiation is not needed, your purchase request will be approved by procurement and will advance to the next approver, which is typically fp&a.

## Category: `purchase_request_escalation`

### Rule `PROC-PROC-0001` — Purchase Request Escalation

**Conditions** (all must hold):
- `escalation_reason` equals `Supplier wants it signed today`

**Reject** when these conditions hold.

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > What if I have an Urgent Request?_
> “Supplier wants it signed today” does not qualify as a reason for escalation and these requests will be denied.

## Category: `purchase_terms_required`

### Rule `PROC-TERMS-0001` — Purchase Terms Required

**Conditions** (all must hold):
- `purchase_made_by_gitlab` equals true

**Request supporting documents** before deciding.
- Required documents: `executed terms and conditions`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `executed_terms_and_conditions`
- Cross-domain refs: `LEG-CONTR-0002`, `LEG-PURCH-0001`, `LEG-VEND-0001`

_Source: gitlab/legal_procurement_guide_collaborating_with_gitlab_legal · Procurement Guide: Collaborating with GitLab Legal > Negotiating Terms_
> For any purchases made by GitLab, there must be executed terms and conditions in place before a purchase can be made or before services can be provided.

## Category: `rfp_bid_requirement`

### Rule `PROC-RFP-0003` — Rfp Bid Requirement

**Conditions** (all must hold):
- `rfp_process_required` equals true
- `purchase_amount_usd` exceeds 250000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> Over $250K: Procurement led RFP, typically 5+ vendor bids

### Rule `PROC-RFP-0004` — Rfp Bid Requirement

**Conditions** (all must hold):
- `rfp_process_required` equals true
- `purchase_amount_usd` is at least 100000 USD
- `purchase_amount_usd` is at most 250000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-NDA-0001`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> $100K - $250K: Business led RFP, 2-3 vendor bids required

### Rule `PROC-RFP-0005` — Rfp Bid Requirement

**Conditions** (all must hold):
- `rfp_process_required` equals true
- `purchase_amount_usd` is at least 25000 USD
- `purchase_amount_usd` is at most 100000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> $25K - $100K: Business led quick-bid, 2 vendor bids required

## Category: `rfp_process_requirement`

### Rule `PROC-RFP-0002` — Rfp Process Requirement

**Conditions** (all must hold):
- `purchase_type` equals `new_spend`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > How to start the Procurement Process_
> For new spend, changing vendors for existing services, or after 3 years of renewing a service, follow the [RFP Process](https://internal.gitlab.com/handbook/finance/procurement/)

## Category: `rfp_vendor_selection`

### Rule `PROC-RFP-0001` — Rfp Vendor Selection

**Conditions** (all must hold):
- `new_spend` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement Category Manager**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `procurement_category_manager_preapproval`
- Exceptions (overriding rules): `unless approved by your Procurement Category Manager`
- Cross-domain refs: `LEG-NDA-0003`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> All new spend, changing of vendors for existing services, and market reviews every 3 years for existing contracts should follow the [RFP and Vendor Selection process](https://internal.gitlab.com/handbook/finance/procurement/), unless approved by your Procurement Category Manager, to ensure we are choosing the best partner for GitLab with the best commercial terms. This must be done prior to verbally agreeing to terms or contracting with any new or existing vendor.

## Category: `software_purchase_it_review`

### Rule `PROC-SOFT-0001` — Software Purchase It Review

**Conditions** (all must hold):
- `purchase_category` equals `new_software`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `it_preapproval`
- Cross-domain refs: `FIN-PO-0001`, `LEG-NDA-0003`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Submitting a request for New Software_
> All new software purchases also need reviewed by [IT](https://handbook.gitlab.com/handbook/finance/procurement/#3b-it-review-2-days-if-purchasing-new-software-or-for-contractors)

## Category: `software_vendor_questionnaire`

### Rule `PROC-SOFT-0002` — Software Vendor Questionnaire

**Conditions** (all must hold):
- `purchase_category` equals `new_software`

**Request supporting documents** before deciding.
- Required documents: `IT Questionnaire tab`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `it_questionnaire_tab`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Submitting a request for New Software_
> New software vendors will need to complete the [IT Questionnaire tab](https://docs.google.com/spreadsheets/d/17-NdZF0SeOS_b59XE9lLg9cuCD9iKKlO/edit#gid=392482466).

## Category: `unauthorized_contract_signature_escalation`

### Rule `PROC-CONTR-0001` — Unauthorized Contract Signature Escalation

**Conditions** (all must hold):
- `contract_signed_without_authority` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-RMDR-0001`, `LEG-RMDR-0002`, `LEG-RMDR-0003`, `LEG-RMDR-0004`, `LEG-RMDR-0005`, `LEG-VEND-0001`

_Source: gitlab/legal_procurement_guide_collaborating_with_gitlab_legal · Procurement Guide: Collaborating with GitLab Legal > Signing Contracts_
> If you accidentally sign a contract or become aware of a contract that was signed by someone without authority, please immediately report it to the GitLab Procurement Team so that GitLab Legal can be engaged.

## Category: `urgent_payment_approval`

### Rule `PROC-PO-0012` — Urgent Payment Approval

**Conditions** (all must hold):
- `payment_category` equals `urgent_payment`
- `payment_in_exception_list` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP** → **Corporate Controller** → **PAO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_preapproval`, `corporate_controller_preapproval`, `pao_preapproval`
- Cross-domain refs: `LEG-AC-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What are the exceptions to the PO Policy?_
> 12. Urgent Payments not included on list above (approval required from VP, Corporate Controller and/or PAO)

## Category: `urgent_request_escalation`

### Rule `PROC-URGENT-0001` — Urgent Request Escalation

**Conditions** (all must hold):
- `approval_lead_time_business_days` is less than 5 business_days

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/finance_procurement_field_marketing_events · Field Marketing and Events > What if I have an Urgent Request?_
> Urgent requests that need approval in less than 5 business days, need to be escalated in the #procurement channel for expediting per the below.

## Category: `urgent_request_escalation_documentation`

### Rule `PROC-URGENT-0002` — Urgent Request Escalation Documentation

**Conditions** (all must hold):
- `approval_lead_time_business_days` is less than 5 business_days

**Request supporting documents** before deciding.
- Required documents: `Link to your Coupa Request`, `Date needed`, `Specific and quantifiable impact to the business if date is missed`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `link_to_your_coupa_request`, `date_needed`, `specific_and_quantifiable_impact_to_the_business_if_date_is_missed`
- Exceptions (overriding rules): `Contracts should not be posted directly in slack`
- Cross-domain refs: `LEG-MATREV-0007`

_Source: gitlab/finance_procurement_field_marketing_events · Field Marketing and Events > What if I have an Urgent Request?_
> Urgent requests that need approval in less than 5 business days, need to be escalated in the #procurement channel for expediting per the below. * In your slack message you MUST include:   + Link to your Coupa Request     - Contracts should not be posted directly in slack   + Date needed   + Specific and quantifiable impact to the business if date is missed.

## Category: `usage_based_software_review`

### Rule `PROC-VEND-0009` — Usage Based Software Review

**Conditions** (all must hold):
- `purchase_category` equals `software_renewal`
- `usage_based` equals true

**Request supporting documents** before deciding.
- Required documents: `usage report`
- Approver chain: **Procurement**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `usage_report`
- Cross-domain refs: `LEG-PRIV-0018`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Other Tips for Submitting Requests_
> For any software renewal/add-on that is based on usage (e.g. user quantities), a usage report is required for Procurement’s review.

## Category: `vendor_anticorruption_review`

### Rule `PROC-AC-0001` — Vendor Anticorruption Review

**Conditions** (all must hold):
- `vendor_recommended_to_gitlab` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Ethics and Compliance team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `ethics_and_compliance_team_preapproval`
- Cross-domain refs: `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`, `LEG-AC-0013`, `LEG-AC-0014`, `LEG-AC-0015`, `LEG-AC-0016`, `LEG-AC-0017`, `LEG-AC-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> Depending on nature of vendor’s services and/or whether the vendor has been recommended to us, the Ethics and Compliance team will need to complete an anticorruption/antibribery review and, potentially, recommend additional measures to mitigate that risk.

## Category: `vendor_cancellation_notification`

### Rule `PROC-VEND-0004` — Vendor Cancellation Notification

**Conditions** (all must hold):
- `cancellation_determined_outside_quarterly_cadence` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement Category Manager**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `procurement_category_manager_preapproval`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> If a cancellation is determined outside of this quarterly cadence, notify your Procurement Category Manager and complete the above process as soon as possible.

## Category: `vendor_cancellation_request`

### Rule `PROC-VEND-0001` — Vendor Cancellation Request

**Conditions** (all must hold):
- `vendor_cancellation_desired` equals true

**Request supporting documents** before deciding.
- Required documents: `Termination/Non-Renewal Request`, `copies of the existing contract(s)`
- Approver chain: **Procurement** → **Legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `termination_non_renewal_request`, `copies_of_the_existing_contract_s`
- Cross-domain refs: `LEG-PRIV-0018`, `LEG-VEND-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> For each of the above, if a cancellation is desired (which include terminations and/or non-renewals) please follow the “Cancellation Process” outlined below:  1. Submit a **Termination/Non-Renewal Request** through Zip by completing the intake form and providing copies of the existing contract(s) that you are canceling. 2. Through Zip, Procurement and Legal will work with the requester to provide instructions on how, when, and who should notify the vendor.

## Category: `vendor_commitment_procurement_engagement`

### Rule `PROC-VEND-0007` — Vendor Commitment Procurement Engagement

**Conditions** (all must hold):
- `commitment_type` equals `business`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Procurement Team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `procurement_team_preapproval`
- Cross-domain refs: `LEG-AC-0009`, `LEG-NDA-0001`, `LEG-VEND-0001`

_Source: gitlab/finance_procurement_field_marketing_events · Field Marketing and Events > Important to Know_
> Do NOT agree to ANY business, legal, and or pricing prior to engaging the Procurement Team.

## Category: `vendor_data_return_deletion_review`

### Rule `PROC-VEND-0002` — Vendor Data Return Deletion Review

**Conditions** (all must hold):
- `vendor_data_shared` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Security** → **Privacy**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `security_preapproval`, `privacy_preapproval`
- Cross-domain refs: `LEG-NDA-0006`, `LEG-PRIV-0017`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> Security and Privacy will also be added for awareness and review if data is being shared with the vendor to determine the requirements of returning or deleting the data.

## Category: `vendor_financial_viability_check`

### Rule `PROC-VEND-0011` — Vendor Financial Viability Check

**Conditions** (all must hold):
- `vendor_entity_type` equals `private_company`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?_
> 1. Vendor is a private company, LLC or self-employed

### Rule `PROC-VEND-0012` — Vendor Financial Viability Check

**Conditions** (all must hold):
- `services_required_for_continued_operations` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?_
> 2. Services provided are required for continued operations

### Rule `PROC-VEND-0013` — Vendor Financial Viability Check

**Conditions** (all must hold):
- `purchase_category` equals `cloud_hosting_services`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?_
> 3. Cloud hosting services

### Rule `PROC-VEND-0014` — Vendor Financial Viability Check

**Conditions** (all must hold):
- `service_customer_uptime_requirement` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-VEND-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?_
> 4. Services directly related to servicing customers with an uptime requirement

### Rule `PROC-VEND-0015` — Vendor Financial Viability Check

**Conditions** (all must hold):
- `stores_nonrecoverable_data` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-PRIV-0017`, `LEG-PRIV-0018`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?_
> 5. Storage of data that is not recoverable if vendor goes out of business

### Rule `PROC-VEND-0016` — Vendor Financial Viability Check

**Conditions** (all must hold):
- `vendor_replacement_time_days` exceeds 7 days

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-PO-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > Third Party Risk Management > When do we require a financial viability check?_
> 6. Software or services where it would take over 1 week to replace or swap

## Category: `vendor_onboarding_for_payment`

### Rule `PROC-VEND-0010` — Vendor Onboarding For Payment

**Conditions** (all must hold):
- `vendor_payment_requested` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-CHAR-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> In order for vendors to be paid, they need to complete their onboarding in our systems.

## Category: `vendor_sanctions_screening`

### Rule `PROC-VEND-0005` — Vendor Sanctions Screening

**Conditions** (all must hold):
- `sanctions_match_detected` equals false
- `vendor_country_risk_tier` is not `high_risk`

**Approve** outright when these conditions hold.
- Cross-domain refs: `FIN-VEND-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> If Risk Rate detects no matches between the vendor and applicable sanctions lists AND the vendor is not located in a high-risk country, the vendor will be auto-approved.

### Rule `PROC-VEND-0006` — Vendor Sanctions Screening

**Conditions** (all must hold):
- `sanctions_match_detected` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab’s Trade Compliance Counsel**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_s_trade_compliance_counsel_preapproval`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> If Risk Rate detects a potential match or is located in a high risk country, the vendor may require escalation to and manual review by GitLab’s Trade Compliance Counsel.

## Category: `vendor_security_review`

### Rule `PROC-SEC-0001` — Vendor Security Review

**Conditions** (all must hold):
- `data_processing_activity` equals `collect`
- `data_categories` equals `Orange Data`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Security Third Party Risk Management**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `security_third_party_risk_management_preapproval`
- Exceptions (overriding rules): `Excluding field marketing events`
- Cross-domain refs: `LEG-PRIV-0018`, `https://handbook.gitlab.com/handbook/security/security-assurance/security-risk/third-party-risk-management/`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> [Security Third Party Risk Management](https://handbook.gitlab.com/handbook/security/security-assurance/security-risk/third-party-risk-management/) reviews are required for vendors that collect, process, or store Orange / Red Data, software providers (SaaS and On-premise), and independent contractors / consultants. (Excluding field marketing events)

### Rule `PROC-VEND-0008` — Vendor Security Review

**Conditions** (all must hold):
- `data_shared` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab’s Security Risk Team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_s_security_risk_team_preapproval`
- Cross-domain refs: `LEG-NDA-0001`, `LEG-NDA-0003`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Other Tips for Submitting Requests_
> If any data will be shared, a Vendor Security Review will be completed. The vendor will receive an email communication from GitLab’s Security Risk Team requesting information regarding their security protocols.

## Category: `vendor_software_offboarding`

### Rule `PROC-VEND-0003` — Vendor Software Offboarding

**Conditions** (all must hold):
- `cancellation_request_type` equals `software_offboarding`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `it_preapproval`
- Cross-domain refs: `LEG-PRIV-0020`, `Tech Stack Update`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> For certain cancellation requests—such as software offboarding—IT will be included in the Zip workflow to determine and complete the required deprovisioning and system offboarding steps.

## Category: `zip_purchase_request_requirement`

### Rule `PROC-ZIP-0001` — Zip Purchase Request Requirement

**Conditions** (all must hold):
- `purchase_category` equals `home_office_equipment`
- `purchase_purpose` equals `individual_work_use`
- `purchase_amount_usd` is less than 5000 USD

**Approve** outright when these conditions hold.
- Cross-domain refs: `FIN-PO-0001`, `Other Services`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request_
> If purchasing Home Office Equipment and/or Software for your individual work use that is <$5K USD, see [Other Services](https://handbook.gitlab.com/handbook/finance/procurement/#other-services) since a Zip Purchase Request is not required in these instances.
