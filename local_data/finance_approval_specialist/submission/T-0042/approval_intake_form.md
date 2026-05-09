# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id TRAV-2026-0042.
Project Name: Topaz Channel Pilot
Applicant Department: People Ops Compliance
Application Date: 2026-05-03

This intake originates from People Ops Compliance, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Travel Trade Compliance** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`device_ownership`=company_owned, `travel_destination_trade_control_status`=us_embargoed, `record_scope`=all_other_records, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `device_ownership`: company_owned
- `travel_destination_trade_control_status`: us_embargoed
- `record_scope`: all_other_records
- `record_action`: destruction
- `material_relation`: job_related

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Travel Trade Compliance
- Record Destruction Transfer Review

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the People Ops Compliance intake queue should additional clarification be needed before final adjudication.
