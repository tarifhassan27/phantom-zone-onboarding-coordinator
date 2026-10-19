-- schema.sql
-- Phantom Zone PLC — HR Onboarding Coordinator
-- Phase 3: Full database schema (all tables)
-- Run in order — foreign key dependencies respected

-- Reference tables (no dependencies)
CREATE TABLE IF NOT EXISTS task_templates (
    id          SERIAL PRIMARY KEY,
    hire_type   TEXT NOT NULL,
    task_name   TEXT NOT NULL,
    owner       TEXT NOT NULL,
    due_offset  INTEGER NOT NULL,
    is_required BOOLEAN NOT NULL DEFAULT TRUE,
    notes       TEXT
);

CREATE TABLE IF NOT EXISTS hires (
    id              SERIAL PRIMARY KEY,
    full_name       TEXT NOT NULL,
    hire_type       TEXT NOT NULL,
    start_date      DATE NOT NULL,
    manager_id      TEXT,
    preferred_lang  TEXT NOT NULL DEFAULT 'en',
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Workflow tables (depend on hires)
CREATE TABLE IF NOT EXISTS tasks (
    id          SERIAL PRIMARY KEY,
    hire_id     INTEGER NOT NULL REFERENCES hires(id),
    task_name   TEXT NOT NULL,
    owner       TEXT NOT NULL,
    due_date    DATE NOT NULL,
    status      TEXT NOT NULL DEFAULT 'pending',
    created_at  TIMESTAMPTZ DEFAULT NOW(),
    updated_at  TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS approval_queue (
    id              SERIAL PRIMARY KEY,
    hire_id         INTEGER NOT NULL REFERENCES hires(id),
    task_id         INTEGER REFERENCES tasks(id),
    message_type    TEXT NOT NULL,
    recipient       TEXT NOT NULL,
    draft_message   TEXT NOT NULL,
    status          TEXT NOT NULL DEFAULT 'pending',
    created_at      TIMESTAMPTZ DEFAULT NOW(),
    decided_at      TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS outbox (
    id                  SERIAL PRIMARY KEY,
    hire_id             INTEGER NOT NULL REFERENCES hires(id),
    task_id             INTEGER REFERENCES tasks(id),
    approval_queue_id   INTEGER REFERENCES approval_queue(id),
    recipient           TEXT NOT NULL,
    message             TEXT NOT NULL,
    sent_at             TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS audit_log (
    id          SERIAL PRIMARY KEY,
    hire_id     INTEGER REFERENCES hires(id),
    event_type  TEXT NOT NULL,
    detail      TEXT,
    logged_at   TIMESTAMPTZ DEFAULT NOW()
);
