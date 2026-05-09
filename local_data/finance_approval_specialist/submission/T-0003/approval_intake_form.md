# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id PREP-2026-0003.
Project Name: Summit Renewal Wave
Applicant Department: People Ops Compliance
Application Date: 2026-05-03

This intake originates from People Ops Compliance, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Prepaid Expense Exception Preapproval** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`prepaid_expense_policy_exception_requested`=True, `coa_change_type`=new, `coa_element_type`=account). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `prepaid_expense_policy_exception_requested`: True
- `coa_change_type`: new
- `coa_element_type`: account

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Prepaid Expense Exception Preapproval
- Chart Of Accounts Approval

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the People Ops Compliance intake queue should additional clarification be needed before final adjudication.
