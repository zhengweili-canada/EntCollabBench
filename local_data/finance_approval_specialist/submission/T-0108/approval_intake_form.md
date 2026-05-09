# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id LARG-2026-0108.
Project Name: Driftwood Compliance Refresh
Applicant Department: Brand & Creative
Application Date: 2026-05-03

This intake originates from Brand & Creative, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Large Internal Event Approval** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 3 parallel review tracks based on the documented parameters (`event_total_cost_usd`=1200000, `mandatory_review_required`=True, `material_type`=video, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `event_total_cost_usd`: 1200000
- `mandatory_review_required`: True
- `material_type`: video
- `video_produced`: False
- `question_about_payment_impropriety`: True
- `anticorruption_gating_any_yes`: True

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Large Internal Event Approval
- Video Materials Review
- Anti Corruption Payment Consultation

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Brand & Creative intake queue should additional clarification be needed before final adjudication.
