# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id DATA-2026-0100.
Project Name: Topaz Channel Pilot
Applicant Department: Procurement Operations
Application Date: 2026-05-03

This intake originates from Procurement Operations, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Data Transfer Safeguard Authorization** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 3 parallel review tracks based on the documented parameters (`appropriate_safeguard_mechanism`=commission_standard_data_protection_clauses, `expense_age_days`=108, `asset_purchased_by_employee`=True, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `appropriate_safeguard_mechanism`: commission_standard_data_protection_clauses
- `expense_age_days`: 108
- `asset_purchased_by_employee`: True
- `employee_termination`: True

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Data Transfer Safeguard Authorization
- Expense Reimbursement Approval
- Asset Disposition Approval

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Procurement Operations intake queue should additional clarification be needed before final adjudication.
