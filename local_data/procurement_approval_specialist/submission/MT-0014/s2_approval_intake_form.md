# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id MUL-2026-0014.
Project Name: Frontier AI Toolkit
Applicant Department: Revenue Operations
Application Date: 2026-05-03

This intake originates from Revenue Operations, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Independent Contractor Agreement** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`worker_type`=independent_contractor, `customer_declines_trial_process`=True, `requested_agreement_type`=Evaluation Agreement, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `worker_type`: independent_contractor
- `customer_declines_trial_process`: True
- `requested_agreement_type`: Evaluation Agreement
- `employer_background_screening_completed`: False
- `extension_beyond_initial_term`: True
- `contingent_worker_employer_type`: vendor
- `returning_to_service_at_gitlab`: True
- `days_since_contract_completion`: 90
- `requires_sso_access`: True

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Independent Contractor Agreement
- Evaluation Agreement Approval

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Revenue Operations intake queue should additional clarification be needed before final adjudication.
