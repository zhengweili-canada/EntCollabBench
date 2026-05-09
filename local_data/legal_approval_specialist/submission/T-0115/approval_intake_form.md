# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id INDI-2026-0115.
Project Name: Meadowlark Risk Posture
Applicant Department: People Ops Compliance
Application Date: 2026-05-03

This intake originates from People Ops Compliance, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Individual Use Software Approval Negation** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`individual_use_software_request_received`=2, `engages_another_processor`=True). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `individual_use_software_request_received`: 2
- `engages_another_processor`: True

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Individual Use Software Approval Negation
- Data Subprocessor Approval

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the People Ops Compliance intake queue should additional clarification be needed before final adjudication.
