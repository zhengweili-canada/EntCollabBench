-- Database Seed Data for: tavishi_v5_new_teams_internal_prod
-- Database ID: db_1764923289936_qliwz9if0
-- MCP Server: teams-internal-prod
-- Created: 2025-12-05 08:28:28.352466+00:00
-- Description: No description provided
-- NOTE: This is seed data fallback (export-sql API was unavailable)

-- ============================================
-- SEED DATA (SQL Statements)
-- ============================================

-- Multi-User Teams Sample Data for multi_user_teams
-- Generated on: 2025-12-05T08:27:52.013892
-- Uses teams_orgs and teams_users schema with TechCorp + GlobalEx organizations

-- Organizations (TechCorp + GlobalEx)
INSERT INTO teams_orgs (org_id, tenant_id, display_name, domain_name, country_letter_code, preferred_language, created_at, updated_at, soft_deleted) VALUES
('techcorp-001', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'TechCorp Solutions', 'techcorp.com', 'US', 'en-US', datetime('now'), datetime('now'), 0),
('globalex-002', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', 'GlobalEx Industries', 'globalex.com', 'CA', 'en-CA', datetime('now'), datetime('now'), 0);

-- Teams Users (teams_users) - Enhanced with 20 new Microsoft Graph API fields
INSERT INTO teams_users (org_id, user_id, user_principal_name, display_name, job_title, mail, given_name, surname, mail_nickname, account_enabled, business_phones, mobile_phone, office_location, preferred_language, department, company_name, usage_location, city, state, country, street_address, postal_code, employee_id, employee_type, user_type, employee_hire_date, other_mails, on_premises_sync_enabled, about_me, birthday, interests, skills, my_site, preferred_name, fax_number, age_group, is_resource_account, past_projects, responsibilities, schools, employee_org_data, static_token, created_at, updated_at, soft_deleted) VALUES
('techcorp-001', 'alice.johnson', 'alice.manager@techcorp.com', 'Alice Johnson', 'Project Manager', 'alice.manager@techcorp.com', 'Alice', 'Johnson', 'alice.manager', 1, '["+1 (555) 123-4567", "+1 (555) 123-4568"]', '+1 (555) 987-6543', 'Building A, Floor 3, Room 301', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E001234', 'Employee', 'Member', '2020-03-15T00:00:00+00:00', '["alice.j@techcorp.com", "ajohnson@techcorp.com"]', 0, 'Experienced project manager passionate about agile methodologies and team collaboration. I thrive in fast-paced environments and love bringing teams together to achieve ambitious goals.', '1988-06-20T00:00:00+00:00', '["Project Management", "Agile Methodologies", "Team Building", "Leadership"]', '["Scrum", "Jira", "Stakeholder Management", "Risk Assessment", "Agile Coaching"]', 'https://alice-johnson-pm.com', 'Ali', '+1 (555) 123-4569', 'Adult', 0, '["Platform Migration 2022", "Mobile App Launch", "Cloud Infrastructure Upgrade"]', '["Team Leadership", "Sprint Planning", "Client Communication", "Budget Management"]', '["MIT", "Harvard Business School"]', '{"costCenter": "CC-ENG-001", "division": "Engineering"}', 'ya29.A0ARrdaM-k9Vq7GzY2pL4mQf8sN1xT0bR3uHcJWv5yKzP6eF2.qwErTyUIopASDfGhJkLzXcVbNm12_34-56', datetime('now'), datetime('now'), 0),
('techcorp-001', 'bob.smith', 'bob.smith@techcorp.com', 'Bob Smith', 'Senior Developer', 'bob.smith@techcorp.com', 'Bob', 'Smith', 'bob.smith', 1, '["+1 (555) 234-5678"]', '+1 (555) 876-5432', 'Building B, Floor 2, Room 205', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E001235', 'Employee', 'Member', '2021-07-01T00:00:00+00:00', '["robert.smith@techcorp.com"]', 0, 'Full-stack developer specializing in cloud-native applications and microservices architecture. Always learning and exploring new technologies.', '1992-03-10T00:00:00+00:00', '["Cloud Computing", "DevOps", "Open Source", "Machine Learning"]', '["Python", "React", "Kubernetes", "Azure", "Docker", "TypeScript", "FastAPI"]', 'https://bobsmith.dev', 'Bobby', NULL, 'Adult', 0, '["API Gateway Migration", "Microservices Platform", "CI/CD Pipeline"]', '["Code Reviews", "Architecture Design", "Mentoring Junior Developers", "Technical Documentation"]', '["Stanford University", "UC Berkeley"]', '{"costCenter": "CC-ENG-001", "division": "Engineering"}', 'ya29.A0ARrdaM-Zx8Nw3Q4pVb6Ls9R1mT0cG2uF5yH7kJd8sA1Lq2.wErtYuIoPaSdFgHjKlZxCvBnM987_65-43', datetime('now'), datetime('now'), 0),
('techcorp-001', 'carol.white', 'carol.white@techcorp.com', 'Carol White', 'UX Designer', 'carol.white@techcorp.com', 'Carol', 'White', 'carol.white', 1, '["+1 (555) 345-6789"]', '+1 (555) 765-4321', 'Building A, Floor 2, Room 201', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E001236', 'Employee', 'Member', '2021-02-10T00:00:00+00:00', '["c.white@techcorp.com"]', 0, 'Creative UX designer focused on user-centered design and accessibility. I believe great design should be invisible yet transformative.', '1991-11-08T00:00:00+00:00', '["UI/UX Design", "Accessibility", "Design Systems", "User Research"]', '["Figma", "Adobe XD", "User Research", "Prototyping", "Design Thinking"]', 'https://carolwhite.design', 'Carol', NULL, 'Adult', 0, '["Design System Overhaul", "Mobile App Redesign", "Accessibility Audit 2023"]', '["UI/UX Design", "User Research", "Design System Maintenance", "Accessibility Compliance"]', '["Rhode Island School of Design", "Parsons School of Design"]', '{"costCenter": "CC-DES-001", "division": "Design"}', 'ya29.A0ARrdaM-b7Hc5Vn2Qm8R1sT4pL0xY9wK3uF6jZ2eRc1.QaWsEdRfTgHyJuIkOlPzXcVbNmKjHgf_21-098', datetime('now'), datetime('now'), 0),
('techcorp-001', 'dave.brown', 'dave.brown@techcorp.com', 'Dave Brown', 'Sales Director', 'dave.brown@techcorp.com', 'Dave', 'Brown', 'dave.brown', 1, '["+1 (555) 456-7890", "+1 (555) 456-7891"]', '+1 (555) 654-3210', 'Building C, Floor 4, Room 401', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E001237', 'Employee', 'Member', '2019-08-20T00:00:00+00:00', '["d.brown@techcorp.com", "david.brown@techcorp.com"]', 0, 'Results-driven sales director with 10+ years of experience building high-performing teams and closing enterprise deals.', '1985-04-12T00:00:00+00:00', '["Sales Strategy", "Business Development", "Networking", "Golf"]', '["Enterprise Sales", "Negotiation", "CRM (Salesforce)", "Team Leadership", "Account Management"]', NULL, 'Dave', '+1 (555) 456-7892', 'Adult', 0, '["Enterprise Sales Expansion 2022", "Partner Program Launch", "EMEA Market Entry"]', '["Sales Team Leadership", "Revenue Growth", "Strategic Partnerships", "Client Relations"]', '["UCLA Anderson School of Management", "University of Texas"]', '{"costCenter": "CC-SAL-001", "division": "Sales"}', 'ya29.A0ARrdaM-p3Lk9Vb6Qw2Zx8N1sT4mH7gF5yR0uJc2ePq.ZxCvBnMlKjHgFfDsaQwErTyUiOpAsDfGhJk_77-11', datetime('now'), datetime('now'), 0),
('techcorp-001', 'james.wilson', 'james.wilson@techcorp.com', 'James Wilson', 'Super Administrator', 'james.wilson@techcorp.com', 'James', 'Wilson', 'james.wilson', 1, '["+1 (555) 999-0001"]', '+1 (555) 999-9999', 'Executive Office, All Access', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E000001', 'Employee', 'Member', '2015-01-01T00:00:00+00:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', 0, NULL, '["Global System Administration", "Security Oversight", "Compliance Management"]', NULL, '{"costCenter": "CC-ADM-001", "division": "Administration"}', 'ya29.A0ARrdaM-super999unique888token777special666.SuperUserAllPermissionsTokenAccess_99-99', datetime('now'), datetime('now'), 0),
('techcorp-001', 'admin.system', 'admin@techcorp.com', 'System Administrator', 'System Administrator', 'admin@techcorp.com', 'System', 'Administrator', 'admin', 1, '["+1 (555) 100-0001"]', '+1 (555) 900-0001', 'IT Department, Server Room', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E000010', 'Employee', 'Member', '2018-05-10T00:00:00+00:00', NULL, 0, NULL, NULL, '["System Architecture", "Automation", "Cybersecurity"]', '["Windows Server", "Active Directory", "PowerShell", "Azure", "Network Security"]', NULL, NULL, NULL, 'Adult', 0, NULL, '["System Maintenance", "User Account Management", "Security Monitoring"]', '["Carnegie Mellon University"]', '{"costCenter": "CC-IT-001", "division": "IT"}', 'ya29.A0ARrdaM-admin123unique456token789special012.AdminSecureTokenForSystemAccess_99-00', datetime('now'), datetime('now'), 0),
('techcorp-001', 'sarah.martinez', 'hr.coordinator@techcorp.com', 'Sarah Martinez', 'Human Resources Coordinator', 'hr.coordinator@techcorp.com', 'Sarah', 'Martinez', 'hr.coordinator', 1, '["+1 (555) 200-0001"]', '+1 (555) 800-0001', 'Building A, Floor 1, HR Department', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E001240', 'Employee', 'Member', '2020-09-01T00:00:00+00:00', NULL, 0, 'HR professional dedicated to creating positive workplace experiences and supporting employee development.', '1989-07-25T00:00:00+00:00', '["Employee Relations", "Talent Development", "Workplace Culture"]', '["HRIS", "Recruitment", "Employee Relations", "Benefits Administration", "Compliance"]', NULL, 'Sarah', NULL, 'Adult', 0, NULL, '["Employee Onboarding", "Benefits Coordination", "HR Policy Compliance"]', '["Cornell University"]', '{"costCenter": "CC-HR-001", "division": "Human Resources"}', 'ya29.A0ARrdaM-hr456unique789token012special345.HRCoordinatorSecureTokenAccess_88-11', datetime('now'), datetime('now'), 0),
('techcorp-001', 'mike.thompson', 'it.support@techcorp.com', 'Mike Thompson', 'IT Support Specialist', 'it.support@techcorp.com', 'Mike', 'Thompson', 'it.support', 1, '["+1 (555) 300-0001"]', '+1 (555) 700-0001', 'Building B, Floor 1, IT Support', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E001245', 'Employee', 'Member', '2022-01-15T00:00:00+00:00', NULL, 0, 'IT support specialist helping users solve technical challenges and maintain productivity.', '1995-02-28T00:00:00+00:00', '["Hardware", "Troubleshooting", "Customer Service"]', '["Windows", "macOS", "Office 365", "Troubleshooting", "Help Desk"]', NULL, 'Mike', NULL, 'Adult', 0, NULL, '["User Support", "Hardware Maintenance", "Software Installation"]', '["DeVry University"]', '{"costCenter": "CC-IT-001", "division": "IT"}', 'ya29.A0ARrdaM-it789unique012token345special678.ITSupportSecureTokenAccess_77-22', datetime('now'), datetime('now'), 0),
('techcorp-001', 'john.davis', 'john.intern@techcorp.com', 'John Davis', 'Software Engineering Intern', 'john.intern@techcorp.com', 'John', 'Davis', 'john.intern', 1, NULL, '+1 (555) 600-0001', 'Building B, Floor 2, Intern Desk 5', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'I001250', 'Intern', 'Member', '2024-06-01T00:00:00+00:00', NULL, 0, 'Computer Science student passionate about machine learning and AI. Eager to learn and contribute to innovative projects.', '2002-09-15T00:00:00+00:00', '["Machine Learning", "AI", "Python Programming", "Gaming"]', '["Python", "TensorFlow", "Git", "Linux", "Java"]', NULL, 'John', NULL, 'Adult', 0, NULL, '["Learning", "Assisting Senior Developers", "Code Testing"]', '["University of Washington"]', '{"costCenter": "CC-ENG-001", "division": "Engineering"}', 'ya29.A0ARrdaM-intern012unique345token678special901.InternSecureTokenAccess_66-33', datetime('now'), datetime('now'), 0),
('techcorp-001', 'teams.service', 'teams-service@techcorp.com', 'Teams Service Account', 'Service Account', 'teams-service@techcorp.com', 'Teams', 'Service', 'teams-service', 1, NULL, NULL, 'System/Automated', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SVC-APP-001', 'Service', 'Application', '2024-01-01T00:00:00+00:00', NULL, 0, 'Automated service account for Teams provisioning with Application-level permissions. Used for creating chats and teams without user context.', NULL, NULL, NULL, NULL, NULL, NULL, 'NotApplicable', 1, NULL, '["Automated Chat Provisioning", "Service Integration", "System Operations"]', NULL, '{"costCenter": "CC-SYS-001", "division": "System Services"}', 'ya29.A0ARrdaM-service999app888application777.TeamsServiceAccountApplicationPermissionsToken_99-88', datetime('now'), datetime('now'), 0),
('techcorp-001', 'nathan.richards', 'nathan.richards@techcorp.com', 'Nathan Richards', 'Security Architect', 'nathan.richards@techcorp.com', 'Nathan', 'Richards', 'nathan.richards', 1, '["+1 (555) 111-2222"]', '+1 (555) 111-3333', 'Building A, Floor 5, Room 501', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E001250', 'Employee', 'Member', '2022-03-15T00:00:00+00:00', '["n.richards@techcorp.com"]', 0, 'Security architect specializing in identity and access management. Focused on implementing secure authentication and authorization patterns across enterprise applications.', '1987-05-12T00:00:00+00:00', '["Cybersecurity", "Identity Management", "Cloud Security", "Zero Trust Architecture"]', '["Azure AD", "OAuth 2.0", "Microsoft Graph API", "Security Architecture", "Identity Governance"]', NULL, 'Nathan', NULL, 'Adult', 0, NULL, '["Security Architecture", "Identity Management", "Access Control Implementation", "Security Compliance"]', '["Massachusetts Institute of Technology", "Stanford University"]', '{"costCenter": "CC-SEC-001", "division": "Security"}', 'ya29.A0ARrdaM-nathan111richards222super333token444.NathanRichardsSecurityArchitectToken_11-22', datetime('now'), datetime('now'), 0),
('techcorp-001', 'sophia.bennett', 'sophia.bennett@techcorp.com', 'Sophia Bennett', 'Integration Services Manager', 'sophia.bennett@techcorp.com', 'Sophia', 'Bennett', 'sophia.bennett', 1, '["+1 (555) 222-3333"]', '+1 (555) 222-4444', 'Building C, Floor 3, Room 305', 'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E001255', 'Employee', 'Member', '2021-08-20T00:00:00+00:00', '["s.bennett@techcorp.com"]', 0, 'Integration services manager responsible for enterprise application integrations and API management. Specialized in building scalable background services and automated workflows.', '1985-09-25T00:00:00+00:00', '["Enterprise Integration", "API Management", "Service Architecture", "Automation"]', '["API Integration", "Microservices", "Azure", "Service Architecture", "Background Services"]', NULL, 'Sophia', NULL, 'Adult', 0, NULL, '["Application Integration", "Service Management", "API Strategy", "Automation Workflows"]', '["Carnegie Mellon University", "University of California Berkeley"]', '{"costCenter": "CC-ENG-001", "division": "Engineering"}', 'ya29.A0ARrdaM-sophia555bennett666integration777token888.SophiaBennettIntegrationManagerToken_55-66', datetime('now'), datetime('now'), 0),
('globalex-002', 'robert.taylor', 'robert.taylor@globalex.com', 'Robert Taylor', 'Super Administrator', 'robert.taylor@globalex.com', 'Robert', 'Taylor', 'robert.taylor', 1, '["+1 (416) 555-999-0001"]', '+1 (416) 555-999-9999', 'Executive Office, All Access', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G000001', 'Employee', 'Member', '2014-06-01T00:00:00+00:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', 0, NULL, '["Global System Administration", "Security Oversight", "Compliance Management"]', NULL, '{"costCenter": "CC-ADM-002", "division": "Administration"}', 'ya29.B1CRrdaM-super888unique777token666special555.GlobalExSuperUserAllPermissionsTokenAccess_99-99', datetime('now'), datetime('now'), 0),
('globalex-002', 'emma.wilson', 'emma.wilson@globalex.com', 'Emma Wilson', 'Chief Executive Officer', 'emma.wilson@globalex.com', 'Emma', 'Wilson', 'emma.wilson', 1, '["+1 (416) 555-1000", "+1 (416) 555-1001"]', '+1 (416) 555-9000', 'Executive Floor, Corner Office', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G100001', 'Employee', 'Member', '2016-01-05T00:00:00+00:00', '["e.wilson@globalex.com", "ceo@globalex.com"]', 0, 'Visionary CEO with 15+ years leading global organizations. Passionate about innovation, sustainability, and building world-class teams.', '1978-05-15T00:00:00+00:00', '["Strategic Planning", "Innovation", "Sustainability", "Leadership Development"]', '["Strategic Leadership", "P&L Management", "M&A", "Board Relations", "Global Operations"]', 'https://emmawilson.com', 'Emma', '+1 (416) 555-1002', 'Adult', 0, '["Global Expansion 2020", "Digital Transformation Initiative", "Sustainability Program"]', '["Corporate Strategy", "Board Leadership", "Stakeholder Relations", "Vision Setting"]', '["Harvard Business School", "Yale University"]', '{"costCenter": "CC-EXE-002", "division": "Executive"}', 'ya29.B1CRrdaM-h8Kw4Q5pVc7Lt8S2nU1dH3vG6yI9kJe9tB2Mq3.xFsuZvJqPbTeFgIjLmZyCwDnN234_12-567', datetime('now'), datetime('now'), 0),
('globalex-002', 'frank.chen', 'frank.chen@globalex.com', 'Frank Chen', 'Chief Technology Officer', 'frank.chen@globalex.com', 'Frank', 'Chen', 'frank.chen', 1, '["+1 (416) 555-2000"]', '+1 (416) 555-8000', 'Tech Hub, Floor 5, Room 501', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G100002', 'Employee', 'Member', '2017-03-20T00:00:00+00:00', '["f.chen@globalex.com", "cto@globalex.com"]', 0, 'Technology leader driving digital innovation and cloud transformation. Experienced in scaling engineering organizations globally.', '1982-11-03T00:00:00+00:00', '["Cloud Architecture", "AI/ML", "Tech Innovation", "Open Source"]', '["Cloud Architecture", "DevOps", "AI/ML", "Team Scaling", "Technology Strategy"]', 'https://frankchen.tech', 'Frank', NULL, 'Adult', 0, '["Cloud Migration 2019", "AI Platform Launch", "DevOps Transformation"]', '["Technology Strategy", "Engineering Leadership", "Innovation", "Architecture Oversight"]', '["MIT", "Carnegie Mellon University"]', '{"costCenter": "CC-ENG-002", "division": "Engineering"}', 'ya29.B1CRrdaM-m9Rx5V7qXd8Nu9T3oW2eI4wH7zJ0lKf0uC3Nr4.yGtvAwKrQcUfHgJkMnAzDxEoO345_23-678', datetime('now'), datetime('now'), 0),
('globalex-002', 'grace.kim', 'grace.kim@globalex.com', 'Grace Kim', 'Human Resources Director', 'grace.kim@globalex.com', 'Grace', 'Kim', 'grace.kim', 1, '["+1 (416) 555-3000", "+1 (416) 555-3001"]', '+1 (416) 555-7000', 'Building North, Floor 3, Room 302', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G100003', 'Employee', 'Member', '2018-07-15T00:00:00+00:00', '["g.kim@globalex.com"]', 0, 'HR leader focused on building inclusive workplace cultures and developing talent pipelines for global organizations.', '1986-08-22T00:00:00+00:00', '["Talent Development", "DEI Initiatives", "Employee Engagement", "Organizational Culture"]', '["Talent Management", "Employee Relations", "Compensation & Benefits", "HR Strategy", "Change Management"]', NULL, 'Grace', '+1 (416) 555-3002', 'Adult', 0, '["Global Talent Program 2021", "DEI Strategy Implementation", "Performance Management Overhaul"]', '["HR Strategy", "Talent Acquisition", "Employee Development", "Compliance"]', '["University of Toronto", "Queen''s University"]', '{"costCenter": "CC-HR-002", "division": "Human Resources"}', 'ya29.B1CRrdaM-r0Sy6W8rYe9Ov0U4pX3fJ5xI8aL1mNg1vD4Os5.zHuwBxLsRdVgIhKlOnBaEyFpP456_34-789', datetime('now'), datetime('now'), 0),
('globalex-002', 'henry.lopez', 'henry.lopez@globalex.com', 'Henry Lopez', 'Operations Manager', 'henry.lopez@globalex.com', 'Henry', 'Lopez', 'henry.lopez', 1, '["+1 (416) 555-4000"]', '+1 (416) 555-6000', 'Operations Center, Floor 1, Room 101', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G100004', 'Employee', 'Member', '2019-11-12T00:00:00+00:00', '["h.lopez@globalex.com"]', 0, 'Operations manager optimizing processes and driving efficiency across global supply chains.', '1987-03-18T00:00:00+00:00', '["Supply Chain", "Process Optimization", "Logistics", "Quality Management"]', '["Operations Management", "Lean Six Sigma", "Supply Chain", "Project Management", "SAP"]', NULL, 'Henry', NULL, 'Adult', 0, '["Supply Chain Optimization 2022", "Warehouse Automation", "Quality System Implementation"]', '["Operations Planning", "Process Improvement", "Vendor Management", "Quality Control"]', '["University of British Columbia", "McGill University"]', '{"costCenter": "CC-OPS-002", "division": "Operations"}', 'ya29.B1CRrdaM-s1Tz7X9sZf0Pw1V5qY4gK6yJ9bM2nOh2wE5Pt6.aIvxCyMtSeWhJiLmPoCbFzGqQ567_45-890', datetime('now'), datetime('now'), 0),
('globalex-002', 'iris.patel', 'iris.employee@globalex.com', 'Iris Patel', 'Marketing Specialist', 'iris.employee@globalex.com', 'Iris', 'Patel', 'iris.employee', 1, '["+1 (416) 555-5000"]', '+1 (416) 555-5500', 'Marketing Department, Floor 2, Room 201', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G100005', 'Employee', 'Member', '2021-04-01T00:00:00+00:00', '["i.patel@globalex.com"]', 0, 'Marketing specialist crafting compelling campaigns and building brand awareness in competitive markets.', '1994-12-05T00:00:00+00:00', '["Digital Marketing", "Content Strategy", "Social Media", "Analytics"]', '["SEO", "Google Analytics", "Content Marketing", "Social Media Marketing", "Adobe Creative Suite"]', NULL, 'Iris', NULL, 'Adult', 0, '["Product Launch Campaign 2023", "Brand Refresh", "Social Media Strategy"]', '["Campaign Management", "Content Creation", "Analytics Reporting", "Brand Consistency"]', '["University of Toronto", "Ryerson University"]', '{"costCenter": "CC-MKT-002", "division": "Marketing"}', 'ya29.B1CRrdaM-iris234unique567token890special123.IrisEmployeeSecureTokenAccess_55-44', datetime('now'), datetime('now'), 0),
('globalex-002', 'jack.morrison', 'jack.contractor@globalex.com', 'Jack Morrison', 'External IT Contractor', 'jack.contractor@globalex.com', 'Jack', 'Morrison', 'jack.contractor', 1, NULL, '+1 (416) 555-9999', 'Contractor Workspace, Floor 1', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'C002100', 'Contractor', 'Guest', '2024-01-15T00:00:00+00:00', '["jack.m@example.com"]', 0, 'IT contractor specializing in infrastructure, security, and cloud migrations. Available for short-term projects.', '1990-07-30T00:00:00+00:00', '["Cybersecurity", "Network Architecture", "Cloud Security"]', '["Network Security", "Firewall Management", "Azure Security", "Penetration Testing", "Compliance"]', NULL, 'Jack', NULL, 'Adult', 0, '["Security Audit 2024", "Network Infrastructure Upgrade"]', '["Security Assessment", "Infrastructure Maintenance", "Compliance Review"]', '["University of Waterloo"]', '{"costCenter": "CC-IT-002", "division": "IT Operations"}', 'ya29.B1CRrdaM-jack567unique890token123special456.JackContractorSecureTokenAccess_44-55', datetime('now'), datetime('now'), 0),
('globalex-002', 'oliver.zhang', 'oliver.zhang@globalex.com', 'Oliver Zhang', 'Senior Data Scientist', 'oliver.zhang@globalex.com', 'Oliver', 'Zhang', 'oliver.zhang', 1, '["+1 (416) 555-7100", "+1 (416) 555-7101"]', '+1 (416) 555-7200', 'Data Science Lab, Floor 4, Room 401', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G100006', 'Employee', 'Member', '2020-09-14T00:00:00+00:00', '["o.zhang@globalex.com", "oliver.z@globalex.com"]', 0, 'Senior data scientist passionate about machine learning and predictive analytics. Building data-driven solutions to complex business problems with a focus on AI/ML implementation and statistical modeling.', '1989-11-22T00:00:00+00:00', '["Machine Learning", "Artificial Intelligence", "Data Visualization", "Statistical Modeling", "Deep Learning"]', '["Python", "R", "TensorFlow", "PyTorch", "SQL", "Spark", "Azure ML", "Power BI"]', 'https://oliverzhang-datascience.com', 'Oliver', '+1 (416) 555-7102', 'Adult', 0, '["Customer Churn Prediction Model", "Revenue Forecasting System", "AI-Powered Recommendation Engine", "Fraud Detection Analytics"]', '["Machine Learning Model Development", "Data Pipeline Architecture", "Statistical Analysis", "Team Mentorship", "Research & Innovation"]', '["Stanford University", "University of Toronto", "Tsinghua University"]', '{"costCenter": "CC-DS-002", "division": "Data Science & Analytics"}', 'ya29.B1CRrdaM-oliver789unique234token567special890.OliverZhangDataScienceTokenAccess_71-82', datetime('now'), datetime('now'), 0),
('globalex-002', 'maya.patel', 'maya.patel@globalex.com', 'Maya Patel', 'VP of Marketing', 'maya.patel@globalex.com', 'Maya', 'Patel', 'maya.patel', 1, '["+1 (416) 555-8100", "+1 (416) 555-8101"]', '+1 (416) 555-8200', 'Marketing Suite, Floor 5, Executive Wing', 'en-CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G100007', 'Employee', 'Member', '2018-06-01T00:00:00+00:00', '["m.patel@globalex.com", "vp.marketing@globalex.com"]', 0, 'Strategic marketing executive with 12+ years driving brand growth and market expansion. Leading integrated marketing campaigns, digital transformation initiatives, and customer experience optimization across global markets.', '1983-04-18T00:00:00+00:00', '["Brand Strategy", "Digital Transformation", "Customer Experience", "Marketing Analytics", "Innovation"]', '["Strategic Marketing", "Brand Management", "Digital Marketing", "Marketing Analytics", "Team Leadership", "Budget Management", "Market Research", "CRM"]', 'https://mayapatel-marketing.com', 'Maya', '+1 (416) 555-8102', 'Adult', 0, '["Global Brand Relaunch 2022", "Digital Marketing Transformation", "Customer Experience Platform", "Market Expansion Strategy APAC"]', '["Marketing Strategy & Execution", "Brand Management", "Team Leadership", "Budget Planning", "Customer Insights", "Digital Innovation"]', '["Northwestern University - Kellogg School of Management", "University of Pennsylvania - Wharton", "University of Mumbai"]', '{"costCenter": "CC-MKT-002", "division": "Marketing"}', 'ya29.B1CRrdaM-maya345unique678token901special234.MayaPatelMarketingVPTokenAccess_81-92', datetime('now'), datetime('now'), 0);

-- Teams Apps Catalog (teams_apps)
INSERT INTO teams_apps (org_id, app_id, display_name, external_id, distribution_method, description, version, developer_name, publishing_state, teams_app_id, azure_ad_app_id, created_at, updated_at) VALUES
('techcorp-001', 'com.techcorp.projectmanager', 'TechCorp Project Manager', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'organization', 'Internal project management tool for TechCorp teams. Track tasks, milestones, and team collaboration in real-time.', '2.1.0', 'TechCorp IT Department', 'published', 'com.techcorp.projectmanager', '12345678-1234-1234-1234-123456789012', datetime('now'), datetime('now')),
('techcorp-001', 'com.techcorp.expensetracker', 'TechCorp Expense Tracker', 'b2c3d4e5-f6a7-8901-bcde-f12345678901', 'organization', 'Submit and track expense reports. Integrates with finance systems for automatic approval workflows.', '1.0.0', 'TechCorp Finance Team', 'submitted', 'com.techcorp.expensetracker', '23456789-2345-2345-2345-234567890123', datetime('now'), datetime('now')),
('techcorp-001', 'com.techcorp.socialfeed', 'TechCorp Social Feed', 'c3d4e5f6-a7b8-9012-cdef-123456789012', 'organization', 'Company social network for sharing updates and connecting with colleagues.', '0.9.5', 'TechCorp Social Team', 'rejected', 'com.techcorp.socialfeed', '34567890-3456-3456-3456-345678901234', datetime('now'), datetime('now')),
('techcorp-001', 'com.microsoft.teamspace.tab.planner', 'Planner', 'd4e5f6a7-b8c9-0123-def1-234567890123', 'store', 'Microsoft Planner makes it easy for your team to create new plans, organize and assign tasks, share files, chat about what you''re working on, and get updates on progress.', '1.13.7', 'Microsoft Corporation', 'published', 'com.microsoft.teamspace.tab.planner', '45678901-4567-4567-4567-456789012345', datetime('now'), datetime('now')),
('techcorp-001', 'com.trello.tab', 'Trello', 'e5f6a7b8-c9d0-1234-ef12-345678901234', 'store', 'Trello is a collaboration tool that organizes your projects into boards. In one glance, know what''s being worked on, who''s working on what, and where something is in a process.', '2.5.3', 'Atlassian', 'published', 'com.trello.tab', '56789012-5678-5678-5678-567890123456', datetime('now'), datetime('now')),
('techcorp-001', 'com.techcorp.betatester', 'Beta Testing Hub', 'f6a7b8c9-d0e1-2345-f123-456789012345', 'sideloaded', 'Internal tool for managing beta test programs and collecting feedback from testers. Sideloaded for development testing.', '0.3.2-beta', 'TechCorp QA Team', 'published', 'com.techcorp.betatester', '67890123-6789-6789-6789-678901234567', datetime('now'), datetime('now')),
('techcorp-001', '0d820ecd-def2-4297-adad-78056cde7c79', 'OneNote', NULL, 'store', 'Create and organize digital notebooks', '1.0.0', 'Microsoft Corporation', NULL, NULL, NULL, datetime('now'), datetime('now')),
('techcorp-001', 'com.microsoft.teamspace.tab.web', 'Website', NULL, 'store', 'Add a website as a tab in your channel', '1.0.0', 'Microsoft Corporation', NULL, NULL, NULL, datetime('now'), datetime('now')),
('techcorp-001', '2a527703-1f6f-4559-a332-d8a7d288cd88', 'SharePoint', NULL, 'store', 'Access SharePoint sites and documents', '1.0.0', 'Microsoft Corporation', NULL, NULL, NULL, datetime('now'), datetime('now')),
('techcorp-001', 'com.microsoft.teamspace.tab.powerbi', 'Power BI', NULL, 'store', 'Bring data to life with Power BI', '1.0.0', 'Microsoft Corporation', NULL, NULL, NULL, datetime('now'), datetime('now')),
('globalex-002', '0d820ecd-def2-4297-adad-78056cde7c78', 'OneNote', NULL, 'store', 'Create and organize digital notebooks', '1.0.0', 'Microsoft Corporation', NULL, NULL, NULL, datetime('now'), datetime('now')),
('globalex-002', 'com.microsoft.teamspace.tab.planner.global', 'Planner', NULL, 'store', 'Plan, track, and manage team work with Planner', '1.0.0', 'Microsoft Corporation', NULL, NULL, NULL, datetime('now'), datetime('now')),
('globalex-002', 'com.microsoft.teamspace.tab.web', 'Website', NULL, 'store', 'Add a website as a tab in your channel', '1.0.0', 'Microsoft Corporation', NULL, NULL, NULL, datetime('now'), datetime('now')),
('globalex-002', '2a527703-1f6f-4559-a332-d8a7d288cd88', 'SharePoint', NULL, 'store', 'Access SharePoint sites and documents', '1.0.0', 'Microsoft Corporation', NULL, NULL, NULL, datetime('now'), datetime('now'));

-- Team Templates (System-wide default templates)
INSERT INTO teams_templates (org_id, template_id, display_name, short_description, description, icon_url, visibility, categories, channel_count, app_count, is_system_template, created_date_time, updated_date_time, soft_delete) VALUES
('default', 'standard', 'Standard', 'Standard team template', 'A standard team template for general collaboration with default channels and settings.', NULL, 'private', '["General"]', 1, 0, 1, datetime('now'), datetime('now'), 0),
('default', 'educationClass', 'Education Class', 'Education class team template', 'Template for educational class teams with features for assignments, grades, and class collaboration.', NULL, 'private', '["Education"]', 2, 3, 1, datetime('now'), datetime('now'), 0),
('default', 'educationStaff', 'Education Staff', 'Education staff team template', 'Template for educational staff teams with features for staff collaboration and planning.', NULL, 'private', '["Education"]', 2, 2, 1, datetime('now'), datetime('now'), 0),
('default', 'educationProfessionalLearningCommunity', 'Education PLC', 'Professional learning community template', 'Template for professional learning communities in education with collaboration and resource sharing.', NULL, 'private', '["Education"]', 2, 1, 1, datetime('now'), datetime('now'), 0),
('default', 'healthcareStandard', 'Healthcare Standard', 'Healthcare standard template', 'Template for healthcare teams with compliance and collaboration features.', NULL, 'private', '["Healthcare"]', 2, 2, 1, datetime('now'), datetime('now'), 0),
('default', 'healthcareCareCoordination', 'Healthcare Care Coordination', 'Healthcare care coordination template', 'Template for healthcare care coordination teams with patient management features.', NULL, 'private', '["Healthcare"]', 3, 3, 1, datetime('now'), datetime('now'), 0),
('default', 'unknownFutureValue', 'Unknown Future Value', 'Placeholder for future templates', 'Placeholder template for forward compatibility with future Microsoft Teams template types.', NULL, 'private', '["System"]', 1, 0, 1, datetime('now'), datetime('now'), 0);

-- Microsoft 365 Groups
INSERT INTO groups (org_id, group_id, display_name, description, mail_nickname, mail, visibility, group_types, security_enabled, mail_enabled, classification, members, created_date_time, updated_date_time, soft_delete) VALUES
('techcorp-001', 'group_techcorp_001', 'TechCorp Solutions Group', 'Main Microsoft 365 group for TechCorp Solutions Team', 'techcorp-solutions', 'techcorp-solutions@techcorp.com', 'Private', '["Unified"]', 0, 1, NULL, '[{"@odata.type": "#microsoft.graph.user", "id": "alice.johnson", "displayName": "Alice Johnson", "userPrincipalName": "alice.manager@techcorp.com", "mail": "alice.manager@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "bob.smith", "displayName": "Bob Smith", "userPrincipalName": "bob.smith@techcorp.com", "mail": "bob.smith@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "carol.white", "displayName": "Carol White Conference Room Manager", "userPrincipalName": "carol.white@techcorp.com", "mail": "carol.white@techcorp.com", "description": "Manages conference room bookings and schedules"}, {"@odata.type": "#microsoft.graph.user", "id": "dave.brown", "displayName": "Dave Brown", "userPrincipalName": "dave.brown@techcorp.com", "mail": "dave.brown@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "james.wilson", "displayName": "James Wilson Conference Center Lead", "userPrincipalName": "james.wilson@techcorp.com", "mail": "james.wilson@techcorp.com", "description": "Oversees conference center operations"}, {"@odata.type": "#microsoft.graph.user", "id": "nathan.richards", "displayName": "Nathan Richards", "userPrincipalName": "nathan.richards@techcorp.com", "mail": "nathan.richards@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "sophia.bennett", "displayName": "Sophia Bennett", "userPrincipalName": "sophia.bennett@techcorp.com", "mail": "sophia.bennett@techcorp.com"}]', datetime('now'), datetime('now'), 0),
('techcorp-001', 'group_techcorp_marketing', 'TechCorp Marketing', 'Marketing department collaboration group', 'techcorp-marketing', 'marketing@techcorp.com', 'Private', '["Unified"]', 0, 1, 'Medium Business Impact', '[{"@odata.type": "#microsoft.graph.user", "id": "alice.johnson", "displayName": "Alice Johnson", "userPrincipalName": "alice.manager@techcorp.com", "mail": "alice.manager@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "carol.white", "displayName": "Carol White", "userPrincipalName": "carol.white@techcorp.com", "mail": "carol.white@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "dave.brown", "displayName": "Dave Brown", "userPrincipalName": "dave.brown@techcorp.com", "mail": "dave.brown@techcorp.com"}]', datetime('now'), datetime('now'), 0),
('techcorp-001', 'group_techcorp_engineering', 'TechCorp Engineering', 'Engineering department for product development', 'techcorp-engineering', 'engineering@techcorp.com', 'Private', '["Unified"]', 0, 1, 'High Business Impact', '[{"@odata.type": "#microsoft.graph.user", "id": "alice.johnson", "displayName": "Alice Johnson", "userPrincipalName": "alice.manager@techcorp.com", "mail": "alice.manager@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "bob.smith", "displayName": "Bob Smith", "userPrincipalName": "bob.smith@techcorp.com", "mail": "bob.smith@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "nathan.richards", "displayName": "Nathan Richards", "userPrincipalName": "nathan.richards@techcorp.com", "mail": "nathan.richards@techcorp.com"}, {"@odata.type": "#microsoft.graph.user", "id": "sophia.bennett", "displayName": "Sophia Bennett", "userPrincipalName": "sophia.bennett@techcorp.com", "mail": "sophia.bennett@techcorp.com"}]', datetime('now'), datetime('now'), 0),
('globalex-002', 'group_globalex_002', 'GlobalEx Industries Group', 'Main Microsoft 365 group for GlobalEx Industries Team', 'globalex-industries', 'globalex-industries@globalex.com', 'Private', '["Unified"]', 0, 1, NULL, '[{"@odata.type": "#microsoft.graph.user", "id": "emma.wilson", "displayName": "Emma Wilson", "userPrincipalName": "emma.wilson@globalex.com", "mail": "emma.wilson@globalex.com"}, {"@odata.type": "#microsoft.graph.user", "id": "frank.chen", "displayName": "Frank Chen", "userPrincipalName": "frank.chen@globalex.com", "mail": "frank.chen@globalex.com"}, {"@odata.type": "#microsoft.graph.user", "id": "grace.kim", "displayName": "Grace Kim", "userPrincipalName": "grace.kim@globalex.com", "mail": "grace.kim@globalex.com"}, {"@odata.type": "#microsoft.graph.user", "id": "henry.lopez", "displayName": "Henry Lopez Conference Facilities", "userPrincipalName": "henry.lopez@globalex.com", "mail": "henry.lopez@globalex.com", "description": "Manages conference facilities and equipment"}, {"@odata.type": "#microsoft.graph.user", "id": "oliver.zhang", "displayName": "Oliver Zhang", "userPrincipalName": "oliver.zhang@globalex.com", "mail": "oliver.zhang@globalex.com"}, {"@odata.type": "#microsoft.graph.user", "id": "maya.patel", "displayName": "Maya Patel", "userPrincipalName": "maya.patel@globalex.com", "mail": "maya.patel@globalex.com"}]', datetime('now'), datetime('now'), 0),
('globalex-002', 'group_globalex_sales', 'GlobalEx Sales', 'Sales team collaboration group', 'globalex-sales', 'sales@globalex.com', 'Private', '["Unified"]', 0, 1, 'Medium Business Impact', '[{"@odata.type": "#microsoft.graph.user", "id": "emma.wilson", "displayName": "Emma Wilson", "userPrincipalName": "emma.wilson@globalex.com", "mail": "emma.wilson@globalex.com"}, {"@odata.type": "#microsoft.graph.user", "id": "maya.patel", "displayName": "Maya Patel", "userPrincipalName": "maya.patel@globalex.com", "mail": "maya.patel@globalex.com"}]', datetime('now'), datetime('now'), 0),
('globalex-002', 'group_globalex_product', 'GlobalEx Product', 'Product management and development group', 'globalex-product', 'product@globalex.com', 'Private', '["Unified"]', 0, 1, 'High Business Impact', '[{"@odata.type": "#microsoft.graph.user", "id": "frank.chen", "displayName": "Frank Chen", "userPrincipalName": "frank.chen@globalex.com", "mail": "frank.chen@globalex.com"}, {"@odata.type": "#microsoft.graph.user", "id": "oliver.zhang", "displayName": "Oliver Zhang", "userPrincipalName": "oliver.zhang@globalex.com", "mail": "oliver.zhang@globalex.com"}, {"@odata.type": "#microsoft.graph.user", "id": "maya.patel", "displayName": "Maya Patel", "userPrincipalName": "maya.patel@globalex.com", "mail": "maya.patel@globalex.com"}]', datetime('now'), datetime('now'), 0);

-- Permissions Catalog / Module Links / User Grants (aggregated)
-- Seed permissions_catalog (aggregated from msgraph with ALL constraint fields)
INSERT INTO permissions_catalog (id, name, type, admin_consent_required, description, resource, operation, [constraint], constraint_scope, permission_level_rank, requires_resource_ownership, allowed_fields_read, allowed_fields_write, applies_to_scope, resource_constraint, source_url, created_at, updated_at) VALUES
('User.Read:delegated', 'User.Read', 'delegated', 0, 'Allows users to sign-in to the app, and allows the app to read the profile of signed-in users. It also allows the app to read basic company information of signed-in users.', 'User', 'Read', NULL, 'self', 10, 1, NULL, '[]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.ReadWrite:delegated', 'User.ReadWrite', 'delegated', 0, 'Allows the app to read the signed-in user''s full profile. It also allows the app to update the signed-in user''s profile information on their behalf.', 'User', 'ReadWrite', NULL, 'self', 20, 1, NULL, '["aboutMe", "birthday", "hireDate", "interests", "mobilePhone", "mySite", "pastProjects", "photo", "preferredName", "responsibilities", "schools", "skills"]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.ReadBasic.All:delegated', 'User.ReadBasic.All', 'delegated', 1, 'Allows the app to read a basic set of profile properties of other users in your organization on behalf of the signed-in user. This includes display name, first and last name, email address, open extensions and photo.', 'User', 'ReadBasic', 'All', 'all', 10, 0, '["id", "displayName", "givenName", "surname", "mail", "userPrincipalName", "photo"]', '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.Read.All:delegated', 'User.Read.All', 'delegated', 1, 'Allows the app to read the full set of profile properties, reports, and managers of other users in your organization, on behalf of the signed-in user.', 'User', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.ReadWrite.All:delegated', 'User.ReadWrite.All', 'delegated', 1, 'Allows the app to read and write the full set of profile properties, reports, and managers of other users in your organization, on behalf of the signed-in user. Also allows the app to create and delete users as well as reset user passwords on behalf of the signed-in user.', 'User', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.Read.All:application', 'User.Read.All', 'application', 1, 'Allows the app to read the full set of profile properties, group membership, reports and managers of other users in your organization, without a signed-in user.', 'User', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.ReadWrite.All:application', 'User.ReadWrite.All', 'application', 1, 'Allows the app to read and write the full set of profile properties, group membership, reports and managers of other users in your organization, without a signed-in user. Also allows the app to create and delete non-administrative users. Does not allow reset of user passwords.', 'User', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.ManageIdentities.All:delegated', 'User.ManageIdentities.All', 'delegated', 1, 'Allows the app to read, update and delete identities that are associated with a user''s account, on behalf of the signed-in user. This controls which identities your users can sign in with.', 'User', 'ManageIdentities', 'All', 'all', 40, 0, NULL, '["identities"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.ManageIdentities.All:application', 'User.ManageIdentities.All', 'application', 1, 'Allows the app to read, update and delete identities that are associated with a user''s account, without a signed-in user. This controls which identities users can sign in with.', 'User', 'ManageIdentities', 'All', 'all', 40, 0, NULL, '["identities"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.EnableDisableAccount.All:delegated', 'User.EnableDisableAccount.All', 'delegated', 1, 'Allows the app to enable and disable user accounts on behalf of the signed-in user.', 'User', 'EnableDisableAccount', 'All', 'all', 40, 0, NULL, '["accountEnabled"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('User.EnableDisableAccount.All:application', 'User.EnableDisableAccount.All', 'application', 1, 'Allows the app to enable and disable user accounts without a signed-in user.', 'User', 'EnableDisableAccount', 'All', 'all', 40, 0, NULL, '["accountEnabled"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Directory.Read.All:delegated', 'Directory.Read.All', 'delegated', 1, 'Allows the app to read data in your organization''s directory, such as users, groups and apps, on behalf of the signed-in user.', 'Directory', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Directory.Read.All:application', 'Directory.Read.All', 'application', 1, 'Allows the app to read data in your organization''s directory, such as users, groups and apps, without a signed-in user.', 'Directory', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Directory.ReadWrite.All:delegated', 'Directory.ReadWrite.All', 'delegated', 1, 'Allows the app to read and write data in your organization''s directory, such as users and groups, on behalf of the signed-in user. Does not allow user or group deletion.', 'Directory', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Directory.ReadWrite.All:application', 'Directory.ReadWrite.All', 'application', 1, 'Allows the app to read and write data in your organization''s directory, such as users and groups, without a signed-in user. Does not allow user or group deletion.', 'Directory', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Directory.AccessAsUser.All:delegated', 'Directory.AccessAsUser.All', 'delegated', 1, 'Allows the app to have the same access to information in the directory as the signed-in user. Required for deleting users with privileged administrator roles.', 'Directory', 'AccessAsUser', 'All', 'all', 50, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsActivity.Send:delegated', 'TeamsActivity.Send', 'delegated', 0, 'Allows the app to create new notifications in users'' activity feeds on behalf of the signed-in user. These notifications may not be discoverable or be held by third parties.', 'User', 'Send', NULL, 'all', 30, 0, '[]', '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsActivity.Send:application', 'TeamsActivity.Send', 'application', 1, 'Allows the app to create new notifications in users'' activity feeds without a signed-in user. These notifications may not be discoverable or be held by third parties.', 'User', 'Send', NULL, 'all', 30, 0, '[]', '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsActivity.Send.User:application', 'TeamsActivity.Send.User', 'application', 1, 'Allows the app to create new notifications in users'' activity feeds without a signed-in user. Uses resource-specific consent.', 'User', 'Send', 'User', 'resource_specific', 30, 0, '[]', '[]', 'resource', '"user_id"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.Read:delegated', 'Chat.Read', 'delegated', 0, 'Allows an app to read 1 on 1 or group chats threads, on behalf of the signed-in user.', 'Chat', 'Read', NULL, 'self', 10, 1, NULL, '[]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.ReadWrite:delegated', 'Chat.ReadWrite', 'delegated', 0, 'Read and write user''s chat messages and chat threads', 'chat', 'write', NULL, 'self', 40, 0, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/api/chat-post', datetime('now'), datetime('now')),
('Chat.ReadWrite.All:delegated', 'Chat.ReadWrite.All', 'delegated', 1, 'Read and write all chat messages and chat threads, on behalf of the signed-in user', 'chat', 'write', NULL, 'all', 50, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.Create:delegated', 'Chat.Create', 'delegated', 0, 'Create chats on behalf of the signed-in user', 'chat', 'create', NULL, 'self', 20, 0, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/api/chat-post', datetime('now'), datetime('now')),
('Chat.Create:application', 'Chat.Create', 'application', 1, 'Allows the app to create chats without a signed-in user', 'chat', 'create', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/chat-post', datetime('now'), datetime('now')),
('Chat.ReadBasic:delegated', 'Chat.ReadBasic', 'delegated', 0, 'Allows an app to read the members and descriptions of one-to-one and group chat threads, on behalf of the signed-in user.', 'Chat', 'ReadBasic', NULL, 'self', 20, 1, NULL, '[]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.Read.All:application', 'Chat.Read.All', 'application', 1, 'Allows the app to read all 1-to-1 or group chat messages in Microsoft Teams.', 'Chat', 'Read', NULL, 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.ReadWrite.All:application', 'Chat.ReadWrite.All', 'application', 1, 'Allows an app to read and write all chat messages in Microsoft Teams, without a signed-in user.', 'Chat', 'ReadWrite', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.ReadBasic.All:application', 'Chat.ReadBasic.All', 'application', 1, 'Read names and members of all one-to-one and group chats in Microsoft Teams, without a signed-in user.', 'Chat', 'ReadBasic', NULL, 'all', 15, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.Manage.Chat:application', 'Chat.Manage.Chat', 'application', 1, 'Allows the app to manage the chat, the chat''s members and grant access to the chat''s data, without a signed-in user.', 'Chat', 'Manage', 'Chat', 'specific', 40, 0, NULL, NULL, 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.ReadBasic.WhereInstalled:application', 'Chat.ReadBasic.WhereInstalled', 'application', 1, 'Allows the app to read names and members of all one-to-one and group chats in Microsoft Teams where the associated Teams application is installed, without a signed-in user.', 'Chat', 'ReadBasic', 'WhereInstalled', 'conditional', 25, 0, NULL, '[]', 'conditional', '"installed_app"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatSettings.Read.Chat:application', 'ChatSettings.Read.Chat', 'application', 1, 'Allows the app to read this chat''s settings, without a signed-in user.', 'ChatSettings', 'Read', 'Chat', 'specific', 20, 0, NULL, '[]', 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatSettings.ReadWrite.Chat:application', 'ChatSettings.ReadWrite.Chat', 'application', 1, 'Allows the app to read and write this chat''s settings, without a signed-in user.', 'ChatSettings', 'ReadWrite', 'Chat', 'specific', 30, 0, NULL, NULL, 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatMember.Read:delegated', 'ChatMember.Read', 'delegated', 1, 'Read the members of chats, on behalf of the signed-in user.', 'ChatMember', 'Read', NULL, 'self', 10, 1, NULL, '[]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatMember.ReadWrite:delegated', 'ChatMember.ReadWrite', 'delegated', 1, 'Add and remove members from chats, on behalf of the signed-in user.', 'ChatMember', 'ReadWrite', NULL, 'self', 20, 1, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatMember.Read.All:application', 'ChatMember.Read.All', 'application', 1, 'Read the members of all chats, without a signed-in user.', 'ChatMember', 'Read', NULL, 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatMember.ReadWrite.All:application', 'ChatMember.ReadWrite.All', 'application', 1, 'Add and remove members from all chats, without a signed-in user.', 'ChatMember', 'ReadWrite', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatMember.Read.Chat:application', 'ChatMember.Read.Chat', 'application', 1, 'Allows the app to read the members of this chat, without a signed-in user.', 'ChatMember', 'Read', 'Chat', 'specific', 15, 0, NULL, '[]', 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.ManageDeletion.All:delegated', 'Chat.ManageDeletion.All', 'delegated', 1, 'Allows the app to delete and recover deleted chats, on behalf of the signed-in user.', 'Chat', 'ManageDeletion', NULL, 'self', 40, 1, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.ManageDeletion.Chat:application', 'Chat.ManageDeletion.Chat', 'application', 1, 'Allows the app to delete and recover deleted chat, without a signed-in user.', 'Chat', 'ManageDeletion', 'Chat', 'specific', 50, 0, NULL, NULL, 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatMessage.Read.Chat:application', 'ChatMessage.Read.Chat', 'application', 1, 'Allows the app to read this chat''s messages, without a signed-in user.', 'ChatMessage', 'Read', 'Chat', 'specific', 25, 0, NULL, '[]', 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatMessage.Read.All:application', 'ChatMessage.Read.All', 'application', 1, 'Allows the app to read all chat messages in Microsoft Teams, without a signed-in user.', 'ChatMessage', 'Read', NULL, 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Chat.UpdatePolicyViolation.All:application', 'Chat.UpdatePolicyViolation.All', 'application', 1, 'Allows the app to update Microsoft Teams 1-to-1 or group chat messages by patching a set of Data Loss Prevention (DLP) policy violation properties to handle the output of DLP processing.', 'Chat', 'UpdatePolicyViolation', NULL, 'all', 50, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Mail.Read:delegated', 'Mail.Read', 'delegated', 0, 'Allows the app to read the signed-in user''s mailbox.', 'Mail', 'Read', NULL, 'self', 10, 1, NULL, '[]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChatMessage.Send:delegated', 'ChatMessage.Send', 'delegated', 0, 'Allows an app to send one-to-one and group chat messages in Microsoft Teams, on behalf of the signed-in user.', 'ChatMessage', 'Send', NULL, 'self', 30, 1, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Group.ReadWrite.All:delegated', 'Group.ReadWrite.All', 'delegated', 1, 'Allows the app to create groups and read all group properties and memberships on behalf of the signed-in user. Additionally allows group owners to manage their groups and allows group members to update group content.', 'Group', 'ReadWrite', NULL, 'all', 40, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsActivity.Send.Chat:application', 'TeamsActivity.Send.Chat', 'application', 1, 'Allows the app to send activity feed notifications to users in this chat, without a signed-in user. Uses resource-specific consent.', 'TeamsActivity', 'Send', 'Chat', 'specific', 35, 0, NULL, NULL, 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/api/chat-sendactivitynotification', datetime('now'), datetime('now')),
('Channel.ReadBasic.All:application', 'Channel.ReadBasic.All', 'application', 1, 'Read all channel names and channel descriptions, without a signed-in user.', 'Channel', 'ReadBasic', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Channel.ReadBasic.All:delegated', 'Channel.ReadBasic.All', 'delegated', 0, 'Read channel names and channel descriptions, on behalf of the signed-in user.', 'Channel', 'ReadBasic', NULL, 'all', 10, 0, '["displayName", "description"]', '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelSettings.Read.All:application', 'ChannelSettings.Read.All', 'application', 1, 'Read all channel names, channel descriptions, and channel settings, without a signed-in user.', 'ChannelSettings', 'Read', NULL, 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelSettings.Read.All:delegated', 'ChannelSettings.Read.All', 'delegated', 1, 'Read all channel names, channel descriptions, and channel settings, on behalf of the signed-in user.', 'ChannelSettings', 'Read', NULL, 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelSettings.ReadWrite.All:application', 'ChannelSettings.ReadWrite.All', 'application', 1, 'Read and write the names, descriptions, and settings of all channels, without a signed-in user.', 'ChannelSettings', 'ReadWrite', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelSettings.ReadWrite.All:delegated', 'ChannelSettings.ReadWrite.All', 'delegated', 1, 'Read and write the names, descriptions, and settings of all channels, on behalf of the signed-in user.', 'ChannelSettings', 'ReadWrite', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMessage.Read.All:application', 'ChannelMessage.Read.All', 'application', 1, 'Allows the app to read all channel messages in Microsoft Teams', 'ChannelMessage', 'Read', NULL, 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMessage.Read.All:delegated', 'ChannelMessage.Read.All', 'delegated', 1, 'Allows an app to read a channel''s messages in Microsoft Teams, on behalf of the signed-in user.', 'ChannelMessage', 'Read', NULL, 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMessage.Read.Group:application', 'ChannelMessage.Read.Group', 'application', 1, 'Allows the app to read this team''s channel''s messages, without a signed-in user.', 'ChannelMessage', 'Read', 'Group', 'specific', 25, 0, NULL, '[]', 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMessage.Send:delegated', 'ChannelMessage.Send', 'delegated', 0, 'Allows an app to send channel messages in Microsoft Teams, on behalf of the signed-in user.', 'ChannelMessage', 'Send', NULL, 'self', 30, 1, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMessage.ReadWrite:delegated', 'ChannelMessage.ReadWrite', 'delegated', 1, 'Allows the app to read and write channel messages, on behalf of the signed-in user. This doesn''t allow the app to edit the policyViolation of a channel message.', 'ChannelMessage', 'ReadWrite', NULL, 'self', 40, 1, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMessage.UpdatePolicyViolation.All:application', 'ChannelMessage.UpdatePolicyViolation.All', 'application', 1, 'Allows the app to update Microsoft Teams channel messages by patching a set of Data Loss Prevention (DLP) policy violation properties to handle the output of DLP processing.', 'ChannelMessage', 'UpdatePolicyViolation', NULL, 'all', 50, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMember.Read.All:application', 'ChannelMember.Read.All', 'application', 1, 'Read the members of all channels, without a signed-in user.', 'ChannelMember', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMember.Read.All:delegated', 'ChannelMember.Read.All', 'delegated', 1, 'Read the members of channels, on behalf of the signed-in user.', 'ChannelMember', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMember.ReadWrite.All:application', 'ChannelMember.ReadWrite.All', 'application', 1, 'Add and remove members from all channels, without a signed-in user. Also allows changing a member''s role, for example from owner to non-owner.', 'ChannelMember', 'ReadWrite', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMember.ReadWrite.All:delegated', 'ChannelMember.ReadWrite.All', 'delegated', 1, 'Add and remove members from channels, on behalf of the signed-in user. Also allows changing a member''s role, for example from owner to non-owner.', 'ChannelMember', 'ReadWrite', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelMember.Read.Group:application', 'ChannelMember.Read.Group', 'application', 1, 'Allows the app to read the members of a specific channel, without a signed-in user. Uses resource-specific consent.', 'ChannelMember', 'Read', 'Group', 'specific', 5, 0, NULL, '[]', 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/api/sharedwithchannelteaminfo-list', datetime('now'), datetime('now')),
('ChannelMember.ReadWrite.Group:application', 'ChannelMember.ReadWrite.Group', 'application', 1, 'Allows the app to read and write the members of a specific channel, without a signed-in user. Uses resource-specific consent.', 'ChannelMember', 'ReadWrite', 'Group', 'specific', 15, 0, NULL, NULL, 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/api/sharedwithchannelteaminfo-list', datetime('now'), datetime('now')),
('GroupMember.Read.All:delegated', 'GroupMember.Read.All', 'delegated', 0, 'Allows the app to list groups, and to read their properties and all group memberships on behalf of the signed-in user. Also allows the app to read calendar, conversations, files, and other group content for all groups the signed-in user can access.', 'Group', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('GroupMember.Read.All:application', 'GroupMember.Read.All', 'application', 1, 'Allows the app to list groups, and to read their properties and all group memberships without a signed-in user. Also allows the app to read calendar, conversations, files, and other group content for all groups.', 'Group', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('GroupMember.ReadWrite.All:delegated', 'GroupMember.ReadWrite.All', 'delegated', 1, 'Allows the app to list groups, read basic properties, read and update the membership of the groups the signed-in user has access to. Group properties and owners cannot be updated and groups cannot be deleted.', 'GroupMember', 'ReadWrite', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('GroupMember.ReadWrite.All:application', 'GroupMember.ReadWrite.All', 'application', 1, 'Allows the app to list groups, read basic properties, read and update the membership of the groups this app has access to without a signed-in user. Group properties and owners cannot be updated and groups cannot be deleted.', 'GroupMember', 'ReadWrite', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Group.Read.All:application', 'Group.Read.All', 'application', 1, 'Allows the app to read group properties and memberships, and read conversations for all groups, without a signed-in user.', 'Group', 'Read', NULL, 'all', 30, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Group.Read.All:delegated', 'Group.Read.All', 'delegated', 1, 'Allows the app to list groups, and to read their properties and all group memberships on behalf of the signed-in user. Also allows the app to read calendar, conversations, files, and other group content for all groups the signed-in user can access.', 'Group', 'Read', NULL, 'all', 30, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Group.ReadWrite.All:application', 'Group.ReadWrite.All', 'application', 1, 'Allows the app to create groups, read all group properties and memberships, update group properties and memberships, and delete groups. Also allows the app to read and write conversations. All of these operations can be performed by the app without a signed-in user.', 'Group', 'ReadWrite', NULL, 'all', 40, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Teamwork.Migrate.All:application', 'Teamwork.Migrate.All', 'application', 1, 'Allows the app to create chat and channel messages, without a signed in user. The app specifies which user appears as the sender, and can backdate the message to appear as if it was sent long ago. The messages can be sent to any chat or channel in the organization.', 'Teamwork', 'Migrate', NULL, 'all', 50, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Channel.Create:delegated', 'Channel.Create', 'delegated', 0, 'Allows the app to create channels in any team, on behalf of the signed-in user.', 'Channel', 'Create', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Channel.Create:application', 'Channel.Create', 'application', 1, 'Allows the app to create channels in any team, without a signed-in user.', 'Channel', 'Create', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Channel.Create.Group:application', 'Channel.Create.Group', 'application', 1, 'Allows the app to create channels in a specific team, without a signed-in user.', 'Channel', 'Create', 'Group', 'specific', 25, 0, NULL, NULL, 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Channel.Delete.All:delegated', 'Channel.Delete.All', 'delegated', 1, 'Allows the app to delete channels in any team, on behalf of the signed-in user.', 'Channel', 'Delete', 'All', 'all', 40, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Channel.Delete.All:application', 'Channel.Delete.All', 'application', 1, 'Allows the app to delete channels in any team, without a signed-in user.', 'Channel', 'Delete', 'All', 'all', 40, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Channel.Delete.Group:application', 'Channel.Delete.Group', 'application', 1, 'Allows the app to delete channels in a specific team, without a signed-in user.', 'Channel', 'Delete', 'Group', 'specific', 35, 0, NULL, NULL, 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamMember.Read.Group:application', 'TeamMember.Read.Group', 'application', 1, 'Allows the app to read the members of a specific team, without a signed-in user.', 'TeamMember', 'Read', 'Group', 'specific', 15, 0, NULL, '[]', 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelSettings.Read.Group:application', 'ChannelSettings.Read.Group', 'application', 1, 'Allows the app to read the settings of a specific channel, without a signed-in user. Uses resource-specific consent.', 'ChannelSettings', 'Read', 'Group', 'specific', 15, 0, NULL, '[]', 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('ChannelSettings.ReadWrite.Group:application', 'ChannelSettings.ReadWrite.Group', 'application', 1, 'Allows the app to read and write the settings of a specific channel, without a signed-in user. Uses resource-specific consent.', 'ChannelSettings', 'ReadWrite', 'Group', 'specific', 25, 0, NULL, NULL, 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.Read.All:delegated', 'TeamsTab.Read.All', 'delegated', 0, 'Allows the app to read the Teams tabs for any team, on behalf of the signed-in user.', 'TeamsTab', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.Read.All:application', 'TeamsTab.Read.All', 'application', 1, 'Allows the app to read the Teams tabs for any team, without a signed-in user.', 'TeamsTab', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.Read.Group:application', 'TeamsTab.Read.Group', 'application', 1, 'Allows the app to read the Teams tabs in a specific team, without a signed-in user. Uses resource-specific consent.', 'TeamsTab', 'Read', 'Group', 'specific', 5, 0, NULL, '[]', 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.ReadWrite.All:delegated', 'TeamsTab.ReadWrite.All', 'delegated', 1, 'Allows the app to read and write the Teams tabs for any team, on behalf of the signed-in user.', 'TeamsTab', 'ReadWrite', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.ReadWrite.All:application', 'TeamsTab.ReadWrite.All', 'application', 1, 'Allows the app to read and write the Teams tabs for any team, without a signed-in user.', 'TeamsTab', 'ReadWrite', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.ReadWrite.Group:application', 'TeamsTab.ReadWrite.Group', 'application', 1, 'Allows the app to read and write the Teams tabs in a specific team, without a signed-in user. Uses resource-specific consent.', 'TeamsTab', 'ReadWrite', 'Group', 'specific', 15, 0, NULL, NULL, 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.ReadWriteForTeam:delegated', 'TeamsTab.ReadWriteForTeam', 'delegated', 1, 'Allows the app to read and write the tabs for any team the user can access, on behalf of the signed-in user.', 'TeamsTab', 'ReadWriteForTeam', NULL, 'all', 25, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.ReadWriteForTeam.All:application', 'TeamsTab.ReadWriteForTeam.All', 'application', 1, 'Allows the app to read and write Teams tabs in all teams, without a signed-in user.', 'TeamsTab', 'ReadWriteForTeam', NULL, 'all', 25, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.ReadWriteSelfForTeam:delegated', 'TeamsTab.ReadWriteSelfForTeam', 'delegated', 0, 'Allows the app to read and write the tabs the user can access, on behalf of the signed-in user.', 'TeamsTab', 'ReadWriteSelfForTeam', NULL, 'self', 15, 1, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.ReadWriteSelfForTeam.All:application', 'TeamsTab.ReadWriteSelfForTeam.All', 'application', 1, 'Allows the app to read and write Teams tabs that the app itself can access, without a signed-in user.', 'TeamsTab', 'ReadWriteSelfForTeam', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Files.Read.All:delegated', 'Files.Read.All', 'delegated', 0, 'Allows the app to read all files the signed-in user can access.', 'Files', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Files.Read.All:application', 'Files.Read.All', 'application', 1, 'Allows the app to read all files in all site collections without a signed in user.', 'Files', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Files.ReadWrite.All:delegated', 'Files.ReadWrite.All', 'delegated', 0, 'Allows the app to read, create, update, and delete all files the signed-in user can access.', 'Files', 'ReadWrite', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Files.ReadWrite.All:application', 'Files.ReadWrite.All', 'application', 1, 'Allows the app to read, create, update, and delete all files in all site collections without a signed in user.', 'Files', 'ReadWrite', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Files.Read:delegated', 'Files.Read', 'delegated', 0, 'Allows the app to read the signed-in user''s files.', 'Files', 'Read', NULL, 'self', 5, 1, NULL, '[]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Files.ReadWrite:delegated', 'Files.ReadWrite', 'delegated', 0, 'Allows the app to read, create, update, and delete the signed-in user''s files.', 'Files', 'ReadWrite', NULL, 'self', 15, 1, NULL, NULL, 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Sites.Read.All:delegated', 'Sites.Read.All', 'delegated', 0, 'Allows the app to read documents and list items in all site collections on behalf of the signed-in user.', 'Sites', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Sites.Read.All:application', 'Sites.Read.All', 'application', 1, 'Allows the app to read documents and list items in all site collections without a signed in user.', 'Sites', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Sites.ReadWrite.All:delegated', 'Sites.ReadWrite.All', 'delegated', 0, 'Allows the app to edit or delete documents and list items in all site collections on behalf of the signed-in user.', 'Sites', 'ReadWrite', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Sites.ReadWrite.All:application', 'Sites.ReadWrite.All', 'application', 1, 'Allows the app to edit or delete documents and list items in all site collections without a signed in user.', 'Sites', 'ReadWrite', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Teamwork.Read.All:delegated', 'Teamwork.Read.All', 'delegated', 1, 'Read organization-level teamwork settings, such as region and whether Microsoft Teams is enabled, on behalf of the signed-in user.', 'Teamwork', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/teamwork-get?view=graph-rest-1.0&tabs=http', datetime('now'), datetime('now')),
('Teamwork.Read.All:application', 'Teamwork.Read.All', 'application', 1, 'Read organization-level teamwork settings, such as region and whether Microsoft Teams is enabled, without a signed-in user.', 'Teamwork', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/teamwork-get?view=graph-rest-1.0&tabs=http', datetime('now'), datetime('now')),
('Team.Create:delegated', 'Team.Create', 'delegated', 0, 'Allows the app to create teams on behalf of the signed-in user.', 'Team', 'Create', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Team.Create:application', 'Team.Create', 'application', 1, 'Allows the app to create teams without a signed-in user.', 'Team', 'Create', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Team.ReadBasic.All:delegated', 'Team.ReadBasic.All', 'delegated', 0, 'Read the names and descriptions of teams, on behalf of the signed-in user.', 'Team', 'ReadBasic', 'All', 'all', 10, 0, '["displayName", "description"]', '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Team.ReadBasic.All:application', 'Team.ReadBasic.All', 'application', 1, 'Read the names and descriptions of all teams, without a signed-in user.', 'Team', 'ReadBasic', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamSettings.Read.All:delegated', 'TeamSettings.Read.All', 'delegated', 1, 'Read all teams'' settings, on behalf of the signed-in user.', 'TeamSettings', 'Read', 'All', 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamSettings.Read.All:application', 'TeamSettings.Read.All', 'application', 1, 'Read all teams'' settings, without a signed-in user.', 'TeamSettings', 'Read', 'All', 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamSettings.ReadWrite.All:delegated', 'TeamSettings.ReadWrite.All', 'delegated', 1, 'Read and change all teams'' settings, on behalf of the signed-in user.', 'TeamSettings', 'ReadWrite', 'All', 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamSettings.ReadWrite.All:application', 'TeamSettings.ReadWrite.All', 'application', 1, 'Read and change all teams'' settings, without a signed-in user.', 'TeamSettings', 'ReadWrite', 'All', 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamSettings.ReadWrite.Group:application', 'TeamSettings.ReadWrite.Group', 'application', 1, 'Read and change this team''s settings, without a signed-in user.', 'TeamSettings', 'ReadWrite', 'Group', 'specific', 25, 0, NULL, NULL, 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamMember.Read.All:delegated', 'TeamMember.Read.All', 'delegated', 1, 'Read the members of all teams, on behalf of the signed-in user.', 'TeamMember', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamMember.Read.All:application', 'TeamMember.Read.All', 'application', 1, 'Read the members of all teams, without a signed-in user.', 'TeamMember', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamMember.ReadWrite.All:delegated', 'TeamMember.ReadWrite.All', 'delegated', 1, 'Add and remove members from all teams, on behalf of the signed-in user. Also allows changing a member''s role.', 'TeamMember', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamMember.ReadWrite.All:application', 'TeamMember.ReadWrite.All', 'application', 1, 'Add and remove members from all teams, without a signed-in user. Also allows changing a member''s role.', 'TeamMember', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamMember.ReadWriteNonOwnerRole.All:delegated', 'TeamMember.ReadWriteNonOwnerRole.All', 'delegated', 1, 'Add and remove members from all teams, and change their roles, except for Owner role, on behalf of the signed-in user.', 'TeamMember', 'ReadWriteNonOwnerRole', 'All', 'all', 15, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamMember.ReadWriteNonOwnerRole.All:application', 'TeamMember.ReadWriteNonOwnerRole.All', 'application', 1, 'Add and remove members from all teams, and change their roles, except for Owner role, without a signed-in user.', 'TeamMember', 'ReadWriteNonOwnerRole', 'All', 'all', 15, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadForTeam:delegated', 'TeamsAppInstallation.ReadForTeam', 'delegated', 1, 'Allows the app to read the Teams apps that are installed in teams the signed-in user can access. Does not give the ability to read application-specific settings.', 'TeamsAppInstallation', 'ReadForTeam', NULL, 'membership', 10, 0, NULL, '[]', 'membership', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteSelfForTeam:delegated', 'TeamsAppInstallation.ReadWriteSelfForTeam', 'delegated', 1, 'Allows the app to read, install, upgrade, and uninstall its own Teams apps in teams the signed-in user can access.', 'TeamsAppInstallation', 'ReadWriteSelfForTeam', 'Self', 'membership', 15, 0, NULL, NULL, 'membership', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteForTeam:delegated', 'TeamsAppInstallation.ReadWriteForTeam', 'delegated', 1, 'Allows the app to read, install, upgrade, and uninstall all Teams apps in teams the signed-in user can access.', 'TeamsAppInstallation', 'ReadWriteForTeam', NULL, 'membership', 20, 0, NULL, NULL, 'membership', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadForTeam.All:application', 'TeamsAppInstallation.ReadForTeam.All', 'application', 1, 'Allows the app to read the Teams apps that are installed in any team, without a signed-in user.', 'TeamsAppInstallation', 'ReadForTeam', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteSelfForTeam.All:application', 'TeamsAppInstallation.ReadWriteSelfForTeam.All', 'application', 1, 'Allows the app to read, install, upgrade, and uninstall its own Teams apps in any team, without a signed-in user.', 'TeamsAppInstallation', 'ReadWriteSelfForTeam', 'All', 'all', 15, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteForTeam.All:application', 'TeamsAppInstallation.ReadWriteForTeam.All', 'application', 1, 'Allows the app to read, install, upgrade, and uninstall all Teams apps in any team, without a signed-in user.', 'TeamsAppInstallation', 'ReadWriteForTeam', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsApp.Read.Group:application', 'TeamsApp.Read.Group', 'application', 1, 'Allows the app to read the Teams apps that are installed in a specific team, without a signed-in user.', 'TeamsApp', 'Read', 'Group', 'specific', 10, 0, NULL, '[]', 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.Read.Group:application', 'TeamsAppInstallation.Read.Group', 'application', 1, 'Allows the app to read the Teams apps that are installed in this team, without a signed-in user.', 'TeamsAppInstallation', 'Read', 'Group', 'specific', 10, 0, NULL, '[]', 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsActivity.Send.Team:application', 'TeamsActivity.Send.Team', 'application', 1, 'Allows the app to send activity feed notifications to users in this team, without a signed-in user. Uses resource-specific consent.', 'TeamsActivity', 'Send', 'Team', 'specific', 35, 0, NULL, NULL, 'specific', '"team"', 'https://learn.microsoft.com/en-us/graph/api/team-sendactivitynotification', datetime('now'), datetime('now')),
('Schedule.Read.All:delegated', 'Schedule.Read.All', 'delegated', 1, 'Allows the app to read schedule, schedule groups, shifts and associated entities in the Teams or Shifts application on behalf of the signed-in user.', 'Schedule', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/schedule-list-daynotes?view=graph-rest-1.0', datetime('now'), datetime('now')),
('Schedule.Read.All:application', 'Schedule.Read.All', 'application', 1, 'Allows the app to read all schedules, schedule groups, shifts and associated entities in the Teams or Shifts application without a signed-in user.', 'Schedule', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/schedule-list-daynotes?view=graph-rest-1.0', datetime('now'), datetime('now')),
('Schedule.ReadWrite.All:delegated', 'Schedule.ReadWrite.All', 'delegated', 1, 'Allows the app to manage schedule, schedule groups, shifts and associated entities in the Teams or Shifts application on behalf of the signed-in user.', 'Schedule', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/schedule-list-daynotes?view=graph-rest-1.0', datetime('now'), datetime('now')),
('Schedule.ReadWrite.All:application', 'Schedule.ReadWrite.All', 'application', 1, 'Allows the app to manage all schedules, schedule groups, shifts and associated entities in the Teams or Shifts application without a signed-in user.', 'Schedule', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/schedule-list-daynotes?view=graph-rest-1.0', datetime('now'), datetime('now')),
('TeamsTab.Create:delegated', 'TeamsTab.Create', 'delegated', 0, 'Allows the app to create tabs in any team in Microsoft Teams, on behalf of the signed-in user', 'chat_tab', 'create', 'none', 'all', 40, 0, NULL, '["teamsApp_odata_bind", "displayName", "configuration"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/chat-post-tabs', datetime('now'), datetime('now')),
('TeamsTab.Create:application', 'TeamsTab.Create', 'application', 1, 'Allows the app to create tabs in any team in Microsoft Teams, without a signed-in user', 'chat_tab', 'create', 'none', 'all', 40, 0, NULL, '["teamsApp_odata_bind", "displayName", "configuration"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/api/chat-post-tabs', datetime('now'), datetime('now')),
('TeamsTab.Create.Chat:application', 'TeamsTab.Create.Chat', 'application', 1, 'Allows the app to create tabs in chats in Microsoft Teams, without a signed-in user', 'chat_tab', 'create', 'chat', 'all', 40, 0, NULL, '["teamsApp_odata_bind", "displayName", "configuration"]', 'chat', '"chat_only"', 'https://learn.microsoft.com/en-us/graph/api/chat-post-tabs', datetime('now'), datetime('now')),
('TeamsTab.ReadWriteSelfForChat:delegated', 'TeamsTab.ReadWriteSelfForChat', 'delegated', 0, 'Allows the app to read and write tabs in chats the signed-in user can access, on their behalf', 'chat_tab', 'write', 'self', 'self', 45, 1, NULL, '["teamsApp_odata_bind", "displayName", "configuration"]', 'chat', '"user_is_chat_member"', 'https://learn.microsoft.com/en-us/graph/api/chat-post-tabs', datetime('now'), datetime('now')),
('TeamsTab.ReadWriteSelfForChat.All:application', 'TeamsTab.ReadWriteSelfForChat.All', 'application', 1, 'Allows the app to read and write tabs in chats on behalf of the user, without a signed-in user', 'chat_tab', 'write', 'self', 'all', 45, 0, NULL, '["teamsApp_odata_bind", "displayName", "configuration"]', 'chat', NULL, 'https://learn.microsoft.com/en-us/graph/api/chat-post-tabs', datetime('now'), datetime('now')),
('TeamsTab.ReadWriteForChat:delegated', 'TeamsTab.ReadWriteForChat', 'delegated', 0, 'Allows the app to read and write tabs in chats in Microsoft Teams, on behalf of the signed-in user. Only chats where the user is a member.', 'chat_tab', 'write', 'self', 'self', 48, 0, NULL, '["teamsApp_odata_bind", "displayName", "configuration"]', 'chat', '"user_is_chat_member"', 'https://learn.microsoft.com/en-us/graph/api/chat-post-tabs', datetime('now'), datetime('now')),
('TeamsTab.ReadWriteForChat.All:application', 'TeamsTab.ReadWriteForChat.All', 'application', 1, 'Allows the app to read and write tabs in chats in Microsoft Teams, without a signed-in user', 'chat_tab', 'write', 'chat', 'all', 48, 0, NULL, '["teamsApp_odata_bind", "displayName", "configuration"]', 'chat', '"chat_only"', 'https://learn.microsoft.com/en-us/graph/api/chat-post-tabs', datetime('now'), datetime('now')),
('TeamsTab.ReadWrite.Chat:application', 'TeamsTab.ReadWrite.Chat', 'application', 1, 'Allows the app to read and write tabs in chats in Microsoft Teams, without a signed-in user', 'chat_tab', 'write', 'chat', 'all', 48, 0, NULL, '["teamsApp_odata_bind", "displayName", "configuration"]', 'chat', '"chat_only"', 'https://learn.microsoft.com/en-us/graph/api/chat-patch-tabs', datetime('now'), datetime('now')),
('TeamsTab.Delete.Chat:application', 'TeamsTab.Delete.Chat', 'application', 1, 'Allows the app to delete tabs from chats in Microsoft Teams, without a signed-in user', 'chat_tab', 'delete', 'chat', 'all', 60, 0, NULL, '[]', 'chat', '"chat_only"', 'https://learn.microsoft.com/en-us/graph/api/chat-delete-tabs', datetime('now'), datetime('now')),
('TeamsTab.Read.Chat:application', 'TeamsTab.Read.Chat', 'application', 1, 'Allows the app to read tabs in chats in Microsoft Teams, without a signed-in user', 'chat_tab', 'read', 'chat', 'all', 35, 0, NULL, '[]', 'chat', '"chat_only"', 'https://learn.microsoft.com/en-us/graph/api/chat-get-tabs', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadForUser:delegated', 'TeamsAppInstallation.ReadForUser', 'delegated', 0, 'Allows the app to read the Teams apps that are installed for the signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'read', 'self', 'self', 20, 1, NULL, '[]', 'own', '"user_own_installations"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteForUser:delegated', 'TeamsAppInstallation.ReadWriteForUser', 'delegated', 1, 'Allows the app to read, install, upgrade, and uninstall Teams apps installed for the signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'write', 'self', 'self', 30, 1, NULL, '[]', 'own', '"user_own_installations"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteSelectedForUser:delegated', 'TeamsAppInstallation.ReadWriteSelectedForUser', 'delegated', 1, 'Allows the app to read, install, upgrade, and uninstall selected Teams apps installed for the signed in user. Does not give the ability to read application-specific settings.', 'teams_app', 'write', 'self', 'self', 35, 1, NULL, '[]', 'own', '"user_selected_installations"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteSelfForUser:delegated', 'TeamsAppInstallation.ReadWriteSelfForUser', 'delegated', 0, 'Allows a Teams app to read, install, upgrade, and uninstall itself for the signed-in user.', 'teams_app', 'write', 'self', 'self', 25, 1, NULL, '[]', 'own', '"self_app_installation"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.Read.All:application', 'TeamsAppInstallation.Read.All', 'application', 1, 'Allows the app to read the Teams apps that are installed in any scope, without a signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'read', 'none', 'all', 40, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.Read.User:application', 'TeamsAppInstallation.Read.User', 'application', 1, 'Allows the app to read the Teams apps that are installed in user''s personal scope, without a signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'read', 'user', 'all', 38, 0, NULL, '[]', 'user', '"user_personal_scope"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteForUser.All:application', 'TeamsAppInstallation.ReadWriteForUser.All', 'application', 1, 'Allows the app to read, install, upgrade, and uninstall Teams apps for any user, without a signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'write', 'none', 'all', 50, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteSelectedForUser.All:application', 'TeamsAppInstallation.ReadWriteSelectedForUser.All', 'application', 1, 'Allows the app to read, install, upgrade, and uninstall selected Teams apps for any user, without a signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'write', 'selected', 'all', 48, 0, NULL, '[]', 'all', '"selected_apps_all_users"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteSelfForUser.All:application', 'TeamsAppInstallation.ReadWriteSelfForUser.All', 'application', 1, 'Allows a Teams app to read, install, upgrade, and uninstall itself to any user, without a signed-in user.', 'teams_app', 'write', 'self', 'all', 45, 0, NULL, '[]', 'all', '"self_app_all_users"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadForUser.All:application', 'TeamsAppInstallation.ReadForUser.All', 'application', 1, 'Allows the app to read the Teams apps that are installed for any user, without a signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'read', 'none', 'all', 42, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadForChat:delegated', 'TeamsAppInstallation.ReadForChat', 'delegated', 0, 'Allows the app to read the Teams apps that are installed in chats the signed-in user can access. Does not give the ability to read application-specific settings.', 'teams_app', 'read', 'chat', 'self', 22, 1, NULL, '[]', 'chat', '"user_accessible_chats"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteSelfForChat:delegated', 'TeamsAppInstallation.ReadWriteSelfForChat', 'delegated', 1, 'Allows a Teams app to read, install, upgrade, and uninstall itself in chats the signed-in user can access.', 'teams_app', 'write', 'self', 'self', 28, 1, NULL, '[]', 'chat', '"self_app_user_chats"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ManageSelectedForChat:delegated', 'TeamsAppInstallation.ManageSelectedForChat', 'delegated', 1, 'Allows the app to read, install, upgrade, and uninstall selected Teams apps in chats the signed-in user can access. Gives the ability to manage permission grants for accessing those specific chats'' data.', 'teams_app', 'write', 'selected', 'self', 32, 1, NULL, '[]', 'chat', '"selected_apps_user_chats"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteAndConsentForChat:delegated', 'TeamsAppInstallation.ReadWriteAndConsentForChat', 'delegated', 1, 'Allows the app to read, install, upgrade, and uninstall Teams apps in chats the signed-in user can access. Gives the ability to manage permission grants for accessing those specific chats'' data.', 'teams_app', 'write', 'none', 'self', 34, 1, NULL, '[]', 'chat', '"user_accessible_chats"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteAndConsentSelfForChat:delegated', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat', 'delegated', 1, 'Allows a Teams app to read, install, upgrade, and uninstall itself in chats the signed-in user can access, and manage its permission grants for accessing those specific chats'' data.', 'teams_app', 'write', 'self', 'self', 29, 1, NULL, '[]', 'chat', '"self_app_user_chats_with_consent"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteForChat:delegated', 'TeamsAppInstallation.ReadWriteForChat', 'delegated', 1, 'Allows the app to read, install, upgrade, and uninstall Teams apps in chats the signed-in user can access. Does not give the ability to read application-specific settings.', 'teams_app', 'write', 'none', 'self', 33, 1, NULL, '[]', 'chat', '"user_accessible_chats"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadForChat.All:application', 'TeamsAppInstallation.ReadForChat.All', 'application', 1, 'Allows the app to read the Teams apps that are installed in any chat, without a signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'read', 'none', 'all', 43, 0, NULL, '[]', 'chat', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteSelfForChat.All:application', 'TeamsAppInstallation.ReadWriteSelfForChat.All', 'application', 1, 'Allows a Teams app to read, install, upgrade, and uninstall itself for any chat, without a signed-in user.', 'teams_app', 'write', 'self', 'all', 46, 0, NULL, '[]', 'chat', '"self_app_all_chats"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ManageSelectedForChat.All:application', 'TeamsAppInstallation.ManageSelectedForChat.All', 'application', 1, 'Allows the app to read, install, upgrade, and uninstall selected Teams apps in any chat, without a signed-in user. Gives the ability to manage permission grants for accessing those specific chats'' data.', 'teams_app', 'write', 'selected', 'all', 49, 0, NULL, '[]', 'chat', '"selected_apps_all_chats"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.Read.Chat:application', 'TeamsAppInstallation.Read.Chat', 'application', 1, 'Allows the app to read the Teams apps that are installed in this chat along with the permissions granted to each app, without a signed-in user.', 'teams_app', 'read', 'chat', 'specific', 44, 0, NULL, '[]', 'specific_chat', '"specific_chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteAndConsentForChat.All:application', 'TeamsAppInstallation.ReadWriteAndConsentForChat.All', 'application', 1, 'Allows the app to read, install, upgrade, and uninstall Teams apps in any chat, without a signed-in user. Gives the ability to manage permission grants for accessing those specific chats'' data.', 'teams_app', 'write', 'none', 'all', 52, 0, NULL, '[]', 'chat', '"all_chats_with_consent"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteAndConsentSelfForChat.All:application', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat.All', 'application', 1, 'Allows a Teams app to read, install, upgrade, and uninstall itself for any chat, without a signed-in user, and manage its permission grants for accessing those specific chats'' data.', 'teams_app', 'write', 'self', 'all', 47, 0, NULL, '[]', 'chat', '"self_app_all_chats_with_consent"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsAppInstallation.ReadWriteForChat.All:application', 'TeamsAppInstallation.ReadWriteForChat.All', 'application', 1, 'Allows the app to read, install, upgrade, and uninstall Teams apps in any chat, without a signed-in user. Does not give the ability to read application-specific settings.', 'teams_app', 'write', 'none', 'all', 51, 0, NULL, '[]', 'chat', '"all_chats"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamsTab.Delete.Group:application', 'TeamsTab.Delete.Group', 'application', 1, 'Allows the app to delete this team''s tabs, without a signed-in user.', 'channel_tab', 'delete', 'group', 'group', 62, 0, NULL, '[]', 'channel', '"resource_specific_consent"', 'https://learn.microsoft.com/en-us/graph/api/channel-delete-tabs', datetime('now'), datetime('now')),
('Calls.JoinGroupCallAsGuest.All:application', 'Calls.JoinGroupCallAsGuest.All', 'application', 1, 'Allows the app to anonymously join group calls and scheduled meetings in your organization, without a signed-in user. The app will be joined as a guest to meetings in your organization.', 'Call', 'JoinGroupCallAsGuest', NULL, 'all', 10, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Calls.Initiate.All:application', 'Calls.Initiate.All', 'application', 1, 'Allows the app to place outbound calls to a single user and transfer calls to users in your organization''s directory, without a signed-in user.', 'Call', 'Initiate', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Calls.InitiateGroupCall.All:application', 'Calls.InitiateGroupCall.All', 'application', 1, 'Allows the app to place outbound calls to multiple users and add participants to meetings in your organization, without a signed-in user.', 'Call', 'InitiateGroupCall', NULL, 'all', 30, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Calls.JoinGroupCall.All:application', 'Calls.JoinGroupCall.All', 'application', 1, 'Allows the app to join group calls and scheduled meetings in your organization, without a signed-in user. The app will be joined with the privileges of a directory user to meetings in your organization.', 'Call', 'JoinGroupCall', NULL, 'all', 40, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Calls.AccessMedia.All:application', 'Calls.AccessMedia.All', 'application', 1, 'Allows the app to get direct access to media streams in a call, without a signed-in user.', 'Call', 'AccessMedia', NULL, 'all', 50, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Calls.JoinGroupCalls.Chat:application', 'Calls.JoinGroupCalls.Chat', 'application', 1, 'Allows the app to join group calls and scheduled meetings associated with a specific chat, without a signed-in user.', 'Call', 'JoinGroupCalls', 'Chat', 'specific', 15, 0, NULL, NULL, 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('CallRecords.Read.All:application', 'CallRecords.Read.All', 'application', 1, 'Allows the app to read call records for all calls and online meetings without a signed-in user.', 'CallRecords', 'Read', NULL, 'all', 60, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('UserTeamwork.Read:delegated', 'UserTeamwork.Read', 'delegated', 1, 'Read user teamwork settings', 'UserTeamwork', 'Read', NULL, 'self', 10, 1, NULL, '[]', 'self', '"user"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('UserTeamwork.Read.All:application', 'UserTeamwork.Read.All', 'application', 1, 'Read all user teamwork settings', 'UserTeamwork', 'Read', 'All', 'all', 20, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('CallRecords.Read:delegated', 'CallRecords.Read', 'delegated', 1, 'Read call records', 'CallRecord', 'Read', NULL, 'self', 10, 0, NULL, '[]', 'self', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetingArtifact.Read.All:application', 'OnlineMeetingArtifact.Read.All', 'application', 1, 'Allows the app to read online meeting artifacts in your organization, without a signed-in user.', 'OnlineMeetingArtifact', 'Read', NULL, 'all', 15, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetingArtifact.Read.All:delegated', 'OnlineMeetingArtifact.Read.All', 'delegated', 0, 'Allows the app to read online meeting artifacts on behalf of the signed-in user.', 'OnlineMeetingArtifact', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetingArtifact.Read.Chat:application', 'OnlineMeetingArtifact.Read.Chat', 'application', 1, 'Read attendance reports & attendance records for this webinar or town hall.', 'OnlineMeetingArtifact', 'Read', 'Chat', 'specific', 10, 0, NULL, '[]', 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetingTranscript.Read.All:application', 'OnlineMeetingTranscript.Read.All', 'application', 1, 'Allows the app to read all transcripts of all online meetings, without a signed-in user.', 'OnlineMeetingTranscript', 'Read', NULL, 'all', 15, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetingTranscript.Read.All:delegated', 'OnlineMeetingTranscript.Read.All', 'delegated', 1, 'Allows the app to read all transcripts of online meetings, on behalf of the signed-in user.', 'OnlineMeetingTranscript', 'Read', NULL, 'all', 15, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetingTranscript.Read.Chat:application', 'OnlineMeetingTranscript.Read.Chat', 'application', 1, 'Allows the app to read transcripts of the meetings associated with this chat, without a signed-in user.', 'OnlineMeetingTranscript', 'Read', 'Chat', 'specific', 10, 0, NULL, '[]', 'specific', '"chat"', 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetings.Read:delegated', 'OnlineMeetings.Read', 'delegated', 0, 'Allows the app to read online meeting details on behalf of the signed-in user.', 'OnlineMeetings', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetings.ReadWrite:delegated', 'OnlineMeetings.ReadWrite', 'delegated', 0, 'Allows the app to read and create online meetings on behalf of the signed-in user.', 'OnlineMeetings', 'ReadWrite', NULL, 'all', 15, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetings.Read.All:application', 'OnlineMeetings.Read.All', 'application', 1, 'Allows the app to read online meeting details in your organization, without a signed-in user.', 'OnlineMeetings', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('OnlineMeetings.ReadWrite.All:application', 'OnlineMeetings.ReadWrite.All', 'application', 1, 'Allows the app to read and create online meetings as an application in your organization.', 'OnlineMeetings', 'ReadWrite', NULL, 'all', 15, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('VirtualAppointment.Read:delegated', 'VirtualAppointment.Read', 'delegated', 1, 'Allows an application to read virtual appointments for the signed-in user. Only an organizer or participant user can read their virtual appointments.', 'VirtualAppointment', 'Read', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('VirtualAppointment.ReadWrite:delegated', 'VirtualAppointment.ReadWrite', 'delegated', 1, 'Allows an application to read and write virtual appointments for the signed-in user. Only an organizer or participant user can read and write their virtual appointments.', 'VirtualAppointment', 'ReadWrite', NULL, 'all', 15, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('VirtualAppointmentNotification.Send:delegated', 'VirtualAppointmentNotification.Send', 'delegated', 1, 'Allows an application to send notifications for virtual appointments for the signed-in user.', 'VirtualAppointment', 'Send', NULL, 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('VirtualAppointmentNotification.Send:application', 'VirtualAppointmentNotification.Send', 'application', 1, 'Allows the application to send notification regarding virtual appointments as any user, without a signed-in user. The app must also be authorized to access an individual user''s data by the online meetings application access policy.', 'VirtualAppointment', 'Send', NULL, 'all', 15, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('TeamworkTag.Read:delegated', 'TeamworkTag.Read', 'delegated', 0, 'Read teamwork tags for teams the signed-in user is a member of', 'teamworkTag', 'read', 'membership', 'group', 1, 0, NULL, NULL, NULL, NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference#teamworktagread', datetime('now'), datetime('now')),
('TeamworkTag.ReadWrite:delegated', 'TeamworkTag.ReadWrite', 'delegated', 0, 'Create, read, update, and delete teamwork tags for teams the signed-in user is a member of', 'teamworkTag', 'write', 'membership', 'group', 2, 0, NULL, NULL, NULL, NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference#teamworktagreadwrite', datetime('now'), datetime('now')),
('TeamworkTag.Read.All:application', 'TeamworkTag.Read.All', 'application', 1, 'Read all teamwork tags in the organization without a signed-in user', 'teamworkTag', 'read', NULL, 'all', 3, 0, NULL, NULL, NULL, NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference#teamworktagreadall', datetime('now'), datetime('now')),
('TeamworkTag.ReadWrite.All:application', 'TeamworkTag.ReadWrite.All', 'application', 1, 'Create, read, update, and delete all teamwork tags in the organization without a signed-in user', 'teamworkTag', 'write', NULL, 'all', 4, 0, NULL, NULL, NULL, NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference#teamworktagreadwriteall', datetime('now'), datetime('now')),
('Presence.Read:delegated', 'Presence.Read', 'delegated', 0, 'Allows the app to read presence information on behalf of the signed-in user. Presence information includes activity, availability, status note, calendar out-of-office message, timezone and location.', 'User', 'Read', NULL, 'self', 10, 1, '["id", "availability", "activity", "sessionId", "expirationDateTime", "isActive", "createdDateTime", "lastModifiedDateTime"]', '[]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Presence.Read.All:delegated', 'Presence.Read.All', 'delegated', 1, 'Allows the app to read presence information of all users in the directory on behalf of the signed-in user. Presence information includes activity, availability, status note, calendar out-of-office message, timezone and location.', 'User', 'Read', 'All', 'all', 10, 0, '["id", "availability", "activity", "sessionId", "expirationDateTime", "applicationId", "applicationName", "isActive", "createdDateTime", "lastModifiedDateTime"]', '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Presence.ReadWrite:delegated', 'Presence.ReadWrite', 'delegated', 0, 'Allows the app to read and write presence information on behalf of the signed-in user. Presence information includes activity, availability, status note, calendar out-of-office message, timezone and location.', 'User', 'ReadWrite', NULL, 'self', 20, 1, '["id", "availability", "activity", "sessionId", "expirationDateTime", "isActive", "createdDateTime", "lastModifiedDateTime"]', '["sessionId", "availability", "activity", "expirationDuration"]', 'own', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Presence.ReadWrite.All:delegated', 'Presence.ReadWrite.All', 'delegated', 1, 'Allows the app to read and write presence information of all users in the directory on behalf of the signed-in user. Presence information includes activity, availability, status note, calendar out-of-office message, timezone and location.', 'User', 'ReadWrite', 'All', 'all', 20, 0, '["id", "availability", "activity", "sessionId", "expirationDateTime", "applicationId", "applicationName", "isActive", "createdDateTime", "lastModifiedDateTime"]', '["sessionId", "availability", "activity", "expirationDuration"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Presence.Read.All:application', 'Presence.Read.All', 'application', 1, 'Allows the app to read presence information of all users in the directory without a signed-in user. Presence information includes activity, availability, status note, calendar out-of-office message, timezone and location.', 'User', 'Read', 'All', 'all', 20, 0, '["id", "availability", "activity", "sessionId", "expirationDateTime", "applicationId", "applicationName", "isActive", "createdDateTime", "lastModifiedDateTime"]', '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('Presence.ReadWrite.All:application', 'Presence.ReadWrite.All', 'application', 1, 'Allows the app to read and write presence information of all users in the directory without a signed-in user. Presence information includes activity, availability, status note, calendar out-of-office message, timezone and location.', 'User', 'ReadWrite', 'All', 'all', 30, 0, '["id", "availability", "activity", "sessionId", "expirationDateTime", "applicationId", "applicationName", "isActive", "createdDateTime", "lastModifiedDateTime"]', '["sessionId", "availability", "activity", "expirationDuration"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('VirtualEvent.ReadWrite:delegated', 'VirtualEvent.ReadWrite', 'delegated', 1, 'Allows the app to read and write virtual events on behalf of the signed-in user.', 'VirtualEvent', 'ReadWrite', NULL, 'self', 40, 0, NULL, NULL, 'self', NULL, 'https://learn.microsoft.com/en-us/graph/api/virtualeventsroot-post-webinars', datetime('now'), datetime('now')),
('VirtualEvent.Read:delegated', 'VirtualEvent.Read', 'delegated', 0, 'Allows the app to read virtual events on behalf of the signed-in user.', 'VirtualEvent', 'Read', NULL, 'self', 20, 0, NULL, NULL, 'self', NULL, 'https://learn.microsoft.com/en-us/graph/api/virtualeventwebinar-getbyuserrole', datetime('now'), datetime('now')),
('VirtualEvent.Read.All:application', 'VirtualEvent.Read.All', 'application', 1, 'Allows the app to read all virtual events without a signed-in user.', 'VirtualEvent', 'Read.All', NULL, 'organization', 30, 0, NULL, NULL, 'organization', NULL, 'https://learn.microsoft.com/en-us/graph/api/virtualeventsroot-list-webinars', datetime('now'), datetime('now')),
('VirtualEvent.Read.Chat:application', 'VirtualEvent.Read.Chat', 'application', 1, 'Allows the app to read virtual events for users with application access policy.', 'VirtualEvent', 'Read.Chat', NULL, 'selected', 25, 0, NULL, NULL, 'selected', NULL, 'https://learn.microsoft.com/en-us/graph/api/virtualeventwebinar-getbyuseridandrole', datetime('now'), datetime('now')),
('LearningProvider.Read:delegated', 'LearningProvider.Read', 'delegated', 0, 'Allows the app to read learning providers on behalf of the signed-in user.', 'LearningProvider', 'Read', NULL, 'self', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningProvider.ReadWrite:delegated', 'LearningProvider.ReadWrite', 'delegated', 1, 'Allows the app to create, read, update, and delete learning providers on behalf of the signed-in user.', 'LearningProvider', 'ReadWrite', NULL, 'self', 20, 0, NULL, '["displayName", "squareLogoWebUrlForDarkTheme", "longLogoWebUrlForDarkTheme", "squareLogoWebUrlForLightTheme", "longLogoWebUrlForLightTheme", "loginWebUrl", "isCourseActivitySyncEnabled"]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningProvider.ReadWrite.All:delegated', 'LearningProvider.ReadWrite.All', 'delegated', 1, 'Allows the app to create, read, update, and delete all learning providers in the organization on behalf of the signed-in user.', 'LearningProvider', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningProvider.Read.All:application', 'LearningProvider.Read.All', 'application', 1, 'Allows the app to read all learning providers in the organization without a signed-in user.', 'LearningProvider', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningProvider.ReadWrite.All:application', 'LearningProvider.ReadWrite.All', 'application', 1, 'Allows the app to create, read, update, and delete all learning providers in the organization without a signed-in user.', 'LearningProvider', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningAssignedCourse.Read:delegated', 'LearningAssignedCourse.Read', 'delegated', 0, 'Allows the app to read assigned learning course activities on behalf of the signed-in user.', 'LearningCourseActivity', 'Read', NULL, 'self', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningAssignedCourse.Read.All:application', 'LearningAssignedCourse.Read.All', 'application', 1, 'Allows the app to read all assigned learning course activities in the organization without a signed-in user.', 'LearningCourseActivity', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningAssignedCourse.ReadWrite.All:application', 'LearningAssignedCourse.ReadWrite.All', 'application', 1, 'Allows the app to create, read, update, and delete all assigned learning course activities in the organization without a signed-in user.', 'LearningCourseActivity', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningSelfInitiatedCourse.Read:delegated', 'LearningSelfInitiatedCourse.Read', 'delegated', 0, 'Allows the app to read self-initiated learning course activities on behalf of the signed-in user.', 'LearningCourseActivity', 'Read', NULL, 'self', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningSelfInitiatedCourse.Read.All:application', 'LearningSelfInitiatedCourse.Read.All', 'application', 1, 'Allows the app to read all self-initiated learning course activities in the organization without a signed-in user.', 'LearningCourseActivity', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('LearningSelfInitiatedCourse.ReadWrite.All:application', 'LearningSelfInitiatedCourse.ReadWrite.All', 'application', 1, 'Allows the app to create, read, update, and delete all self-initiated learning course activities in the organization without a signed-in user.', 'LearningCourseActivity', 'ReadWrite', 'All', 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('AppCatalog.Read.All:application', 'AppCatalog.Read.All', 'application', 1, 'Allows the app to read apps in the app catalogs without a signed-in user.', 'AppCatalog', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('AppCatalog.Read.All:delegated', 'AppCatalog.Read.All', 'delegated', 0, 'Allows the app to read the apps in the app catalogs.', 'AppCatalog', 'Read', 'All', 'all', 10, 0, NULL, '[]', 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now')),
('AppCatalog.Submit:delegated', 'AppCatalog.Submit', 'delegated', 0, 'Allows the app to submit application packages to the catalog and cancel submissions that are pending review on behalf of the signed-in user.', 'AppCatalog', 'Submit', NULL, 'all', 20, 0, NULL, NULL, 'all', NULL, 'https://learn.microsoft.com/en-us/graph/permissions-reference', datetime('now'), datetime('now'));
-- Link modules to catalog permissions (aggregated)
INSERT INTO module_permissions (module_name, permission_id, created_at) VALUES
('users', 'User.Read:delegated', datetime('now')),
('users', 'User.ReadWrite:delegated', datetime('now')),
('users', 'User.ReadBasic.All:delegated', datetime('now')),
('users', 'User.Read.All:delegated', datetime('now')),
('users', 'User.ReadWrite.All:delegated', datetime('now')),
('users', 'User.Read.All:application', datetime('now')),
('users', 'User.ReadWrite.All:application', datetime('now')),
('chats', 'Chat.Read:delegated', datetime('now')),
('chats', 'Chat.ReadWrite:delegated', datetime('now')),
('chats', 'Chat.ReadWrite.All:delegated', datetime('now')),
('chats', 'Chat.Read.All:application', datetime('now')),
('chats', 'Chat.ReadWrite.All:application', datetime('now')),
('chats', 'TeamsTab.Create:delegated', datetime('now')),
('chats', 'TeamsTab.Read.All:delegated', datetime('now')),
('chats', 'TeamsTab.ReadWrite.All:delegated', datetime('now')),
('chats', 'TeamsTab.ReadWriteSelfForChat:delegated', datetime('now')),
('chats', 'TeamsTab.ReadWriteForChat:delegated', datetime('now')),
('chats', 'TeamsTab.Create:application', datetime('now')),
('chats', 'TeamsTab.Read.All:application', datetime('now')),
('chats', 'TeamsTab.ReadWrite.All:application', datetime('now')),
('chats', 'TeamsTab.ReadWriteSelfForChat.All:application', datetime('now')),
('chats', 'TeamsTab.ReadWriteForChat.All:application', datetime('now')),
('channels', 'Channel.ReadBasic.All:delegated', datetime('now')),
('channels', 'Channel.ReadBasic.All:application', datetime('now')),
('channels', 'ChannelSettings.Read.All:delegated', datetime('now')),
('channels', 'ChannelSettings.Read.All:application', datetime('now')),
('channels', 'ChannelSettings.ReadWrite.All:delegated', datetime('now')),
('channels', 'ChannelSettings.ReadWrite.All:application', datetime('now')),
('teamworktag', 'TeamworkTag.Read:delegated', datetime('now')),
('teamworktag', 'TeamworkTag.ReadWrite:delegated', datetime('now')),
('teamworktag', 'TeamworkTag.Read.All:application', datetime('now')),
('teamworktag', 'TeamworkTag.ReadWrite.All:application', datetime('now')),
('virtual_events', 'VirtualEvent.Read:delegated', datetime('now')),
('virtual_events', 'VirtualEvent.ReadWrite:delegated', datetime('now')),
('virtual_events', 'VirtualEvent.Read.All:application', datetime('now')),
('virtual_events', 'VirtualEvent.Read.Chat:application', datetime('now')),
('online_meetings', 'OnlineMeetingArtifact.Read.All:delegated', datetime('now')),
('online_meetings', 'OnlineMeetingArtifact.Read.All:application', datetime('now')),
('online_meetings', 'OnlineMeetingArtifact.Read.Chat:application', datetime('now')),
('online_meetings', 'OnlineMeetingTranscript.Read.All:delegated', datetime('now')),
('online_meetings', 'OnlineMeetingTranscript.Read.All:application', datetime('now')),
('online_meetings', 'OnlineMeetings.Read:delegated', datetime('now')),
('online_meetings', 'OnlineMeetings.ReadWrite:delegated', datetime('now')),
('online_meetings', 'OnlineMeetings.Read.All:application', datetime('now')),
('online_meetings', 'OnlineMeetings.ReadWrite.All:application', datetime('now')),
('answer_call', 'Calls.JoinGroupCall.All:application', datetime('now')),
('answer_call', 'Calls.JoinGroupCallAsGuest.All:application', datetime('now'));
-- Grant users the module-linked permission(s) (aggregated)
INSERT INTO user_permissions (org_id, user_id, permission_id, resource_scope, granted_by, granted_at) VALUES
('techcorp-001', 'james.wilson', 'CallRecords.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Calls.AccessMedia.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Calls.Initiate.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Calls.InitiateGroupCall.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Calls.JoinGroupCall.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Calls.JoinGroupCallAsGuest.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Channel.Create.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Channel.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Channel.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Channel.Delete.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Channel.Delete.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Channel.Delete.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Channel.ReadBasic.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMember.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMember.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMessage.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMessage.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMessage.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMessage.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelMessage.UpdatePolicyViolation.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelSettings.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelSettings.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelSettings.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelSettings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChannelSettings.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.Manage.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.ManageDeletion.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Teamwork.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.ReadBasic.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.ReadBasic.WhereInstalled:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.ReadWrite:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMember.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMember.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMember.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMessage.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'ChatMessage.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Directory.AccessAsUser.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Directory.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Directory.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Directory.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Directory.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Files.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Files.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Group.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Group.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Group.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Group.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Group.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Group.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'GroupMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'GroupMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Mail.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Team.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Team.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Team.ReadBasic.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Team.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamMember.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamMember.ReadWriteNonOwnerRole.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamMember.ReadWriteNonOwnerRole.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamSettings.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamSettings.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamSettings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamSettings.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsActivity.Send.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsActivity.Send.Team:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsActivity.Send:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsActivity.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ManageSelectedForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ManageSelectedForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteAndConsentForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteAndConsentForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Create.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Delete.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Delete.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWriteForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWriteSelfForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsTab.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Teamwork.Migrate.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Teamwork.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Teamwork.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamworkTag.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamworkTag.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamworkTag.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamworkTag.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'User.EnableDisableAccount.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'User.ManageIdentities.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'User.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'User.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'User.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'User.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'User.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'UserTeamwork.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'TeamsAppInstallation.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Presence.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Presence.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Presence.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'Presence.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'OnlineMeetingArtifact.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'OnlineMeetingTranscript.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'OnlineMeetings.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'OnlineMeetings.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'OnlineMeetings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'VirtualAppointment.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'VirtualAppointment.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'VirtualAppointmentNotification.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'VirtualEvent.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'VirtualEvent.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'VirtualEvent.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'LearningProvider.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'LearningProvider.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'LearningAssignedCourse.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'LearningAssignedCourse.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'LearningSelfInitiatedCourse.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'LearningSelfInitiatedCourse.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'AppCatalog.Submit:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'AppCatalog.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'AppCatalog.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'AppCatalog.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'james.wilson', 'AppCatalog.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'User.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'User.EnableDisableAccount.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Directory.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Chat.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Chat.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'ChannelSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'TeamsTab.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'TeamsTab.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'TeamsTab.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Group.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Files.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Files.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Calls.AccessMedia.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Calls.Initiate.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Presence.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'admin.system', 'Presence.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'User.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Chat.ManageDeletion.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'ChatMember.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsTab.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsTab.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsAppInstallation.ReadForUser:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsAppInstallation.ReadForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsAppInstallation.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsAppInstallation.ReadForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsAppInstallation.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsAppInstallation.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Calls.JoinGroupCall.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Calls.InitiateGroupCall.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'ChannelMessage.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'ChannelMessage.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'ChannelMessage.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'ChannelMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Group.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Group.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Group.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Group.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'GroupMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamMember.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Mail.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Files.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsActivity.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsActivity.Send:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'TeamsActivity.Send.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'OnlineMeetingArtifact.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'OnlineMeetingTranscript.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'OnlineMeetings.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'OnlineMeetings.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'VirtualAppointment.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'VirtualAppointment.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'VirtualAppointmentNotification.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'UserTeamwork.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Calls.Initiate.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Schedule.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'Schedule.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'AppCatalog.Submit:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'alice.johnson', 'AppCatalog.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'User.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'TeamsTab.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'TeamsAppInstallation.ReadForUser:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'GroupMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'OnlineMeetingArtifact.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'OnlineMeetingTranscript.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'OnlineMeetings.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'OnlineMeetings.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'VirtualAppointmentNotification.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'UserTeamwork.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'Schedule.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'bob.smith', 'Schedule.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'carol.white', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'carol.white', 'Chat.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'carol.white', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'carol.white', 'TeamsTab.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'carol.white', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'carol.white', 'ChannelMessage.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'carol.white', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'carol.white', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'User.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'TeamsTab.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'TeamsAppInstallation.ReadForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'TeamsAppInstallation.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'Mail.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'dave.brown', 'Team.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'sarah.martinez', 'User.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'sarah.martinez', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'sarah.martinez', 'User.ManageIdentities.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'sarah.martinez', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'sarah.martinez', 'TeamsTab.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'mike.thompson', 'User.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'mike.thompson', 'User.EnableDisableAccount.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'mike.thompson', 'Chat.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'mike.thompson', 'TeamsTab.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'mike.thompson', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'john.davis', 'User.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'john.davis', 'Chat.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'john.davis', 'TeamsTab.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'john.davis', 'ChannelMessage.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Channel.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Channel.Delete.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChannelMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChannelMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChannelMessage.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChannelMessage.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChannelMessage.UpdatePolicyViolation.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChannelSettings.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChannelSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Chat.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Chat.ManageDeletion.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Chat.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Chat.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Chat.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChatMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChatMember.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChatMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChatMember.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'ChatMessage.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Directory.AccessAsUser.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Directory.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Directory.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Files.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Files.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Group.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Group.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Group.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'GroupMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Mail.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Presence.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Presence.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Presence.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Team.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Team.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamMember.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamMember.ReadWriteNonOwnerRole.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamSettings.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsActivity.Send:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ManageSelectedForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadForUser:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadWriteAndConsentForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsAppInstallation.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsTab.Create:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsTab.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsTab.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsTab.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsTab.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsTab.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamsTab.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'Teamwork.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamworkTag.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'TeamworkTag.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'User.EnableDisableAccount.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'User.ManageIdentities.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'User.Read.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'User.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'User.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'User.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'UserTeamwork.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'VirtualEvent.Read:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'nathan.richards', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'CallRecords.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Calls.AccessMedia.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Calls.Initiate.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Calls.InitiateGroupCall.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Calls.JoinGroupCall.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Calls.JoinGroupCallAsGuest.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Channel.Create.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Channel.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Channel.Delete.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Channel.Delete.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Channel.ReadBasic.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelMember.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelMember.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelMessage.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelMessage.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelMessage.UpdatePolicyViolation.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelSettings.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelSettings.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelSettings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChannelSettings.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.Manage.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.ManageDeletion.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.ManageDeletion.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.ReadBasic.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.ReadBasic.WhereInstalled:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Chat.ReadWrite:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChatMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChatMember.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChatMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'ChatMessage.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Directory.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Directory.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Group.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Group.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Group.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'GroupMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'GroupMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'OnlineMeetingArtifact.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'OnlineMeetingArtifact.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'OnlineMeetings.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'OnlineMeetings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'OnlineMeetingTranscript.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Presence.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Team.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Team.ReadBasic.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamMember.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamMember.ReadWriteNonOwnerRole.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamSettings.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamSettings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamSettings.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsActivity.Send.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsActivity.Send.Team:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsActivity.Send:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsApp.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ManageSelectedForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.Read.User:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadForUser.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteAndConsentForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteForUser.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteSelectedForUser.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteSelfForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsAppInstallation.ReadWriteSelfForUser.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.Create.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.Delete.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.Delete.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.ReadWrite.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.ReadWriteForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamsTab.ReadWriteSelfForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Teamwork.Migrate.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'Teamwork.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamworkTag.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'TeamworkTag.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'User.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'UserTeamwork.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'VirtualEvent.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'sophia.bennett', 'VirtualEvent.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Chat.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Chat.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Chat.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Chat.ManageDeletion.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Chat.ManageDeletion.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'ChatMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Teamwork.Migrate.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Chat.ReadWrite:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Chat.Manage.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.Create:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.Create.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.ReadWrite.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.Delete.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.Delete.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.ReadWriteForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsTab.ReadWriteSelfForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadForUser.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.Read.User:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadWriteForUser.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadWriteSelectedForUser.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadWriteSelfForUser.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'ChannelMessage.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'ChannelMessage.UpdatePolicyViolation.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Group.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'GroupMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'GroupMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamMember.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamMember.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Files.Read.All', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'UserTeamwork.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'CallRecords.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Calls.AccessMedia.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Calls.Initiate.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Calls.InitiateGroupCall.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Calls.JoinGroupCall.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Calls.JoinGroupCallAsGuest.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'OnlineMeetingArtifact.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'OnlineMeetingArtifact.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'OnlineMeetingTranscript.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'OnlineMeetings.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'OnlineMeetings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadWriteSelfForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsAppInstallation.ReadWriteForTeam.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'TeamsApp.Read.Group:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'VirtualEvent.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'VirtualEvent.Read.Chat:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Schedule.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'Schedule.ReadWrite.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'AppCatalog.Read.All:application', NULL, NULL, datetime('now')),
('techcorp-001', 'teams.service', 'AppCatalog.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'CallRecords.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Calls.AccessMedia.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Calls.Initiate.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Calls.InitiateGroupCall.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Calls.JoinGroupCall.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Calls.JoinGroupCallAsGuest.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Channel.Create.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Channel.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Channel.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Channel.Delete.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Channel.Delete.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Channel.Delete.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Channel.ReadBasic.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMember.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMember.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMember.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMessage.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMessage.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMessage.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMessage.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelMessage.UpdatePolicyViolation.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelSettings.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelSettings.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelSettings.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelSettings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChannelSettings.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.Manage.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.ManageDeletion.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.ReadBasic.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.ReadBasic.WhereInstalled:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.ReadWrite:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMember.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMember.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMember.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMember.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMessage.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'ChatMessage.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Directory.AccessAsUser.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Directory.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Directory.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Directory.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Directory.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Files.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Files.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Group.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Group.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Group.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Group.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Group.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Group.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'GroupMember.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'GroupMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Mail.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Team.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Team.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Team.ReadBasic.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Team.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamMember.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamMember.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamMember.ReadWriteNonOwnerRole.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamMember.ReadWriteNonOwnerRole.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamSettings.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamSettings.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamSettings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamSettings.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsActivity.Send.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsActivity.Send.Team:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsActivity.Send:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsActivity.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ManageSelectedForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ManageSelectedForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteAndConsentForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteAndConsentForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Create.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Delete.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Delete.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWriteForTeam.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWriteSelfForTeam.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsTab.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Teamwork.Migrate.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Teamwork.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Teamwork.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamworkTag.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamworkTag.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamworkTag.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamworkTag.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'User.EnableDisableAccount.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'User.ManageIdentities.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'User.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'User.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'User.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'User.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'User.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'UserTeamwork.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'TeamsAppInstallation.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Presence.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'Presence.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'VirtualEvent.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'VirtualEvent.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'robert.taylor', 'VirtualEvent.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'User.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'User.EnableDisableAccount.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'Directory.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'Chat.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'Chat.ManageDeletion.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'ChannelSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'Team.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'TeamMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'TeamSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'TeamsTab.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'TeamsTab.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'Group.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'Files.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'emma.wilson', 'Schedule.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Channel.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Channel.Delete.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChannelMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChannelMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChannelMessage.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChannelMessage.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChannelMessage.UpdatePolicyViolation.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChannelSettings.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChannelSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Chat.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Chat.ManageDeletion.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Chat.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Chat.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Chat.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChatMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChatMember.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChatMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChatMember.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'ChatMessage.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Directory.AccessAsUser.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Directory.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Directory.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Files.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Files.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Group.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Group.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Group.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'GroupMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Mail.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Presence.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Presence.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Presence.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Team.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Team.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamMember.ReadWriteNonOwnerRole.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamSettings.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsActivity.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ManageSelectedForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadForUser:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadWriteAndConsentForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsAppInstallation.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsTab.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsTab.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsTab.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsTab.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsTab.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsTab.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamsTab.ReadWriteSelfForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'Teamwork.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamworkTag.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'TeamworkTag.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'User.EnableDisableAccount.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'User.ManageIdentities.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'User.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'User.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'User.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'User.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'UserTeamwork.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'VirtualEvent.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'OnlineMeetings.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'OnlineMeetings.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'AppCatalog.Submit:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'AppCatalog.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'oliver.zhang', 'AppCatalog.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'CallRecords.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Calls.AccessMedia.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Calls.Initiate.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Calls.InitiateGroupCall.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Calls.JoinGroupCall.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Calls.JoinGroupCallAsGuest.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Channel.Create.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Channel.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Channel.Delete.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Channel.Delete.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Channel.ReadBasic.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelMember.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelMember.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelMember.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelMessage.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelMessage.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelMessage.UpdatePolicyViolation.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelSettings.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelSettings.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelSettings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChannelSettings.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.Manage.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.ManageDeletion.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.ManageDeletion.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.ReadBasic.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.ReadBasic.WhereInstalled:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Chat.ReadWrite:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChatMember.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChatMember.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChatMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'ChatMessage.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Directory.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Directory.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Group.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Group.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Group.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'GroupMember.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'GroupMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'OnlineMeetingArtifact.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'OnlineMeetingArtifact.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'OnlineMeetings.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'OnlineMeetings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'OnlineMeetingTranscript.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Presence.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Team.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Team.ReadBasic.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamMember.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamMember.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamMember.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamMember.ReadWriteNonOwnerRole.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamSettings.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamSettings.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamSettings.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsActivity.Send.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsActivity.Send.Team:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsActivity.Send:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsApp.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ManageSelectedForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.Read.User:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadForTeam.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadForUser.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteAndConsentForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteAndConsentSelfForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteForTeam.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteForUser.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteSelectedForUser.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteSelfForTeam.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsAppInstallation.ReadWriteSelfForUser.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.Create.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.Create:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.Delete.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.Delete.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.Read.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.ReadWrite.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.ReadWrite.Group:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.ReadWriteForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.ReadWriteForTeam.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.ReadWriteSelfForChat.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamsTab.ReadWriteSelfForTeam.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Teamwork.Migrate.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'Teamwork.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamworkTag.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'TeamworkTag.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'User.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'UserTeamwork.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'VirtualEvent.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'VirtualEvent.Read.Chat:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'AppCatalog.Read.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'maya.patel', 'AppCatalog.ReadWrite.All:application', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'User.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'User.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'Chat.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'TeamsTab.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'TeamsTab.ReadWriteForTeam:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'ChannelSettings.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'Team.Create:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'TeamMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'frank.chen', 'VirtualEvent.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'grace.kim', 'User.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'grace.kim', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'grace.kim', 'User.ManageIdentities.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'grace.kim', 'User.EnableDisableAccount.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'grace.kim', 'Directory.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'grace.kim', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'grace.kim', 'TeamsTab.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'grace.kim', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'henry.lopez', 'User.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'henry.lopez', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'henry.lopez', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'henry.lopez', 'TeamsTab.ReadWriteForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'henry.lopez', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'henry.lopez', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'henry.lopez', 'ChannelMember.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'henry.lopez', 'ChannelMember.ReadWrite.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'iris.patel', 'User.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'iris.patel', 'Chat.ReadWrite:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'iris.patel', 'TeamsTab.ReadWriteSelfForChat:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'iris.patel', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'iris.patel', 'ChannelMessage.Send:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'jack.morrison', 'User.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'jack.morrison', 'Chat.Read:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'jack.morrison', 'TeamsTab.Read.All:delegated', NULL, NULL, datetime('now')),
('globalex-002', 'jack.morrison', 'Channel.ReadBasic.All:delegated', NULL, NULL, datetime('now'));

-- User Role Assignments (Microsoft Entra roles)
-- Seed user role assignments (Microsoft Entra roles)
INSERT INTO teams_user_roles (org_id, user_id, role_id, role_name, role_description, assigned_at, assigned_by) VALUES
('techcorp-001', 'james.wilson', '62e90394-69f5-4237-9190-012177145e10', 'Global Administrator', 'Super User - Full administrative access including deleting privileged users', datetime('now'), NULL),
('techcorp-001', 'admin.system', '62e90394-69f5-4237-9190-012177145e10', 'Global Administrator', 'System Admin - Full administrative access including deleting privileged users', datetime('now'), NULL),
('techcorp-001', 'alice.johnson', 'fe930be7-5e62-47db-91af-98c3a49a38b1', 'User Administrator', 'Manager - Can manage non-privileged users', datetime('now'), NULL),
('techcorp-001', 'bob.smith', '00000000-0000-0000-0000-000000000000', 'User', 'Developer - Regular user with no administrative privileges', datetime('now'), NULL),
('techcorp-001', 'carol.white', '00000000-0000-0000-0000-000000000000', 'User', 'Designer - Regular user with no administrative privileges', datetime('now'), NULL),
('techcorp-001', 'dave.brown', '00000000-0000-0000-0000-000000000000', 'User', 'Sales - Regular user with no administrative privileges', datetime('now'), NULL),
('techcorp-001', 'sarah.martinez', 'fe930be7-5e62-47db-91af-98c3a49a38b1', 'User Administrator', 'HR Coordinator - Can manage users for HR purposes', datetime('now'), NULL),
('techcorp-001', 'mike.thompson', '7be44c8a-adaf-4e2a-84d6-ab2649e08a13', 'Privileged Authentication Administrator', 'IT Support - Privileged admin, can manage all users including auth methods', datetime('now'), NULL),
('techcorp-001', 'nathan.richards', '194ae4cb-b126-40b2-bd5b-6091b380977d', 'Security Administrator', 'Security Architect - Full delegated permissions for testing user-context OAuth 2.0 flows and identity management', datetime('now'), NULL),
('techcorp-001', 'sophia.bennett', '9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3', 'Application Administrator', 'Integration Services Manager - Full application permissions for testing daemon services and automated workflows', datetime('now'), NULL),
('techcorp-001', 'john.davis', '00000000-0000-0000-0000-000000000000', 'User', 'Intern - Regular user with minimal privileges', datetime('now'), NULL),
('globalex-002', 'emma.wilson', '62e90394-69f5-4237-9190-012177145e10', 'Global Administrator', 'CEO - Full administrative access', datetime('now'), NULL),
('globalex-002', 'frank.chen', 'e8611ab8-c189-46e8-94e1-60213ab1f814', 'Privileged Role Administrator', 'CTO - Can manage role assignments and privileged access', datetime('now'), NULL),
('globalex-002', 'grace.kim', 'fe930be7-5e62-47db-91af-98c3a49a38b1', 'User Administrator', 'HR Manager - Can manage non-privileged users', datetime('now'), NULL),
('globalex-002', 'henry.lopez', 'fe930be7-5e62-47db-91af-98c3a49a38b1', 'User Administrator', 'Operations Manager - Can manage users for operations', datetime('now'), NULL),
('globalex-002', 'iris.patel', '00000000-0000-0000-0000-000000000000', 'User', 'Regular Employee - Standard user access', datetime('now'), NULL),
('globalex-002', 'jack.morrison', '00000000-0000-0000-0000-000000000000', 'User', 'External Contractor - Limited access', datetime('now'), NULL);

-- Chats
INSERT INTO chats (chat_id, org_id, topic, chat_type, created_at, updated_at, soft_delete) VALUES
('meeting_MjdhMjVmN2QtZjNkNC00YjY4LWJkNDQtMmY2ZGUyMzQyMmY4', 'techcorp-001', NULL, 'oneOnOne', datetime('now'), datetime('now'), 0),
('meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'techcorp-001', 'Project Alpha Development Team', 'group', datetime('now'), datetime('now'), 0),
('meeting_MzllZWE0MjUtMGY2OS00YjZkLTkyNzgtOTQ2OWYwZGE3MzFm', 'techcorp-001', NULL, 'oneOnOne', datetime('now'), datetime('now'), 0),
('meeting_YjczNzM1YjItZmE2Mi00YzY1LWFjNjMtMzE0ZGZhOGI2NDVm', 'techcorp-001', 'Leadership Team Chat', 'group', datetime('now'), datetime('now'), 0),
('meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'globalex-002', 'Design Feedback & Reviews Global', 'group', datetime('now'), datetime('now'), 0),
('app_alice.johnson_NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', 'techcorp-001', 'Planner Bot - NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', 'oneOnOne', datetime('now'), datetime('now'), 0),
('app_bob.smith_NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwYWUzNWIzNi0wZmQ3LTQyMmUtODA1Yi1kNTNhZjE1NzkwOTM=', 'techcorp-001', 'Wiki Bot - NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwYWUzNWIzNi0wZmQ3LTQyMmUtODA1Yi1kNTNhZjE1NzkwOTM=', 'oneOnOne', datetime('now'), datetime('now'), 0);

-- Chat Members
INSERT INTO chat_members (chat_id, org_id, user_id, roles, tenant_id, display_name, is_hidden, last_message_read_datetime, added_at) VALUES
('meeting_MjdhMjVmN2QtZjNkNC00YjY4LWJkNDQtMmY2ZGUyMzQyMmY4', 'techcorp-001', 'alice.johnson', 'owner', NULL, 'Alice Johnson', 0, '2021-02-02T18:20:00.000+00:00', datetime('now')),
('meeting_MjdhMjVmN2QtZjNkNC00YjY4LWJkNDQtMmY2ZGUyMzQyMmY4', 'techcorp-001', 'bob.smith', 'owner', NULL, 'Bob Smith', 0, '2021-02-02T18:19:52.105', datetime('now')),
('meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'techcorp-001', 'alice.johnson', 'owner', NULL, 'Alice Johnson', 0, '2021-03-17T09:00:00.000+00:00', datetime('now')),
('meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'techcorp-001', 'bob.smith', 'guest', NULL, 'Bob Smith', 0, '2021-03-17T08:59:08.136', datetime('now')),
('meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'techcorp-001', 'carol.white', 'guest', NULL, 'Carol White', 1, '2021-03-16T15:30:00.000+00:00', datetime('now')),
('meeting_MzllZWE0MjUtMGY2OS00YjZkLTkyNzgtOTQ2OWYwZGE3MzFm', 'techcorp-001', 'alice.johnson', 'owner', NULL, 'Alice Johnson', 0, '2021-04-15T10:30:00.000+00:00', datetime('now')),
('meeting_MzllZWE0MjUtMGY2OS00YjZkLTkyNzgtOTQ2OWYwZGE3MzFm', 'techcorp-001', 'dave.brown', 'owner', NULL, 'Dave Brown', 0, '2021-04-15T10:25:00.000+00:00', datetime('now')),
('meeting_YjczNzM1YjItZmE2Mi00YzY1LWFjNjMtMzE0ZGZhOGI2NDVm', 'techcorp-001', 'alice.johnson', 'owner', NULL, 'Alice Johnson', 0, '2021-05-06T23:55:07.191', datetime('now')),
('meeting_YjczNzM1YjItZmE2Mi00YzY1LWFjNjMtMzE0ZGZhOGI2NDVm', 'techcorp-001', 'dave.brown', 'guest', NULL, 'Dave Brown', 0, '2021-05-06T23:50:00.000+00:00', datetime('now')),
('meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'techcorp-001', 'alice.johnson', 'owner', NULL, 'Alice Johnson', 0, '2021-03-01T17:05:00.000+00:00', datetime('now')),
('meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'techcorp-001', 'bob.smith', 'guest', NULL, 'Bob Smith', 0, '2021-03-01T17:04:19.349+00:00', datetime('now')),
('meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'techcorp-001', 'carol.white', 'guest', NULL, 'Carol White', 0, '2021-03-01T17:10:00.000+00:00', datetime('now')),
('meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'techcorp-001', 'dave.brown', 'guest', NULL, 'Dave Brown', 0, NULL, datetime('now')),
('app_alice.johnson_NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', 'techcorp-001', 'alice.johnson', 'owner', NULL, 'Alice Johnson', 0, NULL, datetime('now')),
('app_bob.smith_NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwYWUzNWIzNi0wZmQ3LTQyMmUtODA1Yi1kNTNhZjE1NzkwOTM=', 'techcorp-001', 'bob.smith', 'owner', NULL, 'Bob Smith', 0, NULL, datetime('now'));

-- Chat Messages
INSERT INTO chat_messages (message_id, chat_id, reply_to_id, etag, message_type, created_datetime, last_modified_datetime, last_edited_datetime, deleted_datetime, subject, summary, importance, locale, web_url, channel_identity_json, policy_violation_json, on_behalf_of_json, event_detail_json, from_json, body_json, attachments_json, mentions_json, reactions_json, message_history_json) VALUES
('1612289992105', 'meeting_MjdhMjVmN2QtZjNkNC00YjY4LWJkNDQtMmY2ZGUyMzQyMmY4', NULL, '1612289992105', 'message', '2021-02-02T18:19:52.105', '2021-02-02T18:19:52.105', NULL, NULL, NULL, NULL, 'normal', 'en-us', NULL, NULL, NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "alice.johnson", "displayName": "Alice Johnson", "userIdentityType": "aadUser"}}', '{"contentType": "text", "content": "Hey Bob, how''s the development on the new feature going?"}', '[]', '[]', '[]', '[]'),
('1615971548136', 'meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', NULL, '1615971548136', 'message', '2021-03-17T08:59:08.136', '2021-03-17T08:59:08.136', NULL, NULL, NULL, NULL, 'normal', 'en-us', NULL, NULL, NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "bob.smith", "displayName": "Bob Smith", "userIdentityType": "aadUser"}}', '{"contentType": "text", "content": "Project Alpha update: API development is 80% complete. Should be ready for testing next week."}', '[]', '[]', '[]', '[]'),
('1614618259349', 'meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', NULL, '1614618259349', 'message', '2021-03-01T17:04:19.349+00:00', '2021-03-01T17:04:19.349+00:00', NULL, NULL, NULL, NULL, 'normal', 'en-us', NULL, NULL, NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "carol.white", "displayName": "Carol White", "userIdentityType": "aadUser"}}', '{"contentType": "html", "content": "<p>Here''s the latest design mockup for the user dashboard. Please review and provide feedback!</p>"}', '[]', '[]', '[]', '[]');

-- Teams (with group_id, template_id, internal_id, incoming_channels, and migration_mode)
INSERT INTO teams (org_id, team_id, group_id, template_id, display_name, description, visibility, specialization, classification, internal_id, incoming_channels, member_settings, guest_settings, messaging_settings, fun_settings, discovery_settings, members, is_archived, migration_mode, web_url, created_date_time, updated_date_time, soft_delete) VALUES
('techcorp-001', 'team_techcorp_001', 'group_techcorp_001', 'standard', 'TechCorp Solutions Team', 'Main collaboration team for TechCorp Solutions organization', 'private', 'none', 'High Business Impact', 'team_techcorp_001', '[{"id": "e4f8a2b6c7d9e3f5a8b2c6d1e5f9a3b7", "displayName": "Tech Innovation", "description": "Shared channel for technology innovation collaboration", "membershipType": "shared", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}]', '{"allowCreateUpdateChannels": true, "allowCreatePrivateChannels": true, "allowDeleteChannels": true, "allowAddRemoveApps": true, "allowCreateUpdateRemoveTabs": true, "allowCreateUpdateRemoveConnectors": true}', '{"allowCreateUpdateChannels": false, "allowDeleteChannels": false}', '{"allowUserEditMessages": true, "allowUserDeleteMessages": true, "allowOwnerDeleteMessages": true, "allowTeamMentions": true, "allowChannelMentions": true}', '{"allowGiphy": true, "giphyContentRating": "moderate", "allowStickersAndMemes": true, "allowCustomMemes": true}', '{"showInTeamsSearchAndSuggestions": false}', '[{"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_techcorp_james_000", "roles": ["owner"], "displayName": "James Wilson", "userId": "james.wilson", "email": "james.wilson@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_techcorp_alice_001", "roles": ["owner"], "displayName": "Alice Johnson", "userId": "alice.johnson", "email": "alice.manager@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_techcorp_bob_002", "roles": ["member"], "displayName": "Bob Smith", "userId": "bob.smith", "email": "bob.smith@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_techcorp_carol_003", "roles": ["member"], "displayName": "Carol White", "userId": "carol.white", "email": "carol.white@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_techcorp_dave_004", "roles": ["member"], "displayName": "Dave Brown", "userId": "dave.brown", "email": "dave.brown@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_techcorp_nathan_005", "roles": ["member"], "displayName": "Nathan Richards", "userId": "nathan.richards", "email": "nathan.richards@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2022-03-15T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_techcorp_sophia_006", "roles": ["member"], "displayName": "Sophia Bennett", "userId": "sophia.bennett", "email": "sophia.bennett@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2021-08-20T00:00:00.000"}]', 0, 0, 'https://teams.microsoft.com/l/team/team_techcorp_001', datetime('now'), datetime('now'), 0),
('techcorp-001', 'team_techcorp_migration_001', 'group_techcorp_migration_001', 'standard', 'TechCorp Data Migration Team', 'Team created via migration with Teamwork.Migrate.All permission - currently in migration mode', 'private', 'none', 'High Business Impact', 'team_techcorp_migration_001', NULL, '{"allowCreateUpdateChannels": true, "allowCreatePrivateChannels": true, "allowDeleteChannels": true, "allowAddRemoveApps": true, "allowCreateUpdateRemoveTabs": true, "allowCreateUpdateRemoveConnectors": true}', '{"allowCreateUpdateChannels": false, "allowDeleteChannels": false}', '{"allowUserEditMessages": true, "allowUserDeleteMessages": true, "allowOwnerDeleteMessages": true, "allowTeamMentions": true, "allowChannelMentions": true}', '{"allowGiphy": true, "giphyContentRating": "moderate", "allowStickersAndMemes": true, "allowCustomMemes": true}', '{"showInTeamsSearchAndSuggestions": false}', '[{"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_migration_alice_001", "roles": ["owner"], "displayName": "Alice Johnson", "userId": "alice.johnson", "email": "alice.manager@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2025-10-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_migration_bob_002", "roles": ["member"], "displayName": "Bob Smith", "userId": "bob.smith", "email": "bob.smith@techcorp.com", "tenantId": "techcorp-001", "visibleHistoryStartDateTime": "2025-10-01T00:00:00.000"}]', 0, 1, 'https://teams.microsoft.com/l/team/team_techcorp_migration_001', datetime('now'), datetime('now'), 0),
('globalex-002', 'team_globalex_002', 'group_globalex_002', 'standard', 'GlobalEx Industries Team', 'Executive and operational team for GlobalEx Industries', 'private', 'none', 'Medium Business Impact', 'team_globalex_002', '[{"id": "d3e7f1a5b9c6d8e2f4a7b1c5d9e3f8a2", "displayName": "Product Roadmap", "description": "Shared channel for cross-organization product planning", "membershipType": "shared", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}]', '{"allowCreateUpdateChannels": true, "allowCreatePrivateChannels": true, "allowDeleteChannels": false, "allowAddRemoveApps": true, "allowCreateUpdateRemoveTabs": true, "allowCreateUpdateRemoveConnectors": false}', '{"allowCreateUpdateChannels": false, "allowDeleteChannels": false}', '{"allowUserEditMessages": true, "allowUserDeleteMessages": false, "allowOwnerDeleteMessages": true, "allowTeamMentions": true, "allowChannelMentions": true}', '{"allowGiphy": false, "giphyContentRating": "strict", "allowStickersAndMemes": false, "allowCustomMemes": false}', '{"showInTeamsSearchAndSuggestions": true}', '[{"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_globalex_emma_001", "roles": ["owner"], "displayName": "Emma Wilson", "userId": "emma.wilson", "email": "emma.wilson@globalex.com", "tenantId": "globalex-002", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_globalex_frank_002", "roles": ["owner"], "displayName": "Frank Chen", "userId": "frank.chen", "email": "frank.chen@globalex.com", "tenantId": "globalex-002", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_globalex_grace_003", "roles": ["member"], "displayName": "Grace Kim", "userId": "grace.kim", "email": "grace.kim@globalex.com", "tenantId": "globalex-002", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_globalex_henry_004", "roles": ["member"], "displayName": "Henry Lopez", "userId": "henry.lopez", "email": "henry.lopez@globalex.com", "tenantId": "globalex-002", "visibleHistoryStartDateTime": "2021-01-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_globalex_oliver_005", "roles": ["member"], "displayName": "Oliver Zhang", "userId": "oliver.zhang", "email": "oliver.zhang@globalex.com", "tenantId": "globalex-002", "visibleHistoryStartDateTime": "2020-09-14T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_globalex_maya_006", "roles": ["member"], "displayName": "Maya Patel", "userId": "maya.patel", "email": "maya.patel@globalex.com", "tenantId": "globalex-002", "visibleHistoryStartDateTime": "2018-06-01T00:00:00.000"}]', 0, 0, 'https://teams.microsoft.com/l/team/team_globalex_002', datetime('now'), datetime('now'), 0),
('globalex-002', 'team_globalex_migration_002', 'group_globalex_migration_002', 'standard', 'GlobalEx Legacy System Migration', 'Team for legacy system data migration - currently in migration mode awaiting completion', 'private', 'none', 'Medium Business Impact', 'team_globalex_migration_002', NULL, '{"allowCreateUpdateChannels": true, "allowCreatePrivateChannels": true, "allowDeleteChannels": false, "allowAddRemoveApps": true, "allowCreateUpdateRemoveTabs": true, "allowCreateUpdateRemoveConnectors": false}', '{"allowCreateUpdateChannels": false, "allowDeleteChannels": false}', '{"allowUserEditMessages": true, "allowUserDeleteMessages": false, "allowOwnerDeleteMessages": true, "allowTeamMentions": true, "allowChannelMentions": true}', '{"allowGiphy": false, "giphyContentRating": "strict", "allowStickersAndMemes": false, "allowCustomMemes": false}', '{"showInTeamsSearchAndSuggestions": true}', '[{"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_migration_emma_001", "roles": ["owner"], "displayName": "Emma Wilson", "userId": "emma.wilson", "email": "emma.wilson@globalex.com", "tenantId": "globalex-002", "visibleHistoryStartDateTime": "2025-10-01T00:00:00.000"}, {"@odata.type": "#microsoft.graph.aadUserConversationMember", "id": "membership_migration_frank_002", "roles": ["owner"], "displayName": "Frank Chen", "userId": "frank.chen", "email": "frank.chen@globalex.com", "tenantId": "globalex-002", "visibleHistoryStartDateTime": "2025-10-01T00:00:00.000"}]', 0, 1, 'https://teams.microsoft.com/l/team/team_globalex_migration_002', datetime('now'), datetime('now'), 0);

-- Installed Apps (for teams)
INSERT INTO installed_apps (org_id, team_id, installation_id, teams_app_id, teams_app_external_id, teams_app_display_name, teams_app_distribution_method, teams_app_definition_id, teams_app_definition_version, azure_ad_app_id, publishing_state, short_description, description, required_resource_specific_permissions, consented_permission_set, created_date_time, soft_delete) VALUES
('techcorp-001', 'team_techcorp_001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', 'com.microsoft.teamspace.tab.planner', NULL, 'Planner', 'store', 'Y29tLm1pY3Jvc29mdC50ZWFtc3BhY2UudGFiLnBsYW5uZXI=', '1.0.0', '09408b3a-3ede-4983-95e1-da0693027e19', 'published', 'Plan, track, and manage team work', 'Plan, track, and manage team work with Planner. Create tasks, assign them to team members, and track progress.', '["ChannelMessage.Read.Group", "TeamMember.Read.Group"]', '{"resourceSpecificPermissions": [{"permissionValue": "ChannelMessage.Read.Group", "permissionType": "Delegated"}]}', datetime('now'), 0),
('techcorp-001', 'team_techcorp_001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwYWUzNWIzNi0wZmQ3LTQyMmUtODA1Yi1kNTNhZjE1NzkwOTM=', 'com.microsoft.teamspace.tab.wiki', NULL, 'Wiki', 'store', 'Y29tLm1pY3Jvc29mdC50ZWFtc3BhY2UudGFiLndpa2k=', '1.0.0', '0ae35b36-0fd7-422e-805b-d53af1579093', 'published', 'Create and share knowledge', 'Create and share knowledge with Wiki. Build collaborative documentation directly in Teams.', '["ChannelMessage.Read.Group"]', NULL, datetime('now'), 0),
('techcorp-001', 'team_techcorp_001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwZDgyMGVjZC1kZWYyLTQyOTctYWRhZC03ODA1NmNkZTdjNzg=', '0d820ecd-def2-4297-adad-78056cde7c78', NULL, 'OneNote', 'store', 'MGQ4MjBlY2QtZGVmMi00Mjk3LWFkYWQtNzgwNTZjZGU3Yzc4', '1.0.0', '0d820ecd-def2-4297-adad-78056cde7c78', 'published', 'Digital notebooks for your team', 'Create and organize digital notebooks with OneNote. Capture ideas, meeting notes, and project details.', NULL, NULL, datetime('now'), 0),
('globalex-002', 'team_globalex_002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', 'com.microsoft.teamspace.tab.planner.global', NULL, 'Planner', 'store', 'Y29tLm1pY3Jvc29mdC50ZWFtc3BhY2UudGFiLnBsYW5uZXIuZ2xvYmFs', '1.0.0', '09408b3a-3ede-4983-95e1-da0693027e19', 'published', 'Plan, track, and manage team work', 'Plan, track, and manage team work with Planner. Create tasks, assign them to team members, and track progress.', '["ChannelMessage.Read.Group", "TeamMember.Read.Group"]', '{"resourceSpecificPermissions": [{"permissionValue": "ChannelMessage.Read.Group", "permissionType": "Delegated"}, {"permissionValue": "TeamMember.Read.Group", "permissionType": "Delegated"}]}', datetime('now'), 0),
('globalex-002', 'team_globalex_002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=', '2a527703-1f6f-4559-a332-d8a7d288cd88', NULL, 'SharePoint', 'store', 'MmE1Mjc3MDMtMWY2Zi00NTU5LWEzMzItZDhhN2QyODhjZDg4', '1.0.0', '2a527703-1f6f-4559-a332-d8a7d288cd88', 'published', 'Access SharePoint sites and documents', 'Access SharePoint sites and documents directly from Teams. Collaborate on files and content seamlessly.', '["TeamsTab.Read.Group"]', '{"resourceSpecificPermissions": [{"permissionValue": "TeamsTab.Read.Group", "permissionType": "Application"}]}', datetime('now'), 0),
('globalex-002', 'team_globalex_002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyNjb20ubWljcm9zb2Z0LnRlYW1zcGFjZS50YWIucG93ZXJiaQ==', 'com.microsoft.teamspace.tab.powerbi', NULL, 'Power BI', 'store', 'Y29tLm1pY3Jvc29mdC50ZWFtc3BhY2UudGFiLnBvd2VyYmk=', '1.0.0', '871c010f-5e61-4fb1-83ac-98610a7e9110', 'published', 'Bring data to life with Power BI', 'Bring data to life with Power BI. Share interactive reports and dashboards with your team.', '["TeamsActivity.Send.Group"]', NULL, datetime('now'), 0);

-- Resource-Specific Permission Grants (for teams)
INSERT INTO resource_specific_permission_grants (org_id, grant_id, resource_type, resource_id, client_app_id, resource_app_id, client_id, permission_type, permission, installation_id, created_date_time, soft_deleted, additional_metadata) VALUES
('techcorp-001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=#ChannelMessage.Read.Group#Delegated', 'team', 'team_techcorp_001', '09408b3a-3ede-4983-95e1-da0693027e19', '00000003-0000-0000-c000-000000000000', '09408b3a-3ede-4983-95e1-da0693027e19', 'Delegated', 'ChannelMessage.Read.Group', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', '2024-01-15T10:30:00Z', 0, '{"app_name": "Planner", "app_display_name": "Planner", "granted_by": "alice.johnson@techcorp.com"}'),
('techcorp-001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=#TeamMember.Read.Group#Delegated', 'team', 'team_techcorp_001', '09408b3a-3ede-4983-95e1-da0693027e19', '00000003-0000-0000-c000-000000000000', '09408b3a-3ede-4983-95e1-da0693027e19', 'Delegated', 'TeamMember.Read.Group', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', '2024-01-15T10:30:00Z', 0, '{"app_name": "Planner", "app_display_name": "Planner", "granted_by": "alice.johnson@techcorp.com"}'),
('techcorp-001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=#TeamsTab.Create.Group#Application', 'team', 'team_techcorp_001', '09408b3a-3ede-4983-95e1-da0693027e19', '00000003-0000-0000-c000-000000000000', '09408b3a-3ede-4983-95e1-da0693027e19', 'Application', 'TeamsTab.Create.Group', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', '2024-01-15T10:30:00Z', 0, '{"app_name": "Planner", "app_display_name": "Planner", "granted_by": "system"}'),
('techcorp-001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwZDgyMGVjZC1kZWYyLTQyOTctYWRhZC03ODA1NmNkZTdjNzg=#Notes.ReadWrite#Delegated', 'team', 'team_techcorp_001', '0d820ecd-def2-4297-adad-78056cde7c78', '00000003-0000-0000-c000-000000000000', '0d820ecd-def2-4297-adad-78056cde7c78', 'Delegated', 'Notes.ReadWrite', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwZDgyMGVjZC1kZWYyLTQyOTctYWRhZC03ODA1NmNkZTdjNzg=', '2024-01-18T11:20:00Z', 0, '{"app_name": "OneNote", "app_display_name": "OneNote", "granted_by": "alice.johnson@techcorp.com"}'),
('techcorp-001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwZDgyMGVjZC1kZWYyLTQyOTctYWRhZC03ODA1NmNkZTdjNzg=#Notes.Read#Delegated', 'team', 'team_techcorp_001', '0d820ecd-def2-4297-adad-78056cde7c78', '00000003-0000-0000-c000-000000000000', '0d820ecd-def2-4297-adad-78056cde7c78', 'Delegated', 'Notes.Read', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwZDgyMGVjZC1kZWYyLTQyOTctYWRhZC03ODA1NmNkZTdjNzg=', '2024-01-18T11:20:00Z', 0, '{"app_name": "OneNote", "app_display_name": "OneNote", "granted_by": "alice.johnson@techcorp.com"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=#ChannelMessage.Read.Group#Delegated', 'team', 'team_globalex_002', '09408b3a-3ede-4983-95e1-da0693027e19', '00000003-0000-0000-c000-000000000000', '09408b3a-3ede-4983-95e1-da0693027e19', 'Delegated', 'ChannelMessage.Read.Group', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', '2024-01-20T14:15:00Z', 0, '{"app_name": "Planner", "app_display_name": "Planner", "granted_by": "emma.wilson@globalex.com"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=#TeamMember.Read.Group#Delegated', 'team', 'team_globalex_002', '09408b3a-3ede-4983-95e1-da0693027e19', '00000003-0000-0000-c000-000000000000', '09408b3a-3ede-4983-95e1-da0693027e19', 'Delegated', 'TeamMember.Read.Group', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', '2024-01-20T14:15:00Z', 0, '{"app_name": "Planner", "app_display_name": "Planner", "granted_by": "emma.wilson@globalex.com"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=#TeamsTab.Read.Group#Application', 'team', 'team_globalex_002', '09408b3a-3ede-4983-95e1-da0693027e19', '00000003-0000-0000-c000-000000000000', '09408b3a-3ede-4983-95e1-da0693027e19', 'Application', 'TeamsTab.Read.Group', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', '2024-01-20T14:15:00Z', 0, '{"app_name": "Planner", "app_display_name": "Planner", "granted_by": "system"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=#Sites.ReadWrite.All#Application', 'team', 'team_globalex_002', '00000003-0000-0ff1-ce00-000000000000', '00000003-0000-0000-c000-000000000000', '00000003-0000-0ff1-ce00-000000000000', 'Application', 'Sites.ReadWrite.All', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=', '2024-01-22T09:45:00Z', 0, '{"app_name": "SharePoint", "app_display_name": "SharePoint", "granted_by": "system"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=#Sites.FullControl.All#Application', 'team', 'team_globalex_002', '00000003-0000-0ff1-ce00-000000000000', '00000003-0000-0000-c000-000000000000', '00000003-0000-0ff1-ce00-000000000000', 'Application', 'Sites.FullControl.All', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=', '2024-01-22T09:45:00Z', 0, '{"app_name": "SharePoint", "app_display_name": "SharePoint", "granted_by": "system"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=#Sites.Manage.All#Application', 'team', 'team_globalex_002', '00000003-0000-0ff1-ce00-000000000000', '00000003-0000-0000-c000-000000000000', '00000003-0000-0ff1-ce00-000000000000', 'Application', 'Sites.Manage.All', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=', '2024-01-22T09:45:00Z', 0, '{"app_name": "SharePoint", "app_display_name": "SharePoint", "granted_by": "system"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=#TeamsTab.ReadWrite.Group#Application', 'team', 'team_globalex_002', '00000003-0000-0ff1-ce00-000000000000', '00000003-0000-0000-c000-000000000000', '00000003-0000-0ff1-ce00-000000000000', 'Application', 'TeamsTab.ReadWrite.Group', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyMyYTUyNzcwMy0xZjZmLTQ1NTktYTMzMi1kOGE3ZDI4OGNkODg=', '2024-01-22T09:45:00Z', 0, '{"app_name": "SharePoint", "app_display_name": "SharePoint", "granted_by": "system"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyNjb20ubWljcm9zb2Z0LnRlYW1zcGFjZS50YWIucG93ZXJiaQ==#Reports.Read.All#Application', 'team', 'team_globalex_002', '00000009-0000-0000-c000-000000000000', '00000003-0000-0000-c000-000000000000', '00000009-0000-0000-c000-000000000000', 'Application', 'Reports.Read.All', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyNjb20ubWljcm9zb2Z0LnRlYW1zcGFjZS50YWIucG93ZXJiaQ==', '2024-01-25T16:30:00Z', 0, '{"app_name": "PowerBI", "app_display_name": "Power BI", "granted_by": "system"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyNjb20ubWljcm9zb2Z0LnRlYW1zcGFjZS50YWIucG93ZXJiaQ==#Reports.ReadWrite.All#Application', 'team', 'team_globalex_002', '00000009-0000-0000-c000-000000000000', '00000003-0000-0000-c000-000000000000', '00000009-0000-0000-c000-000000000000', 'Application', 'Reports.ReadWrite.All', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyNjb20ubWljcm9zb2Z0LnRlYW1zcGFjZS50YWIucG93ZXJiaQ==', '2024-01-25T16:30:00Z', 0, '{"app_name": "PowerBI", "app_display_name": "Power BI", "granted_by": "system"}'),
('globalex-002', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyNjb20ubWljcm9zb2Z0LnRlYW1zcGFjZS50YWIucG93ZXJiaQ==#TeamsActivity.Send.Group#Application', 'team', 'team_globalex_002', '00000009-0000-0000-c000-000000000000', '00000003-0000-0000-c000-000000000000', '00000009-0000-0000-c000-000000000000', 'Application', 'TeamsActivity.Send.Group', 'YWNkYTQ0MmMtNzhkMi00OTFiLTgyMDQtNGVmNTAxOWMwMTkzIyNjb20ubWljcm9zb2Z0LnRlYW1zcGFjZS50YWIucG93ZXJiaQ==', '2024-01-25T16:30:00Z', 0, '{"app_name": "PowerBI", "app_display_name": "Power BI", "granted_by": "system"}'),
('techcorp-001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwYWUzNWIzNi0wZmQ3LTQyMmUtODA1Yi1kNTNhZjE1NzkwOTM=#ChannelMessage.Read.Group#Delegated', 'team', 'team_techcorp_001', '0ae35b36-0fd7-422e-805b-d53af1579093', '00000003-0000-0000-c000-000000000000', '0ae35b36-0fd7-422e-805b-d53af1579093', 'Delegated', 'ChannelMessage.Read.Group', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwYWUzNWIzNi0wZmQ3LTQyMmUtODA1Yi1kNTNhZjE1NzkwOTM=', '2024-01-16T12:00:00Z', 0, '{"app_name": "Wiki", "app_display_name": "Wiki", "granted_by": "alice.johnson@techcorp.com"}');

-- Teamwork Settings (Organization-level Teams settings)
INSERT INTO teamwork (org_id, teamwork_id, is_teams_enabled, region) VALUES
('techcorp-001', 'teamwork', 1, 'Americas'),
('globalex-002', 'teamwork', 1, 'Europe and MiddleEast');

-- Schedule Day Notes (Teams Schedule API - Microsoft Graph v1.0)
INSERT INTO day_notes (org_id, team_id, day_note_id, day_note_date, draft_day_note, shared_day_note, created_date_time, last_modified_date_time) VALUES
('techcorp-001', 'team_techcorp_001', 'NOTE_52191d41-ce2d-4295-a477-b75941bd8e0f', '2025-11-29', NULL, '{"contentType": "text", "content": "Team standup at 10 AM. Code review session at 2 PM. Remember to update sprint board."}', datetime('now'), datetime('now')),
('techcorp-001', 'team_techcorp_001', 'NOTE_d011e056-5f78-4020-98b2-84ef6f71d008', '2025-11-30', '{"contentType": "text", "content": "Sprint planning meeting at 11 AM - still being finalized"}', NULL, datetime('now'), datetime('now')),
('techcorp-001', 'team_techcorp_001', 'NOTE_a1b2c3d4-e5f6-4789-abcd-ef1234567890', '2025-12-01', '{"contentType": "text", "content": "Demo day preparation - need to finalize presentation"}', '{"contentType": "text", "content": "Demo day preparation. Product demo at 3 PM for stakeholders."}', datetime('now'), datetime('now')),
('techcorp-001', 'team_techcorp_001', 'NOTE_12345678-90ab-cdef-1234-567890abcdef', '2025-12-02', NULL, '{"contentType": "text", "content": "Team retrospective at 10 AM. Come prepared with feedback from the sprint."}', datetime('now'), datetime('now')),
('techcorp-001', 'team_techcorp_001', 'NOTE_abcdef12-3456-7890-abcd-ef1234567890', '2025-12-08', '{"contentType": "text", "content": "Release day - version 2.0. Deployment checklist in progress."}', NULL, datetime('now'), datetime('now')),
('globalex-002', 'team_globalex_002', 'NOTE_aaaabbbb-cccc-dddd-eeee-ffff00001111', '2025-11-30', NULL, '{"contentType": "text", "content": "Q4 Sales kickoff meeting at 9 AM. Review quarterly targets and strategies."}', datetime('now'), datetime('now')),
('globalex-002', 'team_globalex_002', 'NOTE_11112222-3333-4444-5555-666677778888', '2025-12-01', '{"contentType": "text", "content": "Client presentations - agenda being updated"}', '{"contentType": "text", "content": "Client presentations scheduled throughout the day. Check calendar for specific times."}', datetime('now'), datetime('now')),
('globalex-002', 'team_globalex_002', 'NOTE_99998888-7777-6666-5555-444433332222', '2025-12-04', '{"contentType": "text", "content": "Team building activity planned - details TBD"}', NULL, datetime('now'), datetime('now')),
('globalex-002', 'team_globalex_002', 'NOTE_fedcba09-8765-4321-fedc-ba0987654321', '2025-12-06', NULL, '{"contentType": "text", "content": "Performance review day. Individual meetings scheduled. Check your calendar for your slot."}', datetime('now'), datetime('now'));

-- 9 schedule day notes created

-- Learning Course Activities (Viva Learning API - Microsoft Graph v1.0)
INSERT INTO learning_course_activities (learning_course_activity_id, org_id, learning_provider_id, learner_user_id, learning_content_id, activity_type, status, assignment_type, assigner_user_id, assigned_date_time, due_date_time, notes_content, completion_percentage, completed_date_time, started_date_time, external_course_activity_id, created_date_time, last_modified_date_time, soft_delete) VALUES
('8ba2228a-e020-11ec-9d64-0242ac120002', 'techcorp-001', 'lp_microsoft_learn_001', 'alice.johnson', '57baf9dc-e020-11ec-9d64-0242ac120002', 'learningAssignment', 'inProgress', 'required', 'james.wilson', '2021-05-01T08:00:00.0000000+00:00', '2022-09-22T16:05:00.0000000+00:00', 'Complete leadership training module by end of quarter', 45, NULL, NULL, 'LP001-ALICE-001', datetime('now'), datetime('now'), 0),
('9cb3339b-f131-22fd-ae75-1353bd251113', 'techcorp-001', 'lp_microsoft_learn_001', 'bob.smith', '68cba0ed-f131-33ge-bg86-2464ce362224', 'learningSelfInitiatedCourse', 'completed', NULL, NULL, NULL, NULL, NULL, 100, '2021-06-21T22:57:17.0000000+00:00', '2021-05-21T22:57:17.0000000+00:00', 'LP001-BOB-SELF-001', datetime('now'), datetime('now'), 0),
('aca4450c-g242-44he-ch97-3575df473335', 'techcorp-001', 'lp_microsoft_learn_001', 'carol.white', '79dbc1fe-g242-44he-ch97-3575df473335', 'learningAssignment', 'notStarted', 'recommended', 'alice.johnson', '2021-06-15T10:00:00.0000000+00:00', '2022-12-31T23:59:59.0000000+00:00', 'UX design best practices course recommended for skill development', 0, NULL, NULL, NULL, datetime('now'), datetime('now'), 0),
('bdb5561d-h353-55if-di08-4686eg584446', 'globalex-002', 'lp_coursera_001', 'emma.wilson', '8aedc20f-h353-55if-di08-4686eg584446', 'learningSelfInitiatedCourse', 'inProgress', NULL, NULL, NULL, NULL, NULL, 60, NULL, '2021-07-10T09:00:00.0000000+00:00', 'LP002-EMMA-SELF-001', datetime('now'), datetime('now'), 0),
('cec6672e-i464-66jg-ej19-5797fh695557', 'globalex-002', 'lp_coursera_001', 'frank.chen', '9bfed31g-i464-66jg-ej19-5797fh695557', 'learningAssignment', 'inProgress', 'peerRecommended', 'emma.wilson', '2021-08-01T14:30:00.0000000+00:00', '2023-03-31T23:59:59.0000000+00:00', 'Advanced cloud architecture course - peer recommendation from CEO', 30, NULL, NULL, 'LP002-FRANK-PEER-001', datetime('now'), datetime('now'), 0);

-- 5 learning course activities created

-- Learning Providers (Viva Learning API - Microsoft Graph v1.0)
INSERT INTO learning_providers (learning_provider_id, org_id, display_name, square_logo_web_url_for_dark_theme, long_logo_web_url_for_dark_theme, square_logo_web_url_for_light_theme, long_logo_web_url_for_light_theme, login_web_url, is_course_activity_sync_enabled, created_date_time, last_modified_date_time, soft_delete) VALUES
('lp_microsoft_learn_001', 'techcorp-001', 'Microsoft Learn', 'https://learn.microsoft.com/media/logos/logo-ms-dark-square.png', 'https://learn.microsoft.com/media/logos/logo-ms-dark-long.png', 'https://learn.microsoft.com/media/logos/logo-ms-light-square.png', 'https://learn.microsoft.com/media/logos/logo-ms-light-long.png', 'https://learn.microsoft.com', 1, datetime('now'), datetime('now'), 0),
('lp_linkedin_learning_001', 'techcorp-001', 'LinkedIn Learning', 'https://static.licdn.com/sc/h/eahiplrwoq61f4uan012ia17i', 'https://static.licdn.com/sc/h/3m1jgec6rr4k3v6b8dzqfvbfb', 'https://static.licdn.com/sc/h/eahiplrwoq61f4uan012ia17i', 'https://static.licdn.com/sc/h/3m1jgec6rr4k3v6b8dzqfvbfb', 'https://www.linkedin.com/learning', 1, datetime('now'), datetime('now'), 0),
('lp_coursera_001', 'globalex-002', 'Coursera', 'https://d3njjcbhbojbot.cloudfront.net/web/images/favicons/icon-blue-512x512.png', 'https://d3njjcbhbojbot.cloudfront.net/web/images/logo/coursera-logo.png', 'https://d3njjcbhbojbot.cloudfront.net/web/images/favicons/icon-blue-512x512.png', 'https://d3njjcbhbojbot.cloudfront.net/web/images/logo/coursera-logo.png', 'https://www.coursera.org', 0, datetime('now'), datetime('now'), 0),
('lp_udemy_business_001', 'techcorp-001', 'Udemy Business', 'https://www.udemy.com/staticx/udemy/images/v7/logo-udemy.svg', 'https://www.udemy.com/staticx/udemy/images/v7/logo-udemy-business.svg', 'https://www.udemy.com/staticx/udemy/images/v7/logo-udemy.svg', 'https://www.udemy.com/staticx/udemy/images/v7/logo-udemy-business.svg', 'https://business.udemy.com', 1, datetime('now'), datetime('now'), 0),
('lp_pluralsight_001', 'techcorp-001', 'Pluralsight', 'https://www.pluralsight.com/content/dam/pluralsight2/logos/pluralsight-logo-vrt-color-2.png', 'https://www.pluralsight.com/content/dam/pluralsight2/logos/pluralsight-logo-hor-color-2.png', 'https://www.pluralsight.com/content/dam/pluralsight2/logos/pluralsight-logo-vrt-color-2.png', 'https://www.pluralsight.com/content/dam/pluralsight2/logos/pluralsight-logo-hor-color-2.png', 'https://www.pluralsight.com', 1, datetime('now'), datetime('now'), 0),
('lp_skillsoft_001', 'globalex-002', 'Skillsoft', 'https://www.skillsoft.com/themes/custom/skillsoft_theme/logo.svg', 'https://www.skillsoft.com/themes/custom/skillsoft_theme/logo-horizontal.svg', 'https://www.skillsoft.com/themes/custom/skillsoft_theme/logo.svg', 'https://www.skillsoft.com/themes/custom/skillsoft_theme/logo-horizontal.svg', 'https://www.skillsoft.com', 0, datetime('now'), datetime('now'), 0),
('lp_edx_001', 'globalex-002', 'edX for Business', 'https://www.edx.org/images/logos/edx-logo-elm.svg', 'https://www.edx.org/images/logos/edx-logo-horizontal.svg', 'https://www.edx.org/images/logos/edx-logo-elm.svg', 'https://www.edx.org/images/logos/edx-logo-horizontal.svg', 'https://business.edx.org', 1, datetime('now'), datetime('now'), 0),
('lp_go1_001', 'globalex-002', 'Go1', 'https://www.go1.com/static/images/logo-square.png', 'https://www.go1.com/static/images/logo-horizontal.png', 'https://www.go1.com/static/images/logo-square.png', 'https://www.go1.com/static/images/logo-horizontal.png', 'https://www.go1.com', 1, datetime('now'), datetime('now'), 0),
('lp_degreed_001', 'techcorp-001', 'Degreed', 'https://degreed.com/static/images/logo-square-dark.png', 'https://degreed.com/static/images/logo-horizontal-dark.png', 'https://degreed.com/static/images/logo-square-light.png', 'https://degreed.com/static/images/logo-horizontal-light.png', 'https://degreed.com', 0, datetime('now'), datetime('now'), 0),
('lp_cornerstone_001', 'techcorp-001', 'Cornerstone OnDemand', 'https://www.cornerstoneondemand.com/sites/default/files/logo-square.png', 'https://www.cornerstoneondemand.com/sites/default/files/logo-horizontal.png', 'https://www.cornerstoneondemand.com/sites/default/files/logo-square.png', 'https://www.cornerstoneondemand.com/sites/default/files/logo-horizontal.png', 'https://www.cornerstoneondemand.com', 1, datetime('now'), datetime('now'), 0),
('lp_saba_cloud_001', 'techcorp-001', 'Saba Cloud', 'https://www.saba.com/assets/images/saba-logo-square.png', 'https://www.saba.com/assets/images/saba-logo-horizontal.png', 'https://www.saba.com/assets/images/saba-logo-square.png', 'https://www.saba.com/assets/images/saba-logo-horizontal.png', 'https://www.saba.com', 0, datetime('now'), datetime('now'), 0),
('lp_harvard_business_001', 'techcorp-001', 'Harvard Business Publishing', 'https://hbsp.harvard.edu/assets/logo-square.png', 'https://hbsp.harvard.edu/assets/logo-horizontal.png', 'https://hbsp.harvard.edu/assets/logo-square.png', 'https://hbsp.harvard.edu/assets/logo-horizontal.png', 'https://hbsp.harvard.edu', 1, datetime('now'), datetime('now'), 0),
('lp_openSesame_001', 'startup-001', 'OpenSesame', 'https://www.opensesame.com/site/assets/images/logo-square.png', 'https://www.opensesame.com/site/assets/images/logo-horizontal.png', 'https://www.opensesame.com/site/assets/images/logo-square.png', 'https://www.opensesame.com/site/assets/images/logo-horizontal.png', 'https://www.opensesame.com', 1, datetime('now'), datetime('now'), 0),
('lp_udacity_001', 'techcorp-001', 'Udacity for Enterprise', 'https://www.udacity.com/images/svgs/udacity-logo-square.svg', 'https://www.udacity.com/images/svgs/udacity-logo.svg', 'https://www.udacity.com/images/svgs/udacity-logo-square.svg', 'https://www.udacity.com/images/svgs/udacity-logo.svg', 'https://www.udacity.com/enterprise', 0, datetime('now'), datetime('now'), 0),
('lp_datacamp_001', 'techcorp-001', 'DataCamp', 'https://www.datacamp.com/datacamp-sq-logo.png', 'https://www.datacamp.com/datacamp-logo.png', 'https://www.datacamp.com/datacamp-sq-logo.png', 'https://www.datacamp.com/datacamp-logo.png', 'https://www.datacamp.com', 1, datetime('now'), datetime('now'), 0);

-- 15 learning providers created

-- Teamwork Tags (for TeamworkTag CRUD APIs)
INSERT INTO teamwork_tags (id, team_id, display_name, description, tag_type, created_at, updated_at) VALUES
('tag_techcorp_engineering_001', 'team_techcorp_001', 'Engineering', 'Engineering team members', 'standard', datetime('now'), datetime('now')),
('tag_techcorp_design_001', 'team_techcorp_001', 'Design', 'Design team members', 'standard', datetime('now'), datetime('now')),
('tag_techcorp_oncall_001', 'team_techcorp_001', 'On-Call', 'On-call rotation members', 'scheduled', datetime('now'), datetime('now')),
('tag_globalex_sales_001', 'team_globalex_002', 'Sales', 'Sales team members', 'standard', datetime('now'), datetime('now')),
('tag_globalex_support_001', 'team_globalex_002', 'Support', 'Customer support team', 'standard', datetime('now'), datetime('now')),
('tag_finance_001', 'team_techcorp_001', 'Finance', 'Finance team members', 'standard', datetime('now'), datetime('now'));

-- 6 teamwork tags created

-- Deleted Teams (Soft-deleted teams for /teamwork/deletedTeams API)
INSERT INTO teams (org_id, team_id, group_id, template_id, display_name, description, visibility, specialization, classification, internal_id, incoming_channels, member_settings, guest_settings, messaging_settings, fun_settings, discovery_settings, members, is_archived, migration_mode, web_url, created_date_time, updated_date_time, soft_delete) VALUES
('techcorp-001', 'team_techcorp_archived_001', NULL, NULL, 'Legacy Project Alpha', 'Archived team from completed Project Alpha initiative', 'private', 'none', NULL, 'team_techcorp_archived_001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'https://teams.microsoft.com/l/team/team_techcorp_archived_001', datetime('now'), '2024-01-15T10:30:00.000Z', 1),
('techcorp-001', 'team_techcorp_archived_002', NULL, NULL, 'Q3 2023 Marketing Campaign', 'Completed Q3 marketing campaign team', 'private', 'none', NULL, 'team_techcorp_archived_002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'https://teams.microsoft.com/l/team/team_techcorp_archived_002', datetime('now'), '2024-02-20T14:45:00.000Z', 1),
('globalex-002', 'team_globalex_archived_001', NULL, NULL, 'Digital Transformation Initiative', 'Completed digital transformation project team', 'private', 'none', NULL, 'team_globalex_archived_001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'https://teams.microsoft.com/l/team/team_globalex_archived_001', datetime('now'), '2024-03-10T09:15:00.000Z', 1);

-- Chat Tabs are created via API calls (POST /chats/{chat-id}/tabs). Not seeded here because id/webUrl/sortOrderIndex are server-assigned.

-- Channels (with migration_mode for completeMigration API)
INSERT INTO channels (channel_id, org_id, team_id, display_name, description, membership_type, is_favorite_by_default, is_archived, migration_mode, created_date_time, soft_delete) VALUES
('2da4cc29dd784156a8903cc978016bd6', 'techcorp-001', 'team_techcorp_001', 'General', 'General discussions for the TechCorp team', 'standard', 1, 0, NULL, datetime('now'), 0),
('5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'techcorp-001', 'team_techcorp_001', 'Development', 'Development team discussions and updates', 'standard', 0, 0, 'migration', datetime('now'), 0),
('7f9e3c1a5b4d2e8c6a9b8f7d6c5e4a3b', 'techcorp-001', 'team_techcorp_001', 'Private Leadership', 'Private channel for leadership discussions', 'private', 0, 0, NULL, datetime('now'), 0),
('a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'globalex-002', 'team_globalex_002', 'General', 'General discussions for the GlobalEx team', 'standard', 1, 0, NULL, datetime('now'), 0),
('b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5', 'globalex-002', 'team_globalex_002', 'Executive Updates', 'Executive team updates and announcements', 'standard', 0, 0, 'migration', datetime('now'), 0),
('c9d2e6f4a7b5c8d6e9f3a1b4c7d5e8f2', 'globalex-002', 'team_globalex_002', 'HR Private', 'Private HR discussions and policies', 'private', 0, 0, NULL, datetime('now'), 0),
('channel_shared_001', 'techcorp-001', 'team_techcorp_001', 'Cross-Team Collaboration', 'Shared channel for collaboration between TechCorp and GlobalEx teams', 'shared', 0, 0, NULL, datetime('now'), 0),
('channel_shared_002', 'globalex-002', 'team_globalex_002', 'Partner Projects', 'Shared channel for partner collaboration projects', 'shared', 1, 0, NULL, datetime('now'), 0),
('channel_shared_003', 'techcorp-001', 'team_techcorp_001', 'External Partners Hub', 'Multi-tenant shared channel for external partner collaboration', 'shared', 0, 0, NULL, datetime('now'), 0);

-- Channel Members
INSERT INTO channel_members (channel_id, user_id, roles, display_name, email, tenant_id, added_at) VALUES
('2da4cc29dd784156a8903cc978016bd6', 'admin.super', 'owner', 'Super User Tech Org', 'super.user@techcorp.com', NULL, datetime('now')),
('2da4cc29dd784156a8903cc978016bd6', 'alice.johnson', 'owner', 'Alice Johnson', 'alice.manager@techcorp.com', NULL, datetime('now')),
('2da4cc29dd784156a8903cc978016bd6', 'bob.smith', 'member', 'Bob Smith', 'bob.smith@techcorp.com', NULL, datetime('now')),
('2da4cc29dd784156a8903cc978016bd6', 'carol.white', 'member', 'Carol White', 'carol.white@techcorp.com', NULL, datetime('now')),
('2da4cc29dd784156a8903cc978016bd6', 'dave.brown', 'member', 'Dave Brown', 'dave.brown@techcorp.com', NULL, datetime('now')),
('5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'admin.super', 'owner', 'Super User Tech Org', 'super.user@techcorp.com', NULL, datetime('now')),
('5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'alice.johnson', 'owner', 'Alice Johnson', 'alice.manager@techcorp.com', NULL, datetime('now')),
('5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'bob.smith', 'member', 'Bob Smith', 'bob.smith@techcorp.com', NULL, datetime('now')),
('5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'carol.white', 'member', 'Carol White', 'carol.white@techcorp.com', NULL, datetime('now')),
('7f9e3c1a5b4d2e8c6a9b8f7d6c5e4a3b', 'admin.super', 'owner', 'Super User Tech Org', 'super.user@techcorp.com', NULL, datetime('now')),
('7f9e3c1a5b4d2e8c6a9b8f7d6c5e4a3b', 'alice.johnson', 'owner', 'Alice Johnson', 'alice.manager@techcorp.com', NULL, datetime('now')),
('7f9e3c1a5b4d2e8c6a9b8f7d6c5e4a3b', 'dave.brown', 'member', 'Dave Brown', 'dave.brown@techcorp.com', NULL, datetime('now')),
('a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'emma.wilson', 'owner', 'Emma Wilson', 'emma.wilson@globalex.com', NULL, datetime('now')),
('a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'frank.chen', 'member', 'Frank Chen', 'frank.chen@globalex.com', NULL, datetime('now')),
('a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'grace.kim', 'member', 'Grace Kim', 'grace.kim@globalex.com', NULL, datetime('now')),
('a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'henry.lopez', 'member', 'Henry Lopez', 'henry.lopez@globalex.com', NULL, datetime('now')),
('b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5', 'emma.wilson', 'owner', 'Emma Wilson', 'emma.wilson@globalex.com', NULL, datetime('now')),
('b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5', 'frank.chen', 'member', 'Frank Chen', 'frank.chen@globalex.com', NULL, datetime('now')),
('b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5', 'grace.kim', 'member', 'Grace Kim', 'grace.kim@globalex.com', NULL, datetime('now')),
('c9d2e6f4a7b5c8d6e9f3a1b4c7d5e8f2', 'emma.wilson', 'owner', 'Emma Wilson', 'emma.wilson@globalex.com', NULL, datetime('now')),
('c9d2e6f4a7b5c8d6e9f3a1b4c7d5e8f2', 'grace.kim', 'member', 'Grace Kim', 'grace.kim@globalex.com', NULL, datetime('now')),
('d3e7f1a5b9c6d8e2f4a7b1c5d9e3f8a2', 'alice.johnson', 'owner', 'Alice Johnson', 'alice.manager@techcorp.com', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', datetime('now')),
('d3e7f1a5b9c6d8e2f4a7b1c5d9e3f8a2', 'bob.smith', 'member', 'Bob Smith', 'bob.smith@techcorp.com', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', datetime('now')),
('d3e7f1a5b9c6d8e2f4a7b1c5d9e3f8a2', 'emma.wilson', 'member', 'Emma Wilson', 'emma.wilson@globalex.com', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', datetime('now')),
('d3e7f1a5b9c6d8e2f4a7b1c5d9e3f8a2', 'frank.chen', 'member', 'Frank Chen', 'frank.chen@globalex.com', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', datetime('now')),
('e4f8a2b6c7d9e3f5a8b2c6d1e5f9a3b7', 'emma.wilson', 'owner', 'Emma Wilson', 'emma.wilson@globalex.com', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', datetime('now')),
('e4f8a2b6c7d9e3f5a8b2c6d1e5f9a3b7', 'frank.chen', 'member', 'Frank Chen', 'frank.chen@globalex.com', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', datetime('now')),
('e4f8a2b6c7d9e3f5a8b2c6d1e5f9a3b7', 'alice.johnson', 'member', 'Alice Johnson', 'alice.manager@techcorp.com', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', datetime('now')),
('e4f8a2b6c7d9e3f5a8b2c6d1e5f9a3b7', 'bob.smith', 'member', 'Bob Smith', 'bob.smith@techcorp.com', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', datetime('now')),
('channel_shared_001', 'alice.johnson', 'owner', 'Alice Johnson', 'alice@techcorp.com', 'org_techcorp', datetime('now')),
('channel_shared_001', 'bob.smith', 'member', 'Bob Smith', 'bob.smith@techcorp.com', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', datetime('now')),
('channel_shared_001', 'emma.wilson', 'owner', 'Bob Smith', 'bob@globalex.com', 'org_globalex', datetime('now')),
('channel_shared_001', 'user_charlie', 'member', 'Charlie Brown', 'charlie@techcorp.com', 'org_techcorp', datetime('now')),
('channel_shared_002', 'user_david', 'owner', 'David Lee', 'david@globalex.com', 'org_globalex', datetime('now')),
('channel_shared_002', 'user_eve', 'owner', 'Eve Martinez', 'eve@techcorp.com', 'org_techcorp', datetime('now')),
('channel_shared_003', 'user_frank', 'owner', 'Frank Wilson', 'frank@techcorp.com', 'org_techcorp', datetime('now')),
('channel_shared_003', 'grace.kim', 'member', 'Grace Kim', 'grace.kim@globalex.com', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', datetime('now')),
('channel_shared_003', 'user_henry', 'member', 'Henry Anderson', 'henry@acmecorp.com', 'org_acmecorp', datetime('now')),
('channel_shared_003', 'user_iris', 'member', 'Iris Chen', 'iris@innovate.com', 'org_innovate', datetime('now')),
('channel_shared_001', 'jack.morrison', 'member', 'Jack Morrison', 'jack.contractor@globalex.com', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', datetime('now'));

-- Channel Tabs (for list_tabs_in_channel API)
INSERT INTO teams_channel_tabs (org_id, team_id, channel_id, tab_id, display_name, web_url, app_id, sort_order_index, configuration_json, created_at, updated_at) VALUES
('techcorp-001', 'team_techcorp_001', '2da4cc29dd784156a8903cc978016bd6', 'tab_general_website_001', 'Company Portal', 'https://teams.microsoft.com/_#/apps/com.microsoft.teamspace.tab.web/sections/general', 'com.microsoft.teamspace.tab.web', '10000100', '{"contentUrl": "https://www.techcorp.com/portal", "websiteUrl": "https://www.techcorp.com/portal", "removeUrl": null, "entityId": "website_001"}', datetime('now'), datetime('now')),
('techcorp-001', 'team_techcorp_001', '2da4cc29dd784156a8903cc978016bd6', 'tab_general_onenote_001', 'Team Notebook', 'https://teams.microsoft.com/_#/apps/0d820ecd-def2-4297-adad-78056cde7c79/sections/general', '0d820ecd-def2-4297-adad-78056cde7c79', '10000200', '{"contentUrl": "https://techcorp.sharepoint.com/sites/TechCorpTeam/_layouts/15/WopiFrame.aspx?sourcedoc={notebook-id}", "removeUrl": null, "entityId": "notebook_001"}', datetime('now'), datetime('now')),
('techcorp-001', 'team_techcorp_001', '5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'tab_dev_planner_001', 'Sprint Board', 'https://teams.microsoft.com/_#/apps/com.microsoft.teamspace.tab.planner/sections/dev', 'com.microsoft.teamspace.tab.planner', '10000100', '{"entityId": "plan_dev_001", "contentUrl": "https://tasks.office.com/techcorp.com/en-US/Home/Planner/#/plantaskboard?groupId=group_techcorp_001&planId=plan_dev_001", "websiteUrl": "https://tasks.office.com/techcorp.com/en-US/Home/Planner/#/plantaskboard?groupId=group_techcorp_001&planId=plan_dev_001", "removeUrl": "https://tasks.office.com/techcorp.com/en-US/Home/Planner/#/plantaskboard?groupId=group_techcorp_001&planId=plan_dev_001"}', datetime('now'), datetime('now')),
('techcorp-001', 'team_techcorp_001', '5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'tab_dev_sharepoint_001', 'Development Docs', 'https://teams.microsoft.com/_#/apps/2a527703-1f6f-4559-a332-d8a7d288cd88/sections/dev', '2a527703-1f6f-4559-a332-d8a7d288cd88', '10000200', '{"entityId": "sharepoint_dev_001", "contentUrl": "https://techcorp.sharepoint.com/sites/TechCorpTeam/Development", "websiteUrl": "https://techcorp.sharepoint.com/sites/TechCorpTeam/Development", "removeUrl": null}', datetime('now'), datetime('now')),
('techcorp-001', 'team_techcorp_001', '5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'tab_dev_powerbi_001', 'Team Metrics', 'https://teams.microsoft.com/_#/apps/com.microsoft.teamspace.tab.powerbi/sections/dev', 'com.microsoft.teamspace.tab.powerbi', '10000300', '{"entityId": "powerbi_report_001", "contentUrl": "https://app.powerbi.com/groups/workspace-id/reports/report-id", "websiteUrl": "https://app.powerbi.com/groups/workspace-id/reports/report-id", "removeUrl": null}', datetime('now'), datetime('now')),
('globalex-002', 'team_globalex_002', 'a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'tab_global_onenote_001', 'Executive Notes', 'https://teams.microsoft.com/_#/apps/0d820ecd-def2-4297-adad-78056cde7c78/sections/general', '0d820ecd-def2-4297-adad-78056cde7c78', '10000100', '{"contentUrl": "https://globalex.sharepoint.com/sites/GlobalExTeam/_layouts/15/WopiFrame.aspx?sourcedoc={notebook-id}", "removeUrl": null, "entityId": "notebook_globalex_001"}', datetime('now'), datetime('now')),
('globalex-002', 'team_globalex_002', 'a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'tab_global_website_001', 'Company Intranet', 'https://teams.microsoft.com/_#/apps/com.microsoft.teamspace.tab.web/sections/general', 'com.microsoft.teamspace.tab.web', '10000200', '{"contentUrl": "https://www.globalex.com/intranet", "websiteUrl": "https://www.globalex.com/intranet", "removeUrl": null, "entityId": "website_globalex_001"}', datetime('now'), datetime('now')),
('globalex-002', 'team_globalex_002', 'b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5', 'tab_exec_planner_001', 'Executive Tasks', 'https://teams.microsoft.com/_#/apps/com.microsoft.teamspace.tab.planner.global/sections/exec', 'com.microsoft.teamspace.tab.planner.global', '10000100', '{"entityId": "plan_exec_001", "contentUrl": "https://tasks.office.com/globalex.com/en-US/Home/Planner/#/plantaskboard?groupId=group_globalex_002&planId=plan_exec_001", "websiteUrl": "https://tasks.office.com/globalex.com/en-US/Home/Planner/#/plantaskboard?groupId=group_globalex_002&planId=plan_exec_001", "removeUrl": "https://tasks.office.com/globalex.com/en-US/Home/Planner/#/plantaskboard?groupId=group_globalex_002&planId=plan_exec_001"}', datetime('now'), datetime('now')),
('globalex-002', 'team_globalex_002', 'b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5', 'tab_exec_sharepoint_001', 'Board Documents', 'https://teams.microsoft.com/_#/apps/2a527703-1f6f-4559-a332-d8a7d288cd88/sections/exec', '2a527703-1f6f-4559-a332-d8a7d288cd88', '10000200', '{"entityId": "sharepoint_exec_001", "contentUrl": "https://globalex.sharepoint.com/sites/GlobalExTeam/Executive", "websiteUrl": "https://globalex.sharepoint.com/sites/GlobalExTeam/Executive", "removeUrl": null}', datetime('now'), datetime('now'));

-- Shared With Channel Teams (sharedWithChannelTeamInfo API)
INSERT INTO shared_with_channel_teams (shared_team_id, channel_id, team_id, tenant_id, display_name, is_host_team, created_at, updated_at, soft_delete) VALUES
('shared_team_001_host', 'channel_shared_001', 'team_techcorp_001', 'org_techcorp', 'TechCorp Engineering', 1, '2024-01-15T10:30:00+00:00', '2024-01-15T10:30:00+00:00', 0),
('shared_team_001_guest_01', 'channel_shared_001', 'team_globalex_002', 'org_globalex', 'GlobalEx Sales', 0, '2024-01-16T08:00:00+00:00', '2024-01-16T08:00:00+00:00', 0),
('shared_team_001_guest_02', 'channel_shared_001', 'team_techcorp_marketing', 'org_techcorp', 'TechCorp Marketing', 0, '2024-01-20T11:15:00+00:00', '2024-01-20T11:15:00+00:00', 0),
('shared_team_002_host', 'channel_shared_002', 'team_globalex_002', 'org_globalex', 'GlobalEx Product Team', 1, '2024-02-01T14:00:00+00:00', '2024-02-01T14:00:00+00:00', 0),
('shared_team_002_guest_01', 'channel_shared_002', 'team_techcorp_001', 'org_techcorp', 'TechCorp Development', 0, '2024-02-02T09:30:00+00:00', '2024-02-02T09:30:00+00:00', 0),
('shared_team_003_host', 'channel_shared_003', 'team_techcorp_001', 'org_techcorp', 'TechCorp Engineering', 1, '2024-03-10T09:00:00+00:00', '2024-03-10T09:00:00+00:00', 0),
('shared_team_003_guest_01', 'channel_shared_003', 'team_globalex_002', 'org_globalex', 'GlobalEx Partnerships', 0, '2024-03-11T10:00:00+00:00', '2024-03-11T10:00:00+00:00', 0),
('shared_team_003_guest_02', 'channel_shared_003', 'team_acmecorp_003', 'org_acmecorp', 'AcmeCorp Integration', 0, '2024-03-12T13:30:00+00:00', '2024-03-12T13:30:00+00:00', 0),
('shared_team_003_guest_03', 'channel_shared_003', 'team_innovate_004', 'org_innovate', 'Innovate Solutions', 0, '2024-03-15T16:45:00+00:00', '2024-03-15T16:45:00+00:00', 0),
('deletable_shared_team_001', 'channel_shared_001', 'team_techcorp_001', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'TechCorp Test Team (Deletable)', 0, '2024-04-01T10:00:00+00:00', '2024-04-01T10:00:00+00:00', 0),
('deletable_shared_team_002', 'channel_shared_002', 'team_globalex_002', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', 'GlobalEx Test Team (Deletable)', 0, '2024-04-02T11:00:00+00:00', '2024-04-02T11:00:00+00:00', 0);


-- Channel Messages
INSERT INTO channel_messages (message_id, channel_id, team_id, reply_to_id, etag, message_type, created_datetime, last_modified_datetime, last_edited_datetime, deleted_datetime, subject, summary, importance, locale, web_url, channel_identity_json, policy_violation_json, on_behalf_of_json, event_detail_json, from_json, body_json, attachments_json, mentions_json, reactions_json, message_history_json) VALUES
('1620051289001', '2da4cc29dd784156a8903cc978016bd6', 'team_techcorp_001', NULL, '1620051289001', 'message', '2021-05-03T14:21:29.001', '2021-05-03T14:21:29.001', NULL, NULL, NULL, NULL, 'normal', 'en-us', 'https://teams.microsoft.com/l/message/2da4cc29dd784156a8903cc978016bd6/1620051289001', '{"teamId": "team_techcorp_001", "channelId": "2da4cc29dd784156a8903cc978016bd6"}', NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "alice.johnson", "displayName": "Alice Johnson", "userIdentityType": "aadUser"}}', '{"contentType": "html", "content": "<p>Welcome everyone to the TechCorp General channel! Please use this space for team-wide announcements and discussions.</p>"}', '[]', '[]', '[]', '[]'),
('1620051289002', '2da4cc29dd784156a8903cc978016bd6', 'team_techcorp_001', NULL, '1620051289002', 'message', '2021-05-03T15:30:15.002+00:00', '2021-05-03T15:30:15.002+00:00', NULL, NULL, NULL, NULL, 'normal', 'en-us', 'https://teams.microsoft.com/l/message/2da4cc29dd784156a8903cc978016bd6/1620051289002', '{"teamId": "team_techcorp_001", "channelId": "2da4cc29dd784156a8903cc978016bd6"}', NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "bob.smith", "displayName": "Bob Smith", "userIdentityType": "aadUser"}}', '{"contentType": "text", "content": "Thanks Alice! Excited to collaborate with everyone here. \ud83d\ude80"}', '[]', '[]', '[]', '[]'),
('1620051289003', '5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'team_techcorp_001', NULL, '1620051289003', 'message', '2021-05-04T09:15:30.003+00:00', '2021-05-04T09:15:30.003+00:00', NULL, NULL, 'Sprint Update', NULL, 'high', 'en-us', 'https://teams.microsoft.com/l/message/5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b/1620051289003', '{"teamId": "team_techcorp_001", "channelId": "5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b"}', NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "bob.smith", "displayName": "Bob Smith", "userIdentityType": "aadUser"}}', '{"contentType": "html", "content": "<p><strong>Sprint Update:</strong> API authentication module is complete. Moving on to user permissions system next.</p>"}', '[{"id": "att_sprint_001", "contentType": "application/pdf", "contentUrl": "https://techcorp.sharepoint.com/sites/dev/documents/sprint_report.pdf", "content": "JVBERi0xLjQNCiXi48...", "name": "Sprint_Week_18_Report.pdf", "thumbnailUrl": "https://techcorp.sharepoint.com/sites/dev/thumbnails/pdf_thumb.png"}]', '[]', '[{"reactionType": "\ud83d\udc4d", "createdDateTime": "2021-05-04T09:20:00.000", "user": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "userIdentityType": "aadUser"}}}]', '[]'),
('1620051289005', '5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'team_techcorp_001', NULL, '1620051289005', 'message', '2021-05-04T14:30:45.005+00:00', '2021-05-04T14:30:45.005+00:00', NULL, NULL, 'Code Review Request', NULL, 'urgent', 'en-us', 'https://teams.microsoft.com/l/message/5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b/1620051289005', '{"teamId": "team_techcorp_001", "channelId": "5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b"}', NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "alice.johnson", "displayName": "Alice Johnson", "userIdentityType": "aadUser"}}', '{"contentType": "html", "content": "<p>Hi <at id=\"0\">@Bob Smith</at> and <at id=\"1\">@Carol White</at>, please review the new authentication module code by EOD. Thanks!</p>"}', '[]', '[{"id": 0, "mentionText": "Bob Smith", "mentioned": {"user": {"id": "bob.smith", "displayName": "Bob Smith", "userIdentityType": "aadUser"}}}, {"id": 1, "mentionText": "Carol White", "mentioned": {"user": {"id": "carol.white", "displayName": "Carol White", "userIdentityType": "aadUser"}}}]', '[]', '[]'),
('1620051289004', 'a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'team_globalex_002', NULL, '1620051289004', 'message', '2021-05-05T11:45:22.004+00:00', '2021-05-05T11:45:22.004+00:00', NULL, NULL, 'Q2 Planning', NULL, 'high', 'en-ca', 'https://teams.microsoft.com/l/message/a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5/1620051289004', '{"teamId": "team_globalex_002", "channelId": "a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5"}', NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "emma.wilson", "displayName": "Emma Wilson", "userIdentityType": "aadUser"}}', '{"contentType": "text", "content": "Good morning team! Q2 planning session scheduled for next week. Please prepare your department updates."}', '[]', '[]', '[]', '[]'),
('1620051289006', 'b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5', 'team_globalex_002', NULL, '1620051289006', 'message', '2021-05-06T08:15:10.006+00:00', '2021-05-06T08:15:10.006+00:00', NULL, NULL, 'Board Meeting Results', NULL, 'high', 'en-ca', 'https://teams.microsoft.com/l/message/b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5/1620051289006', '{"teamId": "team_globalex_002", "channelId": "b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5"}', NULL, NULL, NULL, '{"application": null, "device": null, "user": {"id": "emma.wilson", "displayName": "Emma Wilson", "userIdentityType": "aadUser"}}', '{"contentType": "html", "content": "<p>\ud83d\udcca <strong>Board Meeting Update:</strong> Revenue targets exceeded by 12%. Expanding our tech division next quarter.</p>"}', '[{"id": "att_board_001", "contentType": "application/vnd.openxmlformats-officedocument.presentationml.presentation", "contentUrl": "https://globalex.sharepoint.com/sites/exec/documents/board_results_q1.pptx", "content": "UEsDBAoAAAAAAIlSKlc7Z3o8awAAAwAAAA==", "name": "Q1_Board_Meeting_Results.pptx", "thumbnailUrl": "https://globalex.sharepoint.com/sites/exec/thumbnails/ppt_thumb.png"}]', '[]', '[{"reactionType": "\ud83c\udf89", "createdDateTime": "2021-05-06T08:20:00.000", "user": {"user": {"id": "frank.chen", "displayName": "Frank Chen", "userIdentityType": "aadUser"}}}]', '[]');

-- Pinned Chat Messages
INSERT INTO pinned_chat_messages (pinned_message_id, chat_id, message_id, created_datetime) VALUES
('a2eff242-7719-4917-a2ab-0d3b6734a78b', 'meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', '1615971548136', '2021-03-17T09:05:00.000+00:00'),
('593c2de3-3269-4b1a-9652-b00d82b581d5', 'meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', '1614618259349', '2021-03-01T17:10:00.000+00:00');

-- Channel Files Folders (for get_files_folder API)
INSERT INTO channel_files_folders (channel_id, team_id, drive_item_id, name, created_date_time, last_modified_date_time, web_url, size, e_tag, c_tag, description, web_dav_url, created_by_json, last_modified_by_json, drive_id, drive_type, parent_id, parent_path, parent_name, parent_site_id, child_count, fs_created_date_time, fs_last_modified_date_time) VALUES
('2da4cc29dd784156a8903cc978016bd6', 'team_techcorp_001', '01BYE5RZ6QN3VZQUBABZFL2XFCMSMTGLV4', 'General', '2021-05-03T14:00:00+00:00', '2021-05-03T18:30:00+00:00', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/General', 524288, '"{01BYE5RZ6QN3VZQUBABZFL2XFCMSMTGLV4},1"', '"c:{01BYE5RZ6QN3VZQUBABZFL2XFCMSMTGLV4},0"', 'Files and documents for the General channel', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/General', '{"user": {"displayName": "Alice Johnson", "id": "alice.johnson"}}', '{"user": {"displayName": "Bob Smith", "id": "bob.smith"}}', 'b!-RIj2DuyvEyV1T4NlOaMHk8XkS_I8MdFlUCq1BlcjgmhRfAj3-Z8RY2VpuvV_tpd', 'documentLibrary', '01BYE5RZ5MYLM2SMX7BBHZ7OMNIAZPQBZY', '/drive/root:', 'Shared Documents', 'techcorp.sharepoint.com,b00e231e-b22d-4cbc-95d5-3e0d95e68c1e,915f174f-c8f0-4747-9540-aad419a89d89', 3, '2021-05-03T14:00:00+00:00', '2021-05-03T18:30:00+00:00'),
('5d8f4b2f9c8e4a1b847b6c3d7e8f9a0b', 'team_techcorp_001', '01BYE5RZ7ONPFYOTV65VHIZD7X2L56N53R', 'Development', '2021-05-04T09:00:00+00:00', '2021-05-04T15:45:00+00:00', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/Development', 2097152, '"{01BYE5RZ7ONPFYOTV65VHIZD7X2L56N53R},2"', '"c:{01BYE5RZ7ONPFYOTV65VHIZD7X2L56N53R},1"', 'Development team files including code, documentation, and resources', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/Development', '{"user": {"displayName": "Alice Johnson", "id": "alice.johnson"}}', '{"user": {"displayName": "Bob Smith", "id": "bob.smith"}}', 'b!-RIj2DuyvEyV1T4NlOaMHk8XkS_I8MdFlUCq1BlcjgmhRfAj3-Z8RY2VpuvV_tpd', 'documentLibrary', '01BYE5RZ5MYLM2SMX7BBHZ7OMNIAZPQBZY', '/drive/root:', 'Shared Documents', 'techcorp.sharepoint.com,b00e231e-b22d-4cbc-95d5-3e0d95e68c1e,915f174f-c8f0-4747-9540-aad419a89d89', 8, '2021-05-04T09:00:00+00:00', '2021-05-04T15:45:00+00:00'),
('7f9e3c1a5b4d2e8c6a9b8f7d6c5e4a3b', 'team_techcorp_001', '01BYE5RZ3YTFSO3L6ZNVBZXCRBKBRUXVXI', 'Private Leadership', '2021-05-05T10:00:00+00:00', '2021-05-05T16:20:00+00:00', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/Private Leadership', 1048576, '"{01BYE5RZ3YTFSO3L6ZNVBZXCRBKBRUXVXI},1"', '"c:{01BYE5RZ3YTFSO3L6ZNVBZXCRBKBRUXVXI},0"', 'Confidential leadership and management documents', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/Private Leadership', '{"user": {"displayName": "Alice Johnson", "id": "alice.johnson"}}', '{"user": {"displayName": "Alice Johnson", "id": "alice.johnson"}}', 'b!-RIj2DuyvEyV1T4NlOaMHk8XkS_I8MdFlUCq1BlcjgmhRfAj3-Z8RY2VpuvV_tpd', 'documentLibrary', '01BYE5RZ5MYLM2SMX7BBHZ7OMNIAZPQBZY', '/drive/root:', 'Shared Documents', 'techcorp.sharepoint.com,b00e231e-b22d-4cbc-95d5-3e0d95e68c1e,915f174f-c8f0-4747-9540-aad419a89d89', 5, '2021-05-05T10:00:00+00:00', '2021-05-05T16:20:00+00:00'),
('a8b7c9d6e4f2a1b5c8d7e6f9a2b3c4d5', 'team_globalex_002', '01AZJL5PN6Y2GOVW7725BZO354PWSELRRZ', 'General', '2021-05-05T11:00:00+00:00', '2021-05-05T17:30:00+00:00', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/General', 786432, '"{01AZJL5PN6Y2GOVW7725BZO354PWSELRRZ},1"', '"c:{01AZJL5PN6Y2GOVW7725BZO354PWSELRRZ},0"', 'General team files and resources', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/General', '{"user": {"displayName": "Emma Wilson", "id": "emma.wilson"}}', '{"user": {"displayName": "Frank Chen", "id": "frank.chen"}}', 'b!OqwsfNL1KkyCC09RoZyJ0W7iOeNpCuhGqPQz-aWYZ0BMrDwpqLtIR4j7_MxS8zqb', 'documentLibrary', '01AZJL5PMZQSFHFWNFDRHJQTBF2HFQQ2TH', '/drive/root:', 'Shared Documents', 'globalex.sharepoint.com,3aac2c7c-d2f5-4c2a-820b-4f51a19c89d1,6ee239e3-0a69-46e8-a8f4-33fda59860c4', 4, '2021-05-05T11:00:00+00:00', '2021-05-05T17:30:00+00:00'),
('b5c4d7e9f2a6b8c5d9e7f1a4b6c8d2e5', 'team_globalex_002', '01AZJL5PMHUK56PWBOKVHYNNPE67NTDFZC', 'Executive Updates', '2021-05-06T08:00:00+00:00', '2021-05-06T14:15:00+00:00', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/Executive Updates', 3145728, '"{01AZJL5PMHUK56PWBOKVHYNNPE67NTDFZC},3"', '"c:{01AZJL5PMHUK56PWBOKVHYNNPE67NTDFZC},2"', 'Executive communications, board materials, and strategic documents', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/Executive Updates', '{"user": {"displayName": "Emma Wilson", "id": "emma.wilson"}}', '{"user": {"displayName": "Emma Wilson", "id": "emma.wilson"}}', 'b!OqwsfNL1KkyCC09RoZyJ0W7iOeNpCuhGqPQz-aWYZ0BMrDwpqLtIR4j7_MxS8zqb', 'documentLibrary', '01AZJL5PMZQSFHFWNFDRHJQTBF2HFQQ2TH', '/drive/root:', 'Shared Documents', 'globalex.sharepoint.com,3aac2c7c-d2f5-4c2a-820b-4f51a19c89d1,6ee239e3-0a69-46e8-a8f4-33fda59860c4', 12, '2021-05-06T08:00:00+00:00', '2021-05-06T14:15:00+00:00'),
('c9d2e6f4a7b5c8d6e9f3a1b4c7d5e8f2', 'team_globalex_002', '01AZJL5PK3PUZABSG2YZBL3HS72ILRFVWY', 'HR Private', '2021-05-07T09:00:00+00:00', '2021-05-07T15:45:00+00:00', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/HR Private', 1572864, '"{01AZJL5PK3PUZABSG2YZBL3HS72ILRFVWY},1"', '"c:{01AZJL5PK3PUZABSG2YZBL3HS72ILRFVWY},1"', 'Private HR documents including policies, personnel files, and sensitive information', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/HR Private', '{"user": {"displayName": "Grace Kim", "id": "grace.kim"}}', '{"user": {"displayName": "Grace Kim", "id": "grace.kim"}}', 'b!OqwsfNL1KkyCC09RoZyJ0W7iOeNpCuhGqPQz-aWYZ0BMrDwpqLtIR4j7_MxS8zqb', 'documentLibrary', '01AZJL5PMZQSFHFWNFDRHJQTBF2HFQQ2TH', '/drive/root:', 'Shared Documents', 'globalex.sharepoint.com,3aac2c7c-d2f5-4c2a-820b-4f51a19c89d1,6ee239e3-0a69-46e8-a8f4-33fda59860c4', 7, '2021-05-07T09:00:00+00:00', '2021-05-07T15:45:00+00:00');

-- DriveItems for Channel Files Folders (with facet relationships)
INSERT INTO drive_items (drive_item_id, name, size, created_date_time, last_modified_date_time, web_url, web_dav_url, e_tag, c_tag, description, created_by_json, last_modified_by_json, drive_id, drive_type, parent_id, parent_path, parent_name, parent_site_id, child_count, fs_created_date_time, fs_last_modified_date_time, folder_id, file_id, image_id, photo_id, video_id, audio_id, shared_id, root_id, special_folder_id, sharepoint_ids_id, file_system_info_id, channel_files_folder_id) VALUES
('01BYE5RZ6QN3VZQUBABZFL2XFCMSMTGLV4', 'General', 524288, '2021-05-03T14:00:00+00:00', '2021-05-03T18:30:00+00:00', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/General', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/General', '"{01BYE5RZ6QN3VZQUBABZFL2XFCMSMTGLV4},1"', '"c:{01BYE5RZ6QN3VZQUBABZFL2XFCMSMTGLV4},0"', 'Files and documents for the General channel', '{"user": {"displayName": "Alice Johnson", "id": "alice.johnson"}}', '{"user": {"displayName": "Bob Smith", "id": "bob.smith"}}', 'b!-RIj2DuyvEyV1T4NlOaMHk8XkS_I8MdFlUCq1BlcjgmhRfAj3-Z8RY2VpuvV_tpd', 'documentLibrary', '01BYE5RZ5MYLM2SMX7BBHZ7OMNIAZPQBZY', '/drive/root:', 'Shared Documents', 'techcorp.sharepoint.com,b00e231e-b22d-4cbc-95d5-3e0d95e68c1e,915f174f-c8f0-4747-9540-aad419a89d89', 3, '2021-05-03T14:00:00+00:00', '2021-05-03T18:30:00+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('01BYE5RZ7ONPFYOTV65VHIZD7X2L56N53R', 'Development', 2097152, '2021-05-04T09:00:00+00:00', '2021-05-04T15:45:00+00:00', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/Development', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/Development', '"{01BYE5RZ7ONPFYOTV65VHIZD7X2L56N53R},2"', '"c:{01BYE5RZ7ONPFYOTV65VHIZD7X2L56N53R},1"', 'Development team files including code, documentation, and resources', '{"user": {"displayName": "Alice Johnson", "id": "alice.johnson"}}', '{"user": {"displayName": "Bob Smith", "id": "bob.smith"}}', 'b!-RIj2DuyvEyV1T4NlOaMHk8XkS_I8MdFlUCq1BlcjgmhRfAj3-Z8RY2VpuvV_tpd', 'documentLibrary', '01BYE5RZ5MYLM2SMX7BBHZ7OMNIAZPQBZY', '/drive/root:', 'Shared Documents', 'techcorp.sharepoint.com,b00e231e-b22d-4cbc-95d5-3e0d95e68c1e,915f174f-c8f0-4747-9540-aad419a89d89', 8, '2021-05-04T09:00:00+00:00', '2021-05-04T15:45:00+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('01BYE5RZ3YTFSO3L6ZNVBZXCRBKBRUXVXI', 'Private Leadership', 1048576, '2021-05-05T10:00:00+00:00', '2021-05-05T16:20:00+00:00', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/Private Leadership', 'https://techcorp.sharepoint.com/sites/TechCorpTeam/Shared Documents/Private Leadership', '"{01BYE5RZ3YTFSO3L6ZNVBZXCRBKBRUXVXI},1"', '"c:{01BYE5RZ3YTFSO3L6ZNVBZXCRBKBRUXVXI},0"', 'Confidential leadership and management documents', '{"user": {"displayName": "Alice Johnson", "id": "alice.johnson"}}', '{"user": {"displayName": "Alice Johnson", "id": "alice.johnson"}}', 'b!-RIj2DuyvEyV1T4NlOaMHk8XkS_I8MdFlUCq1BlcjgmhRfAj3-Z8RY2VpuvV_tpd', 'documentLibrary', '01BYE5RZ5MYLM2SMX7BBHZ7OMNIAZPQBZY', '/drive/root:', 'Shared Documents', 'techcorp.sharepoint.com,b00e231e-b22d-4cbc-95d5-3e0d95e68c1e,915f174f-c8f0-4747-9540-aad419a89d89', 5, '2021-05-05T10:00:00+00:00', '2021-05-05T16:20:00+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('01AZJL5PN6Y2GOVW7725BZO354PWSELRRZ', 'General', 786432, '2021-05-05T11:00:00+00:00', '2021-05-05T17:30:00+00:00', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/General', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/General', '"{01AZJL5PN6Y2GOVW7725BZO354PWSELRRZ},1"', '"c:{01AZJL5PN6Y2GOVW7725BZO354PWSELRRZ},0"', 'General team files and resources', '{"user": {"displayName": "Emma Wilson", "id": "emma.wilson"}}', '{"user": {"displayName": "Frank Chen", "id": "frank.chen"}}', 'b!OqwsfNL1KkyCC09RoZyJ0W7iOeNpCuhGqPQz-aWYZ0BMrDwpqLtIR4j7_MxS8zqb', 'documentLibrary', '01AZJL5PMZQSFHFWNFDRHJQTBF2HFQQ2TH', '/drive/root:', 'Shared Documents', 'globalex.sharepoint.com,3aac2c7c-d2f5-4c2a-820b-4f51a19c89d1,6ee239e3-0a69-46e8-a8f4-33fda59860c4', 4, '2021-05-05T11:00:00+00:00', '2021-05-05T17:30:00+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('01AZJL5PMHUK56PWBOKVHYNNPE67NTDFZC', 'Executive Updates', 3145728, '2021-05-06T08:00:00+00:00', '2021-05-06T14:15:00+00:00', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/Executive Updates', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/Executive Updates', '"{01AZJL5PMHUK56PWBOKVHYNNPE67NTDFZC},3"', '"c:{01AZJL5PMHUK56PWBOKVHYNNPE67NTDFZC},2"', 'Executive communications, board materials, and strategic documents', '{"user": {"displayName": "Emma Wilson", "id": "emma.wilson"}}', '{"user": {"displayName": "Emma Wilson", "id": "emma.wilson"}}', 'b!OqwsfNL1KkyCC09RoZyJ0W7iOeNpCuhGqPQz-aWYZ0BMrDwpqLtIR4j7_MxS8zqb', 'documentLibrary', '01AZJL5PMZQSFHFWNFDRHJQTBF2HFQQ2TH', '/drive/root:', 'Shared Documents', 'globalex.sharepoint.com,3aac2c7c-d2f5-4c2a-820b-4f51a19c89d1,6ee239e3-0a69-46e8-a8f4-33fda59860c4', 12, '2021-05-06T08:00:00+00:00', '2021-05-06T14:15:00+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('01AZJL5PK3PUZABSG2YZBL3HS72ILRFVWY', 'HR Private', 1572864, '2021-05-07T09:00:00+00:00', '2021-05-07T15:45:00+00:00', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/HR Private', 'https://globalex.sharepoint.com/sites/GlobalExTeam/Shared Documents/HR Private', '"{01AZJL5PK3PUZABSG2YZBL3HS72ILRFVWY},1"', '"c:{01AZJL5PK3PUZABSG2YZBL3HS72ILRFVWY},1"', 'Private HR documents including policies, personnel files, and sensitive information', '{"user": {"displayName": "Grace Kim", "id": "grace.kim"}}', '{"user": {"displayName": "Grace Kim", "id": "grace.kim"}}', 'b!OqwsfNL1KkyCC09RoZyJ0W7iOeNpCuhGqPQz-aWYZ0BMrDwpqLtIR4j7_MxS8zqb', 'documentLibrary', '01AZJL5PMZQSFHFWNFDRHJQTBF2HFQQ2TH', '/drive/root:', 'Shared Documents', 'globalex.sharepoint.com,3aac2c7c-d2f5-4c2a-820b-4f51a19c89d1,6ee239e3-0a69-46e8-a8f4-33fda59860c4', 7, '2021-05-07T09:00:00+00:00', '2021-05-07T15:45:00+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Chat App Installations
INSERT INTO chat_app_installations (installation_id, chat_id, org_id, app_id, app_display_name, app_external_id, app_distribution_method, installed_by_user_id, installed_at, consented_permission_set, teams_app_definition_id) VALUES
('NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', 'app_alice.johnson_NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', 'techcorp-001', 'com.microsoft.teamspace.tab.planner', 'Planner', NULL, 'store', 'alice.johnson', datetime('now'), '{"resourceSpecificPermissions": [{"permissionValue": "ChatMessage.Read.Chat", "permissionType": "Delegated"}]}', 'Y29tLm1pY3Jvc29mdC50ZWFtc3BhY2UudGFiLnBsYW5uZXI='),
('NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwYWUzNWIzNi0wZmQ3LTQyMmUtODA1Yi1kNTNhZjE1NzkwOTM=', 'app_bob.smith_NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwYWUzNWIzNi0wZmQ3LTQyMmUtODA1Yi1kNTNhZjE1NzkwOTM=', 'techcorp-001', 'com.microsoft.teamspace.tab.wiki', 'Wiki', NULL, 'store', 'bob.smith', datetime('now'), NULL, 'Y29tLm1pY3Jvc29mdC50ZWFtc3BhY2UudGFiLndpa2k='),
('chat_proj_alpha_planner_001', 'meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'techcorp-001', 'com.microsoft.teamspace.tab.planner', 'Planner', NULL, 'store', 'alice.johnson', datetime('now'), '{"resourceSpecificPermissions": [{"permissionValue": "ChatMessage.Read.Chat", "permissionType": "Delegated"}]}', 'Y29tLm1pY3Jvc29mdC50ZWFtc3BhY2UudGFiLnBsYW5uZXI=');

-- Chat Permission Grants (from chat app installations)
INSERT INTO resource_specific_permission_grants (org_id, grant_id, resource_type, resource_id, client_app_id, resource_app_id, client_id, permission_type, permission, installation_id, created_date_time, soft_deleted, additional_metadata) VALUES
('techcorp-001', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=#ChatMessage.Read.Chat#Delegated', 'chat', 'app_alice.johnson_NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', 'com.microsoft.teamspace.tab.planner', '00000003-0000-0000-c000-000000000000', 'com.microsoft.teamspace.tab.planner', 'Delegated', 'ChatMessage.Read.Chat', 'NjkwM2ZhOTMtNjA1Yi00M2VmLTkyMGUtNzdjNDcyOWY4MjU4IyMwMDAwMTAxNi1kZTA1LTQ5MmUtOTEwNi00ODI4ZmM4YTg2ODc=', datetime('now'), 0, '{"app_name": "Planner", "granted_by": "alice.johnson"}'),
('techcorp-001', 'chat_proj_alpha_planner_001#ChatMessage.Read.Chat#Delegated', 'chat', 'meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'com.microsoft.teamspace.tab.planner', '00000003-0000-0000-c000-000000000000', 'com.microsoft.teamspace.tab.planner', 'Delegated', 'ChatMessage.Read.Chat', 'chat_proj_alpha_planner_001', datetime('now'), 0, '{"app_name": "Planner", "granted_by": "alice.johnson"}');

-- Content Sharing Sessions (Calls API - Microsoft Graph v1.0)
INSERT INTO content_sharing_sessions (id, org_id, call_id, created_at, updated_at) VALUES
('7e1b4346-85a6-4bdd-abe3-d11c5d420efe', 'techcorp-001', '57af5b7e-1f93-4f46-a8d4-b8c0e5f3a7d2', datetime('now'), datetime('now')),
('9f2c5b57-2g04-5c57-9e5e-c9d1f4e6b8g3', 'techcorp-001', '3f4a5b6c-7d8e-9f0a-1b2c-3d4e5f6a7b8c', datetime('now'), datetime('now')),
('a3d6c8e9-3h15-6d68-af6f-d0e2g5f7c9h4', 'globalex-002', '8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', datetime('now'), datetime('now'));

-- Active Calls (Calls API - Microsoft Graph v1.0)
INSERT INTO calls (id, org_id, callback_uri, call_chain_id, direction, state, subject, source, targets, my_participant_id, requested_modalities, call_options, media_config, created_at, updated_at, soft_delete) VALUES
('incoming-test-call-001', 'techcorp-001', 'https://bot.techcorp.com/api/calls', 'c67f9b54-fedc-4bb3-8ff4-e138fbb62f89', 'incoming', 'incoming', 'Test Redirect Call 001', '{"identity": {"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', 'da8abdd6-53d1-443c-9245-5a3db9687e34', '["audio", "video"]', '{"isContentSharingNotificationEnabled": true}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-002', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '18f800d7-0fae-4bb4-bae2-226fe6cf89b9', 'incoming', 'incoming', 'Test Redirect Call 002', '{"identity": {"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', 'bfbeef04-e13a-481a-9a10-21998f85db5b', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-003', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '6eb93e9b-a1eb-4ef0-b038-a2debbbeb0bd', 'incoming', 'incoming', 'Test Redirect Call 003', '{"identity": {"phone": {"id": "+14255551234"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', '0647dac6-6da5-440c-b03b-907594cc76c1', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-004', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '97333628-129f-49c7-8a1f-b03ac4322b89', 'incoming', 'incoming', 'Test Redirect Call 004', '{"identity": {"user": {"id": "dave.brown", "displayName": "Dave Brown", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', '18ff571d-b9d9-452d-8c28-5fe021f00815', '["audio", "video"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-005', 'techcorp-001', 'https://bot.techcorp.com/api/calls', 'b9ca1111-10a5-4b21-9d6f-b19e9ddb6b7b', 'incoming', 'incoming', 'Test Redirect Call 005', '{"identity": {"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', 'f4e64f6a-30e7-4668-a384-487d3c190d9a', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-006', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '1a37c4ed-769d-48ba-891f-813c2ffedaa4', 'incoming', 'incoming', 'Test Redirect Call 006', '{"identity": {"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', '1a959e84-4cd2-4a6f-a973-7e9d01b074a2', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-007', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '67765840-e94b-44ed-a3b0-4a1044ce2f1e', 'incoming', 'incoming', 'Test Redirect Call 007', '{"identity": {"user": {"id": "dave.brown", "displayName": "Dave Brown", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', 'fdbbae57-1089-4c03-bd8e-1cac5606ace5', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-008', 'techcorp-001', 'https://bot.techcorp.com/api/calls', 'a149c13a-8048-4d3c-97df-c8b780b11fae', 'incoming', 'incoming', 'Test Redirect Call 008', '{"identity": {"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', '21531c29-8c6d-4cad-a7a3-0db83cb5f2b1', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-009', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '91fdf066-47db-4a75-9f8b-ffabdd62e2b8', 'incoming', 'incoming', 'Test Redirect Call 009', '{"identity": {"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', 'f8ebf077-2ff6-456d-b428-0bdf886437c0', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-010', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '280b9373-07f6-4cfe-a60c-377344d1c7f1', 'incoming', 'incoming', 'Test Redirect Call 010', '{"identity": {"user": {"id": "dave.brown", "displayName": "Dave Brown", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', '4d0ccc50-3135-48b2-9a9a-3b27b64eb40a', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-011', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '4f15212e-4a4d-4251-869d-f1f54c934656', 'incoming', 'incoming', 'Test Redirect Call 011', '{"identity": {"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', 'b50ae9c1-3abd-48e4-b43c-b02564e9521c', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('incoming-test-call-012', 'techcorp-001', 'https://bot.techcorp.com/api/calls', 'e0261006-92af-4957-9f1d-a0dd7ef9c5eb', 'incoming', 'incoming', 'Test Redirect Call 012', '{"identity": {"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', 'f0b11998-c679-4a3f-80da-0dea2a2f0341', '["audio"]', '{}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('57af5b7e-1f93-4f46-a8d4-b8c0e5f3a7d2', 'techcorp-001', 'https://bot.techcorp.com/callback', '61590065-71fe-4544-82a9-42f04c9de6a8', 'outgoing', 'established', 'Project Alpha Discussion - Group Call', '{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[]', '632899f8-2ea1-4604-8413-27bd2892079f', '["audio", "video"]', '{"isContentSharingNotificationEnabled": true, "isDeltaRosterEnabled": true, "recordingStatus": "notRecording"}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('f1a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', 'techcorp-001', 'https://bot.techcorp.com/api/calls', '05f2f70f-3a9c-47c1-80a9-cc79e91d8cec', 'incoming', 'incoming', 'Project Kickoff Meeting', '{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"application": {"displayName": "Recording Bot", "id": "832899f8-2ea1-4604-8413-27bd2892079f"}}}]', 'bot-participant-001', '["audio", "video"]', '{"isContentSharingNotificationEnabled": true, "isDeltaRosterEnabled": true}', '{"_odata_type": "#microsoft.graph.appHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'techcorp-001', 'https://bot.contoso.com/api/calls', 'febc6d25-a57b-45de-a43e-f5f4ca5507a5', 'outgoing', 'established', 'Design Review Meeting with Screen Sharing', '{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}, {"identity": {"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}, {"identity": {"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', '3d4e5f6a-7b8c-4d9e-0f1a-2b3c4d5e6f7a', '["audio", "video", "videoBasedScreenSharing"]', '{"isContentSharingNotificationEnabled": true, "isDeltaRosterEnabled": true, "recordingStatus": "notRecording", "screenSharingRole": "viewer"}', '{"_odata_type": "#microsoft.graph.appHostedMediaConfig", "blob": "eyJjb25maWd1cmF0aW9uIjp7Im1lZGlhU2Vzc2lvbiI6eyJhdWRpbyI6dHJ1ZSwidmlkZW8iOnRydWUsInNjcmVlblNoYXJpbmciOnRydWV9fX0="}', datetime('now'), datetime('now'), 0),
('8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', 'globalex-002', 'https://bot.globalex.com/callback', 'fa3271f8-3042-420c-aee7-0ceb0b94eae0', 'outgoing', 'established', 'Q4 Executive Planning', '{"identity": {"user": {"id": "emma.wilson", "displayName": "Emma Wilson", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}}', '[{"identity": {"user": {"id": "frank.chen", "displayName": "Frank Chen", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}}, {"identity": {"user": {"id": "grace.kim", "displayName": "Grace Kim", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}}]', '3e988d7b-9f2e-4292-8cce-5134d65ea066', '["audio", "video"]', '{"isContentSharingNotificationEnabled": true, "isDeltaRosterEnabled": true, "recordingStatus": "recording", "recordingStatusUpdatedAt": "2025-12-05T08:22:52.026195+00:00"}', '{"_odata_type": "#microsoft.graph.appHostedMediaConfig", "blob": "eyJjb25maWd1cmF0aW9uIjp7Im1lZGlhU2Vzc2lvbiI6eyJhdWRpbyI6dHJ1ZSwidmlkZW8iOnRydWV9fX0="}', datetime('now'), datetime('now'), 0),
('b1c2d3e4-f5a6-4b7c-8d9e-0f1a2b3c4d5e', 'techcorp-001', 'https://bot.techcorp.com/callback', '09fcd7f7-bb11-4b95-acf8-13763c40ecd5', 'outgoing', 'established', 'Security Review - Group Call', '{"identity": {"user": {"id": "nathan.richards", "displayName": "Nathan Richards", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[]', '8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', '["audio", "video"]', '{"isContentSharingNotificationEnabled": true, "isDeltaRosterEnabled": true, "recordingStatus": "notRecording"}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('c2d3e4f5-a6b7-4c8d-9e0f-1a2b3c4d5e6f', 'globalex-002', 'https://bot.globalex.com/callback', '050bcb76-1c5f-496b-92e1-936c83e23e15', 'outgoing', 'established', 'Marketing Strategy Discussion - Group Call', '{"identity": {"user": {"id": "maya.patel", "displayName": "Maya Patel", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}}', '[]', '2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6c7d', '["audio", "video"]', '{"isContentSharingNotificationEnabled": true, "isDeltaRosterEnabled": true, "recordingStatus": "notRecording"}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0),
('3f4a5b6c-7d8e-9f0a-1b2c-3d4e5f6a7b8c', 'techcorp-001', 'https://bot.techcorp.com/callback', '339764e9-a1e9-4269-bacb-cac7f7d75c63', 'incoming', 'terminated', 'Design Review Call', '{"identity": {"user": {"id": "dave.brown", "displayName": "Dave Brown", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}', '[{"identity": {"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}]', '0bb0f3af-ddd2-4853-b8ac-6bcea28a003f', '["audio"]', '{"recordingStatus": "notRecording"}', '{"_odata_type": "#microsoft.graph.serviceHostedMediaConfig"}', datetime('now'), datetime('now'), 0);

-- Participants (Participants API - Microsoft Graph v1.0)
INSERT INTO participants (id, org_id, call_id, info, media_streams, is_muted, is_in_lobby, created_at, updated_at) VALUES
('632899f8-2ea1-4604-8413-27bd2892079f', 'techcorp-001', '57af5b7e-1f93-4f46-a8d4-b8c0e5f3a7d2', '{"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('7d3a84c2-9f6e-4b1a-a5c7-3e8d9f2a1b4c', 'techcorp-001', '57af5b7e-1f93-4f46-a8d4-b8c0e5f3a7d2', '{"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('8e9f0a1b-2c3d-4e5f-6a7b-8c9d0e1f2a3b', 'techcorp-001', '57af5b7e-1f93-4f46-a8d4-b8c0e5f3a7d2', '{"user": {"id": "james.wilson", "displayName": "James Wilson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('9a4b5c6d-7e8f-4a9b-0c1d-2e3f4a5b6c7d', 'globalex-002', '8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', '{"user": {"id": "emma.wilson", "displayName": "Emma Wilson", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('1b2c3d4e-5f6a-4b7c-8d9e-0f1a2b3c4d5e', 'globalex-002', '8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', '{"user": {"id": "frank.chen", "displayName": "Frank Chen", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('2c3d4e5f-6a7b-4c8d-9e0f-1a2b3c4d5e6f', 'globalex-002', '8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', '{"user": {"id": "grace.kim", "displayName": "Grace Kim", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('3d4e5f6a-7b8c-4d9e-0f1a-2b3c4d5e6f7a', 'techcorp-001', 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', '{"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}, {"sourceId": "3", "direction": "sendOnly", "mediaType": "videoBasedScreenSharing", "label": "screen-sharing", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('4e5f6a7b-8c9d-4e0f-1a2b-3c4d5e6f7a8b', 'techcorp-001', 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', '{"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('5f6a7b8c-9d0e-4f1a-2b3c-4d5e6f7a8b9c', 'techcorp-001', 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', '{"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('6a7b8c9d-0e1f-4a2b-3c4d-5e6f7a8b9c0d', 'techcorp-001', '3f4a5b6c-7d8e-9f0a-1b2c-3d4e5f6a7b8c', '{"user": {"id": "dave.brown", "displayName": "Dave Brown", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[]', 0, 0, datetime('now'), datetime('now')),
('7b8c9d0e-1f2a-4b3c-4d5e-6f7a8b9c0d1e', 'techcorp-001', '3f4a5b6c-7d8e-9f0a-1b2c-3d4e5f6a7b8c', '{"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[]', 0, 0, datetime('now'), datetime('now')),
('8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', 'techcorp-001', 'b1c2d3e4-f5a6-4b7c-8d9e-0f1a2b3c4d5e', '{"user": {"id": "nathan.richards", "displayName": "Nathan Richards", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('9d0e1f2a-3b4c-5d6e-7f8a-9b0c1d2e3f4a', 'techcorp-001', 'b1c2d3e4-f5a6-4b7c-8d9e-0f1a2b3c4d5e', '{"user": {"id": "sophia.bennett", "displayName": "Sophia Bennett", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b', 'techcorp-001', 'b1c2d3e4-f5a6-4b7c-8d9e-0f1a2b3c4d5e', '{"user": {"id": "dave.brown", "displayName": "Dave Brown", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('1f2a3b4c-5d6e-7f8a-9b0c-1d2e3f4a5b6c', 'globalex-002', 'c2d3e4f5-a6b7-4c8d-9e0f-1a2b3c4d5e6f', '{"user": {"id": "oliver.zhang", "displayName": "Oliver Zhang", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6c7d', 'globalex-002', 'c2d3e4f5-a6b7-4c8d-9e0f-1a2b3c4d5e6f', '{"user": {"id": "maya.patel", "displayName": "Maya Patel", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now')),
('3b4c5d6e-7f8a-9b0c-1d2e-3f4a5b6c7d8e', 'globalex-002', 'c2d3e4f5-a6b7-4c8d-9e0f-1a2b3c4d5e6f', '{"user": {"id": "henry.lopez", "displayName": "Henry Lopez", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}', '[{"sourceId": "1", "direction": "sendReceive", "mediaType": "audio", "label": "main-audio", "serverMuted": false}, {"sourceId": "2", "direction": "sendReceive", "mediaType": "video", "label": "main-video", "serverMuted": false}]', 0, 0, datetime('now'), datetime('now'));

-- Call Records (CallRecords API - Microsoft Graph v1.0)
INSERT INTO call_records (id, org_id, version, type, modalities, organizer, participants, start_date_time, end_date_time, last_modified_date_time, join_web_url, created_at, updated_at) VALUES
('e523d2ed-2966-4b6b-925b-754a88034cc5', 'techcorp-001', 1, 'peerToPeer', '["audio"]', '{"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890", "userPrincipalName": "alice.manager@techcorp.com"}}', '[{"id": "c85a75c6-95c6-4662-873c-fbb3de6fe0a6", "identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890", "userPrincipalName": "alice.manager@techcorp.com"}}}, {"id": "56ec13c1-439f-4a6b-9332-4ea874654b22", "identity": {"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890", "userPrincipalName": "bob.smith@techcorp.com"}}}]', '2025-11-30T06:27:52.010Z', '2025-11-30T06:42:52.013Z', '2025-11-30T06:42:52.013Z', 'https://teams.microsoft.com/l/meetup-join/e523d2ed-2966-4b6b-925b-754a88034cc5', '2025-11-30T06:27:52.010Z', '2025-11-30T06:42:52.013Z'),
('f8a3b1c9-4d7e-4a2f-9c5d-6e8b9f0a1b2c', 'techcorp-001', 1, 'groupCall', '["audio", "video", "videoBasedScreenSharing"]', '{"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890", "userPrincipalName": "alice.manager@techcorp.com"}}', '[{"id": "f2fb8093-3d2e-45c6-ba84-d41571724e23", "identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890", "userPrincipalName": "alice.manager@techcorp.com"}}}, {"id": "ca42afe7-df7f-4017-bc0b-8ea8f959337c", "identity": {"user": {"id": "bob.smith", "displayName": "Bob Smith", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890", "userPrincipalName": "bob.smith@techcorp.com"}}}, {"id": "9a6e737a-8b25-40e4-82db-d02959f7f41c", "identity": {"user": {"id": "carol.white", "displayName": "Carol White", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890", "userPrincipalName": "carol.white@techcorp.com"}}}]', '2025-12-02T05:27:52.013Z', '2025-12-02T06:27:52.013Z', '2025-12-02T06:27:52.013Z', 'https://teams.microsoft.com/l/meetup-join/f8a3b1c9-4d7e-4a2f-9c5d-6e8b9f0a1b2c', '2025-12-02T05:27:52.013Z', '2025-12-02T06:27:52.013Z'),
('a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', 'globalex-002', 1, 'peerToPeer', '["audio"]', '{"user": {"id": "frank.chen", "displayName": "Frank Chen", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba", "userPrincipalName": "frank.chen@globalex.com"}}', '[{"id": "7350627d-80c8-4ce8-9795-ee105f6aa6cc", "identity": {"user": {"id": "frank.chen", "displayName": "Frank Chen", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba", "userPrincipalName": "frank.chen@globalex.com"}}}, {"id": "e9d568ef-ec94-4f4e-a420-936d2a3353a3", "identity": {"user": {"id": "emma.wilson", "displayName": "Emma Wilson", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba", "userPrincipalName": "emma.wilson@globalex.com"}}}]', '2025-12-03T05:27:52.013Z', '2025-12-03T05:37:52.013Z', '2025-12-03T05:37:52.013Z', 'https://teams.microsoft.com/l/meetup-join/a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', '2025-12-03T05:27:52.013Z', '2025-12-03T05:37:52.013Z'),
('d5e6f7a8-b9c0-4d1e-2f3a-4b5c6d7e8f9a', 'globalex-002', 1, 'groupCall', '["audio", "video"]', '{"user": {"id": "emma.wilson", "displayName": "Emma Wilson", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba", "userPrincipalName": "emma.wilson@globalex.com"}}', '[{"id": "c5dd7818-5673-4877-a194-f2f08f4d2350", "identity": {"user": {"id": "emma.wilson", "displayName": "Emma Wilson", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba", "userPrincipalName": "emma.wilson@globalex.com"}}}, {"id": "29f04b71-f80b-4d36-8bfa-b77ce255c1c8", "identity": {"user": {"id": "frank.chen", "displayName": "Frank Chen", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba", "userPrincipalName": "frank.chen@globalex.com"}}}, {"id": "c74ee6ce-7c19-4c08-afc6-a0e6f781cd1f", "identity": {"user": {"id": "grace.kim", "displayName": "Grace Kim", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba", "userPrincipalName": "grace.kim@globalex.com"}}}, {"id": "a8538030-459b-4f90-8305-f247361c3488", "identity": {"user": {"id": "henry.lopez", "displayName": "Henry Lopez", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba", "userPrincipalName": "henry.lopez@globalex.com"}}}]', '2025-12-04T04:27:52.013Z', '2025-12-04T05:27:52.013Z', '2025-12-04T05:27:52.013Z', 'https://teams.microsoft.com/l/meetup-join/d5e6f7a8-b9c0-4d1e-2f3a-4b5c6d7e8f9a', '2025-12-04T04:27:52.013Z', '2025-12-04T05:27:52.013Z');

-- PSTN Call Logs (as call_records with type='pstn')
INSERT INTO call_records (id, org_id, version, type, modalities, organizer, participants, start_date_time, end_date_time, join_web_url, created_at, updated_at) VALUES
('347cd785-9ebc-456d-9697-bbcfda76974d', 'techcorp-001', 1, 'pstn', '[]', '{}', '[{"id": "347cd785-9ebc-456d-9697-bbcfda76974d", "org_id": "techcorp-001", "callId": "1835317186_112562680@61.221.3.176", "userId": "alice.johnson", "userPrincipalName": "alice.manager@techcorp.com", "userDisplayName": "Alice Johnson", "startDateTime": "2025-12-03T05:27:52.026937+00:00", "endDateTime": "2025-12-03T05:42:52.026950+00:00", "duration": 900, "charge": 2.5, "callType": "user_out", "currency": "USD", "calleeNumber": "+1234567890", "usageCountryCode": "US", "tenantCountryCode": "US", "connectionCharge": 0.1, "callerNumber": "+10123456789", "destinationContext": null, "destinationName": "United States", "conferenceId": null, "licenseCapability": "MCOPSTNU", "inventoryType": "Subscriber", "operator": "Microsoft", "callDurationSource": "microsoft"}]', '2025-12-03T05:27:52.026937+00:00', '2025-12-03T05:42:52.026950+00:00', NULL, '2025-12-03T05:27:52.026937+00:00', '2025-12-03T05:42:52.026950+00:00'),
('0081afbc-b01c-44e4-b7ff-ab4cce726f77', 'techcorp-001', 1, 'pstn', '[]', '{}', '[{"id": "0081afbc-b01c-44e4-b7ff-ab4cce726f77", "org_id": "techcorp-001", "callId": "1835317187_112562681@61.221.3.177", "userId": "bob.smith", "userPrincipalName": "bob.smith@techcorp.com", "userDisplayName": "Bob Smith", "startDateTime": "2025-12-04T03:27:52.026966+00:00", "endDateTime": "2025-12-04T03:37:52.026970+00:00", "duration": 600, "charge": 0.0, "callType": "user_in", "currency": "USD", "calleeNumber": "+10123456788", "usageCountryCode": "US", "tenantCountryCode": "US", "connectionCharge": 0.0, "callerNumber": "+1234567891", "destinationContext": null, "destinationName": "United States", "conferenceId": null, "licenseCapability": "MCOPSTNU", "inventoryType": "Subscriber", "operator": "Microsoft", "callDurationSource": "microsoft"}]', '2025-12-04T03:27:52.026966+00:00', '2025-12-04T03:37:52.026970+00:00', NULL, '2025-12-04T03:27:52.026966+00:00', '2025-12-04T03:37:52.026970+00:00'),
('5fff6478-0d5a-4c81-b2d1-4488c99ff8b9', 'globalex-002', 1, 'pstn', '[]', '{}', '[{"id": "5fff6478-0d5a-4c81-b2d1-4488c99ff8b9", "org_id": "globalex-002", "callId": "1835317188_112562682@61.221.3.178", "userId": "emma.wilson", "userPrincipalName": "emma.wilson@globalex.com", "userDisplayName": "Emma Wilson", "startDateTime": "2025-12-02T06:27:52.026981+00:00", "endDateTime": "2025-12-02T06:47:52.026985+00:00", "duration": 1200, "charge": 5.8, "callType": "user_out", "currency": "CAD", "calleeNumber": "+442071234567", "usageCountryCode": "GB", "tenantCountryCode": "CA", "connectionCharge": 0.2, "callerNumber": "+14165551234", "destinationContext": "International", "destinationName": "United Kingdom", "conferenceId": null, "licenseCapability": "MCOPSTNU", "inventoryType": "Subscriber", "operator": "Microsoft", "callDurationSource": "microsoft"}]', '2025-12-02T06:27:52.026981+00:00', '2025-12-02T06:47:52.026985+00:00', NULL, '2025-12-02T06:27:52.026981+00:00', '2025-12-02T06:47:52.026985+00:00'),
('b04f2659-e30a-4abd-a09f-e6416584d897', 'globalex-002', 1, 'pstn', '[]', '{}', '[{"id": "b04f2659-e30a-4abd-a09f-e6416584d897", "org_id": "globalex-002", "callId": "1835317189_112562683@61.221.3.179", "userId": "frank.chen", "userPrincipalName": "frank.chen@globalex.com", "userDisplayName": "Frank Chen", "startDateTime": "2025-12-05T05:27:52.026996+00:00", "endDateTime": "2025-12-05T06:12:52.026999+00:00", "duration": 2700, "charge": 0.0, "callType": "conf_in", "currency": "CAD", "calleeNumber": "+14165551235", "usageCountryCode": "CA", "tenantCountryCode": "CA", "connectionCharge": 0.0, "callerNumber": "+14165559999", "destinationContext": null, "destinationName": "Canada", "conferenceId": "conf_2024_001", "licenseCapability": "MCOPSTNU", "inventoryType": "Subscriber", "operator": "Microsoft", "callDurationSource": "microsoft"}]', '2025-12-05T05:27:52.026996+00:00', '2025-12-05T06:12:52.026999+00:00', NULL, '2025-12-05T05:27:52.026996+00:00', '2025-12-05T06:12:52.026999+00:00');

-- Direct Routing Call Logs (as call_records with type='direct_routing')
INSERT INTO call_records (id, org_id, version, type, modalities, organizer, participants, start_date_time, end_date_time, join_web_url, created_at, updated_at) VALUES
('998a2731-712a-4d21-98c9-6b47b97c6b85', 'techcorp-001', 1, 'direct_routing', '[]', '{}', '[{"id": "998a2731-712a-4d21-98c9-6b47b97c6b85", "org_id": "techcorp-001", "correlationId": "4b63db6c-bf22-4af8-baf8-34134498ef3c", "userId": "alice.johnson", "userPrincipalName": "alice.manager@techcorp.com", "userDisplayName": "Alice Johnson", "startDateTime": "2025-12-03T05:27:52.027117+00:00", "inviteDateTime": "2025-12-03T05:27:47.027123+00:00", "failureDateTime": "0001-01-01T00:00:00Z", "endDateTime": "2025-12-03T05:39:52.027129+00:00", "duration": 720, "callType": "ByotOut", "successfulCall": true, "callerNumber": "+14255551001", "calleeNumber": "+14255559876", "mediaPathLocation": "USWE", "signalingLocation": "USEA", "finalSipCode": 200, "callEndSubReason": 0, "finalSipCodePhrase": "OK", "trunkFullyQualifiedDomainName": "sbc.techcorp.com", "mediaBypassEnabled": false}]', '2025-12-03T05:27:52.027117+00:00', '2025-12-03T05:39:52.027129+00:00', NULL, '2025-12-03T05:27:52.027117+00:00', '2025-12-03T05:39:52.027129+00:00'),
('d492052d-39c7-4f1e-91b7-0385cf90edf5', 'techcorp-001', 1, 'direct_routing', '[]', '{}', '[{"id": "d492052d-39c7-4f1e-91b7-0385cf90edf5", "org_id": "techcorp-001", "correlationId": "6f569b91-092f-4f40-898a-7f32162ad057", "userId": "bob.smith", "userPrincipalName": "bob.smith@techcorp.com", "userDisplayName": "Bob Smith", "startDateTime": "2025-12-04T03:27:52.027146+00:00", "inviteDateTime": "2025-12-04T03:27:49.027150+00:00", "failureDateTime": "0001-01-01T00:00:00Z", "endDateTime": "2025-12-04T03:35:52.027153+00:00", "duration": 480, "callType": "ByotIn", "successfulCall": true, "callerNumber": "+14255552222", "calleeNumber": "+14255551002", "mediaPathLocation": "USWE", "signalingLocation": "USEA", "finalSipCode": 200, "callEndSubReason": 0, "finalSipCodePhrase": "OK", "trunkFullyQualifiedDomainName": "sbc.techcorp.com", "mediaBypassEnabled": true}]', '2025-12-04T03:27:52.027146+00:00', '2025-12-04T03:35:52.027153+00:00', NULL, '2025-12-04T03:27:52.027146+00:00', '2025-12-04T03:35:52.027153+00:00'),
('c9f91f0a-764b-40ed-9305-d4b19c27a83f', 'techcorp-001', 1, 'direct_routing', '[]', '{}', '[{"id": "c9f91f0a-764b-40ed-9305-d4b19c27a83f", "org_id": "techcorp-001", "correlationId": "72aa06b1-990b-497f-b5b7-e92d1be4a3a6", "userId": "carol.white", "userPrincipalName": "carol.white@techcorp.com", "userDisplayName": "Carol White", "startDateTime": "2025-12-04T06:27:52.027177+00:00", "inviteDateTime": "2025-12-04T06:27:50.027180+00:00", "failureDateTime": "2025-12-04T06:27:37.027184+00:00", "endDateTime": "2025-12-04T06:27:37.027187+00:00", "duration": 0, "callType": "ByotOut", "successfulCall": false, "callerNumber": "+14255551003", "calleeNumber": "+14255557777", "mediaPathLocation": null, "signalingLocation": "USEA", "finalSipCode": 480, "callEndSubReason": 540407, "finalSipCodePhrase": "Temporarily Unavailable", "trunkFullyQualifiedDomainName": "sbc.techcorp.com", "mediaBypassEnabled": false}]', '2025-12-04T06:27:52.027177+00:00', '2025-12-04T06:27:37.027187+00:00', NULL, '2025-12-04T06:27:52.027177+00:00', '2025-12-04T06:27:37.027187+00:00'),
('fd79062b-235c-4fd4-9a00-089a38521eff', 'globalex-002', 1, 'direct_routing', '[]', '{}', '[{"id": "fd79062b-235c-4fd4-9a00-089a38521eff", "org_id": "globalex-002", "correlationId": "5dc28b1e-b45a-46a7-a57e-5231be17abfa", "userId": "emma.wilson", "userPrincipalName": "emma.wilson@globalex.com", "userDisplayName": "Emma Wilson", "startDateTime": "2025-12-02T06:27:52.027207+00:00", "inviteDateTime": "2025-12-02T06:27:48.027210+00:00", "failureDateTime": "0001-01-01T00:00:00Z", "endDateTime": "2025-12-02T06:52:52.027213+00:00", "duration": 1500, "callType": "ByotOut", "successfulCall": true, "callerNumber": "+14165552001", "calleeNumber": "+442071234567", "mediaPathLocation": "EUNO", "signalingLocation": "EUNO", "finalSipCode": 200, "callEndSubReason": 0, "finalSipCodePhrase": "OK", "trunkFullyQualifiedDomainName": "sbc.globalex.com", "mediaBypassEnabled": false}]', '2025-12-02T06:27:52.027207+00:00', '2025-12-02T06:52:52.027213+00:00', NULL, '2025-12-02T06:27:52.027207+00:00', '2025-12-02T06:52:52.027213+00:00'),
('465de86b-eaa3-4c54-a8f4-523e698d81f2', 'globalex-002', 1, 'direct_routing', '[]', '{}', '[{"id": "465de86b-eaa3-4c54-a8f4-523e698d81f2", "org_id": "globalex-002", "correlationId": "65ecfffb-0aa5-446f-b89f-9a854dfb3721", "userId": "frank.chen", "userPrincipalName": "frank.chen@globalex.com", "userDisplayName": "Frank Chen", "startDateTime": "2025-12-05T05:27:52.027227+00:00", "inviteDateTime": "2025-12-05T05:27:46.027230+00:00", "failureDateTime": "0001-01-01T00:00:00Z", "endDateTime": "2025-12-05T06:07:52.027234+00:00", "duration": 2400, "callType": "ByotOut", "successfulCall": true, "callerNumber": "+14165552002", "calleeNumber": "+14165559999", "mediaPathLocation": "USWE", "signalingLocation": "USEA", "finalSipCode": 200, "callEndSubReason": 0, "finalSipCodePhrase": "BYE", "trunkFullyQualifiedDomainName": "sbc.globalex.com", "mediaBypassEnabled": true}]', '2025-12-05T05:27:52.027227+00:00', '2025-12-05T06:07:52.027234+00:00', NULL, '2025-12-05T05:27:52.027227+00:00', '2025-12-05T06:07:52.027234+00:00'),
('7486a05a-2828-4253-b085-44f5289e54cf', 'globalex-002', 1, 'direct_routing', '[]', '{}', '[{"id": "7486a05a-2828-4253-b085-44f5289e54cf", "org_id": "globalex-002", "correlationId": "225a3b75-2de1-48b5-9229-908f7dae078b", "userId": "grace.kim", "userPrincipalName": "grace.kim@globalex.com", "userDisplayName": "Grace Kim", "startDateTime": "2025-12-05T07:27:52.027248+00:00", "inviteDateTime": "2025-12-05T07:27:49.027251+00:00", "failureDateTime": "2025-12-05T07:27:44.027254+00:00", "endDateTime": "2025-12-05T07:27:44.027271+00:00", "duration": 0, "callType": "ByotOut", "successfulCall": false, "callerNumber": "+14165552003", "calleeNumber": "+14165558888", "mediaPathLocation": null, "signalingLocation": "USEA", "finalSipCode": 486, "callEndSubReason": 540486, "finalSipCodePhrase": "Busy Here", "trunkFullyQualifiedDomainName": "sbc.globalex.com", "mediaBypassEnabled": false}]', '2025-12-05T07:27:52.027248+00:00', '2025-12-05T07:27:44.027271+00:00', NULL, '2025-12-05T07:27:52.027248+00:00', '2025-12-05T07:27:44.027271+00:00');

-- Online Meetings (Online Meetings API - Microsoft Graph v1.0 - ALL properties)
INSERT INTO online_meetings (id, org_id, user_id, subject, start_date_time, end_date_time, creation_date_time, external_id, join_web_url, video_teleconference_id, allow_attendee_to_enable_camera, allow_attendee_to_enable_mic, allow_breakout_rooms, allow_copying_and_sharing_meeting_content, allow_live_share, allow_meeting_chat, allow_participants_to_change_name, allow_powerpoint_sharing, allow_recording, allow_teamwork_reactions, allow_transcription, allow_whiteboard, allowed_lobby_admitters, allowed_presenters, is_end_to_end_encryption_enabled, is_entry_exit_announced, record_automatically, share_meeting_chat_history_default, meeting_template_id, is_broadcast, chat_info, participants, lobby_bypass_settings, audio_conferencing, chat_restrictions, join_information, join_meeting_id_settings, watermark_protection, broadcast_settings, created_at, updated_at) VALUES
('MSo1N2Y5ZGFjYy03MWJmLTQ3NDMtYjQxMy01M2EdFGkdRWHJlQ', 'techcorp-001', 'alice.johnson', 'Team Standup - Project Alpha', '2025-12-03T06:27:52.027Z', '2025-12-03T06:57:52.027Z', '2025-11-30T08:27:52.027Z', 'STANDUP-2024-001', 'https://teams.microsoft.com/l/meetup-join/MSo1N2Y5ZGFjYy03MWJmLTQ3NDMtYjQxMy01M2EdFGkdRWHJlQ', '123456789012', 1, 1, 1, 1, 'enabled', 'enabled', 0, 1, 1, 1, 1, 1, 'organizerAndCoOrganizersAndPresenters', 'everyone', 0, 1, 0, 'all', NULL, 0, NULL, '{"@odata.type": "microsoft.graph.meetingParticipants", "organizer": {"@odata.type": "microsoft.graph.meetingParticipantInfo", "upn": "alice.manager@techcorp.com", "role": "presenter", "identity": {"user": {"id": "alice.johnson", "displayName": "Alice Johnson", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}}, "attendees": [], "scope": "organization", "isDialInBypassEnabled": false}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, datetime('now'), datetime('now')),
('MSpkYzE3Njc0Yy04MWQ5LTRhZGItYmZ', 'techcorp-001', 'bob.smith', 'Sprint Planning - Q4', '2025-12-04T05:27:52.027Z', '2025-12-04T06:27:52.027Z', '2025-11-28T08:27:52.027Z', 'SPRINT-Q4-2024', 'https://teams.microsoft.com/l/meetup-join/MSpkYzE3Njc0Yy04MWQ5LTRhZGItYmZ', '987654321098', 1, 1, 0, 1, 'enabled', 'enabled', 0, 1, 1, 1, 1, 1, 'organizerAndCoOrganizers', 'organization', 1, 0, 1, 'all', NULL, 0, NULL, NULL, '{"scope": "organization", "isDialInBypassEnabled": true}', '{"tollNumber": "+1 425 555 0100", "tollFreeNumber": "+1 800 555 0100", "conferenceId": "987654321", "dialinUrl": "https://dialin.teams.microsoft.com/987654321"}', NULL, NULL, NULL, NULL, NULL, datetime('now'), datetime('now')),
('MSoxMjM0NTY3OC05YWJjLTQxZjItYTlkNC1lZjEyMzQ1Njc4OTA', 'globalex-002', 'emma.wilson', 'Executive Leadership Sync', '2025-12-02T04:27:52.027Z', '2025-12-02T05:27:52.027Z', '2025-11-25T08:27:52.027Z', NULL, 'https://teams.microsoft.com/l/meetup-join/MSoxMjM0NTY3OC05YWJjLTQxZjItYTlkNC1lZjEyMzQ1Njc4OTA', '555666777888', 0, 0, 0, 0, 'disabled', 'enabled', 0, 0, 1, 0, 1, 0, 'organizerAndCoOrganizers', 'organizer', 1, 1, 1, 'none', NULL, 0, NULL, NULL, '{"scope": "organizer", "isDialInBypassEnabled": false}', NULL, '{"allowTextOnly": true, "allowGiphy": false, "allowStickers": false, "allowMemes": false}', NULL, NULL, '{"isEnabledForContentSharing": true, "isEnabledForVideo": true}', NULL, datetime('now'), datetime('now'));

-- 3 online meetings created with ALL Microsoft Graph API v1.0 properties

-- Call Transcripts (Transcripts API - Microsoft Graph v1.0)
INSERT INTO call_transcripts (id, org_id, meeting_id, call_id, created_date_time, end_date_time, content_correlation_id, transcript_content_url, content, metadata_content, meeting_organizer, created_at, updated_at) VALUES
('MSMjMCMjZDAwYWU3NjUtNmM2Yi00NjQxLTgwMWQtMTkzMmFmMjEzNzdh', 'techcorp-001', 'MSo1N2Y5ZGFjYy03MWJmLTQ3NDMtYjQxMy01M2EdFGkdRWHJlQ', 'af630fe0-04d3-4559-8cf9-91fe45e36296', '2025-12-03T06:27:52.027Z', '2025-12-03T06:57:52.027Z', 'bc842d7a-2f6e-4b18-a1c7-73ef91d5c8e3', 'https://graph.microsoft.com/v1.0/$metadata#users(''alice.johnson'')/onlineMeetings(''MSo1N2Y5ZGFjYy03MWJmLTQ3NDMtYjQxMy01M2EdFGkdRWHJlQ'')/transcripts/(''MSMjMCMjZDAwYWU3NjUtNmM2Yi00NjQxLTgwMWQtMTkzMmFmMjEzNzdh'')/content', 'WEBVTT

00:00:00.000 --> 00:00:05.000
Alice Johnson: Good morning everyone! Let''s start our team standup.

00:00:05.500 --> 00:00:12.000
Bob Smith: Morning Alice. I''ve completed the API authentication module yesterday.

00:00:12.500 --> 00:00:18.000
Alice Johnson: Great work Bob! Any blockers we should know about?

00:00:18.500 --> 00:00:25.000
Bob Smith: No blockers at the moment. Moving on to user permissions system next.

00:00:25.500 --> 00:00:30.000
Alice Johnson: Perfect. Carol, how''s the UI design coming along?', '<?xml version="1.0" encoding="utf-8"?>
<transcript>
  <version>1.0</version>
  <language>en-US</language>
  <duration>PT30M</duration>
  <participants>
    <participant id="alice.johnson">Alice Johnson</participant>
    <participant id="bob.smith">Bob Smith</participant>
  </participants>
</transcript>', '{"application": null, "device": null, "user": {"@odata.type": "#Microsoft.Teams.GraphSvc.teamworkUserIdentity", "id": "alice.johnson", "displayName": "Alice Johnson", "userIdentityType": "aadUser", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', datetime('now'), datetime('now')),
('MSMjMCMjMzAxNjNhYTctNWRmZi00MjM3LTg5MGQtNWJhYWZjZTZhNWYw', 'techcorp-001', 'MSo1N2Y5ZGFjYy03MWJmLTQ3NDMtYjQxMy01M2EdFGkdRWHJlQ', 'af630fe0-04d3-4559-8cf9-91fe45e36296', '2025-11-30T06:27:52.027Z', '2025-11-30T06:57:52.027Z', 'bc842d7a-2f6e-4b18-a1c7-73ef91d5c8e3', 'https://graph.microsoft.com/v1.0/$metadata#users(''alice.johnson'')/onlineMeetings(''MSo1N2Y5ZGFjYy03MWJmLTQ3NDMtYjQxMy01M2EdFGkdRWHJlQ'')/transcripts/(''MSMjMCMjMzAxNjNhYTctNWRmZi00MjM3LTg5MGQtNWJhYWZjZTZhNWYw'')/content', 'WEBVTT

00:00:00.000 --> 00:00:05.000
Alice Johnson: Good morning everyone! Let''s start our team standup.

00:00:05.500 --> 00:00:12.000
Bob Smith: Morning Alice. I''ve completed the API authentication module yesterday.

00:00:12.500 --> 00:00:18.000
Alice Johnson: Great work Bob! Any blockers we should know about?

00:00:18.500 --> 00:00:25.000
Bob Smith: No blockers at the moment. Moving on to user permissions system next.

00:00:25.500 --> 00:00:30.000
Alice Johnson: Perfect. Carol, how''s the UI design coming along?', '<?xml version="1.0" encoding="utf-8"?>
<transcript>
  <version>1.0</version>
  <language>en-US</language>
  <duration>PT30M</duration>
  <participants>
    <participant id="alice.johnson">Alice Johnson</participant>
    <participant id="bob.smith">Bob Smith</participant>
  </participants>
</transcript>', '{"application": null, "device": null, "user": {"@odata.type": "#Microsoft.Teams.GraphSvc.teamworkUserIdentity", "id": "alice.johnson", "displayName": "Alice Johnson", "userIdentityType": "aadUser", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', datetime('now'), datetime('now')),
('MSMjMCMjNzU3ODc2ZDYtOTcwMi00MDhkLWFkNDItOTE2ZDNmZjkwZGY4', 'techcorp-001', 'MSpkYzE3Njc0Yy04MWQ5LTRhZGItYmZ', 'bf730fe1-05d4-4660-9dfa-a2fe46e37397', '2025-12-04T05:27:52.027Z', '2025-12-04T06:27:52.027Z', 'cd953e8b-3g7f-5c29-b2d8-84fg02e6d9f4', 'https://graph.microsoft.com/v1.0/$metadata#users(''bob.smith'')/onlineMeetings(''MSpkYzE3Njc0Yy04MWQ5LTRhZGItYmZ'')/transcripts/(''MSMjMCMjNzU3ODc2ZDYtOTcwMi00MDhkLWFkNDItOTE2ZDNmZjkwZGY4'')/content', 'WEBVTT

00:00:00.000 --> 00:00:05.000
Alice Johnson: Good morning everyone! Let''s start our team standup.

00:00:05.500 --> 00:00:12.000
Bob Smith: Morning Alice. I''ve completed the API authentication module yesterday.

00:00:12.500 --> 00:00:18.000
Alice Johnson: Great work Bob! Any blockers we should know about?

00:00:18.500 --> 00:00:25.000
Bob Smith: No blockers at the moment. Moving on to user permissions system next.

00:00:25.500 --> 00:00:30.000
Alice Johnson: Perfect. Carol, how''s the UI design coming along?', '<?xml version="1.0" encoding="utf-8"?>
<transcript>
  <version>1.0</version>
  <language>en-US</language>
  <duration>PT30M</duration>
  <participants>
    <participant id="alice.johnson">Alice Johnson</participant>
    <participant id="bob.smith">Bob Smith</participant>
  </participants>
</transcript>', '{"application": null, "device": null, "user": {"@odata.type": "#Microsoft.Teams.GraphSvc.teamworkUserIdentity", "id": "bob.smith", "displayName": "Bob Smith", "userIdentityType": "aadUser", "tenantId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"}}', datetime('now'), datetime('now')),
('MSMjMCMjOGI5YzNkNGUtNmY3YS00NWU4LWI2YzEtMjM0NTY3ODkwYWJj', 'globalex-002', 'MSoxMjM0NTY3OC05YWJjLTQxZjItYTlkNC1lZjEyMzQ1Njc4OTA', 'cg840gf2-06e5-5771-aeea-b3gf57f48408', '2025-12-02T04:27:52.027Z', '2025-12-02T05:27:52.027Z', 'de064f9c-4h8g-6d3a-c3e9-95hg13f7eag5', 'https://graph.microsoft.com/v1.0/$metadata#users(''emma.wilson'')/onlineMeetings(''MSoxMjM0NTY3OC05YWJjLTQxZjItYTlkNC1lZjEyMzQ1Njc4OTA'')/transcripts/(''MSMjMCMjOGI5YzNkNGUtNmY3YS00NWU4LWI2YzEtMjM0NTY3ODkwYWJj'')/content', 'WEBVTT

00:00:00.000 --> 00:00:05.000
Alice Johnson: Good morning everyone! Let''s start our team standup.

00:00:05.500 --> 00:00:12.000
Bob Smith: Morning Alice. I''ve completed the API authentication module yesterday.

00:00:12.500 --> 00:00:18.000
Alice Johnson: Great work Bob! Any blockers we should know about?

00:00:18.500 --> 00:00:25.000
Bob Smith: No blockers at the moment. Moving on to user permissions system next.

00:00:25.500 --> 00:00:30.000
Alice Johnson: Perfect. Carol, how''s the UI design coming along?', '<?xml version="1.0" encoding="utf-8"?>
<transcript>
  <version>1.0</version>
  <language>en-US</language>
  <duration>PT30M</duration>
  <participants>
    <participant id="alice.johnson">Alice Johnson</participant>
    <participant id="bob.smith">Bob Smith</participant>
  </participants>
</transcript>', '{"application": null, "device": null, "user": {"@odata.type": "#Microsoft.Teams.GraphSvc.teamworkUserIdentity", "id": "emma.wilson", "displayName": "Emma Wilson", "userIdentityType": "aadUser", "tenantId": "f9e8d7c6-b5a4-3210-9876-543210fedcba"}}', datetime('now'), datetime('now'));

-- Audio Routing Groups Sample Data
-- Microsoft Graph API v1.0 compliant
-- Demonstrates oneToOne (immutable) and multicast (mutable) routing modes

INSERT INTO audio_routing_groups (id, org_id, call_id, routing_mode, sources, receivers, created_at, updated_at) VALUES
('routing_onetoone_alice_bob', 'techcorp-001', '57af5b7e-1f93-4f46-a8d4-b8c0e5f3a7d2', 'oneToOne', '["632899f8-2ea1-4604-8413-27bd2892079f"]', '["7d3a84c2-9f6e-4b1a-a5c7-3e8d9f2a1b4c"]', datetime('now'), datetime('now')),
('routing_multicast_alice_team', 'techcorp-001', 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'multicast', '["3d4e5f6a-7b8c-4d9e-0f1a-2b3c4d5e6f7a"]', '["4e5f6a7b-8c9d-4e0f-1a2b-3c4d5e6f7a8b", "5f6a7b8c-9d0e-4f1a-2b3c-4d5e6f7a8b9c"]', datetime('now'), datetime('now')),
('routing_multicast_emma_execs', 'globalex-002', '8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', 'multicast', '["9a4b5c6d-7e8f-4a9b-0c1d-2e3f4a5b6c7d"]', '["1b2c3d4e-5f6a-4b7c-8d9e-0f1a2b3c4d5e", "2c3d4e5f-6a7b-4c8d-9e0f-1a2b3c4d5e6f"]', datetime('now'), datetime('now'));

-- Audio Routing Groups Summary
-- Total routing groups: 3
-- OneToOne routing groups: 1 (immutable)
-- Multicast routing groups: 2 (mutable)
-- All groups linked to sample calls

-- Large Gallery View Operations (Calls API - Microsoft Graph v1.0)
INSERT INTO large_gallery_view_operations (id, org_id, call_id, status, client_context, result_info, created_at, updated_at) VALUES
('e33176d4-836a-4fd7-b95a-d11bda52811d', 'techcorp-001', '57af5b7e-1f93-4f46-a8d4-b8c0e5f3a7d2', 'running', '785f4929-92ca-497b-863f-c778c77c9758', NULL, datetime('now'), datetime('now')),
('f44287e5-947b-5ce8-bd6f-e22cdb95922e', 'globalex-002', '8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', 'completed', '891a5030-a3db-408c-974g-d889ef08a869', '{"code": 200, "subcode": 0, "message": "Large gallery view added successfully"}', datetime('now'), datetime('now')),
('a55398f6-058c-6df9-ce7g-f33ded06b93f', 'techcorp-001', 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'failed', 'test-failure-context', '{"code": 500, "subcode": 5000, "message": "Failed to add large gallery view due to network error"}', datetime('now'), datetime('now'));

-- 3 large gallery view operations created

-- Hold Music Configurations (Calls API - available music options)
INSERT INTO hold_music_configs (config_id, org_id, name, description, media_uri, resource_id, client_context, is_active) VALUES
('5f2f687c-8e70-466d-a0d4-57c356763b9e', 'techcorp-001', 'classical_music', 'Classical hold music - Relaxing piano melody', 'https://cdn.contoso.com/hold-music/classical.wav', 'f8971b04-b53e-418c-9222-c82ce681a582', 'classical-hold-music-001', 1),
('1b4b11a5-239f-4924-80a6-f8b35b437b28', 'techcorp-001', 'corporate_music', 'Corporate hold music - Professional background music', 'https://cdn.contoso.com/hold-music/corporate.wav', 'a1234b56-7890-1234-5678-90abcdef1234', 'corporate-hold-music-002', 1),
('5f56db5a-bf56-47aa-a1a8-54de399a9597', 'techcorp-001', 'jazz_music', 'Jazz hold music - Smooth jazz background', 'https://cdn.contoso.com/hold-music/jazz.wav', 'b9876c54-3210-9876-5432-10fedcba9876', 'jazz-hold-music-003', 1),
('ba263a46-ebca-45c5-a1bb-2f9349a4f170', 'techcorp-001', 'informational_message', 'Informational message - Please hold while we connect you', 'https://cdn.contoso.com/prompts/please-hold.wav', 'c4567d89-0123-4567-8901-234567890abc', 'info-message-hold-004', 1),
('b0d9279a-4b66-4361-bdd8-a19afe04e3f2', 'techcorp-001', 'simple_beep', 'Simple beep tone - Minimal hold indication', 'https://cdn.contoso.com/tones/beep.wav', 'd7890e12-3456-7890-1234-567890abcdef', 'beep-hold-005', 1),
('7d70b67a-1120-4c8c-8a38-ef9747fcdb1c', 'techcorp-001', 'queue_music', 'Call queue music - You are number X in the queue', 'https://cdn.contoso.com/queue/position-announcement.wav', 'e2345f67-8901-2345-6789-012345678901', 'queue-music-006', 1),
('1a86568a-49dd-4f76-894d-efa1ba5202fa', 'globalex-002', 'classical_music', 'Classical hold music - Relaxing piano melody', 'https://cdn.contoso.com/hold-music/classical.wav', 'f8971b04-b53e-418c-9222-c82ce681a582', 'classical-hold-music-001', 1),
('99ed891c-f1d5-4bab-a4fe-5b8e1021792e', 'globalex-002', 'corporate_music', 'Corporate hold music - Professional background music', 'https://cdn.contoso.com/hold-music/corporate.wav', 'a1234b56-7890-1234-5678-90abcdef1234', 'corporate-hold-music-002', 1),
('857a4576-6bc9-4102-a3a4-a925d6e1b817', 'globalex-002', 'jazz_music', 'Jazz hold music - Smooth jazz background', 'https://cdn.contoso.com/hold-music/jazz.wav', 'b9876c54-3210-9876-5432-10fedcba9876', 'jazz-hold-music-003', 1),
('f3a9683c-474f-49ba-baff-3103cffd6815', 'globalex-002', 'informational_message', 'Informational message - Please hold while we connect you', 'https://cdn.contoso.com/prompts/please-hold.wav', 'c4567d89-0123-4567-8901-234567890abc', 'info-message-hold-004', 1),
('53c981ff-fc2d-4ae8-9532-e4cbe3c9a828', 'globalex-002', 'simple_beep', 'Simple beep tone - Minimal hold indication', 'https://cdn.contoso.com/tones/beep.wav', 'd7890e12-3456-7890-1234-567890abcdef', 'beep-hold-005', 1),
('5d74655c-8bc3-475f-8d38-9497e5e934c0', 'globalex-002', 'queue_music', 'Call queue music - You are number X in the queue', 'https://cdn.contoso.com/queue/position-announcement.wav', 'e2345f67-8901-2345-6789-012345678901', 'queue-music-006', 1),
('ae7e9e6f-8d0f-4cdd-b277-8de8c285c313', 'techcorp-001', 'default_system', 'Default system hold music', NULL, NULL, 'default-system-hold', 1),
('876b5ce3-0485-4c40-a448-f4076aac7d2b', 'globalex-002', 'default_system', 'Default system hold music', NULL, NULL, 'default-system-hold', 1);

-- 14 hold music configurations created

-- Chat Message Hosted Contents (for list_chat_message_hosted_contents API)
INSERT INTO chat_message_hosted_contents (hosted_content_id, message_id, chat_id, content_type, content_bytes, created_datetime) VALUES
('0-wus-d3-7f8e9a0b1c2d3e4f5a6b7c8d9e0f1a2b', '1612289992105', 'meeting_MjdhMjVmN2QtZjNkNC00YjY4LWJkNDQtMmY2ZGUyMzQyMmY4', 'image/png', X'89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4890000000d4944415478da6364f8cf500f00038601805a347d6b0000000049454e44ae426082', '2021-02-02T18:19:52.105+00:00'),
('0-wus-d3-a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '1612289992105', 'meeting_MjdhMjVmN2QtZjNkNC00YjY4LWJkNDQtMmY2ZGUyMzQyMmY4', 'text/x-python', X'646566206669626f6e61636369286e293a0a202020206966206e203c3d20313a2072657475726e206e0a2020202072657475726e206669626f6e61636369286e2d3129202b206669626f6e61636369286e2d32290a', '2021-02-02T18:19:52.106+00:00'),
('0-wus-d9-8c7e3a4f9b2d1e5a6c8d7f0b3e5a7c9d', '1615971548136', 'meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'text/javascript', X'636f6e7374206772656574696e67203d202748656c6c6f20576f726c64273b0a636f6e736f6c652e6c6f67286772656574696e67293b0a', '2021-03-17T08:59:08.136+00:00'),
('0-wus-d9-b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7', '1615971548136', 'meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'application/json', X'7b22617069456e64706f696e74223a202268747470733a2f2f6170692e6578616d706c652e636f6d222c202274696d656f7574223a20353030307d', '2021-03-17T08:59:08.137+00:00'),
('0-wus-d9-c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8', '1615971548136', 'meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'image/jpeg', X'ffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc00011080001000103012200021101031101ffc400150001010000000000000000000000000000000affc40014100100000000000000000000000000000000ffc4001501010100000000000000000000000000000005ffc40014110100000000000000000000000000000000ffda000c03010002110311003f00b0000f00ffd9', '2021-03-17T08:59:08.138+00:00'),
('0-wus-d2-46b19b2d146dba65b98f8bbbadb5c755', '1614618259349', 'meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'image/png', X'89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4890000000d4944415478da6364f8cf500f00038601805a347d6b0000000049454e44ae426082', '2021-03-01T17:04:19.349+00:00'),
('0-wus-d2-d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9', '1614618259349', 'meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'image/jpeg', X'ffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc00011080001000103012200021101031101ffc400150001010000000000000000000000000000000affc40014100100000000000000000000000000000000ffc4001501010100000000000000000000000000000005ffc40014110100000000000000000000000000000000ffda000c03010002110311003f00b0000f00ffd9', '2021-03-01T17:04:19.350+00:00'),
('0-wus-d2-e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0', '1614618259349', 'meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'text/markdown', X'232044657369676e204d6f636b75700a0a2323204f766572766965770a4e65772064617368626f6172642064657369676e20666f7220513220323032312e0a', '2021-03-01T17:04:19.351+00:00'),
('0-wus-d9-f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1', '1615971548136', 'meeting_NjQ2NmFjOWQtMjM3Yi00YmU1LWE4MjUtZmNlOTM0YzJmMmY1', 'application/sql', X'435245415445205441424c452075736572732028696420494e542c206e616d6520564152434841522831303029293b0a', '2021-03-17T08:59:08.139+00:00'),
('0-wus-d2-a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2', '1614618259349', 'meeting_OWE4MjNmOTYtNzBhNC00NzZhLWE5NDItM2Q1ZGE2NzI4NDVl', 'text/csv', X'6e616d652c656d61696c2c726f6c650a416c6963652c616c6963654074656368636f72702e636f6d2c4d616e616765720a426f622c626f624074656368636f72702e636f6d2c446576656c6f7065720a', '2021-03-01T17:04:19.352+00:00');

-- Virtual Event Webinars (Microsoft Graph API v1.0)
INSERT INTO virtual_event_webinars (org_id, id, display_name, description_content_type, description_content, start_date_time, start_time_zone, end_date_time, end_time_zone, audience, status, created_by_user_id, created_by_display_name, created_by_tenant_id, is_attendee_email_notification_enabled, external_event_information, created_at, updated_at) VALUES
('techcorp-001', 'a57082a9-7629-4f74-8da0-8d621aab4d2d@4aa05bcc-1cac-4a83-a9ae-0db84b88f4ba', 'The Impact of Tech on Our Lives', 'text', 'Discusses how technology has changed the way we communicate.', '2025-12-12T10:00:00+00:00', 'Pacific Standard Time', '2025-12-12T17:00:00+00:00', 'Pacific Standard Time', 'organization', 'draft', 'james.wilson', 'James Wilson', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 0, '[]', datetime('now'), datetime('now')),
('globalex-002', 'b68193ba-8730-5f85-9eb1-9e732bbc5c3e@5bb16cdd-2dbd-5b94-bbbf-1eb95ccd99g5ba', 'Future of Remote Work', 'html', '<p>Exploring the trends and tools shaping remote work in 2024 and beyond.</p>', '2025-12-19T14:00:00+00:00', 'UTC', '2025-12-19T16:30:00+00:00', 'UTC', 'everyone', 'draft', 'emma.wilson', 'Emma Wilson', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', 1, '[]', datetime('now'), datetime('now'));

-- Virtual Event Webinar CoOrganizers (display_name and tenant_id derived from relationships)
INSERT INTO virtual_event_webinar_coorganizers (org_id, webinar_id, user_id, added_at) VALUES
('techcorp-001', 'a57082a9-7629-4f74-8da0-8d621aab4d2d@4aa05bcc-1cac-4a83-a9ae-0db84b88f4ba', 'bob.smith', datetime('now')),
('techcorp-001', 'a57082a9-7629-4f74-8da0-8d621aab4d2d@4aa05bcc-1cac-4a83-a9ae-0db84b88f4ba', 'carol.white', datetime('now')),
('globalex-002', 'b68193ba-8730-5f85-9eb1-9e732bbc5c3e@5bb16cdd-2dbd-5b94-bbbf-1eb95ccd99g5ba', 'frank.chen', datetime('now'));

-- Virtual Event Townhalls (Microsoft Graph API v1.0)
INSERT INTO virtual_event_townhalls (org_id, id, display_name, description_content_type, description_content, start_date_time, start_time_zone, end_date_time, end_time_zone, audience, is_invite_only, status, created_by_user_id, created_by_display_name, created_by_tenant_id, is_attendee_email_notification_enabled, external_event_information, created_at, updated_at) VALUES
('techcorp-001', 'bce9a3ca-a310-48fa-baf3-1cedcd04bb3f@4aa05bcc-1cac-4a83-a9ae-0db84b88f4ba', 'Company All-Hands Meeting', 'text', 'Quarterly update and town hall for all employees', '2025-12-15T09:00:00+00:00', 'UTC', '2025-12-15T10:30:00+00:00', 'UTC', 'organization', 0, 'draft', 'james.wilson', 'James Wilson', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 1, '[]', datetime('now'), datetime('now')),
('globalex-002', 'c79204cb-b421-59gb-cac4-2defde05cc4g@6cc27dee-3ece-6c05-cccg-2fc06dde00h6cb', 'Executive Strategy Session', 'text', 'Q2 strategy planning for leadership team only', '2025-12-26T15:00:00+00:00', 'Pacific Standard Time', '2025-12-26T17:00:00+00:00', 'Pacific Standard Time', 'organization', 1, 'draft', 'emma.wilson', 'Emma Wilson', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', 0, '[]', datetime('now'), datetime('now'));

-- Virtual Event Townhall CoOrganizers (display_name and tenant_id derived from relationships)
INSERT INTO virtual_event_townhall_coorganizers (org_id, townhall_id, user_id, added_at) VALUES
('techcorp-001', 'bce9a3ca-a310-48fa-baf3-1cedcd04bb3f@4aa05bcc-1cac-4a83-a9ae-0db84b88f4ba', 'bob.smith', datetime('now')),
('globalex-002', 'c79204cb-b421-59gb-cac4-2defde05cc4g@6cc27dee-3ece-6c05-cccg-2fc06dde00h6cb', 'frank.chen', datetime('now'));

-- Virtual Event Townhall Invited Attendees (users and guests)
INSERT INTO virtual_event_townhall_invited_attendees (org_id, townhall_id, identity_id, identity_type, display_name, tenant_id, guest_email, added_at) VALUES
('globalex-002', 'c79204cb-b421-59gb-cac4-2defde05cc4g@6cc27dee-3ece-6c05-cccg-2fc06dde00h6cb', 'grace.kim', 'communicationsUserIdentity', 'Grace Kim', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', NULL, datetime('now')),
('globalex-002', 'c79204cb-b421-59gb-cac4-2defde05cc4g@6cc27dee-3ece-6c05-cccg-2fc06dde00h6cb', 'henry.lopez', 'communicationsUserIdentity', 'Henry Lopez', 'f9e8d7c6-b5a4-3210-9876-543210fedcba', NULL, datetime('now')),
('globalex-002', 'c79204cb-b421-59gb-cac4-2defde05cc4g@6cc27dee-3ece-6c05-cccg-2fc06dde00h6cb', 'consultant@external.com', 'communicationsGuestIdentity', '', NULL, 'consultant@external.com', datetime('now'));

-- Virtual Event Webinar Presenters (Microsoft Graph API v1.0)
-- Note: tenant_id is derived from webinar.org.tenant_id relationship
INSERT INTO virtual_event_webinar_presenters (org_id, webinar_id, presenter_id, identity_type, identity_id, email, display_name, guest_email, presenter_details_bio_content, presenter_details_bio_content_type, presenter_details_company, presenter_details_job_title, presenter_details_linkedin_profile_web_url, presenter_details_personal_site_web_url, presenter_details_twitter_profile_web_url, added_at) VALUES
('techcorp-001', 'a57082a9-7629-4f74-8da0-8d621aab4d2d@4aa05bcc-1cac-4a83-a9ae-0db84b88f4ba', '7b7e1acd-a3e0-4533-8c1d-c1a4ca0b2e2b', 'communicationsUserIdentity', 'carol.white', 'carol.white@techcorp.com', 'Carol White', NULL, 'Lead Product Manager of Contoso Sales department', 'text', 'Contoso', 'Product Manager', 'https://linkedin.com/in/DianeDemoss', 'https://DianeDemoss.com', NULL, datetime('now')),
('globalex-002', 'b68193ba-8730-5f85-9eb1-9e732bbc5c3e@5bb16cdd-2dbd-5b94-bbbf-1eb95ccd99g5ba', '184975c0-4096-4a02-b251-c48546691c42', 'communicationsGuestIdentity', 'guest.speaker@fabrikam.com', 'guest.speaker@fabrikam.com', 'Guest Speaker', 'guest.speaker@fabrikam.com', 'Industry expert with 15+ years in remote work solutions', 'text', 'Fabrikam Consulting', 'Senior Consultant', 'https://linkedin.com/in/guestspeaker', 'https://guestspeaker.fabrikam.com', 'https://twitter.com/guestspeaker', datetime('now'));

-- Virtual Event Townhall Presenters (Microsoft Graph API v1.0)
-- Note: tenant_id is derived from townhall.org.tenant_id relationship
INSERT INTO virtual_event_townhall_presenters (org_id, townhall_id, presenter_id, identity_type, identity_id, email, display_name, guest_email, added_at) VALUES
('techcorp-001', 'bce9a3ca-a310-48fa-baf3-1cedcd04bb3f@4aa05bcc-1cac-4a83-a9ae-0db84b88f4ba', '9c8f2bde-b4f1-5644-9d2e-d2b5db1c3f3c', 'communicationsUserIdentity', 'bob.smith', 'bob.smith@techcorp.com', 'Bob Smith', NULL, datetime('now')),
('globalex-002', 'c79204cb-b421-59gb-cac4-2defde05cc4g@6cc27dee-3ece-6c05-cccg-2fc06dde00h6cb', '2a9g86d1-5107-5b13-c362-d59657702d53', 'communicationsGuestIdentity', 'external.expert@partner.com', 'external.expert@partner.com', 'External Expert', 'external.expert@partner.com', datetime('now'));

-- Meeting Attendance Reports (Microsoft Graph API v1.0)
INSERT INTO meeting_attendance_reports (org_id, id, meeting_id, total_participant_count, meeting_start_date_time, meeting_end_date_time, external_event_information, created_at, updated_at) VALUES
('techcorp-001', '74c9cec7-59a0-4f4c-84c7-b0f5e3f2f1b5', 'MSo1N2Y5ZGFjYy03MWJmLTQ3NDMtYjQxMy01M2EdFGkdRWHJlQ', 5, '2025-12-03T10:00:00+00:00', '2025-12-03T11:00:00+00:00', NULL, datetime('now'), datetime('now')),
('techcorp-001', '85d0ded8-60b1-5g5d-95d8-c1g6f4g3g2c6', 'MSoxMjM0NTY3OC05MGFiLWNkZWYtZ2hpai1rbG1ub3BxcnN0dQ', 3, '2025-11-30T14:00:00+00:00', '2025-11-30T15:30:00+00:00', NULL, datetime('now'), datetime('now')),
('globalex-002', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'NTq2N3Y5ZGFjYy03MWJmLTQ3NDMtYjQxMy01M2V', 8, '2025-12-04T09:00:00+00:00', '2025-12-04T10:30:00+00:00', NULL, datetime('now'), datetime('now'));

-- Attendance Records (participant attendance data - tenant_id fetched from teams_orgs)
INSERT INTO attendance_records (org_id, id, report_id, email_address, identity_id, display_name, total_attendance_in_seconds, role, attendance_intervals, created_at, updated_at) VALUES
('techcorp-001', '6a9135a6-a9ed-4c4b-a983-6b61bb0fb291', '74c9cec7-59a0-4f4c-84c7-b0f5e3f2f1b5', 'alice.johnson@techcorp.com', 'dc17674c-81d9-4adb-bfb2-8f6a442e4623', 'Alice Johnson', 3600, 'Presenter', '[{"joinDateTime": "2025-12-03T10:00:00+00:00", "leaveDateTime": "2025-12-03T11:00:00+00:00", "durationInSeconds": 3600}]', datetime('now'), datetime('now')),
('techcorp-001', '53a79afe-daf2-438e-be1d-e5be44d52389', '74c9cec7-59a0-4f4c-84c7-b0f5e3f2f1b5', 'bob.smith@techcorp.com', 'ab28685d-92c0-5bec-cfg3-9g7b553f5734', 'Bob Smith', 3540, 'Attendee', '[{"joinDateTime": "2025-12-03T10:01:00+00:00", "leaveDateTime": "2025-12-03T11:00:00+00:00", "durationInSeconds": 3540}]', datetime('now'), datetime('now')),
('techcorp-001', '386bc570-a895-48da-b150-b24a2ab39767', '74c9cec7-59a0-4f4c-84c7-b0f5e3f2f1b5', 'carol.white@techcorp.com', 'bc39796e-03d1-6ced-dgh4-0h8c664g6845', 'Carol White', 2700, 'Attendee', '[{"joinDateTime": "2025-12-03T10:15:00+00:00", "leaveDateTime": "2025-12-03T11:00:00+00:00", "durationInSeconds": 2700}]', datetime('now'), datetime('now')),
('techcorp-001', '2b34fc69-40d7-4d77-8543-3fbd897a035c', '74c9cec7-59a0-4f4c-84c7-b0f5e3f2f1b5', 'david.brown@techcorp.com', 'cd40807f-14e2-7dee-ehi5-1i9d775h7956', 'David Brown', 1800, 'Attendee', '[{"joinDateTime": "2025-12-03T10:10:00+00:00", "leaveDateTime": "2025-12-03T10:25:00+00:00", "durationInSeconds": 900}, {"joinDateTime": "2025-12-03T10:30:00+00:00", "leaveDateTime": "2025-12-03T10:45:00+00:00", "durationInSeconds": 900}]', datetime('now'), datetime('now')),
('techcorp-001', '83959fbe-b108-4a5c-bd07-a321d1460b19', '74c9cec7-59a0-4f4c-84c7-b0f5e3f2f1b5', 'emma.davis@techcorp.com', 'de51918g-25f3-8eff-fij6-2j0e886i8067', 'Emma Davis', 3300, 'Attendee', '[{"joinDateTime": "2025-12-03T10:02:00+00:00", "leaveDateTime": "2025-12-03T10:57:00+00:00", "durationInSeconds": 3300}]', datetime('now'), datetime('now')),
('techcorp-001', '7a30f2af-1d1d-49c4-95b7-2e4a39ecf84f', '85d0ded8-60b1-5g5d-95d8-c1g6f4g3g2c6', 'alice.johnson@techcorp.com', 'dc17674c-81d9-4adb-bfb2-8f6a442e4623', 'Alice Johnson', 5400, 'Presenter', '[{"joinDateTime": "2025-11-30T14:00:00+00:00", "leaveDateTime": "2025-11-30T15:30:00+00:00", "durationInSeconds": 5400}]', datetime('now'), datetime('now')),
('techcorp-001', '016c6334-f466-4cf4-9999-9b4ff209223b', '85d0ded8-60b1-5g5d-95d8-c1g6f4g3g2c6', 'bob.smith@techcorp.com', 'ab28685d-92c0-5bec-cfg3-9g7b553f5734', 'Bob Smith', 5100, 'Attendee', '[{"joinDateTime": "2025-11-30T14:00:00+00:00", "leaveDateTime": "2025-11-30T15:25:00+00:00", "durationInSeconds": 5100}]', datetime('now'), datetime('now')),
('techcorp-001', 'f05322f4-029d-46c9-948f-ff1d52908eec', '85d0ded8-60b1-5g5d-95d8-c1g6f4g3g2c6', 'carol.white@techcorp.com', 'bc39796e-03d1-6ced-dgh4-0h8c664g6845', 'Carol White', 4800, 'Attendee', '[{"joinDateTime": "2025-11-30T14:05:00+00:00", "leaveDateTime": "2025-11-30T15:25:00+00:00", "durationInSeconds": 4800}]', datetime('now'), datetime('now')),
('globalex-002', '581f6451-fe74-4b77-ab40-a9c45a36dee3', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'emma.wilson@globalex.com', 'ed62029h-36g4-9fgg-gjk7-3k1f997j9178', 'Emma Wilson', 5400, 'Presenter', '[{"joinDateTime": "2025-12-04T09:00:00+00:00", "leaveDateTime": "2025-12-04T10:30:00+00:00", "durationInSeconds": 5400}]', datetime('now'), datetime('now')),
('globalex-002', '3ea4fd26-f757-4126-a573-a349cc763f92', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'frank.chen@globalex.com', 'fe73130i-47h5-0ghh-hkl8-4l2g008k0289', 'Frank Chen', 5280, 'Attendee', '[{"joinDateTime": "2025-12-04T09:01:00+00:00", "leaveDateTime": "2025-12-04T10:29:00+00:00", "durationInSeconds": 5280}]', datetime('now'), datetime('now')),
('globalex-002', '13dcade9-054a-4acf-be5f-83fa06c17281', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'grace.kim@globalex.com', 'gf84241j-58i6-1hii-ilm9-5m3h119l1390', 'Grace Kim', 5100, 'Attendee', '[{"joinDateTime": "2025-12-04T09:00:00+00:00", "leaveDateTime": "2025-12-04T10:25:00+00:00", "durationInSeconds": 5100}]', datetime('now'), datetime('now')),
('globalex-002', '25430feb-e3dc-42f8-ac7e-f9bf422bc3a4', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'henry.lopez@globalex.com', 'hg95352k-69j7-2ijj-jmn0-6n4i220m2401', 'Henry Lopez', 4500, 'Attendee', '[{"joinDateTime": "2025-12-04T09:10:00+00:00", "leaveDateTime": "2025-12-04T10:25:00+00:00", "durationInSeconds": 4500}]', datetime('now'), datetime('now')),
('globalex-002', '0be3e201-1986-4a0c-82cb-d05471871fdb', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'isabel.martinez@globalex.com', 'ih06463l-70k8-3jkk-kno1-7o5j331n3512', 'Isabel Martinez', 3900, 'Attendee', '[{"joinDateTime": "2025-12-04T09:15:00+00:00", "leaveDateTime": "2025-12-04T10:20:00+00:00", "durationInSeconds": 3900}]', datetime('now'), datetime('now')),
('globalex-002', '202e28f7-4622-4245-a8d1-8b86e72386ec', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'john.anderson@globalex.com', 'ji17574m-81l9-4kll-lop2-8p6k442o4623', 'John Anderson', 5400, 'Attendee', '[{"joinDateTime": "2025-12-04T09:00:00+00:00", "leaveDateTime": "2025-12-04T10:30:00+00:00", "durationInSeconds": 5400}]', datetime('now'), datetime('now')),
('globalex-002', '08af0eae-e99a-4a23-bc5d-0b6af3b34226', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'karen.taylor@globalex.com', 'kj28685n-92m0-5lmm-mpq3-9q7l553p5734', 'Karen Taylor', 4200, 'Attendee', '[{"joinDateTime": "2025-12-04T09:05:00+00:00", "leaveDateTime": "2025-12-04T10:15:00+00:00", "durationInSeconds": 4200}]', datetime('now'), datetime('now')),
('globalex-002', '1c281058-3a81-4f00-934d-fb60f0d00fd7', '96e1fef9-71c2-6h6e-a6e9-d2h7g5h4h3d7', 'laura.white@globalex.com', 'lk39796o-03n1-6mnn-nqr4-0r8m664q6845', 'Laura White', 5100, 'Attendee', '[{"joinDateTime": "2025-12-04T09:00:00+00:00", "leaveDateTime": "2025-12-04T10:25:00+00:00", "durationInSeconds": 5100}]', datetime('now'), datetime('now'));

-- Complete Teams Database Summary
-- 2 organizations created (TechCorp + GlobalEx)
-- 7 team templates created (system-wide)
-- 6 Microsoft 365 groups created
-- 21 teams_users created
-- 7 chats created
-- 14 Teams apps added to catalog
-- 15 chat memberships created
-- 2 pinned chat messages created
-- 4 participants created
-- 4 call records created
-- 4 PSTN call logs created (stored in call_records with log_type='pstn')
-- 6 Direct Routing call logs created (stored in call_records with log_type='direct_routing')
-- 10 chat message hosted contents created
-- 2 virtual event webinars created
-- 3 webinar coorganizers created
-- 2 virtual event townhalls created
-- 2 townhall coorganizers created
-- 3 townhall invited attendees created
-- 2 webinar presenters created
-- 2 townhall presenters created
-- All data uses teams_orgs, teams_users, teams_apps, teams, and channels schema
-- Teams Management API fully integrated with Microsoft Graph API compliance
-- Pinned Chat Messages API fully integrated with Microsoft Graph API compliance
-- Shared Channels API fully integrated with Microsoft Graph API compliance
-- Virtual Events Webinar API fully integrated with Microsoft Graph API compliance
-- 4 teams created
-- 9 channels created (0 shared + 9 standard/private)
-- 40 channel memberships created
-- 11 sharedWithChannelTeamInfo relationships created
-- 6 channel files folders created


-- ============================================
-- End of Seed Data
-- ============================================

-- ============================================
-- Agent Identity Patch (cross-MCP consistent identities)
-- ============================================
-- IT 服务台一线工程师
UPDATE teams_users
SET display_name='Ivan Park', given_name='Ivan', surname='Park', user_principal_name='ivan.park@techcorp.com', mail='ivan.park@techcorp.com', mail_nickname='ivan.park', static_token='AGT_IT_L1_TOKEN_V1'
WHERE user_id='mike.thompson';

-- IT 问题/变更处理工程师
UPDATE teams_users
SET display_name='Nina Patel', given_name='Nina', surname='Patel', user_principal_name='nina.patel@techcorp.com', mail='nina.patel@techcorp.com', mail_nickname='nina.patel', static_token='AGT_IT_CHG_TOKEN_V1'
WHERE user_id='nathan.richards';

-- HR 服务专员
UPDATE teams_users
SET display_name='Helen Zhou', given_name='Helen', surname='Zhou', user_principal_name='helen.zhou@techcorp.com', mail='helen.zhou@techcorp.com', mail_nickname='helen.zhou', static_token='AGT_HR_SRVC_TOKEN_V1'
WHERE user_id='sarah.martinez';

-- 客户支持专员（CSM Case Agent）
UPDATE teams_users
SET display_name='Carlos Mendez', given_name='Carlos', surname='Mendez', user_principal_name='carlos.mendez@techcorp.com', mail='carlos.mendez@techcorp.com', mail_nickname='carlos.mendez', static_token='AGT_CSM_SUP_TOKEN_V1'
WHERE user_id='henry.lopez';

-- 知识库维护专员（跨 ITSM/HR/CSM）
UPDATE teams_users
SET display_name='Priya Nair', given_name='Priya', surname='Nair', user_principal_name='priya.nair@techcorp.com', mail='priya.nair@techcorp.com', mail_nickname='priya.nair', static_token='AGT_KB_SPEC_TOKEN_V1'
WHERE user_id='alice.johnson';

-- 协作运营专员（会议/邮件/文档/团队空间）
UPDATE teams_users
SET display_name='Olivia Chen', given_name='Olivia', surname='Chen', user_principal_name='olivia.chen@techcorp.com', mail='olivia.chen@techcorp.com', mail_nickname='olivia.chen', static_token='AGT_COLLAB_OPS_TOKEN_V1'
WHERE user_id='sophia.bennett';

-- 开发工程师（基层）
UPDATE teams_users
SET display_name='Ethan Walker', given_name='Ethan', surname='Walker', user_principal_name='ethan.walker@techcorp.com', mail='ethan.walker@techcorp.com', mail_nickname='ethan.walker', static_token='AGT_DEV_ENG_TOKEN_V1'
WHERE user_id='bob.smith';

-- QA/测试工程师（基层）
UPDATE teams_users
SET display_name='Mia Kim', given_name='Mia', surname='Kim', user_principal_name='mia.kim@techcorp.com', mail='mia.kim@techcorp.com', mail_nickname='mia.kim', job_title='QA/Test Engineer', about_me='QA engineer focused on test planning, regression coverage, and release quality.', static_token='AGT_QA_ENG_TOKEN_V1'
WHERE user_id='john.davis';

-- Role text adjustment to align with QA identity in this seed
UPDATE teams_user_roles
SET role_description='QA/Test Engineer - Regular user focused on test execution and quality validation'
WHERE org_id='techcorp-001' AND user_id='john.davis';
