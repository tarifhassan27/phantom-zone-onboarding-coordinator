# Definitions
## Phantom Zone PLC — HR Onboarding Coordinator

### Onboarding Window

| Period | Start | End | What happens |
|---|---|---|---|
| Pre-boarding | Offer acceptance date | Day before joining (Day 0) | Document collection only — HR and Admin tasks |
| Day 1 | Joining date | Joining date | System access (IT), desk + ID card (Admin), manager introduction, team meeting. No paperwork. |
| Post-joining | Day 2 | Day 30 | Training, role handover, check-ins |

### Working Days

- Weekend: Friday and Saturday
- Holidays: standard Bangladesh public holiday calendar for the simulated period
- All due dates and overdue counts use working days only

### Task Owners

| Owner | Responsible for |
|---|---|
| HR | Document collection, induction, policy sign-offs, training enrolment |
| IT | System access, laptop/device provisioning, email setup |
| Admin | ID card, desk assignment, transport registration, gate pass |
| Hiring Manager | Welcome, week-1 plan, introductions, role handover |

### Task Status

| Status | Meaning |
|---|---|
| `pending` | Not yet due |
| `in_progress` | Due date reached, not yet marked done |
| `done` | Marked complete by the owner |
| `overdue` | Due date passed, not done |
| `blocked` | Cannot proceed — reason logged (e.g. missing manager) |
| `failed` | System action attempted and failed (e.g. IT provisioning error) |

### Overdue and Escalation Rules

| Working days overdue | Action |
|---|---|
| 1 | Reminder drafted and sent to task owner (auto-send, no approval needed) |
| 3 | Escalation drafted — sent to owner's line manager, HR copied. Requires human approval before sending. |

### Message Approval Rule (Rule B)

| Message type | Recipient | Approval required? |
|---|---|---|
| Routine reminder | Internal owner (HR / IT / Admin / Manager) | No — auto-send |
| Escalation | Owner's line manager + HR | Yes |
| Any message | New hire | Yes |
| Welcome / introduction | New hire | Yes |

A message may not appear in `outbox` without a corresponding `approved` record in `approval_queue`. This is an invariant checked in the evaluation phase.

### Blocked Conditions

The system blocks task plan generation and logs an error when:
- Hiring manager is missing or unknown
- Hire type is not one of: `factory`, `field_force`, `head_office`

The system never guesses or substitutes defaults for blocked conditions.

**Start date on a weekend or public holiday:** not a block. The system automatically pushes the start date to the next working day, recalculates all due dates from that date, and logs the adjustment.

### Failure Handling

| Failure | Response |
|---|---|
| IT provisioning fails | Retry up to 2 times. On third failure: log as `failed`, escalate to IT manager (approval required). |
| Gemini API unavailable | Fall back to a fixed template message. Log that a fallback was used. |
| Start date changes after plan exists | Re-calculate all pending due dates. Do not create duplicate tasks. Log the change. |

### Language

- Each new hire record carries a preferred language: `bn` (Bangla) or `en` (English)
- Gemini drafts all messages in the hire's preferred language
- Fallback templates exist in both languages

### Pass/Fail Rule

The system passes the evaluation suite if and only if:
1. All 15–20 scenarios produce the expected outcome (task plan, reminders, escalations, failures)
2. `outbox` contains zero rows without a corresponding approval record
3. Every failure is present in `audit_log` — nothing disappears silently

### v1 vs v2 Boundary

The following are explicitly out of scope for v1:
- Real email or Slack delivery (outbox is a Postgres table only)
- Day 31–90 tasks
- Offboarding
- Reporting dashboard
- Integration with the bilingual HR policy assistant
