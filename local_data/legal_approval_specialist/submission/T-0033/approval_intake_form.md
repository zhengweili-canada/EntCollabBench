# Approval Intake Form

_evidence_id_: `E-001`
_kind_: `form`

---

Approval Intake Form for case_id CASE-2026-0033.
Project Name: Cascade Identity Pilot
Applicant Department: Customer Success
Application Date: 2026-05-03

This intake originates from Customer Success, which submitted the case via the standard approval-orchestrator pipeline on 2026-05-03. The submission flags **Procurement Intake** as the operative review area and routes the case for specialist adjudication. Operational context for the request: the team has prepared a 2 parallel review tracks based on the documented parameters (`request_type`=renewal_existing_vendor_services, `payment_category`=ar_customer_refund, `preservation_extension_request_count`=1, and additional fields below). All gating values stated below were captured directly from the upstream business-system record at the time of submission and have not been altered in transit.

Submitted parameters:
- `request_type`: renewal_existing_vendor_services
- `payment_category`: ar_customer_refund
- `preservation_extension_request_count`: 1
- `requestor_type`: law_enforcement
- `gitlab_documents_identified_for_release`: True
- `request_source`: US federal agency

Intake routing topics (agents apply the assigned policy_docs to these topics):
- Procurement Intake
- Po Policy Exception

Next-step expectations: each assigned specialist reads this intake plus the supporting evidence attached to this submission, applies the policy passages indicated by their reference document, and returns a decision keyed to the rules actually triggered by the parameters above. If a gating fact required by a rule is not present in this intake, the specialist should mark the matter `require_docs` listing the missing field rather than infer or default a value. The applicant has authorised contact via the Customer Success intake queue should additional clarification be needed before final adjudication.
