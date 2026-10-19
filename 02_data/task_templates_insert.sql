-- task_templates_insert.sql
-- Phantom Zone PLC — HR Onboarding Coordinator
-- Phase 2: Seed data for task_templates table
-- Run after CREATE TABLE task_templates

TRUNCATE TABLE task_templates RESTART IDENTITY;

INSERT INTO task_templates (hire_type, task_name, owner, due_offset, is_required, notes) VALUES

-- HEAD OFFICE (13 tasks)
('head_office', 'Collect joining documents',         'HR',             -7,  TRUE,  'NID, certificates, offer acceptance'),
('head_office', 'Send welcome email to new hire',    'HR',             -5,  TRUE,  'Includes Day 1 schedule'),
('head_office', 'Provision laptop',                  'IT',             -5,  TRUE,  'Standard head office spec'),
('head_office', 'Create system accounts',            'IT',             -3,  TRUE,  'Email, ERP, HRIS'),
('head_office', 'Arrange desk and access card',      'Admin',          -3,  TRUE,  'Building access'),
('head_office', 'Share pre-boarding checklist',      'HR',             -3,  TRUE,  'What to bring on Day 1'),
('head_office', 'Confirm transport arrangement',     'Admin',          -1,  TRUE,  'If applicable'),
('head_office', 'Induction briefing',                'HR',              0,  TRUE,  'Day 1 morning'),
('head_office', 'Manager introduction meeting',      'Hiring Manager',  0,  TRUE,  'Day 1'),
('head_office', 'Team introduction',                 'Hiring Manager',  0,  TRUE,  'Day 1'),
('head_office', 'IT orientation',                    'IT',              1,  TRUE,  'Systems walkthrough'),
('head_office', 'HR policy sign-off',                'HR',              3,  TRUE,  'Code of conduct, leave policy'),
('head_office', 'Probation KPI setting',             'Hiring Manager',  5,  TRUE,  'Within first week'),

-- FACTORY (14 tasks)
('factory', 'Collect joining documents',             'HR',             -7,  TRUE,  'NID, certificates, offer acceptance'),
('factory', 'Send welcome email to new hire',        'HR',             -5,  TRUE,  'Includes Day 1 schedule'),
('factory', 'Arrange safety gear',                   'Admin',          -5,  TRUE,  'PPE as per factory role'),
('factory', 'Create system accounts',                'IT',             -3,  TRUE,  'Attendance and factory systems'),
('factory', 'Issue factory ID and access card',      'Admin',          -3,  TRUE,  'Gate access'),
('factory', 'Share pre-boarding checklist',          'HR',             -3,  TRUE,  'What to bring on Day 1'),
('factory', 'Confirm transport arrangement',         'Admin',          -1,  TRUE,  'Factory shuttle or allowance'),
('factory', 'Safety induction',                      'HR',              0,  TRUE,  'Mandatory Day 1 morning'),
('factory', 'Induction briefing',                    'HR',              0,  TRUE,  'Day 1 morning'),
('factory', 'Manager introduction meeting',          'Hiring Manager',  0,  TRUE,  'Day 1'),
('factory', 'Team introduction',                     'Hiring Manager',  0,  TRUE,  'Day 1'),
('factory', 'HR policy sign-off',                    'HR',              3,  TRUE,  'Code of conduct, leave policy'),
('factory', 'Probation KPI setting',                 'Hiring Manager',  5,  TRUE,  'Within first week'),
('factory', 'Factory floor orientation',             'Hiring Manager',  1,  TRUE,  'Day 2 walkthrough'),

-- FIELD FORCE (13 tasks)
('field_force', 'Collect joining documents',         'HR',             -7,  TRUE,  'NID, certificates, offer acceptance'),
('field_force', 'Send welcome email to new hire',    'HR',             -5,  TRUE,  'Includes Day 1 schedule and territory info'),
('field_force', 'Issue SIM card and mobile device',  'IT',             -5,  TRUE,  'Field force standard kit'),
('field_force', 'Create system accounts',            'IT',             -3,  TRUE,  'CRM and reporting apps'),
('field_force', 'Share pre-boarding checklist',      'HR',             -3,  TRUE,  'What to bring on Day 1'),
('field_force', 'Arrange territory briefing pack',   'Hiring Manager', -1,  TRUE,  'Route map, customer list'),
('field_force', 'Induction briefing',                'HR',              0,  TRUE,  'Day 1 morning'),
('field_force', 'Manager introduction meeting',      'Hiring Manager',  0,  TRUE,  'Day 1'),
('field_force', 'Team introduction',                 'Hiring Manager',  0,  TRUE,  'Day 1'),
('field_force', 'CRM system training',               'IT',              0,  TRUE,  'Day 1 afternoon'),
('field_force', 'Territory handover meeting',        'Hiring Manager',  1,  TRUE,  'Day 2'),
('field_force', 'HR policy sign-off',                'HR',              3,  TRUE,  'Code of conduct, leave policy'),
('field_force', 'Probation KPI setting',             'Hiring Manager',  5,  TRUE,  'Within first week');
