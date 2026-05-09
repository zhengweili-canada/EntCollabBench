# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id ANTI-2026-0057.
Project Name: Pinecrest Buyout Review
Applicant Department: Brand & Creative
Application Date: 2026-05-03

This intake originates from Brand & Creative, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Anti Corruption Political Contribution Preapproval** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`company_resource_type`=funds, `recipient_type`=government_official, `publicity_waiver_release_required`=2, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `company_resource_type`: funds
- `recipient_type`: government_official
- `publicity_waiver_release_required`: 2
- `anticorruption_gating_any_yes`: True
- `data_categories`: confidential_information
- `sharing_gitlab_business_need_details`: True
- `transfer_type`: payment
- `third_party_likely_recipient_role`: government_employee_or_official
- `payment_purpose`: improper_purpose
- `team_member_or_partner_knowledge`: knows_or_has_reason_to_know

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Anti Corruption Political Contribution Preapproval
- Publicity Waiver Release Requirement Negation

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Brand & Creative intake queue should additional clarification be needed before final adjudication.
