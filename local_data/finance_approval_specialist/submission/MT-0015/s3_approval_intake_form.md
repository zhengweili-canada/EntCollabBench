# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id MUL-2026-0015.
Project Name: Atlas Edge Migration
Applicant Department: Public Sector Office
Application Date: 2026-05-03

This intake originates from Public Sector Office, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Po Policy Exception** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`payment_category`=board_of_director_payment, `customer_declines_trial_process`=True, `requested_agreement_type`=Evaluation Agreement, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `payment_category`: board_of_director_payment
- `customer_declines_trial_process`: True
- `requested_agreement_type`: Evaluation Agreement
- `payment_in_exception_list`: False

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Po Policy Exception
- Evaluation Agreement Approval

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Public Sector Office intake queue should additional clarification be needed before final adjudication.
