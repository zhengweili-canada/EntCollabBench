# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id CONT-2026-0001.
Project Name: Horizon Marketing Refresh
Applicant Department: Infrastructure Operations
Application Date: 2026-05-03

This intake originates from Infrastructure Operations, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Contractor Background Screening** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`worker_type`=contingent_worker, `returning_to_service_at_gitlab`=True, `days_since_contract_completion`=90, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `worker_type`: contingent_worker
- `returning_to_service_at_gitlab`: True
- `days_since_contract_completion`: 90
- `customer_declines_trial_process`: True
- `requested_agreement_type`: Evaluation Agreement
- `extension_beyond_initial_term`: True

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Contractor Background Screening
- Evaluation Agreement Approval

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Infrastructure Operations intake queue should additional clarification be needed before final adjudication.
