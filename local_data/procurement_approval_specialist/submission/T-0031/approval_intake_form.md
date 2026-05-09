# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id EMBA-2026-0031.
Project Name: Topaz Channel Pilot
Applicant Department: Marketing Operations
Application Date: 2026-05-03

This intake originates from Marketing Operations, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Embarrassing Gift Expense** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`expenditure_type`=gift, `company_embarrassment_risk`=True, `request_type`=MLAT_request, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `expenditure_type`: gift
- `company_embarrassment_risk`: True
- `request_type`: MLAT_request
- `request_properly_served`: True
- `request_appropriately_scoped`: True
- `request_within_authority_power`: True
- `applicable_law_compliance`: True
- `anticorruption_gating_any_yes`: True
- `requester_team`: LACA
- `requestor_type`: law_enforcement
- `preservation_extension_request_count`: 1
- `contract_value_usd`: 0

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Embarrassing Gift Expense
- Law Enforcement Request Response

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Marketing Operations intake queue should additional clarification be needed before final adjudication.
