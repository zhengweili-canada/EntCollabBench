# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id RFPB-2026-0063.
Project Name: Orchid Compliance Track
Applicant Department: Revenue Operations
Application Date: 2026-05-03

This intake originates from Revenue Operations, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Rfp Bid Requirement** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 3 parallel review tracks based on the documented parameters (`rfp_process_required`=True, `purchase_amount_usd`=100000, `purchase_made`=True, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `rfp_process_required`: True
- `purchase_amount_usd`: 100000
- `purchase_made`: True
- `forecast_cadence`: quarterly
- `purchase_type`: new_spend
- `purchase_frequency`: one_time
- `purchase_purpose`: individual_work_use
- `purchase_category`: home_office_equipment

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Rfp Bid Requirement
- Purchase Legal Review
- Quarterly Forecast Approval

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Revenue Operations intake queue should additional clarification be needed before final adjudication.
