# Anti-Corruption & Ethics

_Legal approval policy — topic `anti_corruption`. This document is read by the **legal_approval_specialist** during reviews involving this topic. 35 rule(s)._

When adjudicating: identify rules whose ALL conditions match the submission's structured fields. If a rule's `Fulfilled by` items are all present in the submission's evidence, that rule's effective decision becomes `approve`. Otherwise, apply the strictest decision among firing rules (reject > require_preapproval > require_docs > approve).

---

## Category: `anti_corruption_facilitating_payment_preapproval`

### Rule `LEG-AC-0001` — Anti Corruption Facilitating Payment Preapproval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `payment_type` | `==` | `facilitating_payment` |  |

In plain English: `payment_type` equals `facilitating_payment`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`.
- Cross-domain refs: `PROC-PO-0012`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > FACILITATING PAYMENTS
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> Any and all facilitating payments require prior written approval from the CLO.

_Notes_: Applies to all facilitating payments.

## Category: `anti_corruption_payment_consultation`

### Rule `LEG-AC-0007` — Anti Corruption Payment Consultation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `question_about_payment_impropriety` | `==` | `true` |  |

In plain English: `question_about_payment_impropriety` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Company’s Chief Legal Officer**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `company_s_chief_legal_officer_preapproval`.
- Cross-domain refs: `PROC-AC-0002`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> If you have any questions about whether a payment may be improper or violate this Policy, consult the Company’s Chief Legal Officer before any payment or offer is made.

## Category: `anti_corruption_political_contribution_preapproval`

### Rule `LEG-AC-0034` — Anti Corruption Political Contribution Preapproval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `company_resource_type` | `==` | `funds` |  |
| `recipient_type` | `==` | `government_official` |  |

In plain English: `company_resource_type` equals `funds` AND `recipient_type` equals `government_official`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > POLITICAL CONTRIBUTIONS
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> To mitigate the risk of an improper payment or the appearance of an improper payment, no Company funds, facilities, or services of any kind may be provided to any government official, including any candidate or prospective candidate for public office, to any political party, or to any political initiative, referendum, or other form of political campaign unless pre-approved in writing by the CLO.

_Notes_: Pre-approval must be in writing.

## Category: `anti_corruption_prohibited_asset_retention_payment`

### Rule `LEG-AC-0006` — Anti Corruption Prohibited Asset Retention Payment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `payment_purpose` | `==` | `retain_assets` |  |

In plain English: `payment_purpose` equals `retain_assets`.

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-PO-0009`, `PROC-PO-0010`, `PROC-PO-0011`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> payments to retain assets, such as an “under the table” payment to a tax official to settle a tax claim.

## Category: `anti_corruption_prohibited_improper_payment_support`

### Rule `LEG-AC-0005` — Anti Corruption Prohibited Improper Payment Support

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `conduct_type` | `==` | `act_in_furtherance_of_improper_payment` |  |

In plain English: `conduct_type` equals `act_in_furtherance_of_improper_payment`.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> acts “in furtherance of” an improper payment, such as arranging for funds to be available for the improper payment;

## Category: `anti_corruption_prohibited_payment`

### Rule `LEG-AC-0002` — Anti Corruption Prohibited Payment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `recipient_role` | `==` | `government_employee_or_official` |  |
| `thing_of_value` | `==` | `true` |  |
| `payment_purpose` | `==` | `wrongfully_influence_government_employee_or_official` |  |

In plain English: `recipient_role` equals `government_employee_or_official` AND `thing_of_value` equals true AND `payment_purpose` equals `wrongfully_influence_government_employee_or_official`.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> Team Members and Partners may not give anything of value to any government employee or official in order to wrongfully influence the government employee or official

### Rule `LEG-AC-0003` — Anti Corruption Prohibited Payment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `recipient_role` | `==` | `government_employee_or_official` |  |
| `payment_purpose` | `==` | `improper_purpose` |  |
| `payment_channel` | `==` | `direct` |  |

In plain English: `recipient_role` equals `government_employee_or_official` AND `payment_purpose` equals `improper_purpose` AND `payment_channel` equals `direct`.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> payments made directly to a government employee or official for an improper purpose;

## Category: `anti_corruption_prohibited_third_party_payment`

### Rule `LEG-AC-0004` — Anti Corruption Prohibited Third Party Payment

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `transfer_type` | `==` | `payment` |  |
| `recipient_type` | `==` | `third_party` |  |
| `third_party_likely_recipient_role` | `==` | `government_employee_or_official` |  |
| `payment_purpose` | `==` | `improper_purpose` |  |
| `team_member_or_partner_knowledge` | `==` | `knows_or_has_reason_to_know` |  |

In plain English: `transfer_type` equals `payment` AND `recipient_type` equals `third_party` AND `third_party_likely_recipient_role` equals `government_employee_or_official` AND `payment_purpose` equals `improper_purpose` AND `team_member_or_partner_knowledge` equals `knows_or_has_reason_to_know`.

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > PROHIBITED CONDUCT
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> payments or gifts to third parties where Team Members and Partners know or have reason to know that at least a portion of the payments or gifts is likely to be offered by the third party to a government employee or official for an improper purpose;

## Category: `anti_corruption_red_flag_escalation`

### Rule `LEG-AC-0010` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `payments_in_country_with_corruption_history` |  |

In plain English: `third_party_red_flag_type` equals `payments_in_country_with_corruption_history`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> payments in a country with a history or reputation for corruption;
> 2. refusal to provide a certification of compliance with the FCPA or other anti-bribery laws;
> 3. unusual payment patterns or requests, including payments to third parties, in cash, and payments made to bank accounts outside the country;
> 4. representations or boasting about influence or connections;
> 5. use of a shell or holding company that obscures ownership without credible explanation;
> 6. accusations of improper business practices (credible rumors or media reports, etc.);
> 7. family or business relationship with the government or a government official;
> 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions;
> 9. unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0011` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `refusal_to_certify_anti_bribery_compliance` |  |

In plain English: `third_party_red_flag_type` equals `refusal_to_certify_anti_bribery_compliance`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `FCPA`, `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> refusal to provide a certification of compliance with the FCPA or other anti-bribery laws;
> 3. unusual payment patterns or requests, including payments to third parties, in cash, and payments made to bank accounts outside the country;
> 4. representations or boasting about influence or connections;
> 5. use of a shell or holding company that obscures ownership without credible explanation;
> 6. accusations of improper business practices (credible rumors or media reports, etc.);
> 7. family or business relationship with the government or a government official;
> 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions;
> 9. unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0012` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `unusual_payment_patterns_or_requests` |  |

In plain English: `third_party_red_flag_type` equals `unusual_payment_patterns_or_requests`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> unusual payment patterns or requests, including payments to third parties, in cash, and payments made to bank accounts outside the country;
> 4. representations or boasting about influence or connections;
> 5. use of a shell or holding company that obscures ownership without credible explanation;
> 6. accusations of improper business practices (credible rumors or media reports, etc.);
> 7. family or business relationship with the government or a government official;
> 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions;
> 9. unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0013` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `boasting_about_influence_or_connections` |  |

In plain English: `third_party_red_flag_type` equals `boasting_about_influence_or_connections`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> representations or boasting about influence or connections;
> 5. use of a shell or holding company that obscures ownership without credible explanation;
> 6. accusations of improper business practices (credible rumors or media reports, etc.);
> 7. family or business relationship with the government or a government official;
> 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions;
> 9. unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0014` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `shell_or_holding_company_obscures_ownership` |  |

In plain English: `third_party_red_flag_type` equals `shell_or_holding_company_obscures_ownership`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> use of a shell or holding company that obscures ownership without credible explanation;
> 6. accusations of improper business practices (credible rumors or media reports, etc.);
> 7. family or business relationship with the government or a government official;
> 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions;
> 9. unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0015` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `accusations_of_improper_business_practices` |  |

In plain English: `third_party_red_flag_type` equals `accusations_of_improper_business_practices`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> accusations of improper business practices (credible rumors or media reports, etc.);
> 7. family or business relationship with the government or a government official;
> 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions;
> 9. unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0016` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `family_or_business_relationship_with_government_official` |  |

In plain English: `third_party_red_flag_type` equals `family_or_business_relationship_with_government_official`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> family or business relationship with the government or a government official;
> 8. requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions;
> 9. unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0017` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `up_front_payment_request_or_money_needed_to_get_business` |  |

In plain English: `third_party_red_flag_type` equals `up_front_payment_request_or_money_needed_to_get_business`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> requests for payments “up front” or statements that a particular amount of money is needed to “get the business,” “make the necessary arrangements,” or similar expressions;
> 9. unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0018` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `unusually_high_commissions_fees_or_payments` |  |

In plain English: `third_party_red_flag_type` equals `unusually_high_commissions_fees_or_payments`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> unusually high commissions, agents’ fees, or payments for goods or services;
> 10. apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0019` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `apparent_lack_of_qualifications_or_resources` |  |

In plain English: `third_party_red_flag_type` equals `apparent_lack_of_qualifications_or_resources`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> apparent lack of qualifications or resources;
> 11. whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0020` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `recommended_by_potential_government_customer_official` |  |

In plain English: `third_party_red_flag_type` equals `recommended_by_potential_government_customer_official`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-AC-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> whether the representative or joint venture partner has been recommended by an official of the potential government customer;
> 12. requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0021` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `request_to_make_agreements_without_company_approval` |  |

In plain English: `third_party_red_flag_type` equals `request_to_make_agreements_without_company_approval`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Cross-domain refs: `PROC-URGENT-0001`, `PROC-URGENT-0002`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> requests to be able to make agreements without the Company’s approval; and
> 13. requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

### Rule `LEG-AC-0022` — Anti Corruption Red Flag Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `third_party_red_flag_type` | `==` | `request_to_keep_agreements_or_communications_secret` |  |

In plain English: `third_party_red_flag_type` equals `request_to_keep_agreements_or_communications_secret`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **your supervisor** → **the CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `your_supervisor_preapproval`, `the_clo_preapproval`.
- Exceptions (overriding rules): `customary nondisclosure or confidentiality agreement`
- Cross-domain refs: `FIN-VEND-0001`, `PROC-VEND-0008`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > RED FLAGS RELATED TO THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> requests that agreements or communications be kept secret (other than a customary nondisclosure or confidentiality agreement).
> 
> Team Members and Partners are responsible for monitoring their email and other communications and documents for red flags. Any red flags should be brought promptly to the attention of your supervisor or the CLO. Failure to do so is considered a violation of this Anti-Corruption Policy.

_Notes_: Red flags must be escalated promptly.

## Category: `charitable_contribution_approval`

### Rule `LEG-AC-0008` — Charitable Contribution Approval

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `contribution_type` | `==` | `charitable_donation` |  |
| `donation_on_behalf_of_company` | `==` | `true` |  |

In plain English: `contribution_type` equals `charitable_donation` AND `donation_on_behalf_of_company` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`.
- Cross-domain refs: `FIN-EXP-0004`, `PROC-ENGAGE-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > CHARITABLE CONTRIBUTIONS
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> Team Members and Partners must obtain prior written approval from the CLO before making any charitable donation on behalf of the Company or using Company funds, directly or indirectly.

_Notes_: Prior written approval is required before making a charitable donation on behalf of the Company.

## Category: `embarrassing_gift_expense`

### Rule `LEG-AC-0028` — Embarrassing Gift Expense

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `expenditure_type` | `==` | `gift` |  |
| `company_embarrassment_risk` | `==` | `true` |  |

In plain English: `expenditure_type` equals `gift` AND `company_embarrassment_risk` equals true.

**Reject** when these conditions hold.
- Cross-domain refs: `PROC-ENGAGE-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> Any gift or expense that is lavish or might otherwise prove embarrassing for the Company is prohibited.

## Category: `fraud_reporting_confidentiality`

### Rule `LEG-AC-0033` — Fraud Reporting Confidentiality

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `reporter_role` | `==` | `Team Member` |  |
| `reporting_status` | `==` | `reporting` |  |

In plain English: `reporter_role` equals `Team Member` AND `reporting_status` equals `reporting`.

**Request supporting documents** before deciding.
- Required documents: `fraud_reporting_confidentiality`
- Approver chain: **CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `fraud_reporting_confidentiality`.
- Exceptions (overriding rules): `unless directed to do so by the CLO`
- Cross-domain refs: `FIN-ACCR-0002`

**Source:**
- doc_id: `gitlab/legal_anti_fraud_policy`
- section: Anti-Fraud Policy > INTRODUCTION > TEAM MEMBER AND DIRECTOR RESPONSIBILITY & REPORTING
- url: https://handbook.gitlab.com/handbook/legal/anti-fraud-policy/

Verbatim quote from the policy corpus:

> The reporting Team Member shall refrain from discussing the matter with any Team Member unless directed to do so by the CLO.

_Notes_: Discussion of the reported matter with any Team Member is allowed only if directed by the CLO.

## Category: `fraud_reporting_escalation`

### Rule `LEG-AC-0023` — Fraud Reporting Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `manager_suspects_fraud` | `==` | `true` |  |

In plain English: `manager_suspects_fraud` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`.

**Source:**
- doc_id: `gitlab/legal_anti_fraud_policy`
- section: Anti-Fraud Policy > INTRODUCTION > MANAGERIAL RESPONSIBILITY
- url: https://handbook.gitlab.com/handbook/legal/anti-fraud-policy/

Verbatim quote from the policy corpus:

> If a manager suspects fraud, or has received a report of fraud from a Team Member, they must immediately contact the CLO.

_Notes_: Manager must immediately contact the CLO when fraud is suspected.

### Rule `LEG-AC-0030` — Fraud Reporting Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `reporter_role` | `==` | `Team Member` |  |
| `fraud_awareness_status` | `==` | `suspected` |  |

In plain English: `reporter_role` equals `Team Member` AND `fraud_awareness_status` equals `suspected`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **direct supervisor** → **GitLab’s Chief Legal Officer (the “***CLO***”)**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `direct_supervisor_preapproval`, `gitlab_s_chief_legal_officer_the_clo_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_anti_fraud_policy`
- section: Anti-Fraud Policy > INTRODUCTION > TEAM MEMBER AND DIRECTOR RESPONSIBILITY & REPORTING
- url: https://handbook.gitlab.com/handbook/legal/anti-fraud-policy/

Verbatim quote from the policy corpus:

> When fraud is suspected, observed, or otherwise made known to a Team Member, the Team Member must immediately report the activity to their direct supervisor (who shall notify GitLab’s Chief Legal Officer (the “***CLO***”).

_Notes_: The direct supervisor is required to notify the CLO.

### Rule `LEG-AC-0031` — Fraud Reporting Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `reporter_role` | `==` | `Director` |  |
| `director_fraud_awareness` | `==` | `aware` |  |
| `fraud_status` | `==` | `suspected` |  |

In plain English: `reporter_role` equals `Director` AND `director_fraud_awareness` equals `aware` AND `fraud_status` equals `suspected`.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO** → **Chair of the Audit Committee** → **outside counsel**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`, `chair_of_the_audit_committee_preapproval`, `outside_counsel_preapproval`.
- Cross-domain refs: `PROC-PO-0004`, `PROC-PO-0005`, `PROC-PO-0006`, `PROC-PO-0007`, `PROC-PO-0008`, `PROC-PO-0010`, `PROC-PO-0011`

**Source:**
- doc_id: `gitlab/legal_anti_fraud_policy`
- section: Anti-Fraud Policy > INTRODUCTION > TEAM MEMBER AND DIRECTOR RESPONSIBILITY & REPORTING
- url: https://handbook.gitlab.com/handbook/legal/anti-fraud-policy/

Verbatim quote from the policy corpus:

> In the event a Director is aware of or notified of suspected or observed fraud, the Director shall notify the CLO, Chair of the Audit Committee or outside counsel, as appropriate.

_Notes_: Notification recipient is selected as appropriate.

### Rule `LEG-AC-0032` — Fraud Reporting Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `reporter_role` | `==` | `Team Member` |  |
| `direct_supervisor_involved_in_fraud` | `==` | `true` |  |

In plain English: `reporter_role` equals `Team Member` AND `direct_supervisor_involved_in_fraud` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_anti_fraud_policy`
- section: Anti-Fraud Policy > INTRODUCTION > TEAM MEMBER AND DIRECTOR RESPONSIBILITY & REPORTING
- url: https://handbook.gitlab.com/handbook/legal/anti-fraud-policy/

Verbatim quote from the policy corpus:

> If the Team Member has reason to believe their direct supervisor may be involved in fraudulent activity, the Team Member is obligated to report the activity to the CLO.

## Category: `gift_entertainment_conditions`

### Rule `LEG-AC-0025` — Gift Entertainment Conditions

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `expenditure_type` | `==` | `gift` |  |

In plain English: `expenditure_type` equals `gift`.

**Request supporting documents** before deciding.
- Required documents: `gift_entertainment_conditions`
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `gift_entertainment_conditions`.
- Cross-domain refs: `FIN-EXP-0006`, `FIN-EXP-0007`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> No gift or entertainment should ever be offered, given, provided or accepted by Team Members and Partners unless it:
> 
> 1. is reasonable and not extravagant;
> 2. is appropriate under the circumstances and serves a valid business purpose;
> 3. is customary and appropriate under U.S. and local customs;
> 4. is not being offered for any improper purpose, and could not be construed as a bribe, kickback or payoff;
> 5. does not violate any Company policy;
> 6. does not violate any U.S., local or international laws or regulations; and
> 7. is accurately described in your expense or other reports and Company’s books and records.

_Notes_: Applies to offering, giving, providing, accepting, or receiving gifts.

## Category: `gift_expense_clo_consultation`

### Rule `LEG-AC-0029` — Gift Expense Clo Consultation
_Severity: recommended_

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `expenditure_type` | `==` | `gift` |  |
| `appropriateness_question_exists` | `==` | `true` |  |

In plain English: `expenditure_type` equals `gift` AND `appropriateness_question_exists` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`.
- Cross-domain refs: `PROC-VEND-0007`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> If Team Members and Partners have any question regarding the appropriateness of any gift or expense, they should consult the CLO prior to giving the gift or incurring the expense.

_Notes_: Consultation should occur before giving the gift.

## Category: `government_official_improper_expenditure`

### Rule `LEG-AC-0026` — Government Official Improper Expenditure

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `expenditure_type` | `==` | `gift` |  |
| `recipient_category` | `==` | `government_employee_or_official` |  |
| `improper_purpose` | `==` | `induce_misuse_of_position` |  |

In plain English: `expenditure_type` equals `gift` AND `recipient_category` equals `government_employee_or_official` AND `improper_purpose` equals `induce_misuse_of_position`.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> all gifts, entertainment, or promotional expenses which are intended to induce a government employee or official to misuse their position or to obtain an improper advantage are prohibited, regardless of their value;

_Notes_: Prohibited regardless of value.

## Category: `lavish_gift_expense`

### Rule `LEG-AC-0027` — Lavish Gift Expense

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `expenditure_type` | `==` | `gift` |  |
| `expenditure_lavish` | `==` | `true` |  |

In plain English: `expenditure_type` equals `gift` AND `expenditure_lavish` equals true.

**Reject** when these conditions hold.

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > GIFTS, ENTERTAINMENT, TRAVEL & PROMOTIONAL EXPENDITURES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> Any gift or expense that is lavish or might otherwise prove embarrassing for the Company is prohibited.

## Category: `partner_code_of_ethics_adherence`

### Rule `LEG-ETHICS-0001` — Partner Code Of Ethics Adherence

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `vendor_intends_to_do_business_with_gitlab` | `==` | `true` |  |

In plain English: `vendor_intends_to_do_business_with_gitlab` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `designated_approver_preapproval`.
- Exceptions (overriding rules): `typically not required in event related agreements unless the vendor is providing services`

**Source:**
- doc_id: `gitlab/finance_procurement`
- section: The GitLab Procurement Team > What is Procurement? > Vendor Lifecycle Management
- url: https://handbook.gitlab.com/handbook/finance/procurement/

Verbatim quote from the policy corpus:

> All vendors must adhere to the [GitLab Partner Code of Ethics](https://handbook.gitlab.com/handbook/legal/partner-code-of-ethics/). It is mandatory all vendors contractually adhere to this if they would like to do business with us. (Note these are typically not required in event related agreements unless the vendor is providing services).

_Notes_: Vendors must contractually adhere to the GitLab Partner Code of Ethics.

## Category: `policy_violation_reporting_escalation`

### Rule `LEG-AC-0024` — Policy Violation Reporting Escalation

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `conduct_believed_policy_violation` | `==` | `true` |  |

In plain English: `conduct_believed_policy_violation` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **Chair of the Audit Committee of GitLab’s Board of Directors** → **GitLab’s Internal Audit Team**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `chair_of_the_audit_committee_of_gitlab_s_board_of_directors_preapproval`, `gitlab_s_internal_audit_team_preapproval`.
- Cross-domain refs: `PROC-CONTR-0001`

**Source:**
- doc_id: `gitlab/legal_anti_fraud_policy`
- section: Anti-Fraud Policy > INTRODUCTION > MANAGERIAL RESPONSIBILITY
- url: https://handbook.gitlab.com/handbook/legal/anti-fraud-policy/

Verbatim quote from the policy corpus:

> The CLO shall promptly report to the Chair of the Audit Committee of GitLab’s Board of Directors and GitLab’s Internal Audit Team with respect to any conduct believed to be a violation of this Policy, and inform any other GitLab e-group member as appropriate.

_Notes_: CLO must promptly report believed Policy violations to the named recipients.

## Category: `third_party_due_diligence`

### Rule `LEG-AC-0009` — Third Party Due Diligence

**Conditions (ALL must hold for this rule to fire):**

| Field | Operator | Value | Unit |
|---|---|---|---|
| `relationship_action` | `==` | `initiate` |  |
| `counterparty_is_third_party` | `==` | `true` |  |

In plain English: `relationship_action` equals `initiate` AND `counterparty_is_third_party` equals true.

**Pre-approval required**: named approvers must sign off before the action proceeds.
- Approver chain: **CLO**
- **Fulfilled by**: when the submission contains evidence of ALL of these items, this rule's effective decision folds to `approve`. Items: `clo_preapproval`.
- Cross-domain refs: `PROC-BGSCRN-0004`, `PROC-RFP-0001`

**Source:**
- doc_id: `gitlab/legal_anti_corruption_policy`
- section: Anti-Corruption Policy > PURPOSE > REPRESENTATIVES, PARTNERS, CONSULTANTS, DISTRIBUTORS, AGENTS AND OTHER THIRD PARTIES
- url: https://handbook.gitlab.com/handbook/legal/anti-corruption-policy/

Verbatim quote from the policy corpus:

> Before initiating a relationship with a representative, partner, consultant, distributor, agent, or other third party, Team Members and Partners must conduct appropriate due diligence to assure that the representative will not engage in any improper conduct. ***This is for several important reasons, including that the Company can be held responsible for a third party’s conduct in certain circumstances under the Anti-Corruption Laws***. Due diligence typically will include considering such factors as:
> 
> * the third party’s qualifications for the position or task at issue;
> * whether the third party has personal or professional ties to the government or any government official;
> * the number and reputation of the third party’s clientele and the representative’s reputation with the United States Embassy or Consulate, local bankers, clients, and other business associates; and
> * the reasonableness of the compensation.
> 
> Consult the CLO regarding the appropriate due diligence procedure for your situation.

_Notes_: CLO consultation is required regarding the appropriate due diligence procedure.
