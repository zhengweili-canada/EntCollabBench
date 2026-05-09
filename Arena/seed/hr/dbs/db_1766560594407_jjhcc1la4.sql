-- Database Seed Data for: hr-4v1-prathamesh
-- Database ID: db_1766560594407_jjhcc1la4
-- MCP Server: sn-hr-internal
-- Created: 2025-12-24 07:16:37.807518+00:00
-- Description: No description provided
-- NOTE: This is seed data fallback (export-sql API was unavailable)

-- ============================================
-- SEED DATA (SQL Statements)
-- ============================================



INSERT INTO organization (org_id, name, active, created_at, updated_at) VALUES
(1, 'ServiceNow', TRUE, '2023-01-01 09:00:00', '2023-01-01 09:00:00'),
(2, 'Globex Corporation', TRUE, '2023-01-02 10:15:00', '2023-01-02 10:15:00'),
(3, 'Soylent Corp', TRUE, '2023-01-05 08:30:00', '2023-01-05 08:30:00'),
(4, 'Initech', TRUE, '2023-02-10 11:45:00', '2023-02-10 11:45:00'),
(5, 'Umbrella Corporation', TRUE, '2023-02-15 14:20:00', '2023-02-15 14:20:00'),
(6, 'Cyberdyne Systems', TRUE, '2023-03-01 09:10:00', '2023-03-01 09:10:00'),
(7, 'Stark Industries', TRUE, '2023-03-05 16:00:00', '2023-03-05 16:00:00'),
(8, 'Wayne Enterprises', TRUE, '2023-03-20 08:00:00', '2023-03-20 08:00:00'),
(9, 'Massive Dynamic', TRUE, '2023-04-01 12:30:00', '2023-04-01 12:30:00'),
(10, 'Hooli', TRUE, '2023-04-10 10:00:00', '2023-04-10 10:00:00'),
(11, 'Vehement Capital Partners', TRUE, '2023-05-05 15:45:00', '2023-05-05 15:45:00'),
(12, 'Pied Piper', TRUE, '2023-05-12 09:30:00', '2023-05-12 09:30:00'),
(13, 'Prestige Worldwide', TRUE, '2023-06-01 11:20:00', '2023-06-01 11:20:00'),
(14, 'Tyrell Corporation', TRUE, '2023-06-15 13:50:00', '2023-06-15 13:50:00'),
(15, 'Oscorp', TRUE, '2023-07-01 10:05:00', '2023-07-01 10:05:00'),
(16, 'Aperture Science', TRUE, '2023-07-20 14:15:00', '2023-07-20 14:15:00'),
(17, 'Black Mesa', TRUE, '2023-08-05 08:45:00', '2023-08-05 08:45:00'),
(18, 'Weyland-Yutani', TRUE, '2023-08-15 17:00:00', '2023-08-15 17:00:00'),
(19, 'Dharma Initiative', FALSE, '2023-09-01 12:00:00', '2023-09-01 12:00:00'),
(20, 'Oceanic Airlines', FALSE, '2023-09-10 09:20:00', '2023-09-10 09:20:00');

-- =============================================================================
-- Permissions Data
-- 19 resources × 2 actions = 38 permissions total
INSERT INTO permission (perm_id, resource, action, created_at, updated_at) VALUES
-- Users permissions
(1, 'users', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 'users', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Groups permissions
(3, 'groups', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 'groups', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- HR Services permissions
(5, 'hr_services', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 'hr_services', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- HR Cases permissions
(7, 'hr_cases', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 'hr_cases', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- HR Profiles permissions
(9, 'hr_profiles', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 'hr_profiles', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Topic Categories permissions
(11, 'topic_categories', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 'topic_categories', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Topic Details permissions
(13, 'topic_details', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 'topic_details', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Service Templates permissions
(15, 'service_templates', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 'service_templates', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- HR Criteria permissions
(17, 'hr_criteria', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 'hr_criteria', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Skills permissions
(19, 'skills', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(20, 'skills', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Knowledge permissions
(21, 'knowledge', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(22, 'knowledge', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Surveys permissions
(23, 'surveys', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(24, 'surveys', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Assignment Rules permissions
(25, 'assignment_rules', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(26, 'assignment_rules', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Escalation Rules permissions
(27, 'escalation_rules', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(28, 'escalation_rules', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Notifications permissions
(29, 'notifications', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(30, 'notifications', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Checklists permissions
(31, 'checklists', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(32, 'checklists', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Survey Instances permissions
(33, 'survey_instances', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(34, 'survey_instances', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Reports permissions
(35, 'reports', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(36, 'reports', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- HR Case Tasks permissions
(37, 'hr_case_tasks', 'read', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(38, 'hr_case_tasks', 'crud', '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO role (role_id, name, created_at, updated_at) VALUES
(1, 'admin', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 'manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 'agent', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 'employee', '2023-01-01 00:00:00', '2023-01-01 00:00:00');

-- Role-Permission mappings (role_permission)
-- Admin: all CRUD permissions (19 resources)
INSERT INTO role_permission (role_id, perm_id, created_at, updated_at) VALUES
(1, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 8, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 10, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 12, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 14, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 16, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 18, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 20, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 22, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 24, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 26, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 28, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 30, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 32, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 34, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 36, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (1, 38, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Manager: all CRUD permissions (19 resources)
(2, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 8, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 10, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 12, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 14, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 16, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 18, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 20, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 22, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 24, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 26, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 28, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 30, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 32, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 34, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 36, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (2, 38, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Agent: mixed permissions
-- CRUD: hr_cases
-- READ: all other resources (18 resources, including hr_case_tasks)
(3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 8, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 9, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 11, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 13, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 15, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 17, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 19, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 21, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 23, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 25, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 27, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 29, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 31, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 33, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 35, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (3, 37, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Employee: all READ permissions (19 resources)
(4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 7, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 9, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 11, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 13, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 15, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 17, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 19, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 21, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 23, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 25, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 27, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 29, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 31, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 33, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 35, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), (4, 37, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO user (user_id, first_name, last_name, email, phone, role, active, org_id, static_token, created_at, updated_at) VALUES
(1, 'Thomas', 'Green', 'thomas.green@servicenow.com', '+44206753369', 'agent', FALSE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwMSIsImlzcyI6Iml0c20ifQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c', '2025-08-27 15:31:48', '2025-12-04 00:51:58'),
(2, 'Christina', 'Oliver', 'christina.oliver@carsonllc.com', '+919079913295', 'employee', TRUE, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwMiIsImlzcyI6Iml0c20ifQ.8j9_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_xyz', '2025-08-27 15:43:46', '2026-06-02 22:51:28'),
(3, 'Tabitha', 'Bullock', 'tabitha.bullock@servicenow.com', '+917949689758', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwMyIsImlzcyI6Iml0c20ifQ.ZN5x_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQ', '2025-08-27 15:34:50', '2026-03-22 20:59:06'),
(4, 'Joanne', 'Simpson', 'joanne.simpson@servicenow.com', '+916014562413', 'manager', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwNCIsImlzcyI6Iml0c20ifQ.kL3_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_123', '2025-08-27 15:35:46', '2026-02-01 00:17:24'),
(5, 'Mckenzie', 'Mendez', 'mckenzie.mendez@servicenow.com', '+917708439042', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwNSIsImlzcyI6Iml0c20ifQ.Pq9_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_456', '2025-08-27 15:29:46', '2025-12-19 10:19:49'),
(6, 'Stephanie', 'Todd', 'stephanie.todd@servicenow.com', '+12068306386', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwNiIsImlzcyI6Iml0c20ifQ.Lm0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_789', '2025-08-27 15:37:13', '2025-09-12 18:15:17'),
(7, 'Denise', 'Hawkins', 'denise.hawkins83@larsonplc.com', '+12127407374', 'employee', TRUE, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwNyIsImlzcyI6Iml0c20ifQ.Op2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_abc', '2025-08-27 15:44:18', '2025-09-11 10:33:12'),
(8, 'James', 'Hill', 'james.hill89@wayneenterprises.com', '+1-555-000-008', 'employee', TRUE, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwOCIsImlzcyI6Iml0c20ifQ.Qr4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_def', '2025-08-27 15:31:23', '2026-01-17 18:36:25'),
(9, 'Steven', 'Hernandez', 'steven.hernandez88@servicenow.com', '+44207037696', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAwOSIsImlzcyI6Iml0c20ifQ.St6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_ghi', '2025-08-27 15:32:55', '2025-09-27 18:40:16'),
(10, 'Brandon', 'Davis', 'brandon.davis@vehementcap.com', '+12028044331', 'employee', TRUE, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxMCIsImlzcyI6Iml0c20ifQ.Uv8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_jkl', '2025-08-27 15:39:21', '2026-02-04 05:21:52'),
(11, 'Travis', 'Wood', 'travis.wood@servicenow.com', '+44208244443', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxMSIsImlzcyI6Iml0c20ifQ.Wx0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_mno', '2025-08-27 15:32:39', '2026-03-06 11:37:16'),
(12, 'Samantha', 'Stone', 'samantha.stone47@servicenow.com', '+12022109048', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxMiIsImlzcyI6Iml0c20ifQ.Yz2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_pqr', '2025-08-27 15:33:57', '2026-04-11 18:10:59'),
(13, 'Jonathan', 'Martinez', 'jonathan.martinez67@servicenow.com', '+441216575414', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxMyIsImlzcyI6Iml0c20ifQ.Ab4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_stu', '2025-08-27 15:46:12', '2025-10-09 00:27:42'),
(14, 'Kenneth', 'Scott', 'kenneth.scott@starkpetersenandpalmer.com', '+919309546138', 'employee', TRUE, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxNCIsImlzcyI6Iml0c20ifQ.Cd6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_vwx', '2025-08-27 15:29:55', '2026-02-09 06:09:42'),
(15, 'Diana', 'Johnson', 'diana.johnson@servicenow.com', '+917430366696', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxNSIsImlzcyI6Iml0c20ifQ.Ef8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_yz1', '2025-08-27 15:42:15', '2025-12-17 23:19:40'),
(16, 'Meghan', 'Hernandez', 'meghan.hernandez@spencerinc.com', '+12026268395', 'employee', TRUE, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxNiIsImlzcyI6Iml0c20ifQ.Gh0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_234', '2025-08-27 15:37:32', '2026-03-14 18:48:52'),
(17, 'Terry', 'Lopez', 'terry.lopez@vehementcap.com', '+441416143244', 'employee', TRUE, 8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxNyIsImlzcyI6Iml0c20ifQ.Ij2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_567', '2025-08-27 15:37:37', '2026-04-26 01:43:13'),
(18, 'David', 'Ramirez', 'david.ramirez@miller-willis.com', '+12129296418', 'employee', TRUE, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxOCIsImlzcyI6Iml0c20ifQ.Kl4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_890', '2025-08-27 15:38:46', '2026-04-07 19:37:53'),
(19, 'Angela', 'Brooks', 'angela.brooks@phillips-jones.com', '+12065074879', 'employee', TRUE, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAxOSIsImlzcyI6Iml0c20ifQ.Mn6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_abc', '2025-08-27 15:36:58', '2025-12-23 13:11:09'),
(20, 'Marc', 'Henry', 'marc.henry@stark-industries.com', '+441413668878', 'employee', TRUE, 11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyMCIsImlzcyI6Iml0c20ifQ.Op8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_def', '2025-08-27 15:42:52', '2025-09-02 09:50:25'),
(21, 'Andrew', 'Bell', 'andrew.bell58@averyltd.com', '+441212121981', 'employee', TRUE, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyMSIsImlzcyI6Iml0c20ifQ.Qr0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_ghi', '2025-08-27 15:34:35', '2025-11-30 08:14:07'),
(22, 'David', 'Jones', 'david.jones95@servicenow.com', '+12062814376', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyMiIsImlzcyI6Iml0c20ifQ.St2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_jkl', '2025-08-27 15:34:17', '2026-06-15 07:28:15'),
(23, 'Kathleen', 'Montgomery', 'kathleen.montgomery44@servicenow.com', '+918863790861', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyMyIsImlzcyI6Iml0c20ifQ.Uv4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_mno', '2025-08-27 15:34:37', '2026-06-07 07:00:45'),
(24, 'Eric', 'Rodriguez', 'eric.rodriguez54@servicenow.com', '+16465917196', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyNCIsImlzcyI6Iml0c20ifQ.Wx6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_pqr', '2025-08-27 15:40:29', '2026-01-02 09:20:53'),
(25, 'Barbara', 'Perry', 'barbara.perry5@servicenow.com', '+441414646339', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyNSIsImlzcyI6Iml0c20ifQ.Yz8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_stu', '2025-08-27 15:37:56', '2026-05-03 08:34:25'),
(26, 'Christine', 'Torres', 'christine.torres@servicenow.com', '+441217971333', 'agent', FALSE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyNiIsImlzcyI6Iml0c20ifQ.Ab0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_vwx', '2025-08-27 15:36:52', '2025-11-28 08:18:58'),
(27, 'Ashley', 'Krueger', 'ashley.krueger@estradallc.com', '+1-555-000-027', 'employee', TRUE, 13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyNyIsImlzcyI6Iml0c20ifQ.Cd2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_yz1', '2025-08-27 15:44:23', '2026-02-02 20:37:22'),
(28, 'Sharon', 'Fields', 'sharon.fields@smithllc.com', '+441613441732', 'employee', TRUE, 14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyOCIsImlzcyI6Iml0c20ifQ.Ef4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_234', '2025-08-27 15:31:09', '2025-12-11 17:18:44'),
(29, 'Anne', 'Medina', 'anne.medina@servicenow.com', '+919967691593', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAyOSIsImlzcyI6Iml0c20ifQ.Gh6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_567', '2025-08-27 15:45:46', '2025-09-03 08:06:10'),
(30, 'Randy', 'Summers', 'randy.summers57@johnsonriveraandcarr.com', '+441616508996', 'employee', TRUE, 15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzMCIsImlzcyI6Iml0c20ifQ.Ij8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_890', '2025-08-27 15:44:55', '2025-09-21 07:46:37'),
(31, 'Robin', 'Monroe', 'robin.monroe83@servicenow.com', '+441135284684', 'manager', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzMSIsImlzcyI6Iml0c20ifQ.Kl0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_abc', '2025-08-27 15:49:26', '2026-02-12 15:07:07'),
(32, 'Jose', 'Roberson', 'jose.roberson@servicenow.com', '+919411701599', 'admin', FALSE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzMiIsImlzcyI6Iml0c20ifQ.Mn2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_def', '2025-08-27 15:40:09', '2026-01-14 01:21:52'),
(33, 'Zachary', 'Mcintosh', 'zachary.mcintosh3@servicenow.com', '+16463645351', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzMyIsImlzcyI6Iml0c20ifQ.Op4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_ghi', '2025-08-27 15:31:57', '2026-05-08 07:36:29'),
(34, 'Amanda', 'Holmes', 'amanda.holmes@estradallc.com', '+1-555-000-034', 'employee', TRUE, 16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzNCIsImlzcyI6Iml0c20ifQ.Qr6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_jkl', '2025-08-27 15:40:55', '2025-10-23 04:32:35'),
(35, 'David', 'Ford', 'david.ford@smithllc.com', '+16467629276', 'employee', FALSE, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzNSIsImlzcyI6Iml0c20ifQ.St8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_mno', '2025-08-27 15:35:52', '2026-06-03 12:38:16'),
(36, 'Douglas', 'Morse', 'douglas.morse@perkinsandsons.com', '+919235834456', 'employee', TRUE, 18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzNiIsImlzcyI6Iml0c20ifQ.Uv0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_pqr', '2025-08-27 15:40:24', '2026-02-28 00:25:03'),
(37, 'Randy', 'Martinez', 'randy.martinez94@servicenow.com', '+916831462491', 'manager', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzNyIsImlzcyI6Iml0c20ifQ.Wx2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_stu', '2025-08-27 15:35:56', '2026-04-02 16:58:39'),
(38, 'Samuel', 'Kemp', 'samuel.kemp@servicenow.com', '+12063286323', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzOCIsImlzcyI6Iml0c20ifQ.Yz4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_vwx', '2025-08-27 15:33:56', '2026-03-31 07:44:40'),
(39, 'Karen', 'Watkins', 'karen.watkins@servicenow.com', '+441613971941', 'admin', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzOSIsImlzcyI6Iml0c20ifQ.Ab6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_yz1', '2025-08-27 15:45:46', '2026-02-10 13:31:36'),
(40, 'Susan', 'Adams', 'susan.adams75@servicenow.com', '+1-555-000-040', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0MCIsImlzcyI6Iml0c20ifQ.Cd8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_234', '2025-08-27 15:49:55', '2025-09-08 21:03:27'),
(41, 'Scott', 'Mitchell', 'scott.mitchell@servicenow.com', '+441615025154', 'admin', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0MSIsImlzcyI6Iml0c20ifQ.Ef0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_567', '2025-08-27 15:37:27', '2025-09-30 17:24:38'),
(42, 'Elizabeth', 'Gregory', 'elizabeth.gregory83@servicenow.com', '+1-555-000-042', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0MiIsImlzcyI6Iml0c20ifQ.Gh2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_890', '2025-08-27 15:39:06', '2026-05-28 11:58:09'),
(43, 'Lauren', 'Clark', 'lauren.clark95@servicenow.com', '+16176548558', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0MyIsImlzcyI6Iml0c20ifQ.Ij4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_abc', '2025-08-27 15:43:41', '2026-03-23 20:43:12'),
(44, 'Lisa', 'Foley', 'lisa.foley21@wayneenterprises.com', '+12026309703', 'employee', TRUE, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0NCIsImlzcyI6Iml0c20ifQ.Kl6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_def', '2025-08-27 15:40:33', '2025-09-19 13:35:29'),
(45, 'Zachary', 'Moore', 'zachary.moore@servicenow.com', '+16466689283', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0NSIsImlzcyI6Iml0c20ifQ.Mn8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_ghi', '2025-08-27 15:42:01', '2026-02-27 02:02:48'),
(46, 'April', 'Knight', 'april.knight92@servicenow.com', '+441212321275', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0NiIsImlzcyI6Iml0c20ifQ.Op0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_jkl', '2025-08-27 15:33:24', '2026-04-08 20:02:26'),
(47, 'Michael', 'Ward', 'michael.ward53@acme.com', '+917398556557', 'employee', TRUE, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0NyIsImlzcyI6Iml0c20ifQ.Qr2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_mno', '2025-08-27 15:45:02', '2026-04-23 05:12:09'),
(48, 'Zachary', 'Davis', 'zachary.davis@garcia-williams.com', '+1-555-000-048', 'employee', TRUE, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0OCIsImlzcyI6Iml0c20ifQ.St4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_pqr', '2025-08-27 15:43:42', '2025-11-19 21:37:00'),
(49, 'Cheryl', 'Osborne', 'cheryl.osborne@servicenow.com', '+44207722647', 'manager', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA0OSIsImlzcyI6Iml0c20ifQ.Uv6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_stu', '2025-08-27 15:42:22', '2026-03-06 22:25:17'),
(50, 'Sara', 'Clark', 'sara.clark93@servicenow.com', '+16175693041', 'admin', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1MCIsImlzcyI6Iml0c20ifQ.Wx8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_vwx', '2025-08-27 15:31:01', '2026-03-21 15:27:01'),
(51, 'Steven', 'Manning', 'steven.manning28@stark-industries.com', '+13052099172', 'employee', TRUE, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1MSIsImlzcyI6Iml0c20ifQ.Yz0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_yz1', '2025-08-27 15:49:09', '2025-10-30 17:25:21'),
(52, 'Casey', 'Green', 'casey.green@servicenow.com', '+1-555-000-052', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1MiIsImlzcyI6Iml0c20ifQ.Ab2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_234', '2025-08-27 15:45:33', '2026-01-30 04:29:56'),
(53, 'Jennifer', 'Taylor', 'jennifer.taylor@greenemartinandramirez.com', '+441411494964', 'employee', TRUE, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1MyIsImlzcyI6Iml0c20ifQ.Cd4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_567', '2025-08-27 15:38:03', '2026-05-09 05:05:53'),
(54, 'Teresa', 'Gibson', 'teresa.gibson51@servicenow.com', '+16465454345', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1NCIsImlzcyI6Iml0c20ifQ.Ef6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_890', '2025-08-27 15:32:38', '2026-01-21 05:17:50'),
(55, 'Bethany', 'Barnes', 'bethany.barnes43@russelljohnsonandclark.com', '+12125516299', 'employee', TRUE, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1NSIsImlzcyI6Iml0c20ifQ.Gh8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_abc', '2025-08-27 15:49:14', '2026-03-13 14:12:32'),
(56, 'Patrick', 'Ross', 'patrick.ross@coxfosterandgilmore.com', '+441214235056', 'employee', TRUE, 8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1NiIsImlzcyI6Iml0c20ifQ.Ij0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_def', '2025-08-27 15:43:56', '2026-06-22 05:12:24'),
(57, 'Richard', 'Lopez', 'richard.lopez@servicenow.com', '+918208429386', 'admin', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1NyIsImlzcyI6Iml0c20ifQ.Kl2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_ghi', '2025-08-27 15:44:56', '2026-05-05 18:52:51'),
(58, 'Ian', 'Johnson', 'ian.johnson@hooli.com', '+918348622916', 'employee', TRUE, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1OCIsImlzcyI6Iml0c20ifQ.Mn4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_jkl', '2025-08-27 15:48:08', '2025-09-26 03:08:50'),
(59, 'Gregory', 'Richards', 'gregory.richards36@servicenow.com', '+12068332563', 'manager', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA1OSIsImlzcyI6Iml0c20ifQ.Op6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_mno', '2025-08-27 15:46:59', '2026-05-25 11:15:37'),
(60, 'Kristen', 'Mitchell', 'kristen.mitchell@smithllc.com', '+12063291601', 'employee', FALSE, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2MCIsImlzcyI6Iml0c20ifQ.Qr8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_pqr', '2025-08-27 15:38:58', '2026-06-20 23:45:14'),
(61, 'Emily', 'Faulkner', 'emily.faulkner78@garcia-williams.com', '+916633857576', 'employee', TRUE, 11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2MSIsImlzcyI6Iml0c20ifQ.St0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_stu', '2025-08-27 15:49:47', '2025-12-21 22:11:32'),
(62, 'Ryan', 'Allen', 'ryan.allen@servicenow.com', '+441134897277', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2MiIsImlzcyI6Iml0c20ifQ.Uv2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_vwx', '2025-08-27 15:41:06', '2026-06-08 07:42:24'),
(63, 'Thomas', 'Bailey', 'thomas.bailey63@initech.io', '+918303097613', 'employee', TRUE, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2MyIsImlzcyI6Iml0c20ifQ.Wx4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_yz1', '2025-08-27 15:34:00', '2026-05-01 05:57:36'),
(64, 'Theresa', 'Fisher', 'theresa.fisher50@ramos-case.com', '+13057818004', 'employee', FALSE, 13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2NCIsImlzcyI6Iml0c20ifQ.Yz6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_234', '2025-08-27 15:36:38', '2026-04-13 17:10:08'),
(65, 'David', 'Wilson', 'david.wilson@servicenow.com', '+13053384775', 'agent', FALSE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2NSIsImlzcyI6Iml0c20ifQ.Ab8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_567', '2025-08-27 15:40:22', '2025-11-25 18:38:00'),
(66, 'Daniel', 'Clark', 'daniel.clark81@servicenow.com', '+441415258214', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2NiIsImlzcyI6Iml0c20ifQ.Cd0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_890', '2025-08-27 15:44:37', '2026-05-12 15:02:57'),
(67, 'Timothy', 'Boyd', 'timothy.boyd@servicenow.com', '+917535317869', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2NyIsImlzcyI6Iml0c20ifQ.Ef2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_abc', '2025-08-27 15:41:29', '2026-02-26 09:02:24'),
(68, 'Leah', 'Lewis', 'leah.lewis81@servicenow.com', '+12026373575', 'manager', FALSE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2OCIsImlzcyI6Iml0c20ifQ.Gh4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_def', '2025-08-27 15:44:23', '2025-11-17 06:03:33'),
(69, 'Robyn', 'Jacobs', 'robyn.jacobs@jonesgoodmanandreynolds.com', '+1-555-000-069', 'employee', TRUE, 14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA2OSIsImlzcyI6Iml0c20ifQ.Ij6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_ghi', '2025-08-27 15:40:17', '2025-10-27 15:26:50'),
(70, 'Nathan', 'Scott', 'nathan.scott@hernandezbarnettandstewart.com', '+919627607189', 'employee', TRUE, 15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3MCIsImlzcyI6Iml0c20ifQ.Kl8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_jkl', '2025-08-27 15:34:39', '2025-11-15 14:06:05'),
(71, 'Zachary', 'Garcia', 'zachary.garcia@waltonconnerandjones.com', '+919744772938', 'employee', FALSE, 16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3MSIsImlzcyI6Iml0c20ifQ.Mn0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_mno', '2025-08-27 15:48:01', '2026-01-04 10:22:35'),
(72, 'David', 'Johnston', 'david.johnston82@servicenow.com', '+13054211531', 'manager', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3MiIsImlzcyI6Iml0c20ifQ.Op2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_pqr', '2025-08-27 15:35:15', '2026-02-19 09:55:27'),
(73, 'Austin', 'Tran', 'austin.tran94@larsonplc.com', '+917122266686', 'employee', FALSE, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3MyIsImlzcyI6Iml0c20ifQ.Qr4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_stu', '2025-08-27 15:31:42', '2025-12-20 06:24:01'),
(74, 'Kayla', 'Lutz', 'kayla.lutz@simonllc.com', '+12065585250', 'employee', TRUE, 18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3NCIsImlzcyI6Iml0c20ifQ.St6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_vwx', '2025-08-27 15:38:20', '2025-11-16 13:28:17'),
(75, 'David', 'Sanchez', 'david.sanchez@servicenow.com', '+918574215661', 'manager', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3NSIsImlzcyI6Iml0c20ifQ.Uv8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_yz1', '2025-08-27 15:41:29', '2026-01-22 20:30:48'),
(76, 'Karen', 'Graham', 'karen.graham@servicenow.com', '+1-555-000-076', 'admin', FALSE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3NiIsImlzcyI6Iml0c20ifQ.Wx0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_234', '2025-08-27 15:32:08', '2025-12-23 19:04:54'),
(77, 'Hannah', 'Gallagher', 'hannah.gallagher@acme.com', '+918823145526', 'employee', TRUE, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3NyIsImlzcyI6Iml0c20ifQ.Yz2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_567', '2025-08-27 15:37:27', '2025-08-31 19:27:45'),
(78, 'Michelle', 'Smith', 'michelle.smith79@umbrella.co', '+441138304612', 'employee', TRUE, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3OCIsImlzcyI6Iml0c20ifQ.Ab4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_890', '2025-08-27 15:31:08', '2026-05-16 21:06:01'),
(79, 'Theresa', 'Miller', 'theresa.miller50@phillips-jones.com', '+441136563456', 'employee', TRUE, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA3OSIsImlzcyI6Iml0c20ifQ.Cd6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_abc', '2025-08-27 15:34:10', '2025-11-19 10:42:14'),
(80, 'Tommy', 'Jacobs', 'tommy.jacobs@servicenow.com', '+16172301276', 'admin', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzAzMCIsImlzcyI6Iml0c20ifQ.Ef8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_def', '2025-08-27 15:45:50', '2026-04-25 21:36:32'),
(81, 'Jon', 'Clark', 'jon.clark@servicenow.com', '+441611946066', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4MSIsImlzcyI6Iml0c20ifQ.Gh0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_ghi', '2025-08-27 15:35:14', '2026-02-12 09:53:57'),
(82, 'Carl', 'Brown', 'carl.brown91@cainryanandduncan.com', '+441218703488', 'employee', TRUE, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4MiIsImlzcyI6Iml0c20ifQ.Ij2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_jkl', '2025-08-27 15:48:38', '2025-10-28 09:43:37'),
(83, 'Tonya', 'Garcia', 'tonya.garcia50@servicenow.com', '+16174696752', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4MyIsImlzcyI6Iml0c20ifQ.Kl4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_mno', '2025-08-27 15:47:31', '2026-04-03 09:06:30'),
(84, 'Jason', 'Morrison', 'jason.morrison13@servicenow.com', '+1-555-000-084', 'admin', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4NCIsImlzcyI6Iml0c20ifQ.Mn6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_pqr', '2025-08-27 15:35:12', '2026-06-08 10:13:47'),
(85, 'Alex', 'Johnson', 'alex.johnson@acme.com', '+44206925748', 'employee', TRUE, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4NSIsImlzcyI6Iml0c20ifQ.Op8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_stu', '2025-08-27 15:37:30', '2025-12-18 20:08:43'),
(86, 'Steven', 'Nguyen', 'steven.nguyen@phillips-jones.com', '+916604995994', 'employee', TRUE, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4N0IsImlzcyI6Iml0c20ifQ.Qr0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_vwx', '2025-08-27 15:38:09', '2026-06-07 12:30:29'),
(87, 'Steven', 'Maxwell', 'steven.maxwell6@servicenow.com', '+916077852143', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4NyIsImlzcyI6Iml0c20ifQ.St2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_yz1', '2025-08-27 15:32:18', '2026-03-28 14:47:39'),
(88, 'Nancy', 'Mcneil', 'nancy.mcneil@initech.io', '+16177294242', 'employee', TRUE, 8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4OCIsImlzcyI6Iml0c20ifQ.Uv4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_234', '2025-08-27 15:48:37', '2025-09-24 15:24:13'),
(89, 'Rebecca', 'Foster', 'rebecca.foster@servicenow.com', '+441611538772', 'admin', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA4OSIsImlzcyI6Iml0c20ifQ.Wx6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_567', '2025-08-27 15:46:16', '2025-11-11 07:00:13'),
(90, 'Heather', 'Ball', 'heather.ball18@greenemartinandramirez.com', '+12066898344', 'employee', TRUE, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5MCIsImlzcyI6Iml0c20ifQ.Yz8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_890', '2025-08-27 15:37:50', '2025-08-30 00:54:38'),
(91, 'Aaron', 'Le', 'aaron.le@servicenow.com', '+441613259188', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5MSIsImlzcyI6Iml0c20ifQ.Ab0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_abc', '2025-08-27 15:40:41', '2025-09-14 02:37:46'),
(92, 'Albert', 'Rodriguez', 'albert.rodriguez95@servicenow.com', '+441215266042', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5MiIsImlzcyI6Iml0c20ifQ.Cd2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_def', '2025-08-27 15:48:53', '2025-10-15 19:43:49'),
(93, 'Zachary', 'Martinez', 'zachary.martinez@servicenow.com', '+12024076139', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5MyIsImlzcyI6Iml0c20ifQ.Ef4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_ghi', '2025-08-27 15:29:40', '2026-03-03 13:37:37'),
(94, 'Wyatt', 'Moreno', 'wyatt.moreno14@stark-industries.com', '+441215864722', 'employee', TRUE, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5NCIsImlzcyI6Iml0c20ifQ.Gh6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_jkl', '2025-08-27 15:44:01', '2026-05-06 06:00:14'),
(95, 'James', 'Wilson', 'james.wilson@servicenow.com', '+441212130731', 'agent', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5NSIsImlzcyI6Iml0c20ifQ.Ij8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_mno', '2025-08-27 15:38:25', '2025-12-27 00:51:46'),
(96, 'Kurt', 'Fritz', 'kurt.fritz@servicenow.com', '+441615027834', 'manager', TRUE, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5NiIsImlzcyI6Iml0c20ifQ.Kl0_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_pqr', '2025-08-27 15:40:48', '2026-04-14 04:16:29'),
(97, 'Erin', 'Davis', 'erin.davis34@chapman-wagner.com', '+441217794732', 'employee', TRUE, 11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5NyIsImlzcyI6Iml0c20ifQ.Mn2_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_stu', '2025-08-27 15:42:31', '2026-06-04 14:46:31'),
(98, 'Christopher', 'Meza', 'christopher.meza@simonllc.com', '+44206467594', 'employee', TRUE, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5OCIsImlzcyI6Iml0c20ifQ.Op4_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_vwx', '2025-08-27 15:44:53', '2025-12-06 01:00:55'),
(99, 'John', 'Ramirez', 'john.ramirez@vehementcap.com', '+13059223174', 'employee', TRUE, 13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzA5OSIsImlzcyI6Iml0c20ifQ.Qr6_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_yz1', '2025-08-27 15:35:52', '2025-11-05 14:58:05'),
(100, 'Lauren', 'Diaz', 'lauren.diaz70@acme.com', '+1-555-000-100', 'employee', TRUE, 14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU0VSXzEwMCIsImlzcyI6Iml0c20ifQ.St8_dflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_234', '2025-08-27 15:30:36', '2026-06-16 11:26:36');


INSERT INTO user_role (user_id, role_id, org_id, created_at, updated_at) VALUES
(1, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 4, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 4, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 4, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 4, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 4, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 4, 7, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 4, 8, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 4, 9, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 4, 10, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(20, 4, 11, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(21, 4, 12, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(22, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(23, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(24, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(25, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(26, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(27, 4, 13, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(28, 4, 14, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(29, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(30, 4, 15, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(31, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(32, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(33, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(34, 4, 16, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(35, 4, 17, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(36, 4, 18, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(37, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(38, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(39, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(40, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(41, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(42, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(43, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(44, 4, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(45, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(46, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(47, 4, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(48, 4, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(49, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(50, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(51, 4, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(52, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(53, 4, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(54, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(55, 4, 7, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(56, 4, 8, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(57, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(58, 4, 9, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(59, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(60, 4, 10, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(61, 4, 11, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(62, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(63, 4, 12, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(64, 4, 13, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(65, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(66, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(67, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(68, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(69, 4, 14, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(70, 4, 15, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(71, 4, 16, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(72, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(73, 4, 17, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(74, 4, 18, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(75, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(76, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(77, 4, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(78, 4, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(79, 4, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(80, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(81, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(82, 4, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(83, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(84, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(85, 4, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(86, 4, 7, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(87, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(88, 4, 8, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(89, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(90, 4, 9, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(91, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(92, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(93, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(94, 4, 10, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(95, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(96, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(97, 4, 11, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(98, 4, 12, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(99, 4, 13, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(100, 4, 14, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO user_group (group_id, name, type, active, org_id, created_at, updated_at) VALUES
-- 1. IT Support (Restricted)
(1, 'IT Support L1', 'IT Support', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 'IT Support L2', 'IT Support', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 2. Service Desk (Restricted)
(3, 'Global Service Desk', 'Service Desk', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 'HR Service Desk', 'Service Desk', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 3. Field Support Technicians (Restricted)
(5, 'Field Ops - North', 'Field Support Technicians', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 'Onsite Support HQ', 'Field Support Technicians', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 4. Infrastructure Problem Team (Restricted)
(7, 'Network Infrastructure', 'Infrastructure Problem Team', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 'Server Operations', 'Infrastructure Problem Team', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 5. IT Support (Additional groups)
(9, 'Change Advisory Board', 'IT Support', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 'HR Leadership Approval', 'IT Support', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 6. Service Desk (Additional groups)
(11, 'HR Case Readers', 'Service Desk', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 'Secure Case Access', 'Service Desk', TRUE, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 7. Field Support Technicians (Additional groups)
(13, 'Globex Full-Time Staff', 'Field Support Technicians', TRUE, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 'Soylent Full-Time Staff', 'Field Support Technicians', TRUE, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 8. Infrastructure Problem Team (Additional groups)
(15, 'Initech Part-Time', 'Infrastructure Problem Team', TRUE, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 'Umbrella Part-Time', 'Infrastructure Problem Team', TRUE, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 9. IT Support (Additional groups)
(17, 'Cyberdyne Contractors', 'IT Support', TRUE, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 'Stark Contractors', 'IT Support', TRUE, 7, '2023-01-01 00:00:00', '2023-01-01 00:00:00');


INSERT INTO user_group_member (group_id, user_id, org_id, created_at, updated_at) VALUES
-- ==========================================================
-- RESTRICTED GROUPS (Only Agents/Managers allowed)
-- ==========================================================

-- Group 1: IT Support L1 (Agents) - Org 1
(1, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Thomas Green
(1, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Tabitha Bullock
(1, 5, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Mckenzie Mendez

-- Group 2: IT Support L2 (Agents) - Org 1
(2, 6, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Stephanie Todd
(2, 9, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Steven Hernandez

-- Group 3: Global Service Desk (Agents) - Org 1
(3, 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Travis Wood
(3, 12, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Samantha Stone
(3, 13, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Jonathan Martinez

-- Group 4: HR Service Desk (Agents) - Org 1
(4, 15, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Diana Johnson
(4, 22, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- David Jones

-- Group 5: Field Ops - North (Agents) - Org 1
(5, 23, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Kathleen Montgomery
(5, 24, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Eric Rodriguez

-- Group 6: Onsite Support HQ (Agents) - Org 1
(6, 25, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Barbara Perry
(6, 26, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Christine Torres

-- Group 7: Network Infrastructure (Agents) - Org 1
(7, 29, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Anne Medina
(7, 33, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Zachary Mcintosh
(7, 6, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Group 8: Server Operations (Agents) - Org 1
(8, 38, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Samuel Kemp
(8, 40, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Susan Adams

-- Group 9: Change Advisory Board (Managers/Admins) - Org 1
(9, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Jose Roberson (Admin)
(9, 31, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Robin Monroe (Manager)

-- Group 10: HR Leadership Approval (Managers) - Org 1
(10, 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Joanne Simpson (Manager)
(10, 37, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Randy Martinez (Manager)
(10, 49, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Cheryl Osborne (Manager)

-- ==========================================================
-- UNRESTRICTED GROUPS (Employees Allowed)
-- ==========================================================

-- Group 11: HR Case Readers (Org 1 Agents)
(11, 42, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Elizabeth Gregory

-- Group 12: Secure Case Access (Org 2 Employees)
(12, 2, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Christina Oliver (Org 2)

-- Group 13: Globex Full-Time Staff (Org 2 Employees)
(13, 2, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Christina Oliver
(13, 44, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Lisa Foley
(13, 77, 2, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Hannah Gallagher

-- Group 14: Soylent Full-Time Staff (Org 3 Employees)
(14, 7, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--Denise Hawkins
(14, 47, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Michael Ward
(14, 78, 3, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Michelle Smith

-- Group 15: Initech Part-Time (Org 4 Employees)
(15, 8, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
--James Hill
(15, 48, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Zachary Davis
(15, 79, 4, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Theresa Miller

-- Group 16: Umbrella Part-Time (Org 5 Employees)
(16, 10, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Brandon Davis
(16, 51, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Steven Manning
(16, 82, 5, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Carl Brown

-- Group 17: Cyberdyne Contractors (Org 6 Employees)
(17, 14, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Kenneth Scott
(17, 53, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Jennifer Taylor
(17, 85, 6, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Alex Johnson

-- Group 18: Stark Contractors (Org 7 Employees)
(18, 16, 7, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Meghan Hernandez
(18, 55, 7, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
-- Bethany Barnes
(18, 86, 7, '2023-01-01 00:00:00', '2023-01-01 00:00:00'); 
-- Steven Nguyen


INSERT INTO hr_profile (hr_profile_id, number, gender, user_id, personal_email, marital_status, type, dob, nationality, employment_start_date, employment_end_date, manager, location_type, national_tax_id, position, created_at, updated_at, org_id) VALUES
(1, 'HRP00001', 'Male', 1, 'thomas.green.1@personal.example.com', 'Married', 'full-time', '1981-02-11 00:00:00', 'GB', '2021-01-15 09:00:00', NULL, 31, 'Office Based', 'TAX-1-0001', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(2, 'HRP00002', 'Female', 2, 'christina.oliver.2@personal.example.com', 'Divorced', 'contractor', '1982-03-12 00:00:00', 'CA', '2022-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-2-0002', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 2),
(3, 'HRP00003', 'Female', 3, 'tabitha.bullock.3@personal.example.com', 'Single', 'full-time', '1983-04-13 00:00:00', 'IN', '2023-01-15 09:00:00', NULL, 49, 'Hotdesk', 'TAX-1-0003', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(4, 'HRP00004', 'Female', 4, 'joanne.simpson.4@personal.example.com', 'Married', 'full-time', '1984-05-14 00:00:00', 'DE', '2020-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-1-0004', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(5, 'HRP00005', 'Other', 5, 'mckenzie.mendez.5@personal.example.com', 'Divorced', 'full-time', '1985-06-15 00:00:00', 'FR', '2021-01-15 09:00:00', NULL, 68, 'Remote', 'TAX-1-0005', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(6, 'HRP00006', 'Female', 6, 'stephanie.todd.6@personal.example.com', 'Single', 'full-time', '1986-07-16 00:00:00', 'JP', '2022-01-15 09:00:00', NULL, 72, 'Hotdesk', 'TAX-1-0006', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(7, 'HRP00007', 'Other', 7, 'denise.hawkins.7@personal.example.com', 'Married', 'part-time', '1987-08-17 00:00:00', 'CN', '2023-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-3-0007', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 3),
(8, 'HRP00008', 'Male', 8, 'james.hill.8@personal.example.com', 'Divorced', 'contractor', '1988-09-18 00:00:00', 'AU', '2020-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-4-0008', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 4),
(9, 'HRP00009', 'Male', 9, 'steven.hernandez.9@personal.example.com', 'Single', 'full-time', '1989-01-19 00:00:00', 'BR', '2021-01-15 09:00:00', NULL, 4, 'Hotdesk', 'TAX-1-0009', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(10, 'HRP00010', 'Other', 10, 'brandon.davis.10@personal.example.com', 'Married', 'part-time', '1990-02-20 00:00:00', 'US', '2022-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-5-0010', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 5),
(11, 'HRP00011', 'Male', 11, 'travis.wood.11@personal.example.com', 'Divorced', 'full-time', '1991-03-21 00:00:00', 'GB', '2023-01-15 09:00:00', NULL, 37, 'Remote', 'TAX-1-0011', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(12, 'HRP00012', 'Female', 12, 'samantha.stone.12@personal.example.com', 'Single', 'full-time', '1992-04-22 00:00:00', 'CA', '2020-01-15 09:00:00', NULL, 49, 'Hotdesk', 'TAX-1-0012', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(13, 'HRP00013', 'Male', 13, 'jonathan.martinez.13@personal.example.com', 'Married', 'full-time', '1993-05-23 00:00:00', 'IN', '2021-01-15 09:00:00', NULL, 59, 'Office Based', 'TAX-1-0013', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(14, 'HRP00014', 'Male', 14, 'kenneth.scott.14@personal.example.com', 'Divorced', 'contractor', '1994-06-24 00:00:00', 'DE', '2022-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-6-0014', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 6),
(15, 'HRP00015', 'Female', 15, 'diana.johnson.15@personal.example.com', 'Single', 'full-time', '1995-07-25 00:00:00', 'FR', '2023-01-15 09:00:00', NULL, 72, 'Hotdesk', 'TAX-1-0015', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(16, 'HRP00016', 'Female', 16, 'meghan.hernandez.16@personal.example.com', 'Married', 'part-time', '1996-08-26 00:00:00', 'JP', '2020-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-7-0016', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 7),
(17, 'HRP00017', 'Other', 17, 'terry.lopez.17@personal.example.com', 'Divorced', 'contractor', '1997-09-27 00:00:00', 'CN', '2021-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-8-0017', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 8),
(18, 'HRP00018', 'Male', 18, 'david.ramirez.18@personal.example.com', 'Single', 'full-time', '1998-01-10 00:00:00', 'AU', '2022-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-9-0018', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 9),
(19, 'HRP00019', 'Other', 19, 'angela.brooks.19@personal.example.com', 'Married', 'part-time', '1999-02-11 00:00:00', 'BR', '2023-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-10-0019', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 10),
(20, 'HRP00020', 'Male', 20, 'marc.henry.20@personal.example.com', 'Divorced', 'contractor', '1980-03-12 00:00:00', 'US', '2020-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-11-0020', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 11),
(21, 'HRP00021', 'Male', 21, 'andrew.bell.21@personal.example.com', 'Single', 'full-time', '1981-04-13 00:00:00', 'GB', '2021-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-12-0021', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 12),
(22, 'HRP00022', 'Male', 22, 'david.jones.22@personal.example.com', 'Married', 'full-time', '1982-05-14 00:00:00', 'CA', '2022-01-15 09:00:00', NULL, 59, 'Office Based', 'TAX-1-0022', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(23, 'HRP00023', 'Female', 23, 'kathleen.montgomery.23@personal.example.com', 'Divorced', 'full-time', '1983-06-15 00:00:00', 'IN', '2023-01-15 09:00:00', NULL, 68, 'Remote', 'TAX-1-0023', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(24, 'HRP00024', 'Other', 24, 'eric.rodriguez.24@personal.example.com', 'Single', 'full-time', '1984-07-16 00:00:00', 'DE', '2020-01-15 09:00:00', NULL, 72, 'Hotdesk', 'TAX-1-0024', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(25, 'HRP00025', 'Female', 25, 'barbara.perry.25@personal.example.com', 'Married', 'full-time', '1985-08-17 00:00:00', 'FR', '2021-01-15 09:00:00', NULL, 75, 'Office Based', 'TAX-1-0025', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(26, 'HRP00026', 'Female', 26, 'christine.torres.26@personal.example.com', 'Divorced', 'full-time', '1986-09-18 00:00:00', 'JP', '2022-01-15 09:00:00', NULL, 96, 'Remote', 'TAX-1-0026', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(27, 'HRP00027', 'Other', 27, 'ashley.krueger.27@personal.example.com', 'Single', 'full-time', '1987-01-19 00:00:00', 'CN', '2023-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-13-0027', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 13),
(28, 'HRP00028', 'Female', 28, 'sharon.fields.28@personal.example.com', 'Married', 'part-time', '1988-02-20 00:00:00', 'AU', '2020-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-14-0028', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 14),
(29, 'HRP00029', 'Female', 29, 'anne.medina.29@personal.example.com', 'Divorced', 'full-time', '1989-03-21 00:00:00', 'BR', '2021-01-15 09:00:00', NULL, 37, 'Remote', 'TAX-1-0029', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(30, 'HRP00030', 'Male', 30, 'randy.summers.30@personal.example.com', 'Single', 'full-time', '1990-04-22 00:00:00', 'US', '2022-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-15-0030', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 15),
(31, 'HRP00031', 'Other', 31, 'robin.monroe.31@personal.example.com', 'Married', 'full-time', '1991-05-23 00:00:00', 'GB', '2023-01-15 09:00:00', NULL, 4, 'Office Based', 'TAX-1-0031', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(32, 'HRP00032', 'Male', 32, 'jose.roberson.32@personal.example.com', 'Divorced', 'full-time', '1992-06-24 00:00:00', 'CA', '2020-01-15 09:00:00', NULL, 68, 'Remote', 'TAX-1-0032', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(33, 'HRP00033', 'Male', 33, 'zachary.mcintosh.33@personal.example.com', 'Single', 'full-time', '1993-07-25 00:00:00', 'IN', '2021-01-15 09:00:00', NULL, 72, 'Hotdesk', 'TAX-1-0033', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(34, 'HRP00034', 'Female', 34, 'amanda.holmes.34@personal.example.com', 'Married', 'part-time', '1994-08-26 00:00:00', 'DE', '2022-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-16-0034', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 16),
(35, 'HRP00035', 'Male', 35, 'david.ford.35@personal.example.com', 'Divorced', 'contractor', '1995-09-27 00:00:00', 'FR', '2023-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-17-0035', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 17),
(36, 'HRP00036', 'Male', 36, 'douglas.morse.36@personal.example.com', 'Single', 'full-time', '1996-01-10 00:00:00', 'JP', '2020-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-18-0036', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 18),
(37, 'HRP00037', 'Male', 37, 'randy.martinez.37@personal.example.com', 'Married', 'full-time', '1997-02-11 00:00:00', 'CN', '2021-01-15 09:00:00', NULL, 4, 'Office Based', 'TAX-1-0037', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(38, 'HRP00038', 'Other', 38, 'samuel.kemp.38@personal.example.com', 'Divorced', 'full-time', '1998-03-12 00:00:00', 'AU', '2022-01-15 09:00:00', NULL, 37, 'Remote', 'TAX-1-0038', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(39, 'HRP00039', 'Female', 39, 'karen.watkins.39@personal.example.com', 'Single', 'full-time', '1999-04-13 00:00:00', 'BR', '2023-01-15 09:00:00', NULL, 49, 'Hotdesk', 'TAX-1-0039', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(40, 'HRP00040', 'Female', 40, 'susan.adams.40@personal.example.com', 'Married', 'full-time', '1980-05-14 00:00:00', 'US', '2020-01-15 09:00:00', NULL, 59, 'Office Based', 'TAX-1-0040', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(41, 'HRP00041', 'Male', 41, 'scott.mitchell.41@personal.example.com', 'Divorced', 'full-time', '1981-06-15 00:00:00', 'GB', '2021-01-15 09:00:00', NULL, 68, 'Remote', 'TAX-1-0041', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(42, 'HRP00042', 'Female', 42, 'elizabeth.gregory.42@personal.example.com', 'Single', 'full-time', '1982-07-16 00:00:00', 'CA', '2022-01-15 09:00:00', NULL, 72, 'Hotdesk', 'TAX-1-0042', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(43, 'HRP00043', 'Other', 43, 'lauren.clark.43@personal.example.com', 'Married', 'full-time', '1983-08-17 00:00:00', 'IN', '2023-01-15 09:00:00', NULL, 75, 'Office Based', 'TAX-1-0043', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(44, 'HRP00044', 'Female', 44, 'lisa.foley.44@personal.example.com', 'Divorced', 'contractor', '1984-09-18 00:00:00', 'DE', '2020-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-2-0044', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 2),
(45, 'HRP00045', 'Male', 45, 'zachary.moore.45@personal.example.com', 'Single', 'full-time', '1985-01-19 00:00:00', 'FR', '2021-01-15 09:00:00', NULL, 4, 'Hotdesk', 'TAX-1-0045', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(46, 'HRP00046', 'Other', 46, 'april.knight.46@personal.example.com', 'Married', 'full-time', '1986-02-20 00:00:00', 'JP', '2022-01-15 09:00:00', NULL, 31, 'Office Based', 'TAX-1-0046', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(47, 'HRP00047', 'Male', 47, 'michael.ward.47@personal.example.com', 'Divorced', 'contractor', '1987-03-21 00:00:00', 'CN', '2023-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-3-0047', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 3),
(48, 'HRP00048', 'Male', 48, 'zachary.davis.48@personal.example.com', 'Single', 'full-time', '1988-04-22 00:00:00', 'AU', '2020-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-4-0048', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 4),
(49, 'HRP00049', 'Female', 49, 'cheryl.osborne.49@personal.example.com', 'Married', 'full-time', '1989-05-23 00:00:00', 'BR', '2021-01-15 09:00:00', NULL, 4, 'Office Based', 'TAX-1-0049', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(50, 'HRP00050', 'Female', 50, 'sara.clark.50@personal.example.com', 'Divorced', 'full-time', '1990-06-24 00:00:00', 'US', '2022-01-15 09:00:00', NULL, 68, 'Remote', 'TAX-1-0050', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(51, 'HRP00051', 'Male', 51, 'steven.manning.51@personal.example.com', 'Single', 'full-time', '1991-07-25 00:00:00', 'GB', '2023-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-5-0051', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 5),
(52, 'HRP00052', 'Other', 52, 'casey.green.52@personal.example.com', 'Married', 'full-time', '1992-08-26 00:00:00', 'CA', '2020-01-15 09:00:00', NULL, 75, 'Office Based', 'TAX-1-0052', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(53, 'HRP00053', 'Female', 53, 'jennifer.taylor.53@personal.example.com', 'Divorced', 'contractor', '1993-09-27 00:00:00', 'IN', '2021-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-6-0053', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 6),
(54, 'HRP00054', 'Female', 54, 'teresa.gibson.54@personal.example.com', 'Single', 'full-time', '1994-01-10 00:00:00', 'DE', '2022-01-15 09:00:00', NULL, 4, 'Hotdesk', 'TAX-1-0054', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(55, 'HRP00055', 'Female', 55, 'bethany.barnes.55@personal.example.com', 'Married', 'part-time', '1995-02-11 00:00:00', 'FR', '2023-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-7-0055', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 7),
(56, 'HRP00056', 'Male', 56, 'patrick.ross.56@personal.example.com', 'Divorced', 'contractor', '1996-03-12 00:00:00', 'JP', '2020-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-8-0056', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 8),
(57, 'HRP00057', 'Male', 57, 'richard.lopez.57@personal.example.com', 'Single', 'full-time', '1997-04-13 00:00:00', 'CN', '2021-01-15 09:00:00', NULL, 49, 'Hotdesk', 'TAX-1-0057', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(58, 'HRP00058', 'Other', 58, 'ian.johnson.58@personal.example.com', 'Married', 'part-time', '1998-05-14 00:00:00', 'AU', '2022-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-9-0058', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 9),
(59, 'HRP00059', 'Male', 59, 'gregory.richards.59@personal.example.com', 'Divorced', 'full-time', '1999-06-15 00:00:00', 'BR', '2023-01-15 09:00:00', NULL, 4, 'Remote', 'TAX-1-0059', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(60, 'HRP00060', 'Female', 60, 'kristen.mitchell.60@personal.example.com', 'Single', 'full-time', '1980-07-16 00:00:00', 'US', '2020-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-10-0060', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 10),
(61, 'HRP00061', 'Female', 61, 'emily.faulkner.61@personal.example.com', 'Married', 'part-time', '1981-08-17 00:00:00', 'GB', '2021-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-11-0061', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 11),
(62, 'HRP00062', 'Other', 62, 'ryan.allen.62@personal.example.com', 'Divorced', 'full-time', '1982-09-18 00:00:00', 'CA', '2022-01-15 09:00:00', NULL, 96, 'Remote', 'TAX-1-0062', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(63, 'HRP00063', 'Male', 63, 'thomas.bailey.63@personal.example.com', 'Single', 'full-time', '1983-01-19 00:00:00', 'IN', '2023-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-12-0063', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 12),
(64, 'HRP00064', 'Female', 64, 'theresa.fisher.64@personal.example.com', 'Married', 'part-time', '1984-02-20 00:00:00', 'DE', '2020-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-13-0064', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 13),
(65, 'HRP00065', 'Male', 65, 'david.wilson.65@personal.example.com', 'Divorced', 'full-time', '1985-03-21 00:00:00', 'FR', '2021-01-15 09:00:00', NULL, 37, 'Remote', 'TAX-1-0065', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(66, 'HRP00066', 'Other', 66, 'daniel.clark.66@personal.example.com', 'Single', 'full-time', '1986-04-22 00:00:00', 'JP', '2022-01-15 09:00:00', NULL, 49, 'Hotdesk', 'TAX-1-0066', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(67, 'HRP00067', 'Male', 67, 'timothy.boyd.67@personal.example.com', 'Married', 'full-time', '1987-05-23 00:00:00', 'CN', '2023-01-15 09:00:00', NULL, 59, 'Office Based', 'TAX-1-0067', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(68, 'HRP00068', 'Female', 68, 'leah.lewis.68@personal.example.com', 'Divorced', 'full-time', '1988-06-24 00:00:00', 'AU', '2020-01-15 09:00:00', NULL, 4, 'Remote', 'TAX-1-0068', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(69, 'HRP00069', 'Female', 69, 'robyn.jacobs.69@personal.example.com', 'Single', 'full-time', '1989-07-25 00:00:00', 'BR', '2021-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-14-0069', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 14),
(70, 'HRP00070', 'Male', 70, 'nathan.scott.70@personal.example.com', 'Married', 'part-time', '1990-08-26 00:00:00', 'US', '2022-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-15-0070', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 15),
(71, 'HRP00071', 'Male', 71, 'zachary.garcia.71@personal.example.com', 'Divorced', 'contractor', '1991-09-27 00:00:00', 'GB', '2023-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-16-0071', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 16),
(72, 'HRP00072', 'Male', 72, 'david.johnston.72@personal.example.com', 'Single', 'full-time', '1992-01-10 00:00:00', 'CA', '2020-01-15 09:00:00', NULL, 4, 'Hotdesk', 'TAX-1-0072', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(73, 'HRP00073', 'Male', 73, 'austin.tran.73@personal.example.com', 'Married', 'part-time', '1993-02-11 00:00:00', 'IN', '2021-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-17-0073', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 17),
(74, 'HRP00074', 'Other', 74, 'kayla.lutz.74@personal.example.com', 'Divorced', 'contractor', '1994-03-12 00:00:00', 'DE', '2022-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-18-0074', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 18),
(75, 'HRP00075', 'Male', 75, 'david.sanchez.75@personal.example.com', 'Single', 'full-time', '1995-04-13 00:00:00', 'FR', '2023-01-15 09:00:00', NULL, 4, 'Hotdesk', 'TAX-1-0075', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(76, 'HRP00076', 'Female', 76, 'karen.graham.76@personal.example.com', 'Married', 'full-time', '1996-05-14 00:00:00', 'JP', '2020-01-15 09:00:00', NULL, 59, 'Office Based', 'TAX-1-0076', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(77, 'HRP00077', 'Female', 77, 'hannah.gallagher.77@personal.example.com', 'Divorced', 'contractor', '1997-06-15 00:00:00', 'CN', '2021-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-2-0077', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 2),
(78, 'HRP00078', 'Female', 78, 'michelle.smith.78@personal.example.com', 'Single', 'full-time', '1998-07-16 00:00:00', 'AU', '2022-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-3-0078', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 3),
(79, 'HRP00079', 'Female', 79, 'theresa.miller.79@personal.example.com', 'Married', 'part-time', '1999-08-17 00:00:00', 'BR', '2023-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-4-0079', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 4),
(80, 'HRP00080', 'Male', 80, 'tommy.jacobs.80@personal.example.com', 'Divorced', 'full-time', '1980-09-18 00:00:00', 'US', '2020-01-15 09:00:00', NULL, 96, 'Remote', 'TAX-1-0080', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(81, 'HRP00081', 'Male', 81, 'jon.clark.81@personal.example.com', 'Single', 'full-time', '1981-01-19 00:00:00', 'GB', '2021-01-15 09:00:00', NULL, 4, 'Hotdesk', 'TAX-1-0081', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(82, 'HRP00082', 'Other', 82, 'carl.brown.82@personal.example.com', 'Married', 'part-time', '1982-02-20 00:00:00', 'CA', '2022-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-5-0082', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 5),
(83, 'HRP00083', 'Female', 83, 'tonya.garcia.83@personal.example.com', 'Divorced', 'full-time', '1983-03-21 00:00:00', 'IN', '2023-01-15 09:00:00', NULL, 37, 'Remote', 'TAX-1-0083', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(84, 'HRP00084', 'Male', 84, 'jason.morrison.84@personal.example.com', 'Single', 'full-time', '1984-04-22 00:00:00', 'DE', '2020-01-15 09:00:00', NULL, 49, 'Hotdesk', 'TAX-1-0084', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(85, 'HRP00085', 'Other', 85, 'alex.johnson.85@personal.example.com', 'Married', 'part-time', '1985-05-23 00:00:00', 'FR', '2021-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-6-0085', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 6),
(86, 'HRP00086', 'Male', 86, 'steven.nguyen.86@personal.example.com', 'Divorced', 'contractor', '1986-06-24 00:00:00', 'JP', '2022-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-7-0086', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 7),
(87, 'HRP00087', 'Male', 87, 'steven.maxwell.87@personal.example.com', 'Single', 'full-time', '1987-07-25 00:00:00', 'CN', '2023-01-15 09:00:00', NULL, 72, 'Hotdesk', 'TAX-1-0087', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(88, 'HRP00088', 'Female', 88, 'nancy.mcneil.88@personal.example.com', 'Married', 'part-time', '1988-08-26 00:00:00', 'AU', '2020-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-8-0088', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 8),
(89, 'HRP00089', 'Female', 89, 'rebecca.foster.89@personal.example.com', 'Divorced', 'full-time', '1989-09-27 00:00:00', 'BR', '2021-01-15 09:00:00', NULL, 96, 'Remote', 'TAX-1-0089', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(90, 'HRP00090', 'Female', 90, 'heather.ball.90@personal.example.com', 'Single', 'full-time', '1990-01-10 00:00:00', 'US', '2022-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-9-0090', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 9),
(91, 'HRP00091', 'Male', 91, 'aaron.le.91@personal.example.com', 'Married', 'full-time', '1991-02-11 00:00:00', 'GB', '2023-01-15 09:00:00', NULL, 31, 'Office Based', 'TAX-1-0091', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(92, 'HRP00092', 'Male', 92, 'albert.rodriguez.92@personal.example.com', 'Divorced', 'full-time', '1992-03-12 00:00:00', 'CA', '2020-01-15 09:00:00', NULL, 37, 'Remote', 'TAX-1-0092', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(93, 'HRP00093', 'Male', 93, 'zachary.martinez.93@personal.example.com', 'Single', 'full-time', '1993-04-13 00:00:00', 'IN', '2021-01-15 09:00:00', NULL, 49, 'Hotdesk', 'TAX-1-0093', 'Administration', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(94, 'HRP00094', 'Male', 94, 'wyatt.moreno.94@personal.example.com', 'Married', 'part-time', '1994-05-14 00:00:00', 'DE', '2022-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-10-0094', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 10),
(95, 'HRP00095', 'Male', 95, 'james.wilson.95@personal.example.com', 'Divorced', 'full-time', '1995-06-15 00:00:00', 'FR', '2023-01-15 09:00:00', NULL, 68, 'Remote', 'TAX-1-0095', 'IT Support', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(96, 'HRP00096', 'Male', 96, 'kurt.fritz.96@personal.example.com', 'Single', 'full-time', '1996-07-16 00:00:00', 'JP', '2020-01-15 09:00:00', NULL, 4, 'Hotdesk', 'TAX-1-0096', 'Manager', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(97, 'HRP00097', 'Other', 97, 'erin.davis.97@personal.example.com', 'Married', 'part-time', '1997-08-17 00:00:00', 'CN', '2021-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-11-0097', 'QA', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 11),
(98, 'HRP00098', 'Male', 98, 'christopher.meza.98@personal.example.com', 'Divorced', 'contractor', '1998-09-18 00:00:00', 'AU', '2022-01-15 09:00:00', NULL, NULL, 'Remote', 'TAX-12-0098', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 12),
(99, 'HRP00099', 'Male', 99, 'john.ramirez.99@personal.example.com', 'Single', 'full-time', '1999-01-19 00:00:00', 'BR', '2023-01-15 09:00:00', NULL, NULL, 'Hotdesk', 'TAX-13-0099', 'Sales', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 13),
(100, 'HRP00100', 'Other', 100, 'lauren.diaz.100@personal.example.com', 'Married', 'part-time', '2000-02-20 00:00:00', 'US', '2020-01-15 09:00:00', NULL, NULL, 'Office Based', 'TAX-14-0100', 'Software Engineer', '2023-01-01 00:00:00', '2023-01-01 00:00:00', 14);

INSERT INTO topic_category (topic_category_id, name, active, coe_type, org_id, created_at, updated_at) VALUES
-- 1. Accounts / Access Control (Mapped to HRIT based on 'Access')
(1, 'Accounts / Access Control', TRUE, 'HRIT', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 2. Accounts / Account Access Control (HRIT Operations)
(2, 'Accounts / Account Access Control', TRUE, 'HRIT', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 3. Benefits (Total Rewards)
(3, 'Benefits', TRUE, 'Total Rewards', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 4. Employee Data Management (Workforce Admin)
(4, 'Employee Data Management', TRUE, 'Workforce Administration', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 5. General (Mapped to Workforce Admin as a catch-all)
(5, 'General', TRUE, 'Workforce Administration', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 6. HR Operations (Workforce Admin)
(6, 'HR Operations', TRUE, 'Workforce Administration', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 7. HR System Support (HRIT Operations)
(7, 'HR System Support', TRUE, 'HRIT', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 8. Payroll Administration (Payroll)
(8, 'Payroll Administration', TRUE, 'Payroll', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 9. Reporting (HRIT Operations)
(9, 'Reporting', TRUE, 'HRIT', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 10. Talent Acquisition (Talent Management)
(10, 'Talent Acquisition', TRUE, 'Talent Management', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 11. Talent Management (Talent Management)
(11, 'Talent Management', TRUE, 'Talent Management', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 12. Time and Expense Management (Payroll)
(12, 'Time and Expense Management', TRUE, 'Payroll', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO topic_detail (topic_detail_id, active, name, topic_category, org_id, created_at, updated_at) VALUES
(1, TRUE, 'Account Access', 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, TRUE, 'Account Notification', 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, TRUE, 'Background Check', 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, TRUE, 'Beneficiaries', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, TRUE, 'Collect Tax Forms', 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, TRUE, 'Corporate Credit Card Request', 12, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, TRUE, 'Data Erasure', 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, TRUE, 'Dental', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, TRUE, 'Direct Deposit Setup', 8, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, TRUE, 'Discrepancy', 8, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, TRUE, 'Drug Screening', 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, TRUE, 'Employment Verification', 6, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, TRUE, 'General', 5, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, TRUE, 'HR Portal', 7, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, TRUE, 'Inquiry (Accounts)', 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), -- Renamed
(16, TRUE, 'Inquiry (Reporting)', 9, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), -- Renamed
(17, TRUE, 'Inquiry (Benefits)', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'), -- Renamed
(18, TRUE, 'Leave of Absence', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, TRUE, 'Manage No Shows', 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(20, TRUE, 'Manage Start Date', 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(21, TRUE, 'Medical', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(22, TRUE, 'New Account Creation', 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(23, TRUE, 'New Hire Documentation', 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(24, TRUE, 'New Hire Onboarding', 10, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(25, TRUE, 'Password Reset', 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(26, TRUE, 'Payroll System', 8, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(27, TRUE, 'Pharmacy', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(28, TRUE, 'Profile Update', 6, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(29, TRUE, 'Relocation Assistance', 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(30, TRUE, 'Report Request', 9, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(31, TRUE, 'Retirement', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(32, TRUE, 'Subject Access Request', 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(33, TRUE, 'Tuition Reimbursement', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(34, TRUE, 'Vision', 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(35, TRUE, 'Work Visa', 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO hr_service (hr_service_id, service_name, fulfillment_type, topic_detail, service_template, hr_criteria, active, org_id, created_at, updated_at) VALUES
(1, 'General Inquiry', 'manual', 13, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 'Generate Employment History', 'manual', 13, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 'HR Account Access Request', 'manual', 1, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 'HR Accounts Inquiry', 'manual', 15, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 'HR Portal Support Request', 'manual', 14, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 'Leave Of Absence', 'manual', 18, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 'Medical Benefits Enrollment Inquiry', 'manual', 21, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 'Medical Benefits Enrollment/Modification', 'manual', 21, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 'Medical Benefits Inquiry', 'manual', 21, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 'New Hire Documentation', 'manual', 23, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 'New Hire Onboarding', 'manual', 24, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 'No Show', 'manual', 19, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 'Password Reset', 'manual', 25, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 'Payroll Discrepancy', 'manual', 10, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 'Pharmacy Benefits Enrollment Inquiry', 'manual', 27, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 'Pharmacy Benefits Enrollment/Modification', 'manual', 27, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 'Pharmacy Benefits Inquiry', 'manual', 27, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 'Report Inquiry', 'manual', 16, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 'Report Request', 'manual', 30, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(20, '401(k) Retirement Plan Enrollment Inquiry', 'manual', 31, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(21, '401(k) Retirement Plan Enrollment/Modification', 'manual', 31, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(22, '401(k) Retirement Plan Inquiry', 'manual', 31, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(23, 'Account Notification', 'manual', 2, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(24, 'Beneficiaries Add/Modify', 'manual', 4, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(25, 'Beneficiaries Inquiry', 'manual', 4, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(26, 'Bulk Parent Case', 'manual', 13, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(27, 'Change Start Date', 'manual', 20, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(28, 'Complete Tax Forms through CIC Plus', 'manual', 5, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(29, 'Dental Benefits Enrollment Inquiry', 'manual', 8, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(30, 'Dental Benefits Enrollment/Modification', 'manual', 8, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(31, 'Dental Benefits Inquiry', 'manual', 8, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(32, 'Direct Deposit Inquiry', 'manual', 9, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(33, 'Direct Deposit Setup', 'manual', 9, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(34, 'Employee Payroll Setup Request', 'manual', 26, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(35, 'Employee Profile Update', 'manual', 28, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(36, 'Employee Travel Visa Request', 'manual', 35, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(37, 'Erasure of Personal Data', 'manual', 7, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(38, 'General Benefits Inquiry', 'manual', 17, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(39, 'Request Background Check', 'manual', 3, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(40, 'Request Background Check by Accurate', 'manual', 3, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(41, 'Request Background Check by First Advantage', 'manual', 3, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(42, 'Request Background Check by Sterling', 'manual', 3, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(43, 'Request Corporate Credit Card', 'manual', 6, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(44, 'Request Drug Screen', 'manual', 11, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(45, 'Request Personal Information Report', 'manual', 32, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(46, 'Request Relocation Assistance', 'manual', 29, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(47, 'Setup New Hire HR Profile', 'manual', 22, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(48, 'Sign Non-Disclosure', 'manual', 23, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(49, 'Tuition Reimbursement Inquiry', 'manual', 33, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(50, 'Verification of Employment', 'manual', 12, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(51, 'Vision Benefits Enrollment Inquiry', 'manual', 34, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(52, 'Vision Benefits Enrollment/Modification', 'manual', 34, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(53, 'Vision Benefits Inquiry', 'manual', 34, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(54, 'Work Visa Transfer Request', 'manual', 35, NULL, NULL, TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO service_template (service_template_id, name, change_request_values, active, coe_type, org_id, created_at, updated_at) VALUES
-- 1. HRIT: Standard Access Change
(1, 'Standard HRIT Access Change', '{"risk": "low", "impact": "low", "urgency": "low", "approval_required": false, "implementation_plan": "automated_provisioning"}', TRUE, 'HRIT', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 2. HRIT: Emergency Patch
(2, 'Emergency HRIT System Patch', '{"risk": "high", "type": "emergency", "cab_approval": true, "downtime_required": true, "notify_users": true}', TRUE, 'HRIT', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 3. Payroll: Cycle Adjustment
(3, 'Payroll Schedule Adjustment', '{"risk": "high", "impact": "high", "urgency": "medium", "approval_group": "Payroll Admin", "audit_required": true}', TRUE, 'Payroll', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 4. Talent Management: New Hire Setup
(4, 'New Hire Provisioning Template', '{"tasks": ["setup_email", "assign_desk", "ship_equipment"], "notify_manager": true, "sla_days": 3}', TRUE, 'Talent Management', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 5. Total Rewards: Enrollment Config
(5, 'Open Enrollment Configuration', '{"window_start": "2023-11-01", "window_end": "2023-11-15", "plan_year": 2024, "provider_api_enabled": true}', TRUE, 'Total Rewards', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 6. Workforce Admin: Data Correction
(6, 'Personal Data Correction Protocol', '{"gdpr_compliant": true, "verification_method": "document_upload", "retention_policy": "7_years"}', TRUE, 'Workforce Administration', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO hr_criteria (hr_criteria_id, name, type, active, user_group, users, created_at, updated_at, org_id) VALUES
-- 1. Employees Only (Case visibility rule)
(1, 'Employees Only', 'case_visibility', TRUE, 13, NULL, '2017-09-11 22:55:37', '2017-09-11 22:55:37', 1),

-- 2. Needs Corporate Credit Card (Approval required)
(2, 'Needs Corporate Credit Card', 'approval', TRUE, 17, NULL, '2017-01-10 10:05:11', '2017-01-10 10:05:11', 1),

-- 3. Needs Relocation (Approval required)
(3, 'Needs Relocation', 'approval', TRUE, 14, NULL, '2017-09-11 22:55:37', '2017-09-11 22:55:37', 1),

-- 4. Needs visa transfer (Approval required)
(4, 'Needs visa transfer', 'approval', TRUE, 15, NULL, '2017-09-11 22:55:37', '2017-09-11 22:55:37', 1),

-- 5. New Hire (Case visibility rule)
(5, 'New Hire', 'case_visibility', TRUE, 13, NULL, '2017-09-11 22:55:37', '2017-09-11 22:55:37', 1),

-- 6. Office Based Employees (Case visibility rule)
(6, 'Office Based Employees', 'case_visibility', TRUE, 13, NULL, '2017-09-11 22:55:37', '2017-09-11 22:55:37', 1),

-- 7. US Employees - Tax forms Collection (Case visibility rule)
(7, 'US Employees - Tax forms Collection', 'case_visibility', TRUE, 16, NULL, '2025-12-08 00:01:51', '2025-12-08 00:01:51', 1);

INSERT INTO skill (skill_id, name, active, org_id, created_at, updated_at) VALUES
(1, 'Employee Career', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 'Employee Onboarding', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 'Employee Relations', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 'Employee Transfer', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 'Exit Interviews', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 'Global Mobility', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 'Hiring', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 'HR', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 'HR Benefits', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 'HR Data Privacy', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 'HR Policy', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 'HR Systems', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 'IT', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 'Leave of Absence', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 'Payroll', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 'Spanish Language', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 'Talent Management', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 'Time Tracking', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 'Vacation / Leave', TRUE, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO user_skill (skill, user, org_id, created_at, updated_at) VALUES
(1, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 32, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 39, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 41, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 50, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 57, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 76, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 80, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 84, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 89, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 31, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 31, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 31, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 31, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 31, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 37, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 37, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 37, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 37, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 37, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 49, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 49, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 49, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 49, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 49, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 59, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 59, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 59, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 59, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 59, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 68, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 68, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 68, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 68, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 68, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 72, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 72, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 72, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 72, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 72, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 75, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 75, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 75, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 75, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 75, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 96, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 96, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 96, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(11, 96, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 96, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 3, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 5, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 5, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 6, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 6, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 9, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 9, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 23, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 23, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 24, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 24, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 25, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 25, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 26, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 26, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 29, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 29, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 33, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 33, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 38, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 38, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 40, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 40, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 11, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 12, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 12, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 12, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 12, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 13, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 13, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 13, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 13, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 15, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 15, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 15, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 15, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 22, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 22, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 22, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 22, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 42, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 42, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 42, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 42, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 42, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 43, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 43, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 43, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 43, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 45, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 45, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 45, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 45, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 46, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 46, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 46, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 46, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 52, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 52, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 52, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 52, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 54, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 54, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 54, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 54, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 54, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 62, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 62, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 62, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 62, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 65, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 65, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 65, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 65, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 66, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 66, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 66, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 66, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 67, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 67, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 67, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 67, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 81, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 81, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 81, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 81, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 81, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 83, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 83, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 83, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 83, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 87, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 87, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 87, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 87, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 91, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 91, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 91, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 91, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 92, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 92, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(18, 92, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 92, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 93, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(1, 93, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 93, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 93, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 93, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 95, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 95, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 95, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 95, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO hr_case (hr_case_id, number, status, hr_service, opened_for, opened_by, priority, source, assigned_to, assignment_group, short_description, worknotes, skills, approval_criteria, coe_type, approver, request_status, account_number, account_type, created_at, updated_at, org_id) VALUES
(1, 'HRC0000711', 'draft', 1, 2, 2, 'critical', 'self-service', 11, 4, 'General inquiry regarding HR policies', 'Case created via self-service', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-2-0', 'checking', '2023-01-15 10:00:00', '2023-01-15 10:00:00', 1),
(2, 'HRC0000712', 'ready', 2, 7, 7, 'high', 'phone', 12, 5, 'Request for employment history verification letter', 'Case created via phone', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-7-1', 'savings', '2023-02-15 10:00:00', '2023-02-15 10:00:00', 2),
(3, 'HRC0000713', 'awaiting_approval', 3, 8, 8, 'moderate', 'email', 5, 3, 'Access issue with HR portal account', 'Case created via email', NULL, NULL, 'HRIT', 31, 'requested', 'ACC-8-2', 'other', '2023-03-15 10:00:00', '2023-03-15 10:00:00', 3),
(4, 'HRC0000714', 'work_in_progress', 4, 10, 10, 'low', 'chat', 6, 7, 'Inquiry about HR account permissions', 'Case created via chat', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-10-3', 'checking', '2023-04-15 10:00:00', '2023-04-15 10:00:00', 4),
(5, 'HRC0000715', 'closed_complete', 5, 14, 14, 'planning', 'walk-in', 9, 8, 'Support needed for HR Portal navigation', 'Case created via walk-in', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-14-4', 'savings', '2023-05-15 10:00:00', '2023-05-15 10:00:00', 5),
(6, 'HRC0000716', 'closed_incomplete', 6, 16, 16, 'critical', 'virtual-agent', 42, 11, 'Request for extended Leave of Absence', 'Case created via virtual-agent', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-16-5', 'other', '2023-06-15 10:00:00', '2023-06-15 10:00:00', 6),
(7, 'HRC0000717', 'awaiting_acceptance', 7, 17, 17, 'high', 'self-service', 43, 4, 'Inquiry regarding medical benefits enrollment', 'Case created via self-service', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-17-6', 'checking', '2023-07-15 10:00:00', '2023-07-15 10:00:00', 7),
(8, 'HRC0000718', 'suspended', 8, 18, 18, 'moderate', 'phone', 45, 11, 'Modification request for current medical plan', 'Case created via phone', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-18-7', 'savings', '2023-08-15 10:00:00', '2023-08-15 10:00:00', 8),
(9, 'HRC0000719', 'cancelled', 9, 19, 19, 'low', 'email', 46, 4, 'General inquiry about medical coverage', 'Case created via email', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-19-8', 'other', '2023-09-15 10:00:00', '2023-09-15 10:00:00', 9),
(10, 'HRC0000720', 'draft', 10, 20, 20, 'planning', 'chat', 52, 5, 'Submission of new hire documentation', 'Case created via chat', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-20-9', 'checking', '2023-01-15 10:00:00', '2023-01-15 10:00:00', 10),
(11, 'HRC0000721', 'ready', 11, 21, 21, 'critical', 'walk-in', 54, 4, 'Request Onboarding case for Andrew Bell', 'Case created via walk-in', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-21-10', 'savings', '2023-02-15 10:00:00', '2023-02-15 10:00:00', 11),
(12, 'HRC0000722', 'awaiting_approval', 12, 27, 27, 'high', 'virtual-agent', 62, 5, 'Report a no-show for scheduled interview', 'Case created via virtual-agent', NULL, NULL, 'Talent Management', 31, 'requested', 'ACC-27-11', 'other', '2023-03-15 10:00:00', '2023-03-15 10:00:00', 12),
(13, 'HRC0000723', 'work_in_progress', 13, 28, 28, 'moderate', 'self-service', 40, 3, 'Password reset for employee portal', 'Case created via self-service', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-28-12', 'checking', '2023-04-15 10:00:00', '2023-04-15 10:00:00', 13),
(14, 'HRC0000724', 'closed_complete', 14, 30, 30, 'low', 'phone', 66, 6, 'Discrepancy found in last pay period', 'Case created via phone', NULL, NULL, 'Payroll', NULL, NULL, 'ACC-30-13', 'savings', '2023-05-15 10:00:00', '2023-05-15 10:00:00', 14),
(15, 'HRC0000725', 'closed_incomplete', 15, 34, 34, 'planning', 'email', 67, 4, 'Inquiry regarding pharmacy benefit options', 'Case created via email', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-34-14', 'other', '2023-06-15 10:00:00', '2023-06-15 10:00:00', 15),
(16, 'HRC0000726', 'awaiting_acceptance', 16, 35, 35, 'critical', 'chat', 81, 11, 'Change request for pharmacy benefits plan', 'Case created via chat', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-35-15', 'checking', '2023-07-15 10:00:00', '2023-07-15 10:00:00', 16),
(17, 'HRC0000727', 'suspended', 17, 36, 36, 'high', 'walk-in', 83, 4, 'Question about covered medications', 'Case created via walk-in', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-36-16', 'savings', '2023-08-15 10:00:00', '2023-08-15 10:00:00', 17),
(18, 'HRC0000728', 'cancelled', 18, 44, 44, 'moderate', 'virtual-agent', 9, 3, 'Inquiry about available HR reports', 'Case created via virtual-agent', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-44-17', 'other', '2023-09-15 10:00:00', '2023-09-15 10:00:00', 18),
(19, 'HRC0000729', 'draft', 19, 47, 47, 'low', 'self-service', 23, 7, 'Request for custom headcount report', 'Case created via self-service', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-47-18', 'checking', '2023-01-15 10:00:00', '2023-01-15 10:00:00', 19),
(20, 'HRC0000730', 'ready', 20, 48, 48, 'planning', 'phone', 92, 11, 'Inquiry about 401(k) enrollment eligibility', 'Case created via phone', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-48-19', 'savings', '2023-02-15 10:00:00', '2023-02-15 10:00:00', 20),
(21, 'HRC0000731', 'awaiting_approval', 21, 51, 51, 'critical', 'email', 93, 4, 'Modification to 401(k) contribution rate', 'Case created via email', NULL, NULL, 'Total Rewards', 31, 'requested', 'ACC-51-20', 'other', '2023-03-15 10:00:00', '2023-03-15 10:00:00', 1),
(22, 'HRC0000732', 'work_in_progress', 22, 53, 53, 'high', 'chat', 95, 11, 'General question about 401(k) plan details', 'Case created via chat', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-53-21', 'checking', '2023-04-15 10:00:00', '2023-04-15 10:00:00', 2),
(23, 'HRC0000733', 'closed_complete', 23, 55, 55, 'moderate', 'walk-in', 29, 3, 'Notification of account status change', 'Case created via walk-in', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-55-22', 'savings', '2023-05-15 10:00:00', '2023-05-15 10:00:00', 3),
(24, 'HRC0000734', 'closed_incomplete', 24, 56, 56, 'low', 'virtual-agent', 12, 11, 'Request to add or modify beneficiaries', 'Case created via virtual-agent', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-56-23', 'other', '2023-06-15 10:00:00', '2023-06-15 10:00:00', 4),
(25, 'HRC0000735', 'awaiting_acceptance', 25, 58, 58, 'planning', 'self-service', 13, 4, 'Inquiry about current beneficiary designations', 'Case created via self-service', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-58-24', 'checking', '2023-07-15 10:00:00', '2023-07-15 10:00:00', 5),
(26, 'HRC0000736', 'suspended', 26, 60, 60, 'critical', 'phone', 15, 5, 'Bulk processing request for multiple cases', 'Case created via phone', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-60-25', 'savings', '2023-08-15 10:00:00', '2023-08-15 10:00:00', 6),
(27, 'HRC0000737', 'cancelled', 27, 61, 61, 'high', 'email', 22, 4, 'Request to change start date for new hire', 'Case created via email', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-61-26', 'other', '2023-09-15 10:00:00', '2023-09-15 10:00:00', 7),
(28, 'HRC0000738', 'draft', 28, 63, 63, 'moderate', 'chat', 42, 5, 'Assistance with CIC Plus tax forms', 'Case created via chat', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-63-27', 'checking', '2023-01-15 10:00:00', '2023-01-15 10:00:00', 8),
(29, 'HRC0000739', 'ready', 29, 64, 64, 'low', 'walk-in', 43, 4, 'Request Relocation Assistance', 'Case created via walk-in', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-64-28', 'savings', '2023-02-15 10:00:00', '2023-02-15 10:00:00', 9),
(30, 'HRC0000740', 'awaiting_approval', 30, 69, 69, 'planning', 'virtual-agent', 45, 11, 'Request to modify dental coverage tier', 'Case created via virtual-agent', NULL, NULL, 'Total Rewards', 31, 'requested', 'ACC-69-29', 'other', '2023-03-15 10:00:00', '2023-03-15 10:00:00', 10),
(31, 'HRC0000741', 'work_in_progress', 31, 70, 70, 'critical', 'self-service', 46, 4, 'General dental benefits question', 'Case created via self-service', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-70-30', 'checking', '2023-04-15 10:00:00', '2023-04-15 10:00:00', 11),
(32, 'HRC0000742', 'closed_complete', 32, 71, 71, 'high', 'phone', 52, 6, 'Inquiry about direct deposit status', 'Case created via phone', NULL, NULL, 'Payroll', NULL, NULL, 'ACC-71-31', 'savings', '2023-05-15 10:00:00', '2023-05-15 10:00:00', 12),
(33, 'HRC0000743', 'closed_incomplete', 33, 73, 73, 'moderate', 'email', 54, 4, 'Request to update direct deposit bank info', 'Case created via email', NULL, NULL, 'Payroll', NULL, NULL, 'ACC-73-32', 'other', '2023-06-15 10:00:00', '2023-06-15 10:00:00', 13),
(34, 'HRC0000744', 'awaiting_acceptance', 34, 74, 74, 'low', 'chat', 62, 6, 'Employee Payroll Setup Request', 'Case created via chat', NULL, NULL, 'Payroll', NULL, NULL, 'ACC-74-33', 'checking', '2023-07-15 10:00:00', '2023-07-15 10:00:00', 14),
(35, 'HRC0000745', 'suspended', 35, 77, 77, 'planning', 'walk-in', 65, 4, 'Request to update employee profile details', 'Case created via walk-in', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-77-34', 'savings', '2023-08-15 10:00:00', '2023-08-15 10:00:00', 15),
(36, 'HRC0000746', 'cancelled', 36, 78, 78, 'critical', 'virtual-agent', 66, 5, 'Request assistance to get a travel visa', 'Case created via virtual-agent', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-78-35', 'other', '2023-09-15 10:00:00', '2023-09-15 10:00:00', 16),
(37, 'HRC0000747', 'draft', 37, 79, 79, 'high', 'self-service', 67, 4, 'Erasure of Personal Data Request', 'Case created via self-service', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-79-36', 'checking', '2023-01-15 10:00:00', '2023-01-15 10:00:00', 17),
(38, 'HRC0000748', 'ready', 38, 82, 82, 'moderate', 'phone', 81, 11, 'General inquiry about total rewards package', 'Case created via phone', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-82-37', 'savings', '2023-02-15 10:00:00', '2023-02-15 10:00:00', 18),
(39, 'HRC0000749', 'awaiting_approval', 39, 85, 85, 'low', 'email', 83, 4, 'Request a background check', 'Case created via email', NULL, NULL, 'Talent Management', 31, 'requested', 'ACC-85-38', 'other', '2023-03-15 10:00:00', '2023-03-15 10:00:00', 19),
(40, 'HRC0000750', 'work_in_progress', 40, 86, 86, 'planning', 'chat', 87, 5, 'Request background check via Accurate', 'Case created via chat', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-86-39', 'checking', '2023-04-15 10:00:00', '2023-04-15 10:00:00', 20),
(41, 'HRC0000751', 'closed_complete', 41, 88, 88, 'critical', 'walk-in', 91, 4, 'Request background check via First Advantage', 'Case created via walk-in', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-88-40', 'savings', '2023-05-15 10:00:00', '2023-05-15 10:00:00', 1),
(42, 'HRC0000752', 'closed_incomplete', 42, 90, 90, 'high', 'virtual-agent', 92, 5, 'Request background check via Sterling', 'Case created via virtual-agent', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-90-41', 'other', '2023-06-15 10:00:00', '2023-06-15 10:00:00', 2),
(43, 'HRC0000753', 'awaiting_acceptance', 43, 94, 94, 'moderate', 'self-service', 93, 4, 'Request new corporate credit card', 'Case created via self-service', NULL, NULL, 'Payroll', NULL, NULL, 'ACC-94-42', 'checking', '2023-07-15 10:00:00', '2023-07-15 10:00:00', 3),
(44, 'HRC0000754', 'suspended', 44, 97, 97, 'low', 'phone', 95, 5, 'Employee Drug Screen Request', 'Case created via phone', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-97-43', 'savings', '2023-08-15 10:00:00', '2023-08-15 10:00:00', 4),
(45, 'HRC0000755', 'cancelled', 45, 98, 98, 'planning', 'email', 11, 4, 'Request for copy of personal information file', 'Case created via email', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-98-44', 'other', '2023-09-15 10:00:00', '2023-09-15 10:00:00', 5),
(46, 'HRC0000756', 'draft', 46, 99, 99, 'critical', 'chat', 12, 5, 'Request Relocation Assistance', 'Case created via chat', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-99-45', 'checking', '2023-01-15 10:00:00', '2023-01-15 10:00:00', 6),
(47, 'HRC0000757', 'ready', 47, 100, 100, 'high', 'walk-in', 25, 2, 'Setup HR profile for incoming new hire', 'Case created via walk-in', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-100-46', 'savings', '2023-02-15 10:00:00', '2023-02-15 10:00:00', 7),
(48, 'HRC0000758', 'awaiting_approval', 48, 2, 2, 'moderate', 'virtual-agent', 15, 5, 'Submission of signed Non-Disclosure Agreement', 'Case created via virtual-agent', NULL, NULL, 'Talent Management', 31, 'requested', 'ACC-2-47', 'other', '2023-03-15 10:00:00', '2023-03-15 10:00:00', 8),
(49, 'HRC0000759', 'work_in_progress', 49, 7, 7, 'low', 'self-service', 22, 4, 'Inquiry about tuition reimbursement program', 'Case created via self-service', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-7-48', 'checking', '2023-04-15 10:00:00', '2023-04-15 10:00:00', 9),
(50, 'HRC0000760', 'closed_complete', 50, 8, 8, 'planning', 'phone', 42, 5, 'Request for verbal verification of employment', 'Case created via phone', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-8-49', 'savings', '2023-05-15 10:00:00', '2023-05-15 10:00:00', 10),
(51, 'HRC0000761', 'closed_incomplete', 51, 10, 10, 'critical', 'email', 43, 4, 'Inquiry regarding vision insurance plan', 'Case created via email', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-10-50', 'other', '2023-06-15 10:00:00', '2023-06-15 10:00:00', 11),
(52, 'HRC0000762', 'awaiting_acceptance', 52, 14, 14, 'high', 'chat', 45, 11, 'Request to change vision benefit coverage', 'Case created via chat', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-14-51', 'checking', '2023-07-15 10:00:00', '2023-07-15 10:00:00', 12),
(53, 'HRC0000763', 'suspended', 53, 16, 16, 'moderate', 'walk-in', 46, 4, 'General question about vision benefits', 'Case created via walk-in', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-16-52', 'savings', '2023-08-15 10:00:00', '2023-08-15 10:00:00', 13),
(54, 'HRC0000764', 'cancelled', 54, 17, 17, 'low', 'virtual-agent', 52, 5, 'Request for work visa transfer processing', 'Case created via virtual-agent', NULL, NULL, 'Talent Management', NULL, NULL, 'ACC-17-53', 'other', '2023-09-15 10:00:00', '2023-09-15 10:00:00', 14),
(55, 'HRC0000765', 'draft', 1, 18, 18, 'planning', 'self-service', 54, 4, 'General inquiry regarding HR policies', 'Case created via self-service', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-18-54', 'checking', '2023-01-15 10:00:00', '2023-01-15 10:00:00', 15),
(56, 'HRC0000766', 'ready', 2, 19, 19, 'critical', 'phone', 62, 5, 'Request for employment history verification letter', 'Case created via phone', NULL, NULL, 'Workforce Administration', NULL, NULL, 'ACC-19-55', 'savings', '2023-02-15 10:00:00', '2023-02-15 10:00:00', 16),
(57, 'HRC0000767', 'awaiting_approval', 3, 20, 20, 'high', 'email', 9, 2, 'Access issue with HR portal account', 'Case created via email', NULL, NULL, 'HRIT', 31, 'requested', 'ACC-20-56', 'other', '2023-03-15 10:00:00', '2023-03-15 10:00:00', 17),
(58, 'HRC0000768', 'work_in_progress', 4, 21, 21, 'moderate', 'chat', 23, 3, 'Inquiry about HR account permissions', 'Case created via chat', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-21-57', 'checking', '2023-04-15 10:00:00', '2023-04-15 10:00:00', 18),
(59, 'HRC0000769', 'closed_complete', 5, 27, 27, 'low', 'walk-in', 24, 7, 'Support needed for HR Portal navigation', 'Case created via walk-in', NULL, NULL, 'HRIT', NULL, NULL, 'ACC-27-58', 'savings', '2023-05-15 10:00:00', '2023-05-15 10:00:00', 19),
(60, 'HRC0000770', 'closed_incomplete', 6, 28, 28, 'planning', 'virtual-agent', 81, 11, 'Request for extended Leave of Absence', 'Case created via virtual-agent', NULL, NULL, 'Total Rewards', NULL, NULL, 'ACC-28-59', 'other', '2023-06-15 10:00:00', '2023-06-15 10:00:00', 20);

INSERT INTO hr_case_task (hr_case_task_id, number, status, assigned_to, assignment_group, short_description, task_type, hr_service, external_url, worknotes, active, parent_case, org_id, created_at, updated_at) VALUES
(1, 'HRT0001000', 'draft', NULL, 4, 'Verify Home Address', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 1, 1, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(2, 'HRT0001001', 'draft', NULL, 4, 'Update Emergency Contacts', 'checklist', NULL, NULL, 'Generated task', FALSE, 1, 1, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(3, 'HRT0001002', 'ready', NULL, 5, 'Update Emergency Contacts', 'checklist', NULL, NULL, 'Generated task', TRUE, 2, 2, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(4, 'HRT0001003', 'ready', NULL, 5, 'Review Employee Handbook', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 2, 2, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(5, 'HRT0001004', 'ready', NULL, 5, 'Confirm Data Privacy Settings', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 2, 2, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(6, 'HRT0001005', 'awaiting_approval', 5, 3, 'Read IT Security Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 3, 3, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(7, 'HRT0001006', 'awaiting_approval', 5, 3, 'Confirm Hardware Receipt', 'checklist', NULL, NULL, 'Generated task', TRUE, 3, 3, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(8, 'HRT0001007', 'closed_complete', 6, 7, 'Confirm Hardware Receipt', 'checklist', NULL, NULL, 'Generated task', TRUE, 4, 4, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(9, 'HRT0001008', 'work_in_progress', 6, 7, 'Rate IT Support Experience', 'survey', NULL, NULL, 'Generated task', TRUE, 4, 4, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(10, 'HRT0001009', 'ready', NULL, 7, 'Verify VPN Access', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 4, 4, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(11, 'HRT0001010', 'closed_complete', 9, 8, 'Rate IT Support Experience', 'survey', NULL, NULL, 'Generated task', FALSE, 5, 5, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(12, 'HRT0001011', 'closed_complete', 9, 8, 'Verify VPN Access', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 5, 5, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(13, 'HRT0001012', 'closed_incomplete', 42, 11, 'Select Medical Plan', 'hr service', 6, NULL, 'Generated task', FALSE, 6, 6, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(14, 'HRT0001013', 'closed_incomplete', 42, 11, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 6, 6, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(15, 'HRT0001014', 'closed_incomplete', 42, 11, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 6, 6, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(16, 'HRT0001015', 'closed_complete', 43, 4, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 7, 7, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(17, 'HRT0001016', 'closed_complete', 43, 4, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 7, 7, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(18, 'HRT0001017', 'suspended', 45, 11, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 8, 8, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(19, 'HRT0001018', 'suspended', 45, 11, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', TRUE, 8, 8, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(20, 'HRT0001019', 'suspended', 45, 11, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 8, 8, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(21, 'HRT0001020', 'cancelled', 46, 4, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', FALSE, 9, 9, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(22, 'HRT0001021', 'cancelled', 46, 4, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 9, 9, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(23, 'HRT0001022', 'draft', NULL, 5, 'New Hire Feedback Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 10, 10, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(24, 'HRT0001023', 'draft', NULL, 5, 'Watch Cultural Orientation Video', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 10, 10, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(25, 'HRT0001024', 'draft', NULL, 5, 'Sign Non-Disclosure Agreement', 'checklist', NULL, NULL, 'Generated task', FALSE, 10, 10, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(26, 'HRT0001025', 'ready', NULL, 4, 'Watch Cultural Orientation Video', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 11, 11, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(27, 'HRT0001026', 'ready', NULL, 4, 'Sign Non-Disclosure Agreement', 'checklist', NULL, NULL, 'Generated task', TRUE, 11, 11, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(28, 'HRT0001027', 'awaiting_approval', 62, 5, 'Sign Non-Disclosure Agreement', 'checklist', NULL, NULL, 'Generated task', TRUE, 12, 12, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(29, 'HRT0001028', 'awaiting_approval', 62, 5, 'Complete Background Check Form', 'hr service', 12, NULL, 'Generated task', TRUE, 12, 12, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(30, 'HRT0001029', 'awaiting_approval', 62, 5, 'Schedule Orientation Session', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 12, 12, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(31, 'HRT0001030', 'closed_complete', 40, 3, 'Read IT Security Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 13, 13, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(32, 'HRT0001031', 'work_in_progress', 40, 3, 'Confirm Hardware Receipt', 'checklist', NULL, NULL, 'Generated task', TRUE, 13, 13, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(33, 'HRT0001032', 'closed_complete', 66, 6, 'Confirm Pay Cycle', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 14, 14, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(34, 'HRT0001033', 'closed_complete', 66, 6, 'Payroll Satisfaction Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 14, 14, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(35, 'HRT0001034', 'closed_complete', 66, 6, 'Verify Bank Details', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 14, 14, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(36, 'HRT0001035', 'closed_incomplete', 67, 4, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 15, 15, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(37, 'HRT0001036', 'closed_incomplete', 67, 4, 'Select Medical Plan', 'hr service', 15, NULL, 'Generated task', FALSE, 15, 15, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(38, 'HRT0001037', 'closed_complete', 81, 11, 'Select Medical Plan', 'hr service', 16, NULL, 'Generated task', FALSE, 16, 16, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(39, 'HRT0001038', 'closed_complete', 81, 11, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 16, 16, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(40, 'HRT0001039', 'closed_complete', 81, 11, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 16, 16, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(41, 'HRT0001040', 'suspended', 83, 4, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 17, 17, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(42, 'HRT0001041', 'suspended', 83, 4, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 17, 17, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(43, 'HRT0001042', 'cancelled', 9, 3, 'Read IT Security Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 18, 18, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(44, 'HRT0001043', 'cancelled', 9, 3, 'Confirm Hardware Receipt', 'checklist', NULL, NULL, 'Generated task', FALSE, 18, 18, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(45, 'HRT0001044', 'cancelled', 9, 3, 'Rate IT Support Experience', 'survey', NULL, NULL, 'Generated task', FALSE, 18, 18, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(46, 'HRT0001045', 'draft', NULL, 7, 'Confirm Hardware Receipt', 'checklist', NULL, NULL, 'Generated task', FALSE, 19, 19, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(47, 'HRT0001046', 'draft', NULL, 7, 'Rate IT Support Experience', 'survey', NULL, NULL, 'Generated task', FALSE, 19, 19, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(48, 'HRT0001047', 'ready', NULL, 11, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 20, 20, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(49, 'HRT0001048', 'ready', NULL, 11, 'Select Medical Plan', 'hr service', 20, NULL, 'Generated task', TRUE, 20, 20, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(50, 'HRT0001049', 'ready', NULL, 11, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 20, 20, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(51, 'HRT0001050', 'awaiting_approval', 93, 4, 'Select Medical Plan', 'hr service', 21, NULL, 'Generated task', TRUE, 21, 1, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(52, 'HRT0001051', 'awaiting_approval', 93, 4, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 21, 1, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(53, 'HRT0001052', 'closed_complete', 95, 11, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 22, 2, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(54, 'HRT0001053', 'work_in_progress', 95, 11, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 22, 2, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(55, 'HRT0001054', 'ready', NULL, 11, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', TRUE, 22, 2, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(56, 'HRT0001055', 'closed_complete', 29, 3, 'Read IT Security Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 23, 3, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(57, 'HRT0001056', 'closed_complete', 29, 3, 'Confirm Hardware Receipt', 'checklist', NULL, NULL, 'Generated task', FALSE, 23, 3, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(58, 'HRT0001057', 'closed_incomplete', 12, 11, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', FALSE, 24, 4, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(59, 'HRT0001058', 'closed_incomplete', 12, 11, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 24, 4, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(60, 'HRT0001059', 'closed_incomplete', 12, 11, 'Select Medical Plan', 'hr service', 24, NULL, 'Generated task', FALSE, 24, 4, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(61, 'HRT0001060', 'closed_complete', 13, 4, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 25, 5, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(62, 'HRT0001061', 'closed_complete', 13, 4, 'Select Medical Plan', 'hr service', 25, NULL, 'Generated task', FALSE, 25, 5, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(63, 'HRT0001062', 'suspended', 15, 5, 'Verify Home Address', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 26, 6, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(64, 'HRT0001063', 'suspended', 15, 5, 'Update Emergency Contacts', 'checklist', NULL, NULL, 'Generated task', TRUE, 26, 6, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(65, 'HRT0001064', 'suspended', 15, 5, 'Review Employee Handbook', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 26, 6, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(66, 'HRT0001065', 'cancelled', 22, 4, 'Sign Non-Disclosure Agreement', 'checklist', NULL, NULL, 'Generated task', FALSE, 27, 7, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(67, 'HRT0001066', 'cancelled', 22, 4, 'Complete Background Check Form', 'hr service', 27, NULL, 'Generated task', FALSE, 27, 7, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(68, 'HRT0001067', 'draft', NULL, 5, 'Complete Background Check Form', 'hr service', 28, NULL, 'Generated task', FALSE, 28, 8, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(69, 'HRT0001068', 'draft', NULL, 5, 'Schedule Orientation Session', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 28, 8, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(70, 'HRT0001069', 'draft', NULL, 5, 'New Hire Feedback Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 28, 8, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(71, 'HRT0001070', 'ready', NULL, 4, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', TRUE, 29, 9, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(72, 'HRT0001071', 'ready', NULL, 4, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 29, 9, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(73, 'HRT0001072', 'awaiting_approval', 45, 11, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 30, 10, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(74, 'HRT0001073', 'awaiting_approval', 45, 11, 'Select Medical Plan', 'hr service', 30, NULL, 'Generated task', TRUE, 30, 10, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(75, 'HRT0001074', 'awaiting_approval', 45, 11, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 30, 10, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(76, 'HRT0001075', 'closed_complete', 46, 4, 'Select Medical Plan', 'hr service', 31, NULL, 'Generated task', TRUE, 31, 11, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(77, 'HRT0001076', 'work_in_progress', 46, 4, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 31, 11, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(78, 'HRT0001077', 'closed_complete', 52, 6, 'Upload Voided Check', 'checklist', NULL, NULL, 'Generated task', FALSE, 32, 12, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(79, 'HRT0001078', 'closed_complete', 52, 6, 'Review Tax Withholdings', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 32, 12, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(80, 'HRT0001079', 'closed_complete', 52, 6, 'Confirm Pay Cycle', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 32, 12, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(81, 'HRT0001080', 'closed_incomplete', 54, 4, 'Review Tax Withholdings', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 33, 13, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(82, 'HRT0001081', 'closed_incomplete', 54, 4, 'Confirm Pay Cycle', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 33, 13, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(83, 'HRT0001082', 'closed_complete', 62, 6, 'Confirm Pay Cycle', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 34, 14, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(84, 'HRT0001083', 'closed_complete', 62, 6, 'Payroll Satisfaction Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 34, 14, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(85, 'HRT0001084', 'closed_complete', 62, 6, 'Verify Bank Details', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 34, 14, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(86, 'HRT0001085', 'suspended', 65, 4, 'Data Accuracy Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 35, 15, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(87, 'HRT0001086', 'suspended', 65, 4, 'Verify Home Address', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 35, 15, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(88, 'HRT0001087', 'cancelled', 66, 5, 'Watch Cultural Orientation Video', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 36, 16, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(89, 'HRT0001088', 'cancelled', 66, 5, 'Sign Non-Disclosure Agreement', 'checklist', NULL, NULL, 'Generated task', FALSE, 36, 16, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(90, 'HRT0001089', 'cancelled', 66, 5, 'Complete Background Check Form', 'hr service', 36, NULL, 'Generated task', FALSE, 36, 16, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(91, 'HRT0001090', 'draft', NULL, 4, 'Update Emergency Contacts', 'checklist', NULL, NULL, 'Generated task', FALSE, 37, 17, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(92, 'HRT0001091', 'draft', NULL, 4, 'Review Employee Handbook', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 37, 17, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(93, 'HRT0001092', 'ready', NULL, 11, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 38, 18, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(94, 'HRT0001093', 'ready', NULL, 11, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', TRUE, 38, 18, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(95, 'HRT0001094', 'ready', NULL, 11, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 38, 18, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(96, 'HRT0001095', 'awaiting_approval', 83, 4, 'Schedule Orientation Session', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 39, 19, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(97, 'HRT0001096', 'awaiting_approval', 83, 4, 'New Hire Feedback Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 39, 19, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(98, 'HRT0001097', 'closed_complete', 87, 5, 'New Hire Feedback Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 40, 20, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(99, 'HRT0001098', 'work_in_progress', 87, 5, 'Watch Cultural Orientation Video', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 40, 20, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(100, 'HRT0001099', 'ready', NULL, 5, 'Sign Non-Disclosure Agreement', 'checklist', NULL, NULL, 'Generated task', TRUE, 40, 20, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(101, 'HRT0001100', 'closed_complete', 91, 4, 'Watch Cultural Orientation Video', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 41, 1, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(102, 'HRT0001101', 'closed_complete', 91, 4, 'Sign Non-Disclosure Agreement', 'checklist', NULL, NULL, 'Generated task', FALSE, 41, 1, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(103, 'HRT0001102', 'closed_incomplete', 92, 5, 'Sign Non-Disclosure Agreement', 'checklist', NULL, NULL, 'Generated task', FALSE, 42, 2, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(104, 'HRT0001103', 'closed_incomplete', 92, 5, 'Complete Background Check Form', 'hr service', 42, NULL, 'Generated task', FALSE, 42, 2, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(105, 'HRT0001104', 'closed_incomplete', 92, 5, 'Schedule Orientation Session', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 42, 2, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(106, 'HRT0001105', 'closed_complete', 93, 4, 'Review Tax Withholdings', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 43, 3, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(107, 'HRT0001106', 'closed_complete', 93, 4, 'Confirm Pay Cycle', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 43, 3, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(108, 'HRT0001107', 'suspended', 95, 5, 'Schedule Orientation Session', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 44, 4, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(109, 'HRT0001108', 'suspended', 95, 5, 'New Hire Feedback Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 44, 4, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(110, 'HRT0001109', 'suspended', 95, 5, 'Watch Cultural Orientation Video', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 44, 4, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(111, 'HRT0001110', 'cancelled', 11, 4, 'Data Accuracy Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 45, 5, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(112, 'HRT0001111', 'cancelled', 11, 4, 'Verify Home Address', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 45, 5, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(113, 'HRT0001112', 'draft', NULL, 5, 'Verify Home Address', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 46, 6, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(114, 'HRT0001113', 'draft', NULL, 5, 'Update Emergency Contacts', 'checklist', NULL, NULL, 'Generated task', FALSE, 46, 6, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(115, 'HRT0001114', 'draft', NULL, 5, 'Review Employee Handbook', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 46, 6, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(116, 'HRT0001115', 'ready', NULL, 2, 'Reset Active Directory Password', 'hr service', 47, NULL, 'Generated task', TRUE, 47, 7, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(117, 'HRT0001116', 'ready', NULL, 2, 'Read IT Security Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 47, 7, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(118, 'HRT0001117', 'awaiting_approval', 15, 5, 'Complete Background Check Form', 'hr service', 48, NULL, 'Generated task', TRUE, 48, 8, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(119, 'HRT0001118', 'awaiting_approval', 15, 5, 'Schedule Orientation Session', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 48, 8, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(120, 'HRT0001119', 'awaiting_approval', 15, 5, 'New Hire Feedback Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 48, 8, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(121, 'HRT0001120', 'closed_complete', 22, 4, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', TRUE, 49, 9, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(122, 'HRT0001121', 'work_in_progress', 22, 4, 'Benefits Enrollment Survey', 'survey', NULL, NULL, 'Generated task', TRUE, 49, 9, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(123, 'HRT0001122', 'closed_complete', 42, 5, 'Data Accuracy Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 50, 10, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(124, 'HRT0001123', 'closed_complete', 42, 5, 'Verify Home Address', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 50, 10, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(125, 'HRT0001124', 'closed_complete', 42, 5, 'Update Emergency Contacts', 'checklist', NULL, NULL, 'Generated task', FALSE, 50, 10, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(126, 'HRT0001125', 'closed_incomplete', 43, 4, 'Select Medical Plan', 'hr service', 51, NULL, 'Generated task', FALSE, 51, 11, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(127, 'HRT0001126', 'closed_incomplete', 43, 4, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 51, 11, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(128, 'HRT0001127', 'closed_complete', 45, 11, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 52, 12, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(129, 'HRT0001128', 'closed_complete', 45, 11, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 52, 12, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(130, 'HRT0001129', 'closed_complete', 45, 11, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', FALSE, 52, 12, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),
(131, 'HRT0001130', 'suspended', 46, 4, 'Review 401k Matching Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 53, 13, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(132, 'HRT0001131', 'suspended', 46, 4, 'Upload Marriage Certificate', 'checklist', NULL, NULL, 'Generated task', TRUE, 53, 13, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),
(133, 'HRT0001132', 'cancelled', 52, 5, 'Schedule Orientation Session', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 54, 14, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(134, 'HRT0001133', 'cancelled', 52, 5, 'New Hire Feedback Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 54, 14, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(135, 'HRT0001134', 'cancelled', 52, 5, 'Watch Cultural Orientation Video', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', FALSE, 54, 14, '2023-09-15 10:05:00', '2023-09-15 10:05:00'),
(136, 'HRT0001135', 'draft', NULL, 4, 'Data Accuracy Survey', 'survey', NULL, NULL, 'Generated task', FALSE, 55, 15, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(137, 'HRT0001136', 'draft', NULL, 4, 'Verify Home Address', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 55, 15, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),
(138, 'HRT0001137', 'ready', NULL, 5, 'Verify Home Address', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 56, 16, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(139, 'HRT0001138', 'ready', NULL, 5, 'Update Emergency Contacts', 'checklist', NULL, NULL, 'Generated task', TRUE, 56, 16, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(140, 'HRT0001139', 'ready', NULL, 5, 'Review Employee Handbook', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 56, 16, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),
(141, 'HRT0001140', 'awaiting_approval', 9, 2, 'Verify VPN Access', 'mark when complete', NULL, NULL, 'Generated task', TRUE, 57, 17, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(142, 'HRT0001141', 'awaiting_approval', 9, 2, 'Reset Active Directory Password', 'hr service', 47, NULL, 'Generated task', TRUE, 57, 17, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(143, 'HRT0001142', 'awaiting_approval', 9, 2, 'Read IT Security Policy', 'url', NULL, 'https://kb.example.com/policy', 'Generated task', TRUE, 57, 17, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),
(144, 'HRT0001143', 'closed_complete', 23, 3, 'Confirm Hardware Receipt', 'checklist', NULL, NULL, 'Generated task', TRUE, 58, 18, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(145, 'HRT0001144', 'work_in_progress', 23, 3, 'Rate IT Support Experience', 'survey', NULL, NULL, 'Generated task', TRUE, 58, 18, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),
(146, 'HRT0001145', 'closed_complete', 24, 7, 'Rate IT Support Experience', 'survey', NULL, NULL, 'Generated task', FALSE, 59, 19, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(147, 'HRT0001146', 'closed_complete', 24, 7, 'Verify VPN Access', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 59, 19, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),
(148, 'HRT0001147', 'closed_incomplete', 81, 11, 'Select Medical Plan', 'hr service', 6, NULL, 'Generated task', FALSE, 60, 20, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),
(149, 'HRT0001148', 'closed_incomplete', 81, 11, 'Add Beneficiaries', 'mark when complete', NULL, NULL, 'Generated task', FALSE, 60, 20, '2023-06-15 10:05:00', '2023-06-15 10:05:00');

INSERT INTO checklist (checklist_item_description, checked, case_task_id, org_id, created_at, updated_at) VALUES
-- Task 2: Update Emergency Contacts (Draft)
('Navigate to profile settings', FALSE, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Add Primary Contact Name and Phone', FALSE, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Save changes', FALSE, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 3: Update Emergency Contacts (Ready)
('Navigate to profile settings', FALSE, 3, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Add Primary Contact Name and Phone', FALSE, 3, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Save changes', FALSE, 3, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 7: Confirm Hardware Receipt (Awaiting Approval)
('Verify Laptop Box Content', FALSE, 7, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Check for damage', FALSE, 7, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Turn on device', FALSE, 7, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 8: Confirm Hardware Receipt (Closed Complete - All True)
('Verify Laptop Box Content', TRUE, 8, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Check for damage', TRUE, 8, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Turn on device', TRUE, 8, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 19: Upload Marriage Certificate (Suspended - Mixed)
('Scan original certificate', TRUE, 19, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', FALSE, 19, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', FALSE, 19, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 21: Upload Marriage Certificate (Cancelled)
('Scan original certificate', FALSE, 21, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', FALSE, 21, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', FALSE, 21, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 25: Sign Non-Disclosure Agreement (Draft)
('Download NDA PDF', FALSE, 25, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Read Terms and Conditions', FALSE, 25, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e-Sign Document', FALSE, 25, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 27: Sign Non-Disclosure Agreement (Ready)
('Download NDA PDF', FALSE, 27, 11, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Read Terms and Conditions', FALSE, 27, 11, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e-Sign Document', FALSE, 27, 11, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 28: Sign Non-Disclosure Agreement (Awaiting Approval)
('Download NDA PDF', FALSE, 28, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Read Terms and Conditions', FALSE, 28, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e-Sign Document', FALSE, 28, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 32: Confirm Hardware Receipt (Work In Progress - Mixed)
('Verify Laptop Box Content', TRUE, 32, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Check for damage', FALSE, 32, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Turn on device', FALSE, 32, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 44: Confirm Hardware Receipt (Cancelled)
('Verify Laptop Box Content', FALSE, 44, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Check for damage', FALSE, 44, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Turn on device', FALSE, 44, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 46: Confirm Hardware Receipt (Draft)
('Verify Laptop Box Content', FALSE, 46, 19, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Check for damage', FALSE, 46, 19, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Turn on device', FALSE, 46, 19, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 55: Upload Marriage Certificate (Ready)
('Scan original certificate', FALSE, 55, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', FALSE, 55, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', FALSE, 55, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 58: Upload Marriage Certificate (Closed Incomplete - Mixed)
('Scan original certificate', TRUE, 58, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', TRUE, 58, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', FALSE, 58, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 64: Update Emergency Contacts (Suspended)
('Navigate to profile settings', TRUE, 64, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Add Primary Contact Name and Phone', FALSE, 64, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Save changes', FALSE, 64, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 66: Sign Non-Disclosure Agreement (Cancelled)
('Download NDA PDF', FALSE, 66, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Read Terms and Conditions', FALSE, 66, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e-Sign Document', FALSE, 66, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 71: Upload Marriage Certificate (Ready)
('Scan original certificate', FALSE, 71, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', FALSE, 71, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', FALSE, 71, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 78: Upload Voided Check (Closed Complete)
('Scan check', TRUE, 78, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Write VOID across front', TRUE, 78, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload image to Payroll portal', TRUE, 78, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 89: Sign Non-Disclosure Agreement (Cancelled)
('Download NDA PDF', FALSE, 89, 16, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Read Terms and Conditions', FALSE, 89, 16, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e-Sign Document', FALSE, 89, 16, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 91: Update Emergency Contacts (Draft)
('Navigate to profile settings', FALSE, 91, 17, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Add Primary Contact Name and Phone', FALSE, 91, 17, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Save changes', FALSE, 91, 17, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 94: Upload Marriage Certificate (Ready)
('Scan original certificate', FALSE, 94, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', FALSE, 94, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', FALSE, 94, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 100: Sign Non-Disclosure Agreement (Ready)
('Download NDA PDF', FALSE, 100, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Read Terms and Conditions', FALSE, 100, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e-Sign Document', FALSE, 100, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 102: Sign Non-Disclosure Agreement (Closed Complete)
('Download NDA PDF', TRUE, 102, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Read Terms and Conditions', TRUE, 102, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e-Sign Document', TRUE, 102, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 103: Sign Non-Disclosure Agreement (Closed Incomplete)
('Download NDA PDF', TRUE, 103, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Read Terms and Conditions', TRUE, 103, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e-Sign Document', FALSE, 103, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 114: Update Emergency Contacts (Draft)
('Navigate to profile settings', FALSE, 114, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Add Primary Contact Name and Phone', FALSE, 114, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Save changes', FALSE, 114, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 121: Upload Marriage Certificate (Closed Complete)
('Scan original certificate', TRUE, 121, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', TRUE, 121, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', TRUE, 121, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 125: Update Emergency Contacts (Closed Complete)
('Navigate to profile settings', TRUE, 125, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Add Primary Contact Name and Phone', TRUE, 125, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Save changes', TRUE, 125, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 130: Upload Marriage Certificate (Closed Complete)
('Scan original certificate', TRUE, 130, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', TRUE, 130, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', TRUE, 130, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 132: Upload Marriage Certificate (Suspended)
('Scan original certificate', TRUE, 132, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Verify date is legible', FALSE, 132, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Upload PDF', FALSE, 132, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Task 144: Confirm Hardware Receipt (Closed Complete)
('Verify Laptop Box Content', TRUE, 144, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Check for damage', TRUE, 144, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Turn on device', TRUE, 144, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO survey (survey_id, question_1, question_2, question_3, question_4, question_5, org_id, created_at, updated_at) VALUES
-- 1. HR Request Satisfaction Survey (From Screenshot)
(1, 'How easy was it to create your HR request?', 'Was your request completed within the expected time?', 'How satisfied are you with the way your agent handled the case?', 'Any other comments you would like us to know?', NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 2. New Hire Feedback Survey (For Onboarding Tasks)
(2, 'How would you rate your onboarding experience so far?', 'Did you receive your equipment on time?', 'How clear was the cultural orientation video?', 'Do you feel welcomed by your team?', 'What could we improve for future new hires?', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 3. Benefits Enrollment Survey (For Total Rewards Tasks)
(3, 'How easy was it to navigate the benefits portal?', 'Do you feel the benefits package meets your needs?', 'Was the enrollment window sufficient?', 'Did you understand the difference between the plans?', 'Any suggestions for next year''s enrollment?', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 4. IT Support Experience Survey (For HRIT Tasks)
(4, 'Was your technical issue resolved effectively?', 'How knowledgeable was the IT support agent?', 'How would you rate the speed of resolution?', 'Was the communication clear throughout the process?', 'Additional feedback for IT support?', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 5. Payroll Satisfaction Survey (For Payroll Tasks)
(5, 'Was your last paycheck accurate?', 'How easy is it to access your pay stubs?', 'Did you encounter any issues with direct deposit?', 'How helpful was the payroll team with your inquiry?', 'Any comments on the payroll process?', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 6. Data Accuracy Survey (For Workforce Admin Tasks)
(6, 'Is your personal information currently up to date?', 'Did you find it easy to update your profile?', 'How confident are you in the security of your data?', 'Were your emergency contacts easy to manage?', 'Any concerns regarding data privacy?', 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO survey_instance (survey_id, case_task_id, assigned_to, org_id, answer_1, answer_2, answer_3, answer_4, answer_5, created_at, updated_at) VALUES
(4, 9, 10, 4, 'Yes', 'Knowledgeable', 'Fast', 'Clear', 'Great job', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 11, 14, 5, 'Yes', 'Knowledgeable', 'Fast', 'Clear', 'Great job', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 20, 18, 8, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 23, 20, 10, 'Excellent', 'Yes', 'Clear', 'Yes', 'Nothing', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 34, 30, 14, 'Yes', 'Easy', 'No', 'Helpful', 'None', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 36, 34, 15, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 47, 47, 19, 'Yes', 'Knowledgeable', 'Fast', 'Clear', 'Great job', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 48, 48, 20, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 59, 56, 4, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 61, 58, 5, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 70, 63, 8, 'Excellent', 'Yes', 'Clear', 'Yes', 'Nothing', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 72, 64, 9, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 73, 69, 10, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 84, 74, 14, 'Yes', 'Easy', 'No', 'Helpful', 'None', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 86, 77, 15, 'Yes', 'Yes', 'Confident', 'Yes', 'No concerns', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 95, 82, 18, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 97, 85, 19, 'Excellent', 'Yes', 'Clear', 'Yes', 'Nothing', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 98, 86, 20, 'Excellent', 'Yes', 'Clear', 'Yes', 'Nothing', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 109, 97, 4, 'Excellent', 'Yes', 'Clear', 'Yes', 'Nothing', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 120, 2, 8, 'Excellent', 'Yes', 'Clear', 'Yes', 'Nothing', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 122, 7, 9, 'Easy', 'Yes', 'Sufficient', 'Yes', 'No', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 123, 8, 9, 'Yes', 'Yes', 'Confident', 'Yes', 'No concerns', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 136, 18, 13, 'Yes', 'Yes', 'Confident', 'Yes', 'No concerns', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 145, 21, 18, 'Yes', 'Knowledgeable', 'Fast', 'Clear', 'Great job', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 146, 27, 18, 'Yes', 'Knowledgeable', 'Fast', 'Clear', 'Great job', '2023-01-01 00:00:00', '2023-01-01 00:00:00');


INSERT INTO assignment_rules (assignment_rule_id, name, based_on_skills, based_on_country, based_on_priority, active, user_group, users, org_id, created_at, updated_at) VALUES
-- 1. HR Total Rewards Case (Routing to HR Service Desk)
(1, 'HR Total Rewards Case', '["Benefits", "401k"]', 'US', 'moderate', TRUE, 4, NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 2. HR Workforce Administration Case (Routing to Field Ops for critical issues)
(2, 'HR Workforce Administration Case', '["Onboarding", "Data Privacy"]', NULL, 'high', TRUE, 5, NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 3. HRIT Operations Case (Routing to IT Support L1)
(3, 'HRIT Operations Case', '["IT", "HR Systems"]', NULL, 'low', TRUE, 1, NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 4. HR Payroll Case (Routing to HR Service Desk)
(4, 'HR Payroll Case', '["Payroll", "Time Tracking"]', 'GB', 'moderate', TRUE, 4, NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 5. HR Talent Management Case (Routing to HR Service Desk)
(5, 'HR Talent Management Case', '["Hiring", "Talent Management"]', NULL, 'planning', TRUE, 4, NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 6. HR General Case (Routing to Global Service Desk)
(6, 'HR General Case', '["HR Policy"]', NULL, 'low', TRUE, 3, NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 7. Critical IT Escalation (Routing to IT Support L2)
(7, 'Critical IT Escalation', '["IT", "HR Systems"]', NULL, 'critical', TRUE, 2, NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 8. Brazil Payroll Specifics (Routing based on country)
(8, 'Brazil Payroll Support', '["Payroll"]', 'BR', 'high', TRUE, 4, NULL, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO escalation_rule (escalation_rule_id, escalate_from, escalate_to, org_id, created_at, updated_at) VALUES
-- 1. IT Support L1 -> IT Support L2 (Standard IT Escalation)
(1, 1, 2, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 2. Global Service Desk -> HR Service Desk (General to Specialized HR)
(2, 3, 4, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 3. Field Ops -> Network Infrastructure (On-site to Engineering)
(3, 5, 7, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 4. HR Service Desk -> HR Leadership Approval (Agent to Manager)
(4, 4, 10, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- 5. IT Support L2 -> Change Advisory Board (Major Incident/Change)
(5, 2, 9, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

INSERT INTO knowledge (knowledge_id, kb_number, title, body, state, visibility, owner_id, created_at, updated_at, org_id) VALUES
-- 1. Benefits Overview (From Image)
(1, 'KB0040002', 'Benefits Overview', 'Comprehensive guide to health, dental, and vision plans available for 2024.', 'published', 'internal', 32, '2023-01-01 00:00:00', '2024-06-14 03:01:17', 1),

-- 2. New Hire Orientation (From Image)
(2, 'KB0040001', 'New Hire Orientation', 'Welcome to the team! This article covers your first week schedule, badging, and IT setup.', 'published', 'internal', 32, '2023-01-01 00:00:00', '2024-06-14 03:01:17', 1),

-- 3. Leave of Absence Policy
(3, 'KB0040003', 'Leave of Absence Policy', 'Guidelines for requesting FMLA, personal leave, or sabbatical. Includes required forms.', 'published', 'internal', 39, '2023-02-15 10:00:00', '2023-05-20 14:30:00', 1),

-- 4. Travel and Expense Policy
(4, 'KB0040004', 'Global Travel & Expense Policy', 'Rules for booking flights, hotels, and per diem rates. Receipts required for expenses > $25.', 'published', 'internal', 39, '2023-03-10 09:00:00', '2023-08-12 11:15:00', 1),

-- 5. IT Security Guidelines
(5, 'KB0040005', 'IT Security Best Practices', 'How to create strong passwords, identify phishing emails, and secure your laptop.', 'published', 'external', 32, '2023-01-20 08:45:00', '2023-09-05 16:20:00', 1),

-- 6. Performance Review Process
(6, 'KB0040006', 'Annual Performance Review Guide', 'Step-by-step instructions for self-assessment and manager feedback in the performance tool.', 'published', 'internal', 39, '2023-10-01 13:00:00', '2023-11-01 09:00:00', 1);

INSERT INTO hr_case_knowledge (hr_case_kb_id, hr_case_id, knowledge_id, used_as, org_id, created_at, updated_at) VALUES
-- 1. Case 7 (Medical Benefits - Active) linked to KB 1 (Benefits Overview)
(1, 7, 1, 'applied', 7, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),

-- 2. Case 30 (Dental Benefits - Active) linked to KB 1 (Benefits Overview)
(2, 30, 1, 'applied', 10, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),

-- 3. Case 53 (Vision Benefits - Suspended) linked to KB 1 (Benefits Overview)
(3, 53, 1, 'suggested', 13, '2023-08-15 10:05:00', '2023-08-15 10:05:00'),

-- 4. Case 11 (Onboarding - Ready) linked to KB 2 (New Hire Orientation)
(4, 11, 2, 'suggested', 11, '2023-02-15 10:05:00', '2023-02-15 10:05:00'),

-- 5. Case 48 (NDA Submission - Awaiting Approval) linked to KB 2 (New Hire Orientation)
(5, 48, 2, 'applied', 8, '2023-03-15 10:05:00', '2023-03-15 10:05:00'),

-- 6. Case 6 (Leave of Absence - Closed Incomplete) linked to KB 3 (Leave Policy)
(6, 6, 3, 'applied', 6, '2023-06-15 10:05:00', '2023-06-15 10:05:00'),

-- 7. Case 1 (General Inquiry - Draft) linked to KB 3 (Leave Policy) - Auto-suggestion
(7, 1, 3, 'suggested', 1, '2023-01-15 10:05:00', '2023-01-15 10:05:00'),

-- 8. Case 43 (Credit Card Request - Awaiting Acceptance) linked to KB 4 (Travel Policy)
(8, 43, 4, 'applied', 3, '2023-07-15 10:05:00', '2023-07-15 10:05:00'),

-- 9. Case 14 (Payroll Discrepancy - Closed Complete) linked to KB 4 (Travel Policy) - Solved issue
(9, 14, 4, 'resolution', 14, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),

-- 10. Case 13 (Password Reset - WIP) linked to KB 5 (IT Security)
(10, 13, 5, 'applied', 13, '2023-04-15 10:05:00', '2023-04-15 10:05:00'),

-- 11. Case 5 (HR Portal Support - Closed Complete) linked to KB 5 (IT Security) - Solved issue
(11, 5, 5, 'resolution', 5, '2023-05-15 10:05:00', '2023-05-15 10:05:00'),

-- 12. Case 57 (Account Access - Awaiting Approval) linked to KB 5 (IT Security)
(12, 57, 5, 'suggested', 17, '2023-03-15 10:05:00', '2023-03-15 10:05:00');

INSERT INTO notification (notification_id, hr_case_id, email, type, status, created_at, org_id, updated_at) VALUES
(1, 1, 'christina.oliver.2@personal.example.com', 'report', 'draft', '2023-01-15 10:10:00', 1, '2023-01-15 10:10:00'),
(2, 2, 'denise.hawkins.7@personal.example.com', 'report', 'ready', '2023-02-15 10:10:00', 2, '2023-02-15 10:10:00'),
(3, 3, 'james.hill.8@personal.example.com', 'alert', 'ready', '2023-03-15 10:10:00', 3, '2023-03-15 10:10:00'),
(4, 4, 'brandon.davis.10@personal.example.com', 'update', 'ready', '2023-04-15 10:10:00', 4, '2023-04-15 10:10:00'),
(5, 5, 'kenneth.scott.14@personal.example.com', 'solution_proposal', 'closed_complete', '2023-05-15 10:10:00', 5, '2023-05-15 10:10:00'),
(6, 6, 'meghan.hernandez.16@personal.example.com', 'report', 'closed_complete', '2023-06-15 10:10:00', 6, '2023-06-15 10:10:00'),
(7, 7, 'terry.lopez.17@personal.example.com', 'solution_proposal', 'awaiting_acceptance', '2023-07-15 10:10:00', 7, '2023-07-15 10:10:00'),
(8, 8, 'david.ramirez.18@personal.example.com', 'reminder', 'ready', '2023-08-15 10:10:00', 8, '2023-08-15 10:10:00'),
(9, 9, 'angela.brooks.19@personal.example.com', 'alert', 'cancelled', '2023-09-15 10:10:00', 9, '2023-09-15 10:10:00'),
(10, 10, 'marc.henry.20@personal.example.com', 'report', 'draft', '2023-01-15 10:10:00', 10, '2023-01-15 10:10:00'),
(11, 11, 'andrew.bell.21@personal.example.com', 'report', 'ready', '2023-02-15 10:10:00', 11, '2023-02-15 10:10:00'),
(12, 12, 'ashley.krueger.27@personal.example.com', 'alert', 'ready', '2023-03-15 10:10:00', 12, '2023-03-15 10:10:00'),
(13, 13, 'sharon.fields.28@personal.example.com', 'update', 'ready', '2023-04-15 10:10:00', 13, '2023-04-15 10:10:00'),
(14, 14, 'randy.summers.30@personal.example.com', 'solution_proposal', 'closed_complete', '2023-05-15 10:10:00', 14, '2023-05-15 10:10:00'),
(15, 15, 'amanda.holmes.34@personal.example.com', 'report', 'closed_complete', '2023-06-15 10:10:00', 15, '2023-06-15 10:10:00'),
(16, 16, 'david.ford.35@personal.example.com', 'solution_proposal', 'awaiting_acceptance', '2023-07-15 10:10:00', 16, '2023-07-15 10:10:00'),
(17, 17, 'douglas.morse.36@personal.example.com', 'reminder', 'ready', '2023-08-15 10:10:00', 17, '2023-08-15 10:10:00'),
(18, 18, 'lisa.foley.44@personal.example.com', 'alert', 'cancelled', '2023-09-15 10:10:00', 18, '2023-09-15 10:10:00'),
(19, 19, 'michael.ward.47@personal.example.com', 'report', 'draft', '2023-01-15 10:10:00', 19, '2023-01-15 10:10:00'),
(20, 20, 'zachary.davis.48@personal.example.com', 'report', 'ready', '2023-02-15 10:10:00', 20, '2023-02-15 10:10:00'),
(21, 21, 'steven.manning.51@personal.example.com', 'alert', 'ready', '2023-03-15 10:10:00', 1, '2023-03-15 10:10:00'),
(22, 22, 'jennifer.taylor.53@personal.example.com', 'update', 'ready', '2023-04-15 10:10:00', 2, '2023-04-15 10:10:00'),
(23, 23, 'bethany.barnes.55@personal.example.com', 'solution_proposal', 'closed_complete', '2023-05-15 10:10:00', 3, '2023-05-15 10:10:00'),
(24, 24, 'patrick.ross.56@personal.example.com', 'report', 'closed_complete', '2023-06-15 10:10:00', 4, '2023-06-15 10:10:00'),
(25, 25, 'ian.johnson.58@personal.example.com', 'solution_proposal', 'awaiting_acceptance', '2023-07-15 10:10:00', 5, '2023-07-15 10:10:00'),
(26, 26, 'kristen.mitchell.60@personal.example.com', 'reminder', 'ready', '2023-08-15 10:10:00', 6, '2023-08-15 10:10:00'),
(27, 27, 'emily.faulkner.61@personal.example.com', 'alert', 'cancelled', '2023-09-15 10:10:00', 7, '2023-09-15 10:10:00'),
(28, 28, 'thomas.bailey.63@personal.example.com', 'report', 'draft', '2023-01-15 10:10:00', 8, '2023-01-15 10:10:00'),
(29, 29, 'theresa.fisher.64@personal.example.com', 'report', 'ready', '2023-02-15 10:10:00', 9, '2023-02-15 10:10:00'),
(30, 30, 'robyn.jacobs.69@personal.example.com', 'alert', 'ready', '2023-03-15 10:10:00', 10, '2023-03-15 10:10:00'),
(31, 31, 'nathan.scott.70@personal.example.com', 'update', 'ready', '2023-04-15 10:10:00', 11, '2023-04-15 10:10:00'),
(32, 32, 'zachary.garcia.71@personal.example.com', 'solution_proposal', 'closed_complete', '2023-05-15 10:10:00', 12, '2023-05-15 10:10:00'),
(33, 33, 'austin.tran.73@personal.example.com', 'report', 'closed_complete', '2023-06-15 10:10:00', 13, '2023-06-15 10:10:00'),
(34, 34, 'kayla.lutz.74@personal.example.com', 'solution_proposal', 'awaiting_acceptance', '2023-07-15 10:10:00', 14, '2023-07-15 10:10:00'),
(35, 35, 'hannah.gallagher.77@personal.example.com', 'reminder', 'ready', '2023-08-15 10:10:00', 15, '2023-08-15 10:10:00'),
(36, 36, 'michelle.smith.78@personal.example.com', 'alert', 'cancelled', '2023-09-15 10:10:00', 16, '2023-09-15 10:10:00'),
(37, 37, 'theresa.miller.79@personal.example.com', 'report', 'draft', '2023-01-15 10:10:00', 17, '2023-01-15 10:10:00'),
(38, 38, 'carl.brown.82@personal.example.com', 'report', 'ready', '2023-02-15 10:10:00', 18, '2023-02-15 10:10:00'),
(39, 39, 'alex.johnson.85@personal.example.com', 'alert', 'ready', '2023-03-15 10:10:00', 19, '2023-03-15 10:10:00'),
(40, 40, 'steven.nguyen.86@personal.example.com', 'update', 'ready', '2023-04-15 10:10:00', 20, '2023-04-15 10:10:00'),
(41, 41, 'nancy.mcneil.88@personal.example.com', 'solution_proposal', 'closed_complete', '2023-05-15 10:10:00', 1, '2023-05-15 10:10:00'),
(42, 42, 'heather.ball.90@personal.example.com', 'report', 'closed_complete', '2023-06-15 10:10:00', 2, '2023-06-15 10:10:00'),
(43, 43, 'wyatt.moreno.94@personal.example.com', 'solution_proposal', 'awaiting_acceptance', '2023-07-15 10:10:00', 3, '2023-07-15 10:10:00'),
(44, 44, 'erin.davis.97@personal.example.com', 'reminder', 'ready', '2023-08-15 10:10:00', 4, '2023-08-15 10:10:00'),
(45, 45, 'christopher.meza.98@personal.example.com', 'alert', 'cancelled', '2023-09-15 10:10:00', 5, '2023-09-15 10:10:00'),
(46, 46, 'john.ramirez.99@personal.example.com', 'report', 'draft', '2023-01-15 10:10:00', 6, '2023-01-15 10:10:00'),
(47, 47, 'lauren.diaz.100@personal.example.com', 'report', 'ready', '2023-02-15 10:10:00', 7, '2023-02-15 10:10:00'),
(48, 48, 'christina.oliver.2@personal.example.com', 'alert', 'ready', '2023-03-15 10:10:00', 8, '2023-03-15 10:10:00'),
(49, 49, 'denise.hawkins.7@personal.example.com', 'update', 'ready', '2023-04-15 10:10:00', 9, '2023-04-15 10:10:00'),
(50, 50, 'james.hill.8@personal.example.com', 'solution_proposal', 'closed_complete', '2023-05-15 10:10:00', 10, '2023-05-15 10:10:00'),
(51, 51, 'brandon.davis.10@personal.example.com', 'report', 'closed_complete', '2023-06-15 10:10:00', 11, '2023-06-15 10:10:00'),
(52, 52, 'kenneth.scott.14@personal.example.com', 'solution_proposal', 'awaiting_acceptance', '2023-07-15 10:10:00', 12, '2023-07-15 10:10:00'),
(53, 53, 'meghan.hernandez.16@personal.example.com', 'reminder', 'ready', '2023-08-15 10:10:00', 13, '2023-08-15 10:10:00'),
(54, 54, 'terry.lopez.17@personal.example.com', 'alert', 'cancelled', '2023-09-15 10:10:00', 14, '2023-09-15 10:10:00'),
(55, 55, 'david.ramirez.18@personal.example.com', 'report', 'draft', '2023-01-15 10:10:00', 15, '2023-01-15 10:10:00'),
(56, 56, 'angela.brooks.19@personal.example.com', 'report', 'ready', '2023-02-15 10:10:00', 16, '2023-02-15 10:10:00'),
(57, 57, 'marc.henry.20@personal.example.com', 'alert', 'ready', '2023-03-15 10:10:00', 17, '2023-03-15 10:10:00'),
(58, 58, 'andrew.bell.21@personal.example.com', 'update', 'ready', '2023-04-15 10:10:00', 18, '2023-04-15 10:10:00'),
(59, 59, 'ashley.krueger.27@personal.example.com', 'solution_proposal', 'closed_complete', '2023-05-15 10:10:00', 19, '2023-05-15 10:10:00'),
(60, 60, 'sharon.fields.28@personal.example.com', 'report', 'closed_complete', '2023-06-15 10:10:00', 20, '2023-06-15 10:10:00');



-- ============================================
-- Agent Identity Patch (cross-MCP consistent identities)
-- Specialized MCP: hr
-- ============================================
-- HR Service Specialist (hr)
-- Selected user: user_id=15 (agent, member of group 4: HR Service Desk)
UPDATE user
SET first_name='Helen', last_name='Zhou', email='helen.zhou@techcorp.com', static_token='AGT_HR_SRVC_TOKEN_V1'
WHERE user_id=15;

-- Align onboarding case tenant/assignee with HR specialist identity used in benchmark.
-- This avoids cross-org permission rejection for token AGT_HR_SRVC_TOKEN_V1.
-- UPDATE hr_case
-- SET org_id=1, assigned_to=15, assignment_group=4
-- WHERE hr_case_id=11;

-- Ensure role mapping is consistent with the role column above.
UPDATE user_role
SET role_id=2
WHERE user_id=15;

-- Knowledge Base Specialist (cross ITSM/HR/CSM), admin profile
UPDATE user
SET first_name='Priya', last_name='Nair', email='priya.nair@techcorp.com', static_token='AGT_KB_SPEC_TOKEN_V1'
WHERE user_id=39;


-- ============================================
-- End of Seed Data
-- ============================================
