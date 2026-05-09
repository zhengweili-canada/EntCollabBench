# Finance Approval Rulebook

This rulebook is the authoritative reference for the **finance_approval_specialist**. It contains 42 rules across 36 categories, derived from the company's policy corpus. When adjudicating an approval request:

1. Read the request and supporting evidence.
2. Identify which rules below have **all conditions** matching the request.
3. **Check fulfillment**: if a rule lists `Fulfilled by: <items>` and the submission already contains evidence of EVERY listed item (e.g. a pre-approval email, a signed NDA, a completed assessment report), treat that rule as already satisfied — its effective decision becomes `approve` for this case.
4. Apply the highest-priority decision among the (effective) firing rules: reject > require_preapproval > require_docs > approve.
5. Cite each rule_id you relied on. If no rule fires for your role, answer with `not_applicable` and explain why.

---

## Category: `account_reconciliation_auto_certification`

### Rule `FIN-ACCT-0005` — Account Reconciliation Auto Certification

**Conditions** (all must hold):
- `account_activity_status` equals `none`

**Approve** outright when these conditions hold.
- Approver chain: **BlackLine**

_Source: gitlab/finance_accounting · Accounting and Reporting > Account Reconciliation Policy_
> If there is no activity and/or the account balance is zero the reconciliation will be auto certified by BlackLine.

## Category: `account_reconciliation_auto_signoff`

### Rule `FIN-ACCT-0001` — Account Reconciliation Auto Signoff

**Conditions** (all must hold):
- `account_balance_usd` equals 0

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FloQast**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `floqast_preapproval`

_Source: gitlab/finance_accounting · Accounting and Reporting > Account Reconciliation Policy_
> FloQast will auto sign-off the recon on our behalf if the following is met:  * Balance is zero

## Category: `account_reconciliation_review`

### Rule `FIN-ACCT-0002` — Account Reconciliation Review

**Conditions** (all must hold):
- `account_risk_rating` equals `High`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **accounting manager or above** → **CFO or PAO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `accounting_manager_or_above_preapproval`, `cfo_or_pao_preapproval`
- Exceptions (overriding rules): `tax and equity related accounts will be reconciled quarterly`
- Cross-domain refs: `LEG-RPT-0002`

_Source: gitlab/finance_accounting · Accounting and Reporting > Account Reconciliation Policy_
> High Risk Accounts will be reconciled by the preparer monthly (for the exception of tax and equity related accounts which will be reconciled quarterly) and will require 1st level review by an accounting manager or above and 2nd level review by the CFO or PAO.

### Rule `FIN-ACCT-0003` — Account Reconciliation Review

**Conditions** (all must hold):
- `account_risk_rating` equals `Medium`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **accounting manager or above**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `accounting_manager_or_above_preapproval`

_Source: gitlab/finance_accounting · Accounting and Reporting > Account Reconciliation Policy_
> Medium Risk Accounts will be reconciled by the preparer monthly and will require 1st level review by an accounting manager or above.

### Rule `FIN-ACCT-0004` — Account Reconciliation Review

**Conditions** (all must hold):
- `account_risk_rating` equals `Low`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **accounting manager or above**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `accounting_manager_or_above_preapproval`

_Source: gitlab/finance_accounting · Accounting and Reporting > Account Reconciliation Policy_
> Low Risk Accounts will be reconciled by the preparer monthly or quarterly and will require 1st level review by an accounting manager or above.

## Category: `accrued_liability_recording`

### Rule `FIN-ACCR-0001` — Accrued Liability Recording

**Conditions** (all must hold):
- `expense_amount_usd` is at least 5000 USD

**Request supporting documents** before deciding.
- Required documents: `accrued_liability_recording`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `accrued_liability_recording`
- Cross-domain refs: `LEG-AC-0027`, `LEG-AC-0028`, `PROC-ENGAGE-0001`, `PROC-EVENT-0001`

_Source: gitlab/finance_accounting · Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy_
> We require that all expenses be recorded where expense exceeds $5K USD or above, in the period the expense was incurred.

## Category: `annual_operating_plan_approval`

### Rule `FIN-AOP-0001` — Annual Operating Plan Approval

**Conditions** (all must hold):
- `plan_type` equals `annual_operating_plan`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **board of directors**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `board_of_directors_preapproval`
- Cross-domain refs: `LEG-RPT-0002`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > FP&A Processes > Annual Operating Plan (“AOP”)_
> * **Governance**: The AOP is approved by the board of directors every year.

## Category: `asset_disposition_approval`

### Rule `FIN-ASSET-0001` — Asset Disposition Approval

**Conditions** (all must hold):
- `asset_purchased_by_employee` equals true
- `employee_termination` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **IT Ops**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `it_ops_preapproval`
- Cross-domain refs: `PROC-IT-0003`

_Source: gitlab/finance_accounting · Accounting and Reporting > Property, Plant and Equipment > Disposition of an Asset_
> Assets will be disposed of if purchased by an employee upon termination (if approved by IT Ops) or if the item is no longer useful before the useful life.

## Category: `card_limit_exception_approval`

### Rule `FIN-CARD-0002` — Card Limit Exception Approval

**Conditions** (all must hold):
- `monthly_card_limit_usd` exceeds 10000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `LEG-PRIV-0012`, `LEG-PRIV-0034`

_Source: gitlab/finance_accounts_payable_corp_credit_cards · Navan Purchasing Card > 7. Exceptions to the Policy_
> Card members can be granted a higher limit than the allotted monthly $10K USD (or local currency) limit with an approved issue.

## Category: `charitable_contribution_payment`

### Rule `FIN-CHAR-0001` — Charitable Contribution Payment

**Conditions** (all must hold):
- `donation_amount_usd` exceeds 5000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-ZIP-0002`, `PROC-ZIP-0003`, `PROC-ZIP-0004`, `PROC-ZIP-0005`, `PROC-ZIP-0006`, `PROC-ZIP-0007`, `PROC-ZIP-0008`

_Source: gitlab/finance_procurement_charitable_contributions · Charitable Contribution Requests_
> if the donation is >$5,000, we will need to set the recipient up in Coupa and follow the PO process in order to issue payment. Please [create a purchase request in Zip](https://handbook.gitlab.com/handbook/business-technology/enterprise-applications/guides/zip-guide/#how-to-initiate-a-new-request) to get the organization registered and to process payment.

### Rule `FIN-CHAR-0002` — Charitable Contribution Payment

**Conditions** (all must hold):
- `donation_amount_usd` is less than 5000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Exceptions (overriding rules): `exception to the PO process`
- Cross-domain refs: `PROC-EVENT-0001`, `PROC-SOFT-0007`, `PROC-SOFT-0008`

_Source: gitlab/finance_procurement_charitable_contributions · Charitable Contribution Requests_
> If the donation is <$5,000, please contact [AP@gitlab.com](mailto:AP@gitlab.com) to process payment as an exception to the PO process.

## Category: `chart_of_accounts_approval`

### Rule `FIN-COA-0001` — Chart Of Accounts Approval

**Conditions** (all must hold):
- `coa_change_type` equals `new`
- `coa_element_type` equals `segment`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Finance team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `finance_team_preapproval`

_Source: gitlab/finance_accounting · Accounting and Reporting > Chart of Accounts Policy_
> All requests for new or modified (including closure/deactivation) COA segments, hierarchies, and configuration attributes are subject to approval by the Finance team.

### Rule `FIN-COA-0002` — Chart Of Accounts Approval

**Conditions** (all must hold):
- `coa_change_type` equals `new`
- `coa_element_type` equals `account`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Accounting Manager**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `accounting_manager_preapproval`

_Source: gitlab/finance_accounting · Accounting and Reporting > Chart of Accounts Policy_
> All requests for new or modified accounts must be submitted to the Accounting Manager for review and approval through a request using the Finance issue tracker.

## Category: `corporate_card_receipt_requirement`

### Rule `FIN-EXP-0001` — Corporate Card Receipt Requirement

**Conditions** (all must hold):
- `payment_method` equals `card`
- `team_member_country` is not `US`

**Request supporting documents** before deciding.
- Required documents: `receipt`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `receipt`

_Source: gitlab/finance_accounts_payable_corp_credit_cards · Navan Purchasing Card > 2. General Guidelines_
> All card charges require a receipt, with exception of US team members in which receipts are required for   anything over $50. Receipts must be uploaded into Navan within 30 days of the transaction date.

## Category: `expenditure_request_documentation`

### Rule `FIN-EXP-0005` — Expenditure Request Documentation

**Conditions** (all must hold):
- `requester_team` equals `LACA`
- `manager_support_status` equals `supported`

**Request supporting documents** before deciding.
- Required documents: `laca-travel-and-expense-request template`
- Approver chain: **manager**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `laca_travel_and_expense_request_template`

_Source: gitlab/legal_legalops · Stategy & Legal Operations > Legal & Corporate Affairs Expenditure Request Process > Expenditure Process Overview_
> If supported by their manager, the team member will complete the [“laca-travel-and-expense-request” template](https://gitlab.com/gitlab-com/legal-and-compliance/-/issues/new?issuable_template=laca-travel-and-expense-request).

## Category: `expenditure_request_preapproval`

### Rule `FIN-EXP-0004` — Expenditure Request Preapproval

**Conditions** (all must hold):
- `requester_team` equals `LACA`
- `request_type` equals `expenditure_request`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **manager**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `manager_preapproval`

_Source: gitlab/legal_legalops · Stategy & Legal Operations > Legal & Corporate Affairs Expenditure Request Process > Expenditure Process Overview_
> LACA team members must first communicate their intended request with their manager.

## Category: `expense_final_approval`

### Rule `FIN-EXP-0006` — Expense Final Approval

**Conditions** (all must hold):
- `expense_report_system` equals `Navan`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **team member’s manager** → **Accounts Payable analyst**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `team_member_s_manager_preapproval`, `accounts_payable_analyst_preapproval`
- Cross-domain refs: `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`, `LEG-AC-0023`, `LEG-AC-0024`

_Source: gitlab/finance_accounting · Accounting and Reporting > Expenses > Team Member Reimbursements - Navan_
> Navan will auto sync and record expense reports into NetSuite once the report is “final approved”. “Final approved” means it has been approved by the team member’s manager and completed an audit review by an Accounts Payable analyst or our external contractor, Montgomery Pacific (Montpac).

## Category: `expense_reimbursement_approval`

### Rule `FIN-EXP-0007` — Expense Reimbursement Approval

**Conditions** (all must hold):
- `expense_age_days` exceeds 90 days

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Manager**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `manager_preapproval`

_Source: gitlab/finance_spending_company_money · Spending Company Money > Guidelines_
> expense claims over 90 days from purchase date will not be reimbursed unless approved by your Manager.

## Category: `external_supplier_form_approval`

### Rule `FIN-VEND-0001` — External Supplier Form Approval

**Conditions** (all must hold):
- `form_type` equals `external_supplier_form`
- `vendor_country` equals `US`

**Request supporting documents** before deciding.
- Required documents: `W9`, `Bank details in a signed bank letterhead`
- Approver chain: **AP Team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `w9`, `bank_details_in_a_signed_bank_letterhead`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-VEND-0001`

_Source: gitlab/finance_accounts_payable · Accounts Payable > Accounts Payable Processing_
> External Supplier Forms are to be final approved by AP Team so that the vendor will be activated in Coupa, to provide our final approval, the vendor must comply with these two important documents so we can properly check the supplier form in our queue.      + W9 for US vendors and W8 for NON US vendors      + Bank details in a signed bank letterhead

## Category: `forecast_approval`

### Rule `FIN-FCAST-0001` — Forecast Approval

**Conditions** (all must hold):
- `forecast_type` equals `FYyyyy-mm`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Head of FP&A**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `head_of_fp_a_preapproval`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > Quarterly & Monthly Cycle (incl. close, variance, forecast, guidance) > Key Definitions_
> **Governance**: The Forecast at `FYyyyy-mm` is approved by the Head of FP&A and reviewed with the CFO.

## Category: `headcount_hiring_plan_change_approval`

### Rule `FIN-HC-0005` — Headcount Hiring Plan Change Approval

**Conditions** (all must hold):
- `hiring_plan_change_type` equals `add`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FBP**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `fbp_preapproval`
- Cross-domain refs: `RLOA`, `rolling forecast`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Hiring Plan Process_
> Add/remove/exchange positions requires FBP approval via existing process, e.g. RLOA or rolling forecast and submit change request Google Form [here](https://docs.google.com/forms/d/e/1FAIpQLSeHS97lg1Fz_SIQTisg-TOPHsXf6QMGw6vXfuEDkB_GY8pKfA/viewform)

## Category: `headcount_position_change_approval`

### Rule `FIN-HC-0001` — Headcount Position Change Approval

**Conditions** (all must hold):
- `position_change_type` equals `adding`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FP&A**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `fp_a_preapproval`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Position ID (PID)_
> Adding/removing/exchanging position(s) requires FP&A’s approval through existing RLOA or rolling forecast. FBP will submit change request Google Form

## Category: `hiring_plan_approval`

### Rule `FIN-HC-0002` — Hiring Plan Approval

**Conditions** (all must hold):
- `hiring_plan_cycle` equals `AOP`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Board of Directors**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `board_of_directors_preapproval`
- Cross-domain refs: `PROC-EVENT-0001`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Role Approval and Release Process_
> Hiring Plans are approved by Board of Directors (during AOP) or CFO & e-group (during RLOA).

## Category: `invoice_write_off_approval`

### Rule `FIN-AR-0001` — Invoice Write Off Approval

**Conditions** (all must hold):
- `invoice_collectibility` equals `uncollectible`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `signature auhorization matrix`

_Source: gitlab/finance_accounting · Accounting and Reporting > Quote to cash > Accounts Receivable Process for Non-Payment of Invoices_
> On a quarterly basis, Senior Billing Manager and Revenue Director will determine the aged invoices that are uncollectible. They will create an issue ten (10) days before the end of the quarter to seek approval according to the [signature auhorization matrix](https://handbook.gitlab.com/handbook/finance/authorization-matrix/) to write off invoices and to also notify the Sr. Director of Sales Operations.

## Category: `job_offer_approval`

### Rule `FIN-HC-0004` — Job Offer Approval

**Conditions** (all must hold):
- `job_offer_status` equals `pending_fill`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FP&A**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `fp_a_preapproval`
- Cross-domain refs: `PROC-CWORK-0001`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Role Approval and Release Process_
> FP&A is also a required approval on all job offers (before the role is officially filled).

## Category: `legal_contingency_accrual`

### Rule `FIN-ACCR-0004` — Legal Contingency Accrual

**Conditions** (all must hold):
- `liability_category` equals `legal_contingency`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal - Commercial, IP & Compliance**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_of_legal_commercial_ip_compliance_preapproval`
- Cross-domain refs: `LEG-ESC-0001`

_Source: gitlab/finance_accounting · Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy_
> Legal Contingencies: Pending or threatened litigation, and actual or probable settlement. Legal contingencies should be determined with the help of GitLab’s VP of Legal - Commercial, IP & Compliance.

### Rule `FIN-ACCR-0005` — Legal Contingency Accrual

**Conditions** (all must hold):
- `liability_category` equals `legal_contingency`
- `loss_probability` equals `probable`
- `amount_reasonably_estimable` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_of_legal_preapproval`
- Cross-domain refs: `LEG-AC-0010`, `LEG-AC-0011`, `LEG-AC-0012`, `LEG-AC-0013`, `LEG-AC-0014`, `LEG-AC-0015`, `LEG-AC-0016`, `LEG-AC-0017`, `LEG-GTM-0001`, `LEG-NDA-0001`, `LEG-VEND-0001`, `LEG-WAIVER-0001`

_Source: gitlab/finance_accounting · Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy_
> In addition, any potential legal contingencies are discussed during the monthly meeting with the VP of Legal and an accrual is recorded if the loss is deemed probable and the amount can be reasonably estimated.

## Category: `payment_batch_segregation_of_duties`

### Rule `FIN-PAY-0001` — Payment Batch Segregation Of Duties

**Conditions** (all must hold):
- `batch_creator_is_releasor` equals true

**Reject** when these conditions hold.

_Source: gitlab/finance_accounting · Accounting and Reporting > Procure to Pay > Payment Process_
> **Segregation of Duties:** The creator of the Batch cannot be the releasor of the same batch regardless of the permissions they have.

## Category: `payroll_invoice_signoff`

### Rule `FIN-PAYROLL-0001` — Payroll Invoice Signoff

**Conditions** (all must hold):
- `invoice_amount_usd` is at least 500000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Manager** → **Director**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `manager_preapproval`, `director_preapproval`

_Source: gitlab/finance_accounts_payable · Accounts Payable > Accounts Payable Processing_
> Invoices with amounts greater than or equal to USD $500,000 are required to have 2 signatories from the Payroll Team (Manager and Director).

## Category: `prepaid_expense_exception_preapproval`

### Rule `FIN-PREPAID-0001` — Prepaid Expense Exception Preapproval

**Conditions** (all must hold):
- `prepaid_expense_policy_exception_requested` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Corporate Controller** → **PAO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `corporate_controller_preapproval`, `pao_preapproval`

_Source: gitlab/finance_accounting · Accounting and Reporting > Accounting Policies > Prepaid Expense Policy_
> Any exceptions should be pre-approved by the Corporate Controller or PAO.

## Category: `professional_fee_accrual`

### Rule `FIN-ACCR-0002` — Professional Fee Accrual

**Conditions** (all must hold):
- `professional_fee_category` equals `legal`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal - Commercial, IP & Compliance**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_of_legal_commercial_ip_compliance_preapproval`
- Cross-domain refs: `LEG-VEND-0001`

_Source: gitlab/finance_accounting · Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy_
> Legal Professional Fees: Monthly templates are e-mailed by the 1st to all legal firms requesting them to complete with all outstanding bills and unbilled services as of that month end (ex. e-mails are sent by April 1st requesting services as of March 31st). The responses from all legal firms are complied and reviewed with the VP of Legal - Commercial, IP & Compliance by the 5th, and accruals are made based on the responses and review.

### Rule `FIN-ACCR-0003` — Professional Fee Accrual

**Conditions** (all must hold):
- `professional_fee_category` equals `tax`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Director of Tax**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `director_of_tax_preapproval`

_Source: gitlab/finance_accounting · Accounting and Reporting > Accounting Policies > Accrued Liabilities Policy_
> Tax and Audit Professional Fees: Similarly e-mails with the template are sent to the tax and audit firms and the tax responses are compiled and reviewed with the Director of Tax and the audit firm responses are reviewed with the Accounting and External Reporting Manager by the 5th and appropriate accruals are made based on the review.

## Category: `purchase_order_requirement`

### Rule `FIN-PO-0001` — Purchase Order Requirement

**Conditions** (all must hold):
- `total_contract_value_usd` exceeds 5000 USD

**Request supporting documents** before deciding.
- Required documents: `purchase order`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `purchase_order`
- Exceptions (overriding rules): `unless it falls under the PO Exception Policy`
- Cross-domain refs: `PROC-ZIP-0001`, `https://handbook.gitlab.com/handbook/finance/procurement/#what-are-the-exceptions-to-the-po-policy`

_Source: gitlab/finance_accounts_payable · Accounts Payable > General Guidelines_
> All purchases/services with a total contract value over $5000 are **required** to have a purchase order, unless it falls under the [PO Exception Policy](https://handbook.gitlab.com/handbook/finance/procurement/#what-are-the-exceptions-to-the-po-policy).

## Category: `purchase_requisition_requirement`

### Rule `FIN-EXP-0002` — Purchase Requisition Requirement

**Conditions** (all must hold):
- `purchase_amount_usd` exceeds 5000 USD
- `payment_method` equals `card`

**Request supporting documents** before deciding.
- Required documents: `Purchase Requisition in Zip`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `purchase_requisition_in_zip`
- Cross-domain refs: `PROC-REQ-0001`, `PROC-SOFT-0007`, `PROC-SOFT-0008`

_Source: gitlab/finance_accounts_payable_corp_credit_cards · Navan Purchasing Card > 2. General Guidelines_
> If your purchase will be over $5,000 USD, you will need to enter a Purchase Requisition in Zip.

## Category: `purchasing_card_approval`

### Rule `FIN-CARD-0003` — Purchasing Card Approval

**Conditions** (all must hold):
- `card_type` equals `navan_purchasing_card`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Finance leadership team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `finance_leadership_team_preapproval`

_Source: gitlab/finance_accounts_payable_corp_credit_cards · Navan Purchasing Card > 8. PROCEDURES_
> Navan Purchasing Cards are limited to team members in certain positions that require a card for the purchase of low value goods and services. These cards are not for company wide use. Cards must be requested via an issue and approved by the Finance leadership team.

## Category: `purchasing_card_issuance_approval`

### Rule `FIN-CARD-0001` — Purchasing Card Issuance Approval

**Conditions** (all must hold):
- `request_type` equals `purchasing_card_issuance`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Direct Manager** → **VP Accounting Operation**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `direct_manager_preapproval`, `vp_accounting_operation_preapproval`

_Source: gitlab/finance_accounts_payable_corp_credit_cards · Navan Purchasing Card > 1. POLICY_
> To ensure good financial management and sound corporate governance, cards are only provided to team members under their name, and with the request/approval of the Direct Manager, and VP Accounting Operation’s final approval.

## Category: `quarterly_forecast_approval`

### Rule `FIN-FCAST-0002` — Quarterly Forecast Approval

**Conditions** (all must hold):
- `forecast_cadence` equals `quarterly`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Head of FP&A**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `head_of_fp_a_preapproval`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > Quarterly & Monthly Cycle (incl. close, variance, forecast, guidance) > Key Definitions_
> **Governance**: The quarterly forecast is approved by the Head of FP&A and reviewed with the CFO.

## Category: `requisition_approval`

### Rule `FIN-HC-0003` — Requisition Approval

**Conditions** (all must hold):
- `requisition_system` equals `Greenhouse`
- `requisition_status` equals `opened`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Total Rewards** → **FP&A** → **Department Lead (VP+)**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `total_rewards_preapproval`, `fp_a_preapproval`, `department_lead_vp_preapproval`
- Cross-domain refs: `LEG-SIGN-0001`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > Headcount Forecast and Hiring Plan > Role Approval and Release Process_
> When a requisition is opened in Greenhouse it is routed for approvals. The job approval requires approvals from Total Rewards, FP&A and Department Lead (VP+)

## Category: `rloa_proposal_approval`

### Rule `FIN-RLOA-0001` — Rloa Proposal Approval

**Conditions** (all must hold):
- `proposal_type` equals `RLOA`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CFO** → **e-group**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `cfo_preapproval`, `e_group_preapproval`
- Cross-domain refs: `LEG-MATREV-0013`, `LEG-MATREV-0014`, `LEG-MATREV-0015`, `LEG-MATREV-0016`

_Source: gitlab/finance_financial_planning_and_analysis · Financial Planning & Analysis > Rolling List of Asks (RLOA) > Detailed Expectations for FP&A_
> At e-group Review Meeting (typically Mon after CFO Variance Meeting),** CFO shares proposal for formal approval and inclusion into investor guidance

## Category: `software_reimbursement_denial`

### Rule `FIN-EXP-0003` — Software Reimbursement Denial

**Conditions** (all must hold):
- `purchase_category` equals `software`
- `payment_method` equals `personal_credit_card`

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-PO-0011`, `PROC-SOFT-0005`

_Source: gitlab/finance_procurement_individual_use_software · Individual Use Software > Individual Use Software Overview_
> Note that **all software purchases charged to either personal or corporate credit cards will be DENIED for reimbursement.**

## Category: `supplier_payment_account_approval`

### Rule `FIN-PAY-0002` — Supplier Payment Account Approval

**Conditions** (all must hold):
- `supplier_onboarding_process` equals `SIM`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-CW-0001`

_Source: gitlab/finance_accounting · Accounting and Reporting > Procure to Pay > Payment Process_
> If the supplier is going through the SIM process, the approval for that supplier payment account will occur directly on the SIM External Form, and AP won’t have to go into the supplier payment accounts to provide approval.

## Category: `vendor_onboarding_approval`

### Rule `FIN-VEND-0002` — Vendor Onboarding Approval

**Conditions** (all must hold):
- `external_supplier_form_status` equals `submitted`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Accounts Payable Approval Group**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `accounts_payable_approval_group_preapproval`
- Cross-domain refs: `LEG-NDA-0003`

_Source: gitlab/finance_accounting · Accounting and Reporting > Procure to Pay > Vendor Master Management_
> After supplier submission, the external form will be routed to Accounts Payable Approval Group for review and approval.
