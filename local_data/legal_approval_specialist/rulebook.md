# Legal Approval Rulebook

This rulebook is the authoritative reference for the **legal_approval_specialist**. It contains 159 rules across 101 categories, derived from the company's policy corpus. When adjudicating an approval request:

1. Read the request and supporting evidence.
2. Identify which rules below have **all conditions** matching the request.
3. **Check fulfillment**: if a rule lists `Fulfilled by: <items>` and the submission already contains evidence of EVERY listed item (e.g. a pre-approval email, a signed NDA, a completed assessment report), treat that rule as already satisfied — its effective decision becomes `approve` for this case.
4. Apply the highest-priority decision among the (effective) firing rules: reject > require_preapproval > require_docs > approve.
5. Cite each rule_id you relied on. If no rule fires for your role, answer with `not_applicable` and explain why.

---

## Category: `accuracy_dri_approval`

### Rule `LEG-ACC-0001` — Accuracy Dri Approval
_Severity: recommended_

**Conditions** (all must hold):
- `has_citable_reference` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **DRI**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `dri_preapproval`
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-SEC-0001`, `PROC-SEC-0002`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **SAFE** > **Why SAFE?** > **WHAT IS SAFE?** > **Accurate:**_
> If you are not able to cite a reference or you are not the [DRI](https://handbook.gitlab.com/handbook/people-group/directly-responsible-individuals/) for this information, did you receive approval from the [DRI](https://handbook.gitlab.com/handbook/people-group/directly-responsible-individuals/) to share this data?

## Category: `agreement_signature_approval`

### Rule `LEG-SIGN-0001` — Agreement Signature Approval

**Conditions** (all must hold):
- `document_type` equals `agreement`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal team member**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `legal_team_member_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > How do I get an Agreement Signed_
> All agreements require a Legal approval stamp in order to be signed. This stamp is placed on the agreement by a Legal team member when an executable version is reached.

## Category: `agreement_template_request`

### Rule `LEG-NEG-0002` — Agreement Template Request

**Conditions** (all must hold):
- `net_arr_threshold_requirements_met` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > EDUCATIONAL > When does GitLab Negotiate?_
> If the net ARR threshold requirements are met, a Sales team member must open a Legal Request to ask for the most current agreement template.

## Category: `ai_generated_image_approval`

### Rule `LEG-AIIMG-0001` — Ai Generated Image Approval

**Conditions** (all must hold):
- `asset_type` equals `ai_generated_image`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Brand**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `brand_preapproval`

_Source: gitlab/legal_ip_public_materials_guidelines · Guidelines for Use of Creative Assets and Third-party Content in External Materials > AI-generated images > **General Requirements for AI-generated images:**_
> All AI-generated images must be reviewed and approved by Brand before use.

## Category: `amended_material_legal_review`

### Rule `LEG-MAT-0003` — Amended Material Legal Review

**Conditions** (all must hold):
- `material_change_type` equals `substantive`
- `legal_review_completed` equals true
- `material_audience` equals `internal`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **@sfriss**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `sfriss_preapproval`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 1 Single material legal review process_
> If **any** substantive changes are made to the material after legal review, another legal review is required. Tag the appropriate reviewers ([`@sfriss`](https://gitlab.com/srissmiller) for internal materials, and [`@sfriss`](https://gitlab.com/srissmiller) and [`@LeeFalc`](https://gitlab.com/LeeFalc) for external materials) in the issue, or issue comment, created in step 1, requesting review of the amended material.

## Category: `amended_material_review`

### Rule `LEG-MATREV-0009` — Amended Material Review

**Conditions** (all must hold):
- `substantive_changes_after_legal_review` equals true
- `material_use` equals `internal`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **@sfriss**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `sfriss_preapproval`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 2 Multiple materials legal review process_
> If **any** substantive changes are made to the material after legal review, another legal review is required. Tag the appropriate reviewers ([`@sfriss`](https://gitlab.com/srissmiller) for internal materials, and [`@sfriss`](https://gitlab.com/srissmiller) and [`@LeeFalc`](https://gitlab.com/LeeFalc) for external materials) in the issue comment created in step 2, requesting review of the amended material.

## Category: `anti_corruption_facilitating_payment_preapproval`

### Rule `LEG-AC-0001` — Anti Corruption Facilitating Payment Preapproval

**Conditions** (all must hold):
- `payment_type` equals `facilitating_payment`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `clo_preapproval`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > FACILITATING PAYMENTS_
> Any and all facilitating payments require prior written approval from the CLO.

## Category: `anti_corruption_payment_consultation`

### Rule `LEG-AC-0007` — Anti Corruption Payment Consultation

**Conditions** (all must hold):
- `question_about_payment_impropriety` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Company’s Chief Legal Officer**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `company_s_chief_legal_officer_preapproval`
- Cross-domain refs: `PROC-AC-0002`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT_
> If you have any questions about whether a payment may be improper or violate this Policy, consult the Company’s Chief Legal Officer before any payment or offer is made.

## Category: `anti_corruption_political_contribution_preapproval`

### Rule `LEG-AC-0034` — Anti Corruption Political Contribution Preapproval

**Conditions** (all must hold):
- `company_resource_type` equals `funds`
- `recipient_type` equals `government_official`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > POLITICAL CONTRIBUTIONS_
> To mitigate the risk of an improper payment or the appearance of an improper payment, no Company funds, facilities, or services of any kind may be provided to any government official, including any candidate or prospective candidate for public office, to any political party, or to any political initiative, referendum, or other form of political campaign unless pre-approved in writing by the CLO.

## Category: `anti_corruption_prohibited_asset_retention_payment`

### Rule `LEG-AC-0006` — Anti Corruption Prohibited Asset Retention Payment

**Conditions** (all must hold):
- `payment_purpose` equals `retain_assets`

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-PO-0009`, `PROC-PO-0010`, `PROC-PO-0011`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT_
> payments to retain assets, such as an “under the table” payment to a tax official to settle a tax claim.

## Category: `anti_corruption_prohibited_improper_payment_support`

### Rule `LEG-AC-0005` — Anti Corruption Prohibited Improper Payment Support

**Conditions** (all must hold):
- `conduct_type` equals `act_in_furtherance_of_improper_payment`

**Reject** when these conditions hold.

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT_
> acts “in furtherance of” an improper payment, such as arranging for funds to be available for the improper payment;

## Category: `anti_corruption_prohibited_payment`

### Rule `LEG-AC-0002` — Anti Corruption Prohibited Payment

**Conditions** (all must hold):
- `recipient_role` equals `government_employee_or_official`
- `thing_of_value` equals true
- `payment_purpose` equals `wrongfully_influence_government_employee_or_official`

**Reject** when these conditions hold.

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT_
> Team Members and Partners may not give anything of value to any government employee or official in order to wrongfully influence the government employee or official

### Rule `LEG-AC-0003` — Anti Corruption Prohibited Payment

**Conditions** (all must hold):
- `recipient_role` equals `government_employee_or_official`
- `payment_purpose` equals `improper_purpose`
- `payment_channel` equals `direct`

**Reject** when these conditions hold.

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT_
> payments made directly to a government employee or official for an improper purpose;

## Category: `anti_corruption_prohibited_third_party_payment`

### Rule `LEG-AC-0004` — Anti Corruption Prohibited Third Party Payment

**Conditions** (all must hold):
- `transfer_type` equals `payment`
- `recipient_type` equals `third_party`
- `third_party_likely_recipient_role` equals `government_employee_or_official`
- `payment_purpose` equals `improper_purpose`
- `team_member_or_partner_knowledge` equals `knows_or_has_reason_to_know`

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT_
> payments or gifts to third parties where Team Members and Partners know or have reason to know that at least a portion of the payments or gifts is likely to be offered by the third party to a government employee or official for an improper purpose;

## Category: `anti_corruption_red_flag_escalation`

### Rule `LEG-AC-0010` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `payments_in_country_with_corruption_history`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> payments in a country with a history or reputation for corruption; 2. refusal to provide a certification of compliance with the FCPA or other anti-bribery laws; 3. unusual payment patterns or requests, including payments to third parties, in cash, and payments made to bank accounts outside the country; 4. representations or boasting about influence or connections; 5. use of a shell or holding company that obscures ownership without credible explanation; 6. accusations of improper business practices (credible rumors or media reports, etc.); 7. family or business relationship with the government or a government official; 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions; 9. unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0011` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `refusal_to_certify_anti_bribery_compliance`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `FCPA`, `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> refusal to provide a certification of compliance with the FCPA or other anti-bribery laws; 3. unusual payment patterns or requests, including payments to third parties, in cash, and payments made to bank accounts outside the country; 4. representations or boasting about influence or connections; 5. use of a shell or holding company that obscures ownership without credible explanation; 6. accusations of improper business practices (credible rumors or media reports, etc.); 7. family or business relationship with the government or a government official; 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions; 9. unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0012` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `unusual_payment_patterns_or_requests`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> unusual payment patterns or requests, including payments to third parties, in cash, and payments made to bank accounts outside the country; 4. representations or boasting about influence or connections; 5. use of a shell or holding company that obscures ownership without credible explanation; 6. accusations of improper business practices (credible rumors or media reports, etc.); 7. family or business relationship with the government or a government official; 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions; 9. unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0013` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `boasting_about_influence_or_connections`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`, `PROC-RFP-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> representations or boasting about influence or connections; 5. use of a shell or holding company that obscures ownership without credible explanation; 6. accusations of improper business practices (credible rumors or media reports, etc.); 7. family or business relationship with the government or a government official; 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions; 9. unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0014` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `shell_or_holding_company_obscures_ownership`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> use of a shell or holding company that obscures ownership without credible explanation; 6. accusations of improper business practices (credible rumors or media reports, etc.); 7. family or business relationship with the government or a government official; 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions; 9. unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0015` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `accusations_of_improper_business_practices`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> accusations of improper business practices (credible rumors or media reports, etc.); 7. family or business relationship with the government or a government official; 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions; 9. unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0016` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `family_or_business_relationship_with_government_official`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> family or business relationship with the government or a government official; 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions; 9. unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0017` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `up_front_payment_request_or_money_needed_to_get_business`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions; 9. unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0018` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `unusually_high_commissions_fees_or_payments`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> unusually high commissions, agents’ fees, or payments for goods or services; 10. apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0019` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `apparent_lack_of_qualifications_or_resources`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> apparent lack of qualifications or resources; 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0020` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `recommended_by_potential_government_customer_official`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Cross-domain refs: `PROC-AC-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> whether the representative or joint venture partner has been recommended by an official of the potential government customer; 12. requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0021` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `request_to_make_agreements_without_company_approval`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> requests to be able to make agreements without the Company’s approval; and 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

### Rule `LEG-AC-0022` — Anti Corruption Red Flag Escalation

**Conditions** (all must hold):
- `third_party_red_flag_type` equals `request_to_keep_agreements_or_communications_secret`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `your_supervisor_preapproval`, `the_clo_preapproval`
- Exceptions (overriding rules): `customary nondisclosure or confidentiality agreement`
- Cross-domain refs: `PROC-VEND-0008`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES_
> requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).  Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

## Category: `audio_content_license_review`

### Rule `LEG-IP-0001` — Audio Content License Review

**Conditions** (all must hold):
- `audio_content_license_uncertain` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **#legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `legal_preapproval`

_Source: gitlab/legal_ip_public_materials_guidelines · Guidelines for Use of Creative Assets and Third-party Content in External Materials > Audio content including music, sounds, and sound effects > Do_
> If you’re unsure, reach out to [#legal](https://app.slack.com/client/T02592416/C78E74A6L) to review the license covering the content you want to use.

## Category: `authorization_modification_approval`

### Rule `LEG-TRADE-0004` — Authorization Modification Approval

**Conditions** (all must hold):
- `authorization_modifications_requested_by_third_party` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_legal_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-ZIP-0002`

_Source: gitlab/legal_trademarks_at_gitlab · Trademarks at GitLab > Use of GitLab trademarks by third-parties on marketing materials_
> [Contact GitLab Legal](https://handbook.gitlab.com/handbook/legal/#how-to-reach-us) to obtain approval for any **modifications** the third party requests to the Authorization.

## Category: `case_study_publication_approval`

### Rule `LEG-CASE-0001` — Case Study Publication Approval

**Conditions** (all must hold):
- `materials_include_case_studies` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **customer** → **partner featured**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `customer_preapproval`, `partner_featured_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-SOFT-0006`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Compliance checklist_
> Case studies included are accurate, not misleading, and necessary approvals for publication from the customer or partner featured are in place and documented.

## Category: `charitable_contribution_approval`

### Rule `LEG-AC-0008` — Charitable Contribution Approval

**Conditions** (all must hold):
- `contribution_type` equals `charitable_donation`
- `donation_on_behalf_of_company` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `clo_preapproval`
- Cross-domain refs: `FIN-EXP-0001`, `PROC-ENGAGE-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > CHARITABLE CONTRIBUTIONS_
> Team Members and Partners must obtain prior written approval from the CLO before making any charitable donation on behalf of the Company or using Company funds, directly or indirectly.

## Category: `confidential_team_member_data_request_approval`

### Rule `LEG-PRIV-0034` — Confidential Team Member Data Request Approval

**Conditions** (all must hold):
- `data_confidentiality` equals `confidential`
- `data_subject` equals `team_member`
- `requester_affiliation` equals `outside_company`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-VEND-0008`, `applicable local laws`

_Source: gitlab/legal_privacy_employee_privacy_policy · Team Member Privacy Policy > How Does GitLab Handle Personal Data After Collection? > Storage of Personal Data_
> Requests for confidential Team Member data from anyone outside our company under any circumstances must be approved in accordance with applicable local laws.

## Category: `contract_document_format`

### Rule `LEG-CONTR-0001` — Contract Document Format

**Conditions** (all must hold):
- `document_type` equals `contract_documents`

**Request supporting documents** before deciding.
- Required documents: `Word (.docx) format in English`
- Approver chain: **legal team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `word_docx_format_in_english`
- Exceptions (overriding rules): `PDF versions are not acceptable for legal review`
- Cross-domain refs: `PROC-URGENT-0002`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > The Procurement Process > Review Steps, Timeline, and Considerations_
> **All contract documents must be provided in Word (.docx) format in English.** PDF versions are not acceptable for legal review as they cannot be efficiently redlined. Contact the vendor to request the Word version before submitting your request.

## Category: `contract_execution_approval`

### Rule `LEG-CONTR-0002` — Contract Execution Approval

**Conditions** (all must hold):
- `contract_execution_requested` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal Team Member**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `legal_team_member_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-CONTR-0001`, `PROC-EVENT-0001`, `PROC-NEG-0001`, `PROC-URGENT-0002`

_Source: gitlab/legal_procurement_guide_collaborating_with_gitlab_legal · Procurement Guide: Collaborating with GitLab Legal > Signing Contracts_
> In order to be executed, all Contracts must include the GitLab Legal stamp. This stamp confirms that the Contract has been reviewed and approved by a Legal Team Member.

## Category: `customer_negotiation_escalation`

### Rule `LEG-ESC-0001` — Customer Negotiation Escalation

**Conditions** (all must hold):
- `requester_type` equals `customer`
- `requested_material_non_standard_terms` equals true
- `transaction_merits_additional_consideration` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab’s leadership**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_s_leadership_preapproval`
- Cross-domain refs: `GitLab Escalation Process`

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Escalation Process_
> If a customer or partner has requested material non-standard terms, and the transaction merits additional consideration by GitLab’s leadership, please follow the [GitLab Escalation Process](https://internal.gitlab.com/handbook/legal-and-corporate-affairs/legal-commercial/index.html/) (the “Process”).

## Category: `data_processing_agreement_required`

### Rule `LEG-PRIV-0017` — Data Processing Agreement Required

**Conditions** (all must hold):
- `personal_data_shared` equals true

**Request supporting documents** before deciding.
- Required documents: `DPA`, `SCC’s`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `dpa`, `scc_s`
- Cross-domain refs: `PROC-PRIV-0003`

_Source: gitlab/finance_procurement_tips_for_submitting_a_zip_request · Tips for Submitting a Zip Request > Other Tips for Submitting Requests_
> If any personal data will be shared, the Vendor will need to sign our DPA and SCC’s as directed by state and/or country statutory requirements.

## Category: `data_protection_impact_assessment`

### Rule `LEG-PRIV-0001` — Data Protection Impact Assessment

**Conditions** (all must hold):
- `processing_risk_level` equals `high`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-SEC-0001`, `PROC-VEND-0008`

_Source: gdpr/article-35 · __prelude___
> Where a type of processing in particular using new technologies, and taking into account the nature, scope, context and purposes of the processing, is likely to result in a high risk to the rights and freedoms of natural persons, the controller shall, prior to the processing, carry out an assessment of the impact of the envisaged processing operations on the protection of personal data.

### Rule `LEG-PRIV-0002` — Data Protection Impact Assessment

**Conditions** (all must hold):
- `processing_type` equals `systematic_extensive_evaluation_of_personal_aspects`
- `automated_processing` equals true
- `decision_effect` equals `legal_or_similarly_significant_effect`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-PRIV-0003`, `PROC-SEC-0001`

_Source: gdpr/article-35 · __prelude___
> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of:    1. a systematic and extensive evaluation of personal aspects relating to natural persons which is based on automated processing, including profiling, and on which decisions are based that produce legal effects concerning the natural person or similarly significantly affect the natural person;

### Rule `LEG-PRIV-0003` — Data Protection Impact Assessment

**Conditions** (all must hold):
- `processing_scale` equals `large_scale`
- `data_categories` contains `special_categories_article_9`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Article 9(1)`

_Source: gdpr/article-35 · __prelude___
> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of:    1. a systematic and extensive evaluation of personal aspects relating to natural persons which is based on automated processing, including profiling, and on which decisions are based that produce legal effects concerning the natural person or similarly significantly affect the natural person;    2. processing on a large scale of special categories of data referred to in [Article 9](https://gdpr-info.eu/art-9-gdpr/)(1), or of personal data relating to criminal convictions and offences referred to in [Article 10](https://gdpr-info.eu/art-10-gdpr/);

### Rule `LEG-PRIV-0004` — Data Protection Impact Assessment

**Conditions** (all must hold):
- `monitoring_area_accessibility` equals `publicly_accessible`
- `monitoring_systematic` equals true
- `monitoring_scale` equals `large_scale`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-PRIV-0003`, `PROC-SEC-0001`

_Source: gdpr/article-35 · __prelude___
> A data protection impact assessment referred to in paragraph 1 shall in particular be required in the case of:    1. a systematic and extensive evaluation of personal aspects relating to natural persons which is based on automated processing, including profiling, and on which decisions are based that produce legal effects concerning the natural person or similarly significantly affect the natural person;    2. processing on a large scale of special categories of data referred to in [Article 9](https://gdpr-info.eu/art-9-gdpr/)(1), or of personal data relating to criminal convictions and offences referred to in [Article 10](https://gdpr-info.eu/art-10-gdpr/); or    3. a systematic monitoring of a publicly accessible area on a large scale.

### Rule `LEG-PRIV-0020` — Data Protection Impact Assessment

**Conditions** (all must hold):
- `privacy_risk_level` equals `high`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-SOFT-0006`

_Source: gitlab/legal_privacy_dpia · Data Protection Impact Assessment (DPIA) > How are DPIAs Conducted?_
> When a high level of risk is identified, the Privacy Team will collaborate with the relevant stakeholders to initiate and complete a DPIA. This typically will involve a Product Manager, business/technical owner, and the appropriate risk owner for the team.

## Category: `data_protection_impact_assessment_review`

### Rule `LEG-PRIV-0005` — Data Protection Impact Assessment Review

**Conditions** (all must hold):
- `processing_risk_changed` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-PRIV-0003`, `PROC-VEND-0002`, `PROC-VEND-0008`

_Source: gdpr/article-35 · __prelude___
> Where necessary, the controller shall carry out a review to assess if processing is performed in accordance with the data protection impact assessment at least when there is a change of the risk represented by processing operations.

## Category: `data_subprocessor_approval`

### Rule `LEG-PRIV-0006` — Data Subprocessor Approval

**Conditions** (all must hold):
- `engages_another_processor` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **controller**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `controller_preapproval`

_Source: gdpr/article-28 · __prelude___
> 2. 1The processor shall not engage another processor without prior specific or general written authorisation of the controller.

## Category: `data_subprocessor_change_notice`

### Rule `LEG-PRIV-0007` — Data Subprocessor Change Notice

**Conditions** (all must hold):
- `subprocessor_authorisation_type` equals `general_written`
- `subprocessor_change_type` equals `addition`

**Request supporting documents** before deciding.
- Required documents: `data_subprocessor_change_notice`
- Approver chain: **controller**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `data_subprocessor_change_notice`

_Source: gdpr/article-28 · __prelude___
> 2In the case of general written authorisation, the processor shall inform the controller of any intended changes concerning the addition or replacement of other processors, thereby giving the controller the opportunity to object to such changes.

## Category: `data_transfer_safeguard_authorization`

### Rule `LEG-PRIV-0009` — Data Transfer Safeguard Authorization

**Conditions** (all must hold):
- `appropriate_safeguard_mechanism` equals `legally_binding_enforceable_public_authority_instrument`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gdpr/article-46 · __prelude___
> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:    1. a legally binding and enforceable instrument between public authorities or bodies;

### Rule `LEG-PRIV-0010` — Data Transfer Safeguard Authorization

**Conditions** (all must hold):
- `appropriate_safeguard_mechanism` equals `binding_corporate_rules`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Article 47`, `PROC-BGSCRN-0006`

_Source: gdpr/article-46 · __prelude___
> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:    1. a legally binding and enforceable instrument between public authorities or bodies;    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);

### Rule `LEG-PRIV-0011` — Data Transfer Safeguard Authorization

**Conditions** (all must hold):
- `appropriate_safeguard_mechanism` equals `commission_standard_data_protection_clauses`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Article 93(2)`, `PROC-PRIV-0003`

_Source: gdpr/article-46 · __prelude___
> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:    1. a legally binding and enforceable instrument between public authorities or bodies;    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);    3. standard data protection clauses adopted by the Commission in accordance with the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);

### Rule `LEG-PRIV-0012` — Data Transfer Safeguard Authorization

**Conditions** (all must hold):
- `appropriate_safeguard_mechanism` equals `supervisory_authority_standard_data_protection_clauses_approved_by_commission`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Article 93(2)`, `FIN-VEND-0001`, `PROC-PRIV-0003`

_Source: gdpr/article-46 · __prelude___
> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:    1. a legally binding and enforceable instrument between public authorities or bodies;    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);    3. standard data protection clauses adopted by the Commission in accordance with the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);    4. standard data protection clauses adopted by a supervisory authority and approved by the Commission pursuant to the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);

### Rule `LEG-PRIV-0013` — Data Transfer Safeguard Authorization

**Conditions** (all must hold):
- `appropriate_safeguard_mechanism` equals `approved_code_of_conduct_with_binding_enforceable_commitments`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Article 40`, `PROC-PRIV-0003`

_Source: gdpr/article-46 · __prelude___
> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:    1. a legally binding and enforceable instrument between public authorities or bodies;    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);    3. standard data protection clauses adopted by the Commission in accordance with the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);    4. standard data protection clauses adopted by a supervisory authority and approved by the Commission pursuant to the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);    5. an approved code of conduct pursuant to [Article 40](https://gdpr-info.eu/art-40-gdpr/) together with binding and enforceable commitments of the controller or processor in the third country to apply the appropriate safeguards, including as regards data subjects’ rights; or

### Rule `LEG-PRIV-0014` — Data Transfer Safeguard Authorization

**Conditions** (all must hold):
- `appropriate_safeguard_mechanism` equals `approved_certification_mechanism_with_binding_enforceable_commitments`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Article 42`, `PROC-PRIV-0003`

_Source: gdpr/article-46 · __prelude___
> 2. The appropriate safeguards referred to in paragraph 1 may be provided for, without requiring any specific authorisation from a supervisory authority, by:    1. a legally binding and enforceable instrument between public authorities or bodies;    2. binding corporate rules in accordance with [Article 47](https://gdpr-info.eu/art-47-gdpr/);    3. standard data protection clauses adopted by the Commission in accordance with the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);    4. standard data protection clauses adopted by a supervisory authority and approved by the Commission pursuant to the examination procedure referred to in [Article 93](https://gdpr-info.eu/art-93-gdpr/)(2);    5. an approved code of conduct pursuant to [Article 40](https://gdpr-info.eu/art-40-gdpr/) together with binding and enforceable commitments of the controller or processor in the third country to apply the appropriate safeguards, including as regards data subjects’ rights; or    6. an approved certification mechanism pursuant to [Article 42](https://gdpr-info.eu/art-42-gdpr/) together with binding and enforceable commitments of the controller or processor in the third country to apply the appropriate safeguards, including as regards data subjects’ rights.

## Category: `data_transfer_safeguards`

### Rule `LEG-PRIV-0008` — Data Transfer Safeguards

**Conditions** (all must hold):
- `data_transfer_type` equals `personal_data`
- `adequacy_decision_article_45_3_present` equals false
- `recipient_location_type` equals `third_country`
- `appropriate_safeguards_provided` equals true
- `enforceable_data_subject_rights_available` equals true
- `effective_legal_remedies_available` equals true

**Request supporting documents** before deciding.
- Required documents: `data_transfer_safeguards`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `data_transfer_safeguards`
- Cross-domain refs: `Article 45(3)`

_Source: gdpr/article-46 · __prelude___
> 1. In the absence of a decision pursuant to [Article 45](https://gdpr-info.eu/art-45-gdpr/)(3), a controller or processor may transfer personal data to a third country or an international organisation only if the controller or processor has provided appropriate safeguards, and on condition that enforceable data subject rights and effective legal remedies for data subjects are available.

## Category: `data_transfer_supervisory_authorization`

### Rule `LEG-PRIV-0015` — Data Transfer Supervisory Authorization

**Conditions** (all must hold):
- `appropriate_safeguard_mechanism` equals `contractual_clauses_with_third_country_or_international_organisation_recipient`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **competent supervisory authority**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `competent_supervisory_authority_preapproval`
- Cross-domain refs: `PROC-PRIV-0003`

_Source: gdpr/article-46 · __prelude___
> 3. Subject to the authorisation from the competent supervisory authority, the appropriate safeguards referred to in paragraph 1 may also be provided for, in particular, by:    1. contractual clauses between the controller or processor and the controller, processor or the recipient of the personal data in the third country or international organisation; or

### Rule `LEG-PRIV-0016` — Data Transfer Supervisory Authorization

**Conditions** (all must hold):
- `appropriate_safeguard_mechanism` equals `administrative_arrangements_with_enforceable_effective_data_subject_rights`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **competent supervisory authority**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `competent_supervisory_authority_preapproval`
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-PRIV-0003`

_Source: gdpr/article-46 · __prelude___
> 3. Subject to the authorisation from the competent supervisory authority, the appropriate safeguards referred to in paragraph 1 may also be provided for, in particular, by:    1. contractual clauses between the controller or processor and the controller, processor or the recipient of the personal data in the third country or international organisation; or    2. provisions to be inserted into administrative arrangements between public authorities or bodies which include enforceable and effective data subject rights.

## Category: `embarrassing_gift_expense`

### Rule `LEG-AC-0028` — Embarrassing Gift Expense

**Conditions** (all must hold):
- `expenditure_type` equals `gift`
- `company_embarrassment_risk` equals true

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-ENGAGE-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES_
> Any gift or expense that is lavish or might otherwise prove embarrassing for the Company is prohibited.

## Category: `evaluation_agreement_approval`

### Rule `LEG-EVAL-0001` — Evaluation Agreement Approval

**Conditions** (all must hold):
- `customer_declines_trial_process` equals true
- `requested_agreement_type` equals `Evaluation Agreement`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Area Sales Manager or higher**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `area_sales_manager_or_higher_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Request for a Trial or Evaluation Agreement_
> If a customer declines the trial process and is adamant to have a separate Evaluation Agreement, the sales team member or solutions architect should:  * Open a Legal Request to request an Evaluation Agreement with Request Form. * The Legal Request should (i) include a request for approval from the Area Sales Manager or higher; and (ii) set forth applicable details to complete the Request Form, such as customer contact information, length of evaluation, number of users, etc.

## Category: `executive_compensation_approval`

### Rule `LEG-RPT-0005` — Executive Compensation Approval

**Conditions** (all must hold):
- `executive_officer_immediate_family_member_of_company_executive_or_director` equals false
- `related_compensation_reportable_if_named_executive_officer` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Company’s Compensation and Leadership Development Committee**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `company_s_compensation_and_leadership_development_committee_preapproval`
- Cross-domain refs: `PROC-PO-0013`

_Source: gitlab/legal_gitlab_related_party_transactions_policy · GitLab Related Party Transactions Policy > PURPOSE > APPROVAL PROCESS_
> the executive officer is not an immediate family member of another Company executive officer or director, the related compensation would have been reported in our proxy statement if the executive officer were a “named executive officer,” and the Company’s Compensation and Leadership Development Committee approved

## Category: `export_compliance_clearance`

### Rule `LEG-EXPORT-0001` — Export Compliance Clearance

**Conditions** (all must hold):
- `account_flagged_by_export_compliance_tool` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `legal_preapproval`
- Cross-domain refs: `FIN-ACCR-0004`, `FIN-ACCR-0005`

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Export Review in SFDC_
> Only Legal can clear the accounts that are flagged by the export compliance tool, please do not tag any other groups for assistance with these requests.

## Category: `external_disclosure_legal_approval`

### Rule `LEG-SAFE-0008` — External Disclosure Legal Approval

**Conditions** (all must hold):
- `data_categories` contains `sensitive_information`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_legal_preapproval`
- Cross-domain refs: `PROC-VEND-0008`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **SAFE** > **Why SAFE?** > **WHAT IS SAFE?** > **Sensitive:**_
> The **S** in “**S**AFE” serves as a reminder to make sure that team members are not sharing information which could be considered **S**ensitive information without express approval from GitLab Legal.

## Category: `external_disclosure_legal_escalation`

### Rule `LEG-SAFE-0007` — External Disclosure Legal Escalation

**Conditions** (all must hold):
- `disclosure_uncertainty` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_of_legal_corporate_preapproval`
- Cross-domain refs: `FIN-ACCR-0004`, `FIN-AR-0001`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **SAFE** > **Why SAFE?** > **WHAT IS SAFE?** > **Sensitive:**_
> If in doubt, please inquire with the VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel before circulating this type of information externally.

## Category: `external_disclosure_legal_review`

### Rule `LEG-SAFE-0006` — External Disclosure Legal Review

**Conditions** (all must hold):
- `data_categories` contains `sensitive_information`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_legal_preapproval`
- Cross-domain refs: `FIN-ACCR-0004`, `PROC-VEND-0008`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **SAFE** > **Why SAFE?** > **WHAT IS SAFE?** > **Sensitive:**_
> The disclosure of sensitive or material nonpublic information may be harmful to team members or the company. If the content to be disclosed includes any of the above information, team members should seek the GitLab Legal’s review via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel.

## Category: `external_material_legal_review`

### Rule `LEG-EXTMAT-0001` — External Material Legal Review

**Conditions** (all must hold):
- `material_reference_type` equals `quote`
- `material_referenced_person_group` equals `Section 16 Officer and VP, IR`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials which quote, or are in the name of, a Section 16 Officer (namely Board Members, CEO, CFO, CLO, CRO, and CTO) and VP, IR | Yes |

### Rule `LEG-EXTMAT-0002` — External Material Legal Review

**Conditions** (all must hold):
- `material_financial_data_status` equals `not_previously_disclosed_publicly`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-SEC-0001`, `PROC-SEC-0002`, `PROC-SEC-0003`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials which include financial data that has not been previously disclosed publicly, or a variation of previously disclosed financial data | Yes |

### Rule `LEG-EXTMAT-0003` — External Material Legal Review

**Conditions** (all must hold):
- `team_member_concern_topic` equals `SAFE`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-BGSCRN-0002`, `PROC-BGSCRN-0006`, `PROC-SEC-0001`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials with which a Team Member has concerns related to SAFE or third-party IP | Yes |

### Rule `LEG-EXTMAT-0004` — External Material Legal Review

**Conditions** (all must hold):
- `material_topic` equals `mergers`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials related to mergers or acquisitions, including spin out, investment or acqui-hires | Yes |

### Rule `LEG-EXTMAT-0005` — External Material Legal Review

**Conditions** (all must hold):
- `material_topic` equals `executive_organizational_changes`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials related to executive or other material organizational changes | Yes |

### Rule `LEG-EXTMAT-0006` — External Material Legal Review

**Conditions** (all must hold):
- `material_topic` equals `quarterly_earnings`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials related to quarterly earnings, including future results and dates of earnings release | Yes |

### Rule `LEG-EXTMAT-0007` — External Material Legal Review

**Conditions** (all must hold):
- `material_topic` equals `product_rollout_to_business`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-PO-0013`, `PROC-ZIP-0002`, `PROC-ZIP-0003`, `PROC-ZIP-0004`, `PROC-ZIP-0005`, `PROC-ZIP-0006`, `PROC-ZIP-0007`, `PROC-ZIP-0008`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials related to roll out of products to the business, a new SKU, or changes to an existing SKU | Yes |

### Rule `LEG-EXTMAT-0008` — External Material Legal Review

**Conditions** (all must hold):
- `material_topic` equals `crisis_communications`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Crisis communications | Yes |

### Rule `LEG-EXTMAT-0009` — External Material Legal Review

**Conditions** (all must hold):
- `material_topic` equals `company_culture`
- `material_scope` equals `entirely`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials related entirely to company culture (such as All-Remote) | No |

### Rule `LEG-EXTMAT-0010` — External Material Legal Review

**Conditions** (all must hold):
- `material_data_source` equals `prior_public_filings`
- `material_use_scope` equals `solely_relying_on_and_citing`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials solely relying on and citing data from prior public (such as SEC) filings | No |

### Rule `LEG-EXTMAT-0011` — External Material Legal Review

**Conditions** (all must hold):
- `material_prior_reviewed_by` equals `Legal & Corporate Affairs`
- `material_substantive_changes` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`, `PROC-PO-0011`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials based on pre-existing material previously reviewed by Legal & Corporate Affairs without substantive changes | No |

### Rule `LEG-EXTMAT-0012` — External Material Legal Review

**Conditions** (all must hold):
- `material_topic` equals `tech_industry_generally`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Examples - is Legal Review Necessary?_
> | Materials about the tech industry or DevOps generally | No |

## Category: `external_materials_claim_substantiation`

### Rule `LEG-CLAIM-0001` — External Materials Claim Substantiation

**Conditions** (all must hold):
- `materials_include_express_or_implied_claims` equals true

**Request supporting documents** before deciding.
- Required documents: `Backup materials and data verifying any express or implied claims`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `backup_materials_and_data_verifying_any_express_or_implied_claims`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Compliance checklist_
> Backup materials and data verifying any express or implied claims in the materials are saved and accessible.

## Category: `external_party_materials_approval`

### Rule `LEG-EXT-0001` — External Party Materials Approval

**Conditions** (all must hold):
- `uses_external_party_materials` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **external party**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `external_party_preapproval`
- Cross-domain refs: `PROC-SEC-0001`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Compliance checklist_
> All required external approvals have been obtained prior to using an external party’s materials (e.g., Gartner, Forrester, etc.).

## Category: `financial_information_external_disclosure`

### Rule `LEG-SAFE-0001` — Financial Information External Disclosure

**Conditions** (all must hold):
- `data_categories` contains `financial_information`
- `disclosure_audience` equals `external`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Chief Financial Officer**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `chief_financial_officer_preapproval`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **SAFE** > **Why SAFE?**_
> The **F** in SA**F**E serves as a reminder that the company’s **F**inancial information is so important to protect that it requires Chief Financial Officer’s approval prior to sharing externally.

## Category: `foia_request_escalation`

### Rule `LEG-FOIA-0001` — Foia Request Escalation

**Conditions** (all must hold):
- `request_type` equals `FOIA request`
- `request_source` equals `US federal agency`
- `gitlab_documents_identified_for_release` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **FOIA@gitlab.com**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `foia_gitlab_com_preapproval`

_Source: gitlab/legal · Legal & Corporate Affairs ("LACA") > Freedom of Information Act (FOIA) Requests_
> In the event you receive a notification from a US federal agency pursuant to a FOIA request, indicating that GitLab documents or information have been identified for release by an agency, please immediately forward the request to [FOIA@gitlab.com](mailto:FOIA@gitlab.com).

## Category: `fraud_reporting_confidentiality`

### Rule `LEG-AC-0033` — Fraud Reporting Confidentiality

**Conditions** (all must hold):
- `reporter_role` equals `Team Member`
- `reporting_status` equals `reporting`

**Request supporting documents** before deciding.
- Required documents: `fraud_reporting_confidentiality`
- Approver chain: **CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `fraud_reporting_confidentiality`
- Exceptions (overriding rules): `unless directed to do so by the CLO`

_Source: gitlab/legal_anti_fraud_policy · Anti-Fraud Policy > INTRODUCTION > TEAM MEMBER AND DIRECTOR RESPONSIBILITY & REPORTING_
> The reporting Team Member shall refrain from discussing the matter with any Team Member unless directed to do so by the CLO.

## Category: `fraud_reporting_escalation`

### Rule `LEG-AC-0023` — Fraud Reporting Escalation

**Conditions** (all must hold):
- `manager_suspects_fraud` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `clo_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_anti_fraud_policy · Anti-Fraud Policy > INTRODUCTION > MANAGERIAL RESPONSIBILITY_
> If a manager suspects fraud, or has received a report of fraud from a Team Member, they must immediately contact the CLO.

### Rule `LEG-AC-0030` — Fraud Reporting Escalation

**Conditions** (all must hold):
- `reporter_role` equals `Team Member`
- `fraud_awareness_status` equals `suspected`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **direct supervisor** → **GitLab’s Chief Legal Officer (the “***CLO***”)**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `direct_supervisor_preapproval`, `gitlab_s_chief_legal_officer_the_clo_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_anti_fraud_policy · Anti-Fraud Policy > INTRODUCTION > TEAM MEMBER AND DIRECTOR RESPONSIBILITY & REPORTING_
> When fraud is suspected, observed, or otherwise made known to a Team Member, the Team Member must immediately report the activity to their direct supervisor (who shall notify GitLab’s Chief Legal Officer (the “***CLO***”).

### Rule `LEG-AC-0031` — Fraud Reporting Escalation

**Conditions** (all must hold):
- `reporter_role` equals `Director`
- `director_fraud_awareness` equals `aware`
- `fraud_status` equals `suspected`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO** → **Chair of the Audit Committee** → **outside counsel**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `clo_preapproval`, `chair_of_the_audit_committee_preapproval`, `outside_counsel_preapproval`
- Cross-domain refs: `PROC-PO-0004`, `PROC-PO-0005`, `PROC-PO-0006`, `PROC-PO-0007`, `PROC-PO-0008`

_Source: gitlab/legal_anti_fraud_policy · Anti-Fraud Policy > INTRODUCTION > TEAM MEMBER AND DIRECTOR RESPONSIBILITY & REPORTING_
> In the event a Director is aware of or notified of suspected or observed fraud, the Director shall notify the CLO, Chair of the Audit Committee or outside counsel, as appropriate.

## Category: `gift_entertainment_conditions`

### Rule `LEG-AC-0025` — Gift Entertainment Conditions

**Conditions** (all must hold):
- `expenditure_type` equals `gift`

**Request supporting documents** before deciding.
- Required documents: `gift_entertainment_conditions`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gift_entertainment_conditions`
- Cross-domain refs: `FIN-EXP-0006`, `FIN-EXP-0007`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES_
> No gift or entertainment should ever be offered, given, provided or accepted by Team Members and Partners unless it:  1. is reasonable and not extravagant; 2. is appropriate under the circumstances and serves a valid business purpose; 3. is customary and appropriate under U.S. and local customs; 4. is not being offered for any improper purpose, and could not be construed as a bribe, kickback or payoff; 5. does not violate any Company policy; 6. does not violate any U.S., local or international laws or regulations; and 7. is accurately described in your expense or other reports and Company’s books and records.

## Category: `gift_expense_clo_consultation`

### Rule `LEG-AC-0029` — Gift Expense Clo Consultation
_Severity: recommended_

**Conditions** (all must hold):
- `expenditure_type` equals `gift`
- `appropriateness_question_exists` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `clo_preapproval`
- Cross-domain refs: `FIN-CARD-0001`, `FIN-CARD-0003`, `FIN-EXP-0001`, `FIN-EXP-0004`, `FIN-EXP-0006`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES_
> If Team Members and Partners have any question regarding the appropriateness of any gift or expense, they should consult the CLO prior to giving the gift or incurring the expense.

## Category: `government_official_improper_expenditure`

### Rule `LEG-AC-0026` — Government Official Improper Expenditure

**Conditions** (all must hold):
- `expenditure_type` equals `gift`
- `recipient_category` equals `government_employee_or_official`
- `improper_purpose` equals `induce_misuse_of_position`

**Reject** when these conditions hold.
- Cross-domain refs: `FIN-EXP-0004`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES_
> all gifts, entertainment, or promotional expenses which are intended to induce a government employee or official to misuse their position or to obtain an improper advantage are prohibited, regardless of their value;

## Category: `industry_analyst_content_approval`

### Rule `LEG-CONT-0001` — Industry Analyst Content Approval

**Conditions** (all must hold):
- `content_source_type` equals `industry_analyst_content`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Analyst Relations**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `analyst_relations_preapproval`

_Source: gitlab/legal_ip_public_materials_guidelines · Guidelines for Use of Creative Assets and Third-party Content in External Materials > Industry Analyst Content Use_
> Any use of industry analyst content from firms such as Forrester Research, Gartner, and International Data Corporation (IDC) must be submitted for review and approval to Analyst Relations by filling out this [issue template](https://gitlab.com/gitlab-com/marketing/strategic-marketing/product-marketing/-/issues/new?issuable_template=AR-CitationReview).

## Category: `insurance_certificate_distribution`

### Rule `LEG-INFO-0001` — Insurance Certificate Distribution

**Conditions** (all must hold):
- `request_type` equals `insurance_certificate`

**Request supporting documents** before deciding.
- Required documents: `insurance_certificate_distribution`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `insurance_certificate_distribution`
- Cross-domain refs: `PROC-AGREE-0001`

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Requests for GitLab Financial Information and Insurance Certificates_
> For Insurance Certificate requests, please open a Legal case in SFDC. **Note that our Certificate of Insurance is GitLab’s confidential information and either an NDA or agreed to Subscription terms need to be in place prior to distribution.**

## Category: `job_material_removal_permission`

### Rule `LEG-RET-0002` — Job Material Removal Permission

**Conditions** (all must hold):
- `material_relation` equals `job_related`
- `record_action` equals `remove`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_record_retention_policy · Record Retention Policy_
> Team members are reminded that materials relating to their jobs cannot be removed without GitLab’s permission.

## Category: `laca_expenditure_approval`

### Rule `LEG-EXP-0001` — Laca Expenditure Approval

**Conditions** (all must hold):
- `funding_source` equals `LACA funds`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **applicable stakeholders**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `applicable_stakeholders_preapproval`
- Cross-domain refs: `FIN-EXP-0004`, `FIN-EXP-0005`

_Source: gitlab/legal_legalops · Stategy & Legal Operations > Legal & Corporate Affairs Expenditure Request Process_
> All requests for use of LACA funds require approval from applicable stakeholders within the LACA Expenditure Request Issue Template.

## Category: `lavish_gift_expense`

### Rule `LEG-AC-0027` — Lavish Gift Expense

**Conditions** (all must hold):
- `expenditure_type` equals `gift`
- `expenditure_lavish` equals true

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-ENGAGE-0001`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES_
> Any gift or expense that is lavish or might otherwise prove embarrassing for the Company is prohibited.

## Category: `law_enforcement_emergency_disclosure`

### Rule `LEG-PRIV-0029` — Law Enforcement Emergency Disclosure
_Severity: informational_

**Conditions** (all must hold):
- `requester_type` equals `law_enforcement`
- `good_faith_belief` equals true
- `emergency_circumstance` equals `imminent_danger_of_death_or_serious_physical_injury`

**Request supporting documents** before deciding.
- Required documents: `law_enforcement_emergency_disclosure`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `law_enforcement_emergency_disclosure`

_Source: gitlab/legal_privacy_law_enforcement_guidelines · Guidelines for Law Enforcement Requests > Emergency Requests_
> If, based on information provided by law enforcement, GitLab has a good faith belief that there is a legitimate emergency involving imminent danger of death or serious physical injury to any person, or other exigent circumstances, GitLab may provide information necessary to prevent that harm if we are in a position to do so, consistent with applicable law.

## Category: `law_enforcement_emergency_request_review`

### Rule `LEG-PRIV-0035` — Law Enforcement Emergency Request Review

**Conditions** (all must hold):
- `requester_type` equals `foreign_law_enforcement`
- `request_urgency` equals `emergency`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-VEND-0002`

_Source: gitlab/legal_privacy_law_enforcement_guidelines · Guidelines for Law Enforcement Requests > International Law Enforcement and Public Authority Requests_
> We will evaluate emergency requests from foreign law enforcement on a case-by-case basis consistent with U.S. laws and the laws of other countries if applicable.

## Category: `law_enforcement_preservation_extension`

### Rule `LEG-PRIV-0030` — Law Enforcement Preservation Extension

**Conditions** (all must hold):
- `requestor_type` equals `law_enforcement`
- `request_type` equals `preservation_extension_request`
- `preservation_extension_request_count` is at most 1 requests

**Approve** outright when these conditions hold.

_Source: gitlab/legal_privacy_law_enforcement_guidelines · Guidelines for Law Enforcement Requests > Preservation Requests_
> Law enforcement may request one (1) extension of the preservation request for an additional ninety (90) days.

## Category: `law_enforcement_preservation_request_documentation`

### Rule `LEG-PRIV-0031` — Law Enforcement Preservation Request Documentation

**Conditions** (all must hold):
- `request_type` equals `preservation_request`

**Request supporting documents** before deciding.
- Required documents: `official law enforcement letterhead`, `signature by a law enforcement official`, `required identifiers for the user whose information is requested to be preserved`, `statement that steps are being taken to obtain a court order or other legal process for the data sought to be preserved`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `official_law_enforcement_letterhead`, `signature_by_a_law_enforcement_official`, `required_identifiers_for_the_user_whose_information_is_requested_to_be_preserved`, `statement_that_steps_are_being_taken_to_obtain_a_court_order_or_other_legal_process_for_the_data_sought_to_be_preserved`

_Source: gitlab/legal_privacy_law_enforcement_guidelines · Guidelines for Law Enforcement Requests > Preservation Requests_
> Preservation requests must be sent on official law enforcement letterhead, signed by a law enforcement official and must include:  * Required identifiers for the user whose information is requested to be preserved; * A statement that steps are being taken to obtain a court order or other legal process for the data sought to be preserved.

## Category: `law_enforcement_request_response`

### Rule `LEG-PRIV-0032` — Law Enforcement Request Response

**Conditions** (all must hold):
- `request_type` equals `MLAT_request`
- `request_properly_served` equals true
- `request_appropriately_scoped` equals true
- `request_within_authority_power` equals true
- `applicable_law_compliance` equals true

**Request supporting documents** before deciding.
- Required documents: `law_enforcement_request_response`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `law_enforcement_request_response`
- Cross-domain refs: `PROC-PRIV-0003`, `PROC-VEND-0008`

_Source: gitlab/legal_privacy_law_enforcement_guidelines · Guidelines for Law Enforcement Requests > International Law Enforcement and Public Authority Requests_
> GitLab will respond to MLAT requests only when they are properly served, appropriately scoped, within the power of the requesting authority or agency, and otherwise in accordance with applicable laws.

## Category: `law_enforcement_user_information_request`

### Rule `LEG-PRIV-0022` — Law Enforcement User Information Request

**Conditions** (all must hold):
- `data_categories` contains `Customer support records`

**Request supporting documents** before deciding.
- Required documents: `Subpoena`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `subpoena`
- Cross-domain refs: `PROC-PO-0008`, `PROC-PO-0009`, `PROC-PO-0010`, `PROC-PO-0011`

_Source: gitlab/legal_privacy_law_enforcement_guidelines · Guidelines for Law Enforcement Requests > Available GitLab User Information_
> **User Information Responsive to a Subpoena**  * Basic subscriber information available under ECPA; and * Customer support records.

### Rule `LEG-PRIV-0027` — Law Enforcement User Information Request

**Conditions** (all must hold):
- `data_categories` contains `Billing invoices`

**Request supporting documents** before deciding.
- Required documents: `2703(d) Court Order`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `2703_d_court_order`
- Cross-domain refs: `PROC-PO-0008`

_Source: gitlab/legal_privacy_law_enforcement_guidelines · Guidelines for Law Enforcement Requests > Available GitLab User Information_
> **User Information Responsive to a 2703(d) Court Order**  * Basic subscriber information available under ECPA; * Customer support records; * Metadata related to services usage activity; * Metadata related to website usage; and * Billing invoices.

### Rule `LEG-PRIV-0028` — Law Enforcement User Information Request

**Conditions** (all must hold):
- `data_categories` equals `All other User Information`

**Request supporting documents** before deciding.
- Required documents: `search warrant`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `search_warrant`

_Source: gitlab/legal_privacy_law_enforcement_guidelines · Guidelines for Law Enforcement Requests > Available GitLab User Information_
> All other User Information requires a search warrant.

## Category: `loa_legal_request`

### Rule `LEG-LOA-0001` — Loa Legal Request

**Conditions** (all must hold):
- `loa_terms_type` equals `non_standard`
- `custom_terms_requested` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Letters of Authorization (LOA)_
> If a partner requests a non-standard LOA with custom terms, please open a Legal Request in SFDC as outlined above.

## Category: `mandatory_materials_legal_review`

### Rule `LEG-MATREV-0011` — Mandatory Materials Legal Review

**Conditions** (all must hold):
- `material_review_trigger` equals `external_significant_product_offering_or_change`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `New Product Introduction Process`, `PROC-RFP-0001`, `PROC-RFP-0002`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > When to use this process > Mandatory review_
> Review is **always** required for:  * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:    + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)   + New SKU      - E.g.: Materials announcing the general availability of a new SKU     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)      - E.g.: Materials announcing new pricing for an existing SKU   + Deprecation of an existing SKU      - E.g.: Materials announcing the phasing out of an existing SKU   + Repackaging of features or product sets      - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier.

### Rule `LEG-MATREV-0012` — Mandatory Materials Legal Review

**Conditions** (all must hold):
- `safe_framework_requires_review` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-SOFT-0001`, `PROC-SOFT-0005`, `SAFE Framework Flowchart`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > When to use this process > Mandatory review_
> * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart);

### Rule `LEG-MATREV-0013` — Mandatory Materials Legal Review

**Conditions** (all must hold):
- `material_audience` equals `external`
- `material_review_trigger` equals `leadership_quote_or_byline`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `GitLab Board of Directors`, `GitLab Executive Group`, `PROC-ENGAGE-0001`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > When to use this process > Mandatory review_
> Review is **always** required for:  * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:    + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)   + New SKU      - E.g.: Materials announcing the general availability of a new SKU     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)      - E.g.: Materials announcing new pricing for an existing SKU   + Deprecation of an existing SKU      - E.g.: Materials announcing the phasing out of an existing SKU   + Repackaging of features or product sets      - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier. * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart); * External materials which quote, or are written in the name of, any member of the [GitLab Executive Group](https://about.gitlab.com/company/team/e-group/); VP, Investor Relations; or a member of the [GitLab Board of Directors](https://about.gitlab.com/company/team/board-of-directors/);

### Rule `LEG-MATREV-0014` — Mandatory Materials Legal Review

**Conditions** (all must hold):
- `material_review_trigger` equals `earnings_report_or_nonpublic_financial_data`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-RFP-0001`, `PROC-SEC-0001`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > When to use this process > Mandatory review_
> Review is **always** required for:  * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:    + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)   + New SKU      - E.g.: Materials announcing the general availability of a new SKU     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)      - E.g.: Materials announcing new pricing for an existing SKU   + Deprecation of an existing SKU      - E.g.: Materials announcing the phasing out of an existing SKU   + Repackaging of features or product sets      - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier. * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart); * External materials which quote, or are written in the name of, any member of the [GitLab Executive Group](https://about.gitlab.com/company/team/e-group/); VP, Investor Relations; or a member of the [GitLab Board of Directors](https://about.gitlab.com/company/team/board-of-directors/); * Quarterly and year-end earnings reports, and materials which include financial data that has not been publicly disclosed, or a variation previously disclosed financial data;

### Rule `LEG-MATREV-0015` — Mandatory Materials Legal Review

**Conditions** (all must hold):
- `material_review_trigger` equals `ma_or_material_organizational_management_change`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-SEC-0001`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > When to use this process > Mandatory review_
> Review is **always** required for:  * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:    + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)   + New SKU      - E.g.: Materials announcing the general availability of a new SKU     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)      - E.g.: Materials announcing new pricing for an existing SKU   + Deprecation of an existing SKU      - E.g.: Materials announcing the phasing out of an existing SKU   + Repackaging of features or product sets      - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier. * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart); * External materials which quote, or are written in the name of, any member of the [GitLab Executive Group](https://about.gitlab.com/company/team/e-group/); VP, Investor Relations; or a member of the [GitLab Board of Directors](https://about.gitlab.com/company/team/board-of-directors/); * Quarterly and year-end earnings reports, and materials which include financial data that has not been publicly disclosed, or a variation previously disclosed financial data; * Materials relating to:    + Mergers and acquisitions, including spin outs, investments, or acqui-hires; or   + Executive or other material organizational or management changes

### Rule `LEG-MATREV-0016` — Mandatory Materials Legal Review

**Conditions** (all must hold):
- `material_channel` equals `social_media`
- `material_review_trigger` equals `mandatory_review_subject_or_material_nonpublic_information`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-RFP-0001`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > When to use this process > Mandatory review_
> Review is **always** required for:  * External materials related to the experiment, beta, or general availability announcement or release of significant new product offerings or significant changes to existing product offerings, including:    + Any product or services launched through the [New Product Introduction Process](https://handbook.gitlab.com/handbook/product/product-processes/product-launch/)   + New SKU      - E.g.: Materials announcing the general availability of a new SKU     - E.g.: Materials announcing the forthcoming private beta of what will become a new SKU   + Changes to an existing SKU (e.g., price, removal or addition of a named offering)      - E.g.: Materials announcing new pricing for an existing SKU   + Deprecation of an existing SKU      - E.g.: Materials announcing the phasing out of an existing SKU   + Repackaging of features or product sets      - E.g.: Materials announcing features from an existing product are now available at no additional cost at a lower tier. * Internal and external materials requiring review as determined by the [SAFE Framework Flowchart](https://handbook.gitlab.com/handbook/legal/safe-framework/#safe-flowchart); * External materials which quote, or are written in the name of, any member of the [GitLab Executive Group](https://about.gitlab.com/company/team/e-group/); VP, Investor Relations; or a member of the [GitLab Board of Directors](https://about.gitlab.com/company/team/board-of-directors/); * Quarterly and year-end earnings reports, and materials which include financial data that has not been publicly disclosed, or a variation previously disclosed financial data; * Materials relating to:    + Mergers and acquisitions, including spin outs, investments, or acqui-hires; or   + Executive or other material organizational or management changes * Social media posts that cover or reference subjects that would normally require review (e.g. earnings reports, mergers and acquisitions, etc.) non-public financial data, or a variation of previously disclosed financial data, or those disclosing information related to anything in this list or any other material nonpublic information.

## Category: `material_legal_review`

### Rule `LEG-MAT-0002` — Material Legal Review

**Conditions** (all must hold):
- `mandatory_review_required` equals true
- `material_type` equals `video`
- `video_production_status` equals `not_yet_produced`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 1 Single material legal review process_
> If the review request is subject to [mandatory review](https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review) for a video not yet produced, review is required in respect of **both** (i) the slide deck, storyboard, and script (as appropriate, and in final form) before recording, **and** (ii) the final cut. Request review at each stage as set out in this process.

### Rule `LEG-MATREV-0001` — Material Legal Review

**Conditions** (all must hold):
- `material_use` equals `external`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `FIN-ACCR-0004`, `Guidelines for Use of Third-party IP in External Materials`, `SAFE Framework`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > MNPI and internally-confidential information > External vs Internal use_
> Materials for external use are reviewed (i) against the [SAFE Framework](https://handbook.gitlab.com/handbook/legal/safe-framework/), and (ii) against the [Guidelines for Use of Third-party IP in External Materials](https://handbook.gitlab.com/handbook/legal/ip-public-materials-guidelines/) for compliance with third-party intellectual property (IP) rights;

### Rule `LEG-MATREV-0002` — Material Legal Review

**Conditions** (all must hold):
- `material_use` equals `internal`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Exceptions (overriding rules): `IP review is not required unless it is contemplated that such materials will be used externally.`
- Cross-domain refs: `PROC-SEC-0001`, `PROC-SOFT-0001`, `PROC-SOFT-0005`, `SAFE Framework`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > MNPI and internally-confidential information > External vs Internal use_
> Materials for internal use are reviewed solely against the [SAFE Framework](https://handbook.gitlab.com/handbook/legal/safe-framework/); an IP review is not required unless it is contemplated that such materials will be used externally.

## Category: `materials_legal_review`

### Rule `LEG-MATREV-0003` — Materials Legal Review

**Conditions** (all must hold):
- `contains_mnpi` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-VEND-0002`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 1 Single material legal review process_
> Does the material contain material non-public information (MNPI) or information with restricted internal access?  If Yes, do not proceed and instead refer to the `MNPI and internally-confidential information` section in the Materials Legal Review Process.

### Rule `LEG-MATREV-0004` — Materials Legal Review

**Conditions** (all must hold):
- `material_subject_to_mandatory_review` equals false
- `safe_framework_compliance` equals true
- `ip_guidelines_compliance` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Guidelines for Use of Third-party IP in External Materials`, `PROC-PRIV-0003`, `PROC-SEC-0003`, `SAFE Framework`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 1 Single material legal review process_
> If the material is not subject to mandatory review and complies with the SAFE Framework and IP Guidelines, legal review is not mandatory.

### Rule `LEG-MATREV-0006` — Materials Legal Review

**Conditions** (all must hold):
- `material_use` equals `internal`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Exceptions (overriding rules): `IP review is not required`
- Cross-domain refs: `PROC-SEC-0001`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 2 Multiple materials legal review process_
> IP review is not required for materials created for [internal use](https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#external-vs-internal-use), only SAFE review is required;

### Rule `LEG-MATREV-0008` — Materials Legal Review

**Conditions** (all must hold):
- `material_use` equals `internal`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **@sfriss**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `sfriss_preapproval`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 2 Multiple materials legal review process_
> Tags the appropriate reviewers ([`@sfriss`](https://gitlab.com/srissmiller) for internal materials, and [`@sfriss`](https://gitlab.com/srissmiller) and [`@LeeFalc`](https://gitlab.com/LeeFalc) requesting review);

### Rule `LEG-REV-0001` — Materials Legal Review

**Conditions** (all must hold):
- `listed_under_mandatory_review` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > When to use this process_
> For materials listed under Mandatory Review, a review is **always required**.

## Category: `multiple_materials_review_planning`

### Rule `LEG-MATREV-0007` — Multiple Materials Review Planning

**Conditions** (all must hold):
- `material_piece_count` exceeds 5 pieces

**Request supporting documents** before deciding.
- Required documents: `multiple_materials_review_planning`
- Approver chain: **Legal & Corporate Affairs Team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `multiple_materials_review_planning`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 2 Multiple materials legal review process_
> For multiple materials legal review requests involving more than five pieces of material, the DRI must, no less than 5 business days before the materials will be ready for review, (i) notify the Legal & Corporate Affairs Team in [#legal](https://app.slack.com/client/T02592416/C78E74A6L) of the upcoming event, and (ii) arrange a sync with the Team to agree a timeline for the completion of the review.

## Category: `nda_before_vendor_disclosure`

### Rule `LEG-NDA-0001` — Nda Before Vendor Disclosure

**Conditions** (all must hold):
- `sharing_gitlab_business_need_details` equals true
- `recipient_type` equals `potential_vendor`

**Request supporting documents** before deciding.
- Required documents: `Mutual Non-Disclosure Agreement`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `mutual_non_disclosure_agreement`
- Cross-domain refs: `PROC-VEND-0008`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> Before sharing details and/or confidential information regarding GitLab business needs, obtain a [Mutual Non-Disclosure Agreement](https://handbook.gitlab.com/handbook/legal/nda/) from the potential vendor(s).

## Category: `nda_execution`

### Rule `LEG-NDA-0007` — Nda Execution

**Conditions** (all must hold):
- `confidential_information_exchange` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Non-Disclosure Agreement process`, `PROC-AGREE-0001`

_Source: gitlab/legal_procurement_guide_collaborating_with_gitlab_legal · Procurement Guide: Collaborating with GitLab Legal > NDA Process_
> Prior to exchanging any confidential information, GitLab and a potential Vendor should execute a Mutual Non-Disclosure Agreement.

## Category: `nda_execution_authority`

### Rule `LEG-NDA-0002` — Nda Execution Authority

**Conditions** (all must hold):
- `agreement_type` equals `Non-Disclosure Agreement (NDA)`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **team members with signature authority**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `team_members_with_signature_authority_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_nda · Non-Disclosure Agreement Process_
> Only team members with signature authority can execute agreements on behalf of GitLab, including Non-Disclosure Agreements (NDAs).

## Category: `non_standard_gtm_pricing_approval`

### Rule `LEG-GTM-0001` — Non Standard Gtm Pricing Approval
_Severity: recommended_

**Conditions** (all must hold):
- `sales_related_request` equals true
- `non_standard_gtm_structure` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **appropriate stakeholders**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `appropriate_stakeholders_preapproval`
- Cross-domain refs: `PROC-RFP-0001`

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > OPERATIONAL > Request for Non-Standard Go-To-Market and Pricing From Legal_
> All sales-related requests for a non-standard GTM structure, including pricing and packaging variations (e.g. OEM), will likely require Legal assistance but should begin with an Issue opened by the requestor on the Product board [here](https://gitlab.com/gitlab-com/Product/-/issues/new) to properly vet the monetization request with the appropriate cross-functional stakeholders. Please choose either the **monetization-intake** template or the **monetization-intake-simple** template. Once created, the issue will alert the appropriate stakeholders for internal review, comments, and approvals.

## Category: `partner_code_of_ethics_adherence`

### Rule `LEG-ETHICS-0001` — Partner Code Of Ethics Adherence

**Conditions** (all must hold):
- `vendor_intends_to_do_business_with_gitlab` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Exceptions (overriding rules): `typically not required in event related agreements unless the vendor is providing services`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-RFP-0001`, `PROC-ZIP-0002`, `PROC-ZIP-0003`, `PROC-ZIP-0004`, `PROC-ZIP-0005`, `PROC-ZIP-0006`, `PROC-ZIP-0007`, `PROC-ZIP-0008`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> All vendors must adhere to the [GitLab Partner Code of Ethics](https://handbook.gitlab.com/handbook/legal/partner-code-of-ethics/). It is mandatory all vendors contractually adhere to this if they would like to do business with us. (Note these are typically not required in event related agreements unless the vendor is providing services).

## Category: `partner_negotiation_eligibility`

### Rule `LEG-NEG-0001` — Partner Negotiation Eligibility

**Conditions** (all must hold):
- `partner_categorization` equals `Select Partner`

**Approve** outright when these conditions hold.

_Source: gitlab/legal_customer_negotiations · Sales Guide | Collaborating with GitLab Legal > EDUCATIONAL > When does GitLab Negotiate?_
> only Select partners will be allowed to negotiate terms.

## Category: `policy_change_management`

### Rule `LEG-POLICY-0001` — Policy Change Management

**Conditions** (all must hold):
- `policy_action` equals `implement_new_policy`

**Request supporting documents** before deciding.
- Required documents: `issue template`
- Approver chain: **DRI** → **Board**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `issue_template`

_Source: gitlab/legal_ethics_compliance_program · GitLab's Ethics and Compliance Program > Compliance Standards, Guidelines & Other Resources > Policy Change Management_
> Team members who wish to implement new policies and/or amendments to policies identified [here](https://docs.google.com/spreadsheets/d/1p5_02x6nBy1ftLYwhzTvm1lk47ijVdhlGVEJvU7M4xI/edit?usp=sharing) must document all necessary approvals (including DRI and Board, when necessary) using this [issue template](https://gitlab.com/gitlab-com/legal-and-compliance/-/blob/master/.gitlab/issue_templates/policy-requests.md?ref_type=heads) prior to that policy’s implementation.

## Category: `policy_violation_reporting_escalation`

### Rule `LEG-AC-0024` — Policy Violation Reporting Escalation

**Conditions** (all must hold):
- `conduct_believed_policy_violation` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Chair of the Audit Committee of GitLab’s Board of Directors** → **GitLab’s Internal Audit Team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `chair_of_the_audit_committee_of_gitlab_s_board_of_directors_preapproval`, `gitlab_s_internal_audit_team_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_anti_fraud_policy · Anti-Fraud Policy > INTRODUCTION > MANAGERIAL RESPONSIBILITY_
> The CLO shall promptly report to the Chair of the Audit Committee of GitLab’s Board of Directors and GitLab’s Internal Audit Team with respect to any conduct believed to be a violation of this Policy, and inform any other GitLab e-group member as appropriate.

## Category: `publicity_waiver_release_requirement`

### Rule `LEG-WAIVER-0001` — Publicity Waiver Release Requirement

**Conditions** (all must hold):
- `publicity_waiver_release_required` equals true

**Request supporting documents** before deciding.
- Required documents: `signed Publicity Waiver and Release agreements`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `signed_publicity_waiver_and_release_agreements`
- Cross-domain refs: `Publicity Waiver and Release`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Compliance checklist_
> Where [necessary](https://handbook.gitlab.com/handbook/legal/publicity-waiver-release/), signed Publicity Waiver and Release agreements are in place with named individuals, and individuals appearing in audio or visual content.

## Category: `purchase_legal_review`

### Rule `LEG-PURCH-0001` — Purchase Legal Review

**Conditions** (all must hold):
- `purchase_made` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_legal_preapproval`
- Cross-domain refs: `PROC-PRIV-0001`, `PROC-TERMS-0001`, `PROC-VEND-0008`, `The Procurement Handbook Page`

_Source: gitlab/legal_procurement_guide_collaborating_with_gitlab_legal · Procurement Guide: Collaborating with GitLab Legal > When is Legal involved_
> GitLab Legal will review any and all purchases made to ensure adequate legal terms are present for GitLab to ensure alignment with GitLab’s risk standards.

## Category: `quote_rights_approval`

### Rule `LEG-QUOTE-0001` — Quote Rights Approval

**Conditions** (all must hold):
- `quote_references_gitlab_customer_by_name` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **#customer-advocacy-and-references**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `customer_advocacy_and_references_preapproval`
- Cross-domain refs: `PROC-RFP-0001`

_Source: gitlab/legal_ip_public_materials_guidelines · Guidelines for Use of Creative Assets and Third-party Content in External Materials > Quotes > Do_
> If using a quote that references a GitLab customer or partner by name, confirm with [#customer-advocacy-and-references](https://app.slack.com/client/T02592416/CLFCPMF8E) (for customers) or [#channel-marketing](https://app.slack.com/client/T02592416/C013DF4A7QV) (for partners) that sufficient rights and approvals are in place for the proposed use.

## Category: `record_destruction_transfer_review`

### Rule `LEG-RET-0001` — Record Destruction Transfer Review

**Conditions** (all must hold):
- `record_scope` equals `all_other_records`
- `record_action` equals `destruction`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Legal Department**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `legal_department_preapproval`
- Cross-domain refs: `FIN-ACCR-0004`

_Source: gitlab/legal_record_retention_policy · Record Retention Policy_
> All other records must continue to be managed in accordance with GitLab Records Retention Policy. To ensure this, the Legal Department must be involved in all decisions concerning the destruction or transfer of such records.

## Category: `related_party_transaction_approval`

### Rule `LEG-RPT-0004` — Related Party Transaction Approval

**Conditions** (all must hold):
- `audit_committee_member_is_related_party` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Nominating and Corporate Governance Committee**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `nominating_and_corporate_governance_committee_preapproval`

_Source: gitlab/legal_gitlab_related_party_transactions_policy · GitLab Related Party Transactions Policy > PURPOSE > APPROVAL AUTHORITY_
> In a situation where a member of our Audit Committee is a Related Party in the proposed transaction, our Nominating and Corporate Governance Committee will be the Approval Authority.

## Category: `related_party_transaction_ongoing_review`

### Rule `LEG-RPT-0002` — Related Party Transaction Ongoing Review

**Conditions** (all must hold):
- `transaction_with_related_party` equals true
- `previously_approved_or_ratified` equals true
- `transaction_status` equals `ongoing`
- `remaining_term_months` exceeds 6 months
- `remaining_amount_payable_or_receivable_usd` exceeds 120000 USD

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Approval Authority**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `approval_authority_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-CW-0001`

_Source: gitlab/legal_gitlab_related_party_transactions_policy · GitLab Related Party Transactions Policy > PURPOSE > APPROVAL PROCESS_
> At least annually, the Approval Authority will review any previously approved or ratified transactions with Related Parties that remain ongoing and that have a remaining term of more than six months and remaining amounts payable to or receivable from us of more than $120,000 during the fiscal year. Based on all relevant facts and circumstances, the Approval Authority will determine whether it is in the best interests of the Company and its stockholders to continue, modify or terminate the transaction.

## Category: `related_party_transaction_preapproval`

### Rule `LEG-RPT-0001` — Related Party Transaction Preapproval

**Conditions** (all must hold):
- `transaction_with_related_party` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Chief Legal Officer** → **Approval Authority**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `chief_legal_officer_preapproval`, `approval_authority_preapproval`
- Exceptions (overriding rules): `transaction is subject to standing pre-approval as provided in this policy`, `pursuant to a resolution adopted by the Approval Authority`

_Source: gitlab/legal_gitlab_related_party_transactions_policy · GitLab Related Party Transactions Policy > PURPOSE > APPROVAL PROCESS_
> Any transaction the Company intends to undertake with a Related Party, irrespective of the amounts involved (unless the transaction is subject to standing pre-approval as provided in this policy or pursuant to a resolution adopted by the Approval Authority), must be submitted to the Chief Legal Officer (the “***CLO***”) for their determination of the approvals required under this Policy. The CLO will refer to the Approval Authority any Related Party Transaction, and any other transaction that the CLO otherwise determines should be considered for evaluation by the Approval Authority consistent with the purpose of this Policy.

## Category: `related_party_transaction_ratification`

### Rule `LEG-RPT-0003` — Related Party Transaction Ratification

**Conditions** (all must hold):
- `transaction_with_related_party` equals true
- `approval_or_ratification_required` equals true
- `approval_or_ratification_received` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO** → **Approval Authority**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `clo_preapproval`, `approval_authority_preapproval`

_Source: gitlab/legal_gitlab_related_party_transactions_policy · GitLab Related Party Transactions Policy > PURPOSE > APPROVAL PROCESS_
> If the CLO learns of a transaction with a Related Party that required but did not receive approval or ratification under this Policy, the CLO will promptly submit the transaction to the Approval Authority. The Approval Authority will undertake the review described above.

## Category: `rmdr_consultation`

### Rule `LEG-RMDR-0001` — Rmdr Consultation

**Conditions** (all must hold):
- `third_party_communication_accuses_wrongdoing` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `rmdr_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_risk_management_dispute_resolution · Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR_
> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:  * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company.

### Rule `LEG-RMDR-0002` — Rmdr Consultation

**Conditions** (all must hold):
- `attorney_communication_received` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `rmdr_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-CONTR-0001`, `PROC-VEND-0008`

_Source: gitlab/legal_risk_management_dispute_resolution · Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR_
> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:  * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company. **A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.** * If a team member receives a communication from an attorney representing a third party of any type, or other similar legal notice.

### Rule `LEG-RMDR-0003` — Rmdr Consultation

**Conditions** (all must hold):
- `internal_wrongdoing_suspected` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `rmdr_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_risk_management_dispute_resolution · Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR_
> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:  * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company. **A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.** * If a team member receives a communication from an attorney representing a third party of any type, or other similar legal notice. **If another party involves an attorney, GitLab must involve its RMDR team.** * If a team member suspects wrongdoing within GitLab.

### Rule `LEG-RMDR-0004` — Rmdr Consultation

**Conditions** (all must hold):
- `legal_or_regulatory_question` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `rmdr_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_risk_management_dispute_resolution · Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR_
> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:  * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company. **A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.** * If a team member receives a communication from an attorney representing a third party of any type, or other similar legal notice. **If another party involves an attorney, GitLab must involve its RMDR team.** * If a team member suspects wrongdoing within GitLab. **RMDR can confidentially discuss such matters with the appropriate legal resources, as necessary.** * If a team member has questions about the legal or regulatory landscape.

### Rule `LEG-RMDR-0005` — Rmdr Consultation

**Conditions** (all must hold):
- `emergency_legal_implications` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **RMDR**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `rmdr_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_risk_management_dispute_resolution · Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR_
> GitLab team members must immediately consult with RMDR to ensure that GitLab is managing its legal risks effectively. These include:  * If a team member receives a communication from a third party (i.e., a customer, vendor, partner, etc.) accusing the company of wrongdoing or demanding money from the company. **A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.** * If a team member receives a communication from an attorney representing a third party of any type, or other similar legal notice. **If another party involves an attorney, GitLab must involve its RMDR team.** * If a team member suspects wrongdoing within GitLab. **RMDR can confidentially discuss such matters with the appropriate legal resources, as necessary.** * If a team member has questions about the legal or regulatory landscape. * In the case of an emergency that may have legal implications, such as a cybersecurity incident or major system failure.

## Category: `roadmap_disclaimer_requirement`

### Rule `LEG-DISC-0001` — Roadmap Disclaimer Requirement

**Conditions** (all must hold):
- `required_disclaimers_guidance_indicates_roadmap_disclaimer` equals true

**Request supporting documents** before deciding.
- Required documents: `appropriate roadmap disclaimer`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `appropriate_roadmap_disclaimer`
- Cross-domain refs: `PROC-ENGAGE-0001`, `PROC-SOFT-0004`, `Required Disclaimers guidance`, `appropriate roadmap disclaimer`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Compliance checklist_
> If indicated by the [Required Disclaimers guidance](https://handbook.gitlab.com/handbook/product/product-processes/product-safe-guidance/#required-disclaimers), the [appropriate roadmap disclaimer](https://docs.google.com/presentation/d/1hbf9AnFj_E5Y_Yg_WWoy_R0WJXZZLV0zWpMUHqnIs3c/edit#slide=id.ge2b39964d2_0_144) is included.

## Category: `settlement_signoff`

### Rule `LEG-SETTLE-0001` — Settlement Signoff

**Conditions** (all must hold):
- `settlement_payment_commitment` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **member of the Legal and Corporate Affairs team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `member_of_the_legal_and_corporate_affairs_team_preapproval`
- Cross-domain refs: `PROC-PO-0011`, `PROC-PO-0012`

_Source: gitlab/legal_risk_management_dispute_resolution · Risk Management and Dispute Resolution (RMDR) > When to get in touch with RMDR_
> A team member is not permitted to bind the company to pay money to settle a dispute without signoff from a member of the Legal and Corporate Affairs team.

## Category: `third_party_confidential_information_approval`

### Rule `LEG-NDA-0006` — Third Party Confidential Information Approval

**Conditions** (all must hold):
- `data_categories` contains `confidential_information`
- `recipient_type` equals `third_party`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Security Risk** → **Privacy teams**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `security_risk_preapproval`, `privacy_teams_preapproval`
- Cross-domain refs: `GitLab’s Safe Framework Handbook`, `PROC-PRIV-0003`, `PROC-SEC-0001`, `PROC-VEND-0002`, `PROC-VEND-0008`

_Source: gitlab/legal_nda · Non-Disclosure Agreement Process > Vendors or Other Third-Party NDAs_
> All confidential information shared with third parties must be reviewed and approved by Security Risk and Privacy teams prior to disclosure.

## Category: `third_party_due_diligence`

### Rule `LEG-AC-0009` — Third Party Due Diligence

**Conditions** (all must hold):
- `relationship_action` equals `initiate`
- `counterparty_is_third_party` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `clo_preapproval`
- Cross-domain refs: `PROC-BGSCRN-0004`, `PROC-RFP-0001`, `PROC-SOFT-0006`

_Source: gitlab/legal_anti_corruption_policy · Anti-Corruption Policy > PURPOSE > REPRESENTATIVES, PARTNERS, CONSULTANTS, DISTRIBUTORS, AGENTS AND OTHER THIRD PARTIES_
> Before initiating a relationship with a representative, partner, consultant, distributor, agent, or other third party, Team Members and Partners must conduct appropriate due diligence to assure that the representative will not engage in any improper conduct. ***This is for several important reasons, including that the Company can be held responsible for a third party’s conduct in certain circumstances under the Anti-Corruption Laws***. Due diligence typically will include considering such factors as:  * the third party’s qualifications for the position or task at issue; * whether the third party has personal or professional ties to the government or any government official; * the number and reputation of the third party’s clientele and the representative’s reputation with the United States Embassy or Consulate, local bankers, clients, and other business associates; and * the reasonableness of the compensation.  Consult the CLO regarding the appropriate due diligence procedure for your situation.

## Category: `third_party_logo_approval`

### Rule `LEG-TM-0001` — Third Party Logo Approval

**Conditions** (all must hold):
- `asset_type` equals `logo`
- `third_party_relationship` equals `partner`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **#channel-marketing**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `channel_marketing_preapproval`
- Cross-domain refs: `PROC-SEC-0001`

_Source: gitlab/legal_ip_public_materials_guidelines · Guidelines for Use of Creative Assets and Third-party Content in External Materials > Trademarks - logos and wordmarks > Do_
> For use of a partner’s logo, discuss with [#channel-marketing](https://app.slack.com/client/T02592416/C013DF4A7QV) to confirm that rights and approvals are in place for your proposed use under the Partner Agreement.

## Category: `third_party_nda_execution`

### Rule `LEG-NDA-0005` — Third Party Nda Execution

**Conditions** (all must hold):
- `counterparty_type` equals `third_party`
- `counterparty_is_new` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-TERMS-0001`, `PROC-VEND-0008`

_Source: gitlab/legal_nda · Non-Disclosure Agreement Process > Vendors or Other Third-Party NDAs_
> If a team member is engaging a new vendor or third party, GitLab’s NDA **must** be executed with them first before sharing any type of confidential information.

## Category: `third_party_risk_acceptance_approval`

### Rule `LEG-VEND-0002` — Third Party Risk Acceptance Approval

**Conditions** (all must hold):
- `vendor_risk_tier` equals `Moderate`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP and/or above**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_and_or_above_preapproval`
- Cross-domain refs: `PROC-BGSCRN-0006`, `PROC-SEC-0001`, `PROC-SEC-0002`

_Source: gitlab/legal_privacy · GitLab Privacy > Vendor Privacy Review_
> For Third-Party Risk Acceptance, any Moderate/High risk requires VP and/or above approval

## Category: `trademark_approval`

### Rule `LEG-TM-0002` — Trademark Approval

**Conditions** (all must hold):
- `trademark_request_type` equals `new_trademark`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Brand Team** → **Legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `brand_team_preapproval`, `legal_preapproval`
- Cross-domain refs: `PROC-RFP-0001`, `PROC-SEC-0001`

_Source: gitlab/legal_trademarks_at_gitlab · Trademarks at GitLab > Process for New GitLab Trademarks_
> If considering a new trademark, review the following:  * [The naming process at GitLab](https://handbook.gitlab.com/handbook/marketing/brand-and-product-marketing/brand/naming/#the-naming-process) * [Product and feature naming guidelines](https://handbook.gitlab.com/handbook/product/product-principles/#product-and-feature-naming-guidelines)  After reviewing the above guidelines, reach out to the Brand Team in [#brand](https://app.slack.com/client/E03N1RJJX7C/C0119M5HUER), with your proposed mark, whether it’s a logo or wordmark. If Brand approves use of the proposed logo or wordmark, they will reach out to Legal to discuss next steps.

## Category: `trademark_use_authorization`

### Rule `LEG-TRADE-0003` — Trademark Use Authorization

**Conditions** (all must hold):
- `requester_type` equals `third_party`
- `trademark_material` equals `GitLab’s name`
- `use_context` equals `website`
- `existing_agreement_covers_requested_use` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **third party**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `third_party_preapproval`
- Cross-domain refs: `FIN-VEND-0001`

_Source: gitlab/legal_trademarks_at_gitlab · Trademarks at GitLab > Use of GitLab trademarks by third-parties on marketing materials_
> An Authorization to use GitLab Materials must be signed by any third party wanting to include GitLab’s name or logo on their website or other marketing materials, if use of GitLab’s name or logo for the requested purposes is not already covered in an existing agreement.

## Category: `travel_trade_compliance`

### Rule `LEG-TRADE-0001` — Travel Trade Compliance

**Conditions** (all must hold):
- `device_ownership` equals `company_owned`
- `travel_destination_trade_control_status` equals `us_embargoed`

**Reject** when these conditions hold.

_Source: gitlab/finance_travel · Travel Safety and Security > Travel Safety and Security > Trade Compliance Considerations_
> team members cannot take company-owned devices to or otherwise work from US-embargoed countries or regions under any circumstances.

### Rule `LEG-TRADE-0002` — Travel Trade Compliance

**Conditions** (all must hold):
- `device_ownership` equals `company_owned`
- `travel_destination_country` equals `Russia`

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-VEND-0008`

_Source: gitlab/finance_travel · Travel Safety and Security > Travel Safety and Security > Trade Compliance Considerations_
> Additionally, team members cannot take company-owned devices to or otherwise work from Russia or Belarus, which are also subject to various restrictions.

## Category: `unsafe_information_escalation`

### Rule `LEG-SAFE-0002` — Unsafe Information Escalation

**Conditions** (all must hold):
- `disclosure_medium` equals `personal_social_media_account`
- `information_fits_safe_framework` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate** → **Vice President, Investor Relations**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_of_legal_corporate_preapproval`, `vice_president_investor_relations_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **What if unSAFE information is shared?**_
> If you shared or see information which has been shared via a personal social media account that does not fit within the SAFE framework, please immediately message the company’s VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel and include a screenshot when posting your message.    * After taking the screenshot, please remove the post immediately if you shared the information. The VP of Legal, Corporate and Vice President, Investor Relations will review it and advise on any further action necessary.

### Rule `LEG-SAFE-0003` — Unsafe Information Escalation

**Conditions** (all must hold):
- `disclosure_medium` equals `issue`
- `information_fits_safe_framework` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate** → **Vice President, Investor Relations**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_of_legal_corporate_preapproval`, `vice_president_investor_relations_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`, `PROC-VEND-0008`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **What if unSAFE information is shared?**_
> If you shared or see information which has been shared in an Issue or MR that does not fit within the SAFE framework, please immediately message the Company’s VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel and include a link to such Issue or MR when posting your message. Also mark the [MR or Issue “Confidential”](https://www.youtube.com/watch?v=RcaQaWzw2IQ).    * The VP of Legal, Corporate and Vice President, Investor Relations will review it and advise on any further action necessary.

### Rule `LEG-SAFE-0004` — Unsafe Information Escalation

**Conditions** (all must hold):
- `disclosure_medium` equals `gitlab_unfiltered_video`
- `information_fits_safe_framework` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate** → **Vice President, Investor Relations**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_of_legal_corporate_preapproval`, `vice_president_investor_relations_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **What if unSAFE information is shared?**_
> If you shared or see information which has been shared via GitLab Unfiltered that does not fit within the SAFE framework, please mark the video as private. Once the video is private, please immediately message the VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel.    * The VP of Legal, Corporate and Vice President, Investor Relations will review it and determine next steps, which may include contacting the Digital Production team to have it removed.

### Rule `LEG-SAFE-0005` — Unsafe Information Escalation

**Conditions** (all must hold):
- `disclosure_medium` equals `other_medium`
- `information_fits_safe_framework` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **VP of Legal, Corporate** → **Vice President, Investor Relations**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `vp_of_legal_corporate_preapproval`, `vice_president_investor_relations_preapproval`
- Cross-domain refs: `PROC-CONTR-0001`

_Source: gitlab/legal_safe_framework · GitLab SAFE Framework > **What if unSAFE information is shared?**_
> If you shared or see information which has been shared via a another medium that does not fit within the SAFE framework please send a link to the original post immediately via Slack to the VP of Legal, Corporate via the [#safe](https://gitlab.slack.com/archives/C01UZQ63WFQ) slack channel.    * The VP of Legal, Corporate and Vice President, Investor Relations will review it and, if necessary, contact the appropriate [DRI](https://handbook.gitlab.com/handbook/people-group/directly-responsible-individuals/) to have the information revised to be compliant or if needed, removed.

## Category: `upcoming_feature_disclaimer_requirement`

### Rule `LEG-DISC-0003` — Upcoming Feature Disclaimer Requirement

**Conditions** (all must hold):
- `material_references_upcoming_features` equals true

**Request supporting documents** before deciding.
- Required documents: `appropriate disclaimer`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `appropriate_disclaimer`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Compliance checklist_
> If the material references upcoming products, features or functionality, the appropriate disclaimer is included.

## Category: `upcoming_functionality_disclaimer_requirement`

### Rule `LEG-DISC-0004` — Upcoming Functionality Disclaimer Requirement

**Conditions** (all must hold):
- `material_references_upcoming_functionality` equals true

**Request supporting documents** before deciding.
- Required documents: `appropriate disclaimer`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `appropriate_disclaimer`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Compliance checklist_
> If the material references upcoming products, features or functionality, the appropriate disclaimer is included.

## Category: `upcoming_product_disclaimer_requirement`

### Rule `LEG-DISC-0002` — Upcoming Product Disclaimer Requirement

**Conditions** (all must hold):
- `material_references_upcoming_products` equals true

**Request supporting documents** before deciding.
- Required documents: `appropriate disclaimer`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `appropriate_disclaimer`

_Source: gitlab/legal_external_materials_compliance_tips · External Materials Compliance Tips > Compliance checklist_
> If the material references upcoming products, features or functionality, the appropriate disclaimer is included.

## Category: `vendor_contract_required`

### Rule `LEG-CNTRCT-0001` — Vendor Contract Required

**Conditions** (all must hold):
- `vendor_work` equals true

**Request supporting documents** before deciding.
- Required documents: `completed contract`
- **Fulfilled by** (presence in submission turns this rule into `approve`): `completed_contract`
- Cross-domain refs: `FIN-PO-0001`, `PROC-AGREE-0001`, `PROC-EVENT-0001`, `PROC-LEGAL-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management_
> All work that is done with a vendor must have a completed contract to be compliant and work may not be started until a contract is in place.

## Category: `vendor_contract_review`

### Rule `LEG-VEND-0001` — Vendor Contract Review

**Conditions** (all must hold):
- `third_party_procurement` equals true
- `contract_required` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **GitLab Legal Procurement team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `gitlab_legal_procurement_team_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-CONTR-0001`

_Source: gitlab/finance_procurement · The GitLab Procurement Team > Third Party Risk Management > How do we ensure terms to establish GitLab (and our Vendors) rights and responsibilities?_
> Any time GitLab engages with a third party for the procurement of goods and/or services, which require GitLab to engage in a contract, the GitLab Legal Procurement team will review the terms and conditions.

## Category: `vendor_data_subprocessor_documentation`

### Rule `LEG-PRIV-0033` — Vendor Data Subprocessor Documentation
_Severity: recommended_

**Conditions** (all must hold):
- `vendor_service_includes_accessing_gitlab_data` equals true

**Request supporting documents** before deciding.
- Required documents: `list of sub-processors`
- Approver chain: **GitLab Legal team**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `list_of_sub_processors`
- Cross-domain refs: `PROC-SEC-0002`, `PROC-SEC-0003`, `PROC-VEND-0008`

_Source: gitlab/legal_procurement_guide_collaborating_with_gitlab_legal · Procurement Guide: Collaborating with GitLab Legal > Negotiating Terms_
> In the event a vendor is providing services which include accessing, processing or controlling GitLab data, the GitLab Legal team may require the vendor to provide the list of sub-processors relevant to the services provided to GitLab.

## Category: `vendor_nda_execution`

### Rule `LEG-NDA-0004` — Vendor Nda Execution

**Conditions** (all must hold):
- `counterparty_type` equals `vendor`
- `counterparty_is_new` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-VEND-0008`

_Source: gitlab/legal_nda · Non-Disclosure Agreement Process > Vendors or Other Third-Party NDAs_
> If a team member is engaging a new vendor or third party, GitLab’s NDA **must** be executed with them first before sharing any type of confidential information.

## Category: `vendor_nda_template_review`

### Rule `LEG-NDA-0003` — Vendor Nda Template Review

**Conditions** (all must hold):
- `vendor_requires_own_nda_template` equals true
- `gitlab_template_sought` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **legal**
- **Fulfilled by** (presence in submission turns this rule into `approve`): `legal_preapproval`
- Cross-domain refs: `PROC-AGREE-0001`, `PROC-ZIP-0007`, `PROC-ZIP-0008`, `Procurement Page`

_Source: gitlab/legal_procurement_guide_collaborating_with_gitlab_legal · Procurement Guide: Collaborating with GitLab Legal > NDA Process_
> If a potential vendor requires the use of their NDA template after seeking use of the GitLab template, please follow the process located on the [Procurement Page](https://handbook.gitlab.com/handbook/finance/procurement/) which will initiate the legal review process.

## Category: `vendor_privacy_review`

### Rule `LEG-PRIV-0018` — Vendor Privacy Review

**Conditions** (all must hold):
- `vendor_handles_personal_data` equals true

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-PRIV-0002`, `PROC-PRIV-0003`, `Procurement process`

_Source: gitlab/legal_privacy · GitLab Privacy > Privacy Review Process_
> Every vendor that handles personal data is required to go through a Privacy Review prior to being onboarded, which includes completion and approval of the privacy due diligence questionnaires detailed in the [Procurement process](https://handbook.gitlab.com/handbook/finance/procurement/#privacy-review-4-14-days).

### Rule `LEG-PRIV-0019` — Vendor Privacy Review

**Conditions** (all must hold):
- `data_classification` equals `red`

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `Data Classification Standards`, `PROC-BGSCRN-0006`, `PROC-SEC-0001`

_Source: gitlab/legal_privacy · GitLab Privacy > Privacy Review Process_
> Certain vendors who are classified as handling red or orange data under our [Data Classification Standards](https://handbook.gitlab.com/handbook/security/policies_and_standards/data-classification-standard/) are reviewed annually.

## Category: `video_materials_review`

### Rule `LEG-MATREV-0010` — Video Materials Review

**Conditions** (all must hold):
- `mandatory_review_required` equals true
- `material_type` equals `video`
- `video_produced` equals false

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by** (presence in submission turns this rule into `approve`): `designated_approver_preapproval`
- Cross-domain refs: `PROC-PRIV-0003`, `PROC-SEC-0001`, `mandatory review`

_Source: gitlab/legal_materials_legal_review_process · Materials Legal Review Process > Track 2 Multiple materials legal review process_
> If the review request is subject to [mandatory review](https://handbook.gitlab.com/handbook/legal/materials-legal-review-process/#mandatory-review) for a video not yet produced, review is required in respect of **both** the slide deck, storyboard and script (as appropriate) prior to recording **and** the final cut. Request review at each stage as set out in this process.
