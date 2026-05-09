# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id PURC-2026-0023.
Project Name: Meadowlark Risk Posture
Applicant Department: Sourcing & Procurement
Application Date: 2026-05-03

This intake originates from Sourcing & Procurement, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Purchasing Card Issuance Approval** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`request_type`=purchasing_card_issuance, `account_risk_rating`=Low, `gitlab_documents_identified_for_release`=True, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `request_type`: purchasing_card_issuance
- `account_risk_rating`: Low
- `gitlab_documents_identified_for_release`: True
- `request_source`: US federal agency
- `requester_team`: LACA
- `contract_value_usd`: 0
- `requestor_type`: law_enforcement
- `preservation_extension_request_count`: 1

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Purchasing Card Issuance Approval
- Account Reconciliation Review

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Sourcing & Procurement intake queue should additional clarification be needed before final adjudication.
