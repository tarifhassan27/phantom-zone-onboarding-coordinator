# Problem Statement
## Phantom Zone PLC — HR Onboarding Coordinator

### The Business Problem

At Phantom Zone PLC, onboarding is a coordination problem, not a knowledge problem. HR, IT, Admin, and the hiring manager each own a slice of the new hire's first days — but no single system tracks who must do what, by when, or what has actually happened.

The result is predictable: documents pile up on day 1. The new hire spends their entire first day signing forms, submitting certificates, and filling out system access requests. There is no time to meet the team, understand the company, or hear from the manager. The experience that most shapes long-term retention is lost to paperwork.

The coordinator fixes this by enforcing one rule: **everything that can happen before day 1 must happen before day 1.**

Joining documents — offer letter acceptance, NID copy, academic certificates, medical forms — are collected during pre-boarding. Day 1 is reserved for people: the team, the manager, and the company. System access is still provisioned on day 1 by IT, because hardware and accounts cannot be readied until the hire physically arrives. That is the only exception.

### The System

An n8n workflow coordinator that:

1. Receives a new-hire record (name, role, hire type, start date, hiring manager)
2. Generates a role-specific task plan with working-day due dates assigned to HR, IT, Admin, and the hiring manager
3. Runs a daily check and drafts reminders and escalations in Bangla or English via Gemini
4. Routes consequential messages through a human approval step before anything is sent
5. Logs every action, draft, approval decision, and failure to a Postgres audit trail

### Company Context

**Phantom Zone PLC** — a fictional Bangladeshi pharmaceuticals company (~2,500 employees).

Three hire types, each with a distinct onboarding path:

| Hire Type | Where | Key onboarding requirements |
|---|---|---|
| Factory | Manufacturing plant | GMP and SOP training, medical fitness check, PPE issuance, gate pass |
| Field Force (MPO) | Nationwide territory | Territory assignment, product knowledge training, sales app access |
| Head Office | Dhaka HQ | Standard onboarding — induction, IT setup, departmental orientation |

### Scope

**v1 covers:**
- Offer acceptance → Day 30
- Three hire types: Factory, Field Force, Head Office
- Four task owners: HR, IT, Admin, Hiring Manager
- Working-day due dates (Friday–Saturday weekend + public holidays)
- Bilingual message drafting: Bangla and English
- Human approval for escalations and new-hire-facing messages
- Failure handling: IT provisioning failures, Gemini unavailability, missing manager
- Audit log of every event

**v2 deferred:**
- Real email or Slack delivery
- Day 31–90 window
- Offboarding workflows
- Dashboard / reporting layer
- Integration with the bilingual HR policy assistant
