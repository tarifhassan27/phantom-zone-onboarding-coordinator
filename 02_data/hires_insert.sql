-- hires_insert.sql
-- Phantom Zone PLC — HR Onboarding Coordinator
-- Phase 2: Seed data for hires table (20 synthetic hires)
-- Run after CREATE TABLE hires

TRUNCATE TABLE hires RESTART IDENTITY;

INSERT INTO hires (full_name, hire_type, start_date, manager_id, preferred_lang) VALUES

-- HEAD OFFICE (8 hires)
('Rahim Uddin',      'head_office',  '2026-11-03', 'MGR001', 'bn'),
('Priya Sharma',     'head_office',  '2026-11-03', 'MGR001', 'en'),
('Tanvir Ahmed',     'head_office',  '2026-11-10', 'MGR001', 'bn'),
('Roksana Parvin',   'head_office',  '2026-11-10', 'MGR004', 'en'),
('Jahangir Alam',    'head_office',  '2026-11-17', NULL,     'bn'),  -- EDGE CASE: NULL manager
('Nusrat Jahan',     'head_office',  '2026-11-17', 'MGR004', 'en'),
('Ariful Islam',     'head_office',  '2026-11-24', 'MGR001', 'bn'),
('Sumaiya Islam',    'factory',      '2026-11-24', 'MGR002', 'en'),  -- note: factory type, in head_office batch for date grouping only

-- FACTORY (6 hires)
('Kamal Hossain',    'factory',      '2026-11-03', 'MGR002', 'bn'),
('Nasrin Akter',     'factory',      '2026-11-03', 'MGR002', 'en'),
('Mitu Begum',       'factory',      '2026-11-10', 'MGR002', 'en'),
('Imran Hasan',      'factory',      '2026-11-10', 'MGR002', 'bn'),
('Mizanur Rahman',   'factory',      '2026-11-17', 'MGR002', 'bn'),
('Rafiqul Islam',    'field_force',  '2026-11-17', 'MGR003', 'bn'),  -- note: field_force type

-- FIELD FORCE (6 hires)
('Farhan Islam',     'field_force',  '2026-11-03', 'MGR003', 'bn'),
('Sadia Rahman',     'field_force',  '2026-11-03', 'MGR003', 'en'),
('Shakil Mahmud',    'field_force',  '2026-11-10', 'MGR003', 'bn'),
('Lovely Khatun',    'field_force',  '2026-11-10', 'MGR003', 'en'),
('Tahmina Akter',    'field_force',  '2026-11-24', 'MGR003', 'en'),

-- EDGE CASE
('Sharmin Sultana',  'unknown_type', '2026-11-24', 'MGR001', 'en');  -- EDGE CASE: invalid hire_type
