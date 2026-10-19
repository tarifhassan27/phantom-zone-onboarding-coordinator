# Scenario Suite
## Phantom Zone PLC — HR Onboarding Coordinator
## Written before workflow build (Phase 2)

These are the expected outcomes for all 20 hires. The workflow is evaluated against these after Phase 8. Any deviation is a bug, not a design choice.

---

### How to read this

- **Task plan generated:** Y = a full task plan should be created; N = the hire should be blocked
- **Day-1 tasks:** count of tasks with `due_offset = 0`
- **Pre-boarding tasks:** count of tasks with `due_offset < 0`
- **Reminder at day 1 overdue:** auto-sent to task owner, no approval
- **Escalation at day 3 overdue:** requires human approval before sending
- **New-hire message:** requires human approval before sending

---

### Scenario 1 — Rahim Uddin (head_office, bn, MGR001)
- Task plan generated: **Y**
- Expected tasks: 13 (head_office template)
- Pre-boarding tasks: 6 (due_offset < 0)
- Day-1 tasks: 3
- Language: Bangla
- No edge cases

### Scenario 2 — Priya Sharma (head_office, en, MGR001)
- Task plan generated: **Y**
- Expected tasks: 13
- Pre-boarding tasks: 6
- Day-1 tasks: 3
- Language: English
- No edge cases

### Scenario 3 — Kamal Hossain (factory, bn, MGR002)
- Task plan generated: **Y**
- Expected tasks: 14 (factory template)
- Pre-boarding tasks: 6
- Day-1 tasks: 3
- Language: Bangla
- No edge cases

### Scenario 4 — Nasrin Akter (factory, en, MGR002)
- Task plan generated: **Y**
- Expected tasks: 14
- Pre-boarding tasks: 6
- Day-1 tasks: 3
- Language: English
- No edge cases

### Scenario 5 — Farhan Islam (field_force, bn, MGR003)
- Task plan generated: **Y**
- Expected tasks: 13 (field_force template)
- Pre-boarding tasks: 5
- Day-1 tasks: 4
- Language: Bangla
- No edge cases

### Scenario 6 — Sadia Rahman (field_force, en, MGR003)
- Task plan generated: **Y**
- Expected tasks: 13
- Pre-boarding tasks: 5
- Day-1 tasks: 4
- Language: English
- No edge cases

### Scenario 7 — Tanvir Ahmed (head_office, bn, MGR001)
- Task plan generated: **Y**
- Expected tasks: 13
- Language: Bangla
- No edge cases

### Scenario 8 — Mitu Begum (factory, en, MGR002)
- Task plan generated: **Y**
- Expected tasks: 14
- Language: English
- No edge cases

### Scenario 9 — Shakil Mahmud (field_force, bn, MGR003)
- Task plan generated: **Y**
- Expected tasks: 13
- Language: Bangla
- No edge cases

### Scenario 10 — Roksana Parvin (head_office, en, MGR004)
- Task plan generated: **Y**
- Expected tasks: 13
- Language: English
- No edge cases

### Scenario 11 — Imran Hasan (factory, bn, MGR002)
- Task plan generated: **Y**
- Expected tasks: 14
- Language: Bangla
- No edge cases

### Scenario 12 — Lovely Khatun (field_force, en, MGR003)
- Task plan generated: **Y**
- Expected tasks: 13
- Language: English
- No edge cases

### Scenario 13 — Jahangir Alam (head_office, bn, NULL manager) ⚠️ EDGE CASE
- Task plan generated: **N**
- Expected outcome: blocked, audit log entry written, no tasks created
- Reason: `manager_id` is NULL
- Zero tasks should exist for this hire in the tasks table

### Scenario 14 — Sumaiya Islam (factory, en, MGR002)
- Task plan generated: **Y**
- Expected tasks: 14
- Language: English
- No edge cases

### Scenario 15 — Rafiqul Islam (field_force, bn, MGR003)
- Task plan generated: **Y**
- Expected tasks: 13
- Language: Bangla
- No edge cases

### Scenario 16 — Nusrat Jahan (head_office, en, MGR004)
- Task plan generated: **Y**
- Expected tasks: 13
- Language: English
- No edge cases

### Scenario 17 — Mizanur Rahman (factory, bn, MGR002)
- Task plan generated: **Y**
- Expected tasks: 14
- Language: Bangla
- No edge cases

### Scenario 18 — Tahmina Akter (field_force, en, MGR003)
- Task plan generated: **Y**
- Expected tasks: 13
- Language: English
- No edge cases

### Scenario 19 — Ariful Islam (head_office, bn, MGR001)
- Task plan generated: **Y**
- Expected tasks: 13
- Language: Bangla
- No edge cases

### Scenario 20 — Sharmin Sultana (unknown_type, en, MGR001) ⚠️ EDGE CASE
- Task plan generated: **N**
- Expected outcome: blocked, audit log entry written, no tasks created
- Reason: `hire_type` = 'unknown_type' — not in (factory, field_force, head_office)
- Zero tasks should exist for this hire in the tasks table

---

### Invariant checks (evaluated in Phase 8)

1. `outbox` rows without a corresponding `approved` record in `approval_queue` = **0**
2. Every blocked hire (scenarios 13 and 20) has exactly **0** rows in `tasks`
3. Every failure event has a row in `audit_log` — nothing disappears silently
4. Total tasks created across the 18 valid hires:
   - head_office hires (8): 8 × 13 = 104 tasks
   - factory hires (6): 6 × 14 = 84 tasks
   - field_force hires (6): 6 × 13 = 78 tasks
   - **Total expected: 266 tasks**
