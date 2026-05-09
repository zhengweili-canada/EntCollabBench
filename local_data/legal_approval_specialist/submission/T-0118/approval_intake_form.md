# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id LOAL-2026-0118.
Project Name: Orchid Compliance Track
Applicant Department: Marketing Operations
Application Date: 2026-05-03

This intake originates from Marketing Operations, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Loa Legal Request** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`loa_terms_type`=non_standard, `custom_terms_requested`=True, `reporter_role`=Director, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `loa_terms_type`: non_standard
- `custom_terms_requested`: True
- `reporter_role`: Director
- `director_fraud_awareness`: aware
- `fraud_status`: suspected
- `anticorruption_gating_any_yes`: True
- `direct_supervisor_involved_in_fraud`: True
- `reporting_status`: reporting
- `fraud_awareness_status`: suspected

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Loa Legal Request
- Fraud Reporting Escalation

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Marketing Operations intake queue should additional clarification be needed before final adjudication.
