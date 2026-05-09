# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id INSU-2026-0002.
Project Name: Meadowlark Risk Posture
Applicant Department: Corporate Accounting
Application Date: 2026-05-03

This intake originates from Corporate Accounting, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Insurance Certificate Distribution** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 3 parallel review tracks based on the documented parameters (`request_type`=insurance_certificate, `purchase_request_negotiation_status`=completed, `data_processing_activity`=collect, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `request_type`: insurance_certificate
- `purchase_request_negotiation_status`: completed
- `data_processing_activity`: collect
- `data_categories`: Orange Data
- `applicable_law_compliance`: True
- `request_within_authority_power`: True
- `request_properly_served`: True
- `request_appropriately_scoped`: True
- `contract_value_usd`: 0
- `disclosure_audience`: external
- `data_processed_or_stored_outside_gitlab_systems`: True

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Insurance Certificate Distribution
- Purchase Request Approval
- Vendor Security Review

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Corporate Accounting intake queue should additional clarification be needed before final adjudication.
