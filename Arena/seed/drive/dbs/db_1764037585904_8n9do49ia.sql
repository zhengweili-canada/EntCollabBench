-- Database Seed Data for: 4GDIP_BRIGHT
-- Database ID: db_1764037585904_8n9do49ia
-- MCP Server: GOOGLE_DRIVE_INTERNAL_PROD
-- Created: 2025-11-25 02:26:35.677373+00:00
-- Description: 4GDIP_BRIGHT
-- NOTE: This is seed data fallback (export-sql API was unavailable)

-- ============================================
-- SEED DATA (SQL Statements)
-- ============================================

-- Sample Insert Queries for Drive Schema

-- Users table
INSERT INTO users (id, display_name, email, photo_url, auth_token, created_time, kind, permission_id, me) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P7W', 'John Smith', 'john.smith@company.com', 'https://example.com/photos/john.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA3VyIsImVtYWlsIjoiam9obi5zbWl0aEBjb21wYW55LmNvbSIsIm5hbWUiOiJKb2huIFNtaXRoIiwiaWF0IjoxNzA1MzI0NjAwLCJleHAiOjE3MzY4NjA2MDB9.8K2vQx9mN7pL3sR6tY1uI4oP5aE8wC2bV9nM6xZ3kS', '2024-01-15 10:30:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P7W', false),
('01JBQM3K8TGHZX9RNVQM5Y2P7X', 'Sarah Johnson', 'sarah.johnson@company.com', 'https://example.com/photos/sarah.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA3WCIsImVtYWlsIjoic2FyYWguan9obnNvbkBjb21wYW55LmNvbSIsIm5hbWUiOiJTYXJhaCBKb2huc29uIiwiaWF0IjoxNzA1MzI0NjAwLCJleHAiOjE3MzY4NjA2MDB9.2L9wR5nM8qP4sT7uY3vI6oQ9aF1xE5cW2bV0nN7yZ4kU', '2024-01-16 09:15:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P7X', false),
('01JBQM3K8TGHZX9RNVQM5Y2P7Y', 'Mike Chen', 'mike.chen@company.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA3WSIsImVtYWlsIjoibWlrZS5jaGVuQGNvbXBhbnkuY29tIiwibmFtZSI6Ik1pa2UgQ2hlbiIsImlhdCI6MTcwNTMyNDYwMCwiZXhwIjoxNzM2ODYwNjAwfQ.5M3xS8oN1qR6vU4wY9zI7pQ2aG5xE8cX3bW1nN0yZ6kA', '2024-01-17 14:45:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P7Y', true),
('01JBQM3K8TGHZX9RNVQM5Y2P7Z', 'Emily Davis', 'emily.davis@company.com', 'https://example.com/photos/emily.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA3WiIsImVtYWlsIjoiZW1pbHkuZGF2aXNAY29tcGFueS5jb20iLCJuYW1lIjoiRW1pbHkgRGF2aXMiLCJpYXQiOjE3MDUzMjQ2MDAsImV4cCI6MTczNjg2MDYwMH0.7N5yT0pQ3rS9wX6zA2vI8qU1bH4xE0cY5bZ3nN2yZ9kD', '2024-01-18 11:20:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P7Z', false),
('01JBQM3K8TGHZX9RNVQM5Y2P80', 'Alex Rodriguez', 'alex.rodriguez@company.com', 'https://example.com/photos/alex.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MCIsImVtYWlsIjoiYWxleC5yb2RyaWd1ZXpAY29tcGFueS5jb20iLCJuYW1lIjoiQWxleCBSb2RyaWd1ZXoiLCJpYXQiOjE3MDUzMjQ2MDAsImV4cCI6MTczNjg2MDYwMH0.9P7zU2qR5sT0xY8zB4wI1rV3cH6xE2cA7bZ5nN4yZ1kF', '2024-01-19 08:30:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P80', false),
('01JBQM3K8TGHZX9RNVQM5Y2P81A', 'External Partner User', 'external.user@partner.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MUEiLCJlbWFpbCI6ImV4dGVybmFsLnVzZXJAcGFydG5lci5jb20iLCJuYW1lIjoiRXh0ZXJuYWwgUGFydG5lciBVc2VyIiwiaWF0IjoxNzA1MzI0NjAwLCJleHAiOjE3MzY4NjA2MDB9.1A2bC3dE4fG5hI6jK7lM8nO9pQ0rS', '2024-01-20 09:00:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P81A', false),
('01JBQM3K8TGHZX9RNVQM5Y2P81B', 'Customer Client', 'client@customer.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MUIiLCJlbWFpbCI6ImNsaWVudEBjdXN0b21lci5jb20iLCJuYW1lIjoiQ3VzdG9tZXIgQ2xpZW50IiwiaWF0IjoxNzA1MzI0NjAwLCJleHAiOjE3MzY4NjA2MDB9.2B3cD4eF5gH6iJ7kL8mN9oP0qR1sT', '2024-01-20 09:15:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P81B', false),
('01JBQM3K8TGHZX9RNVQM5Y2P81C', 'External Contractor', 'contractor@external.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MUMiLCJlbWFpbCI6ImNvbnRyYWN0b3JAZXh0ZXJuYWwuY29tIiwibmFtZSI6IkV4dGVybmFsIENvbnRyYWN0b3IiLCJpYXQiOjE3MDUzMjQ2MDAsImV4cCI6MTczNjg2MDYwMH0.3C4dE5fF6gH7iJ8kL9mN0oP1qR2sT', '2024-01-20 09:30:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P81C', false),
('01JBQM3K8TGHZX9RNVQM5Y2P81D', 'Vendor Supplier', 'vendor@supplier.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MUQiLCJlbWFpbCI6InZlbmRvckBzdXBwbGllci5jb20iLCJuYW1lIjoiVmVuZG9yIFN1cHBsaWVyIiwiaWF0IjoxNzA1MzI0NjAwLCJleHAiOjE3MzY4NjA2MDB9.4D5eF6gG7hI8jK9lM0nN1oP2qR3sT', '2024-01-20 09:45:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P81D', false),
('01JBQM3K8TGHZX9RNVQM5Y2P81E', 'Company Intern', 'intern@company.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MUUiLCJlbWFpbCI6ImludGVybkBjb21wYW55LmNvbSIsIm5hbWUiOiJDb21wYW55IEludGVybiIsImlhdCI6MTcwNTMyNDYwMCwiZXhwIjoxNzM2ODYwNjAwfQ.5E6fF7gH8hI9jK0lM1nN2oP3qR4sT', '2024-01-20 10:00:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P81E', false),
('01JBQM3K8TGHZX9RNVQM5Y2P81F', 'External Consultant', 'consultant@external.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MUYiLCJlbWFpbCI6ImNvbnN1bHRhbnRAZXh0ZXJuYWwuY29tIiwibmFtZSI6IkV4dGVybmFsIENvbnN1bHRhbnQiLCJpYXQiOjE3MDUzMjQ2MDAsImV4cCI6MTczNjg2MDYwMH0.6F7gG8hH9iJ0kL1mM2nN3oP4qR5sT', '2024-01-20 10:15:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P81F', false),
('01JBQM3K8TGHZX9RNVQM5Y2P81G', 'External Auditor', 'auditor@external.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MUciLCJlbWFpbCI6ImF1ZGl0b3JAZXh0ZXJuYWwuY29tIiwibmFtZSI6IkV4dGVybmFsIEF1ZGl0b3IiLCJpYXQiOjE3MDUzMjQ2MDAsImV4cCI6MTczNjg2MDYwMH0.7G8hH9iI0jK1lL2mM3nN4oP5qR6sT', '2024-01-20 10:30:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P81G', false),
('01JBQM3K8TGHZX9RNVQM5Y2P81H', 'Partner Collaborator', 'partner@collaborator.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMUpCUU0zSzhUR0haWDlSTlZRTTVZMlA4MUgiLCJlbWFpbCI6InBhcnRuZXJAY29sbGFib3JhdG9yLmNvbSIsIm5hbWUiOiJQYXJ0bmVyIENvbGxhYm9yYXRvciIsImlhdCI6MTcwNTMyNDYwMCwiZXhwIjoxNzM2ODYwNjAwfQ.8H9iI0jJ1kL2mL3nM4oN5pP6qR7sT', '2024-01-20 10:45:00', 'drive#user', 'perm_01JBQM3K8TGHZX9RNVQM5Y2P81H', false);

-- Groups table
INSERT INTO groups (id, name, email, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P81', 'Engineering Team', 'engineering@company.com', '2024-01-15 12:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P82', 'Marketing Team', 'marketing@company.com', '2024-01-16 13:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P83', 'HR Department', 'hr@company.com', '2024-01-17 10:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P84', 'Finance Team', 'finance@company.com', '2024-01-18 16:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P85', 'Project Managers', 'pm@company.com', '2024-01-19 09:20:00');

-- Group Memberships table
INSERT INTO group_memberships (id, group_id, user_id, role, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P86', '01JBQM3K8TGHZX9RNVQM5Y2P81', '01JBQM3K8TGHZX9RNVQM5Y2P7W', 'owner', '2024-01-15 12:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P87', '01JBQM3K8TGHZX9RNVQM5Y2P81', '01JBQM3K8TGHZX9RNVQM5Y2P7Y', 'member', '2024-01-16 10:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P88', '01JBQM3K8TGHZX9RNVQM5Y2P82', '01JBQM3K8TGHZX9RNVQM5Y2P7X', 'manager', '2024-01-17 14:20:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P89', '01JBQM3K8TGHZX9RNVQM5Y2P83', '01JBQM3K8TGHZX9RNVQM5Y2P7Z', 'owner', '2024-01-18 11:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8A', '01JBQM3K8TGHZX9RNVQM5Y2P84', '01JBQM3K8TGHZX9RNVQM5Y2P80', 'member', '2024-01-19 08:50:00');

-- Drives table
INSERT INTO drives (
    id, name, color_rgb, theme_id, background_image_link, hidden, restricted_to_domain,
    trashed, created_time, modified_time, copy_requires_writer_permission,
    domain_users_only, drive_members_only, admin_managed_restrictions,
    sharing_folders_requires_organizer_permission, download_restricted_for_readers,
    download_restricted_for_writers, org_unit_id, kind
) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P8B', 'Engineering Projects', '#4285F4', NULL, NULL, false, true, false, '2024-01-15 13:00:00', '2024-01-20 15:30:00', false, false, false, false, false, false, false, NULL, 'drive#drive'),
('01JBQM3K8TGHZX9RNVQM5Y2P8C', 'Marketing Resources', '#EA4335', NULL, NULL, false, false, false, '2024-01-16 14:15:00', '2024-01-21 10:20:00', false, false, false, false, false, false, false, NULL, 'drive#drive'),
('01JBQM3K8TGHZX9RNVQM5Y2P8D', 'HR Documents', '#34A853', NULL, NULL, true, true, false, '2024-01-17 11:30:00', '2024-01-22 09:45:00', true, false, false, false, false, false, false, NULL, 'drive#drive'),
('01JBQM3K8TGHZX9RNVQM5Y2P8E', 'Financial Reports', '#FBBC04', NULL, NULL, false, true, false, '2024-01-18 16:20:00', '2024-01-23 14:10:00', false, false, false, false, false, false, false, NULL, 'drive#drive'),
('01JBQM3K8TGHZX9RNVQM5Y2P8F', 'Archive Drive', '#9AA0A6', NULL, NULL, false, false, true, '2024-01-19 12:45:00', '2024-01-24 11:30:00', false, false, false, false, false, false, false, NULL, 'drive#drive');

-- Drive Memberships table
INSERT INTO drive_memberships (id, drive_id, type, user_id, group_id, domain, role, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P8G', '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7W', NULL, NULL, 'organizer', '2024-01-15 13:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8H', '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'group', NULL, '01JBQM3K8TGHZX9RNVQM5Y2P81', NULL, 'writer', '2024-01-16 09:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8I', '01JBQM3K8TGHZX9RNVQM5Y2P8C', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7X', NULL, NULL, 'organizer', '2024-01-17 15:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8J', '01JBQM3K8TGHZX9RNVQM5Y2P8D', 'domain', NULL, NULL, 'company.com', 'reader', '2024-01-18 12:20:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8K', '01JBQM3K8TGHZX9RNVQM5Y2P8E', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P80', NULL, NULL, 'fileOrganizer', '2024-01-19 10:15:00'),
-- Additional drive memberships to fix access gaps
('01JBQM3K8TGHZX9RNVQM5Y2P8L', '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P80', NULL, NULL, 'reader', '2024-01-24 08:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8M', '01JBQM3K8TGHZX9RNVQM5Y2P8C', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7W', NULL, NULL, 'reader', '2024-01-22 11:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8N', '01JBQM3K8TGHZX9RNVQM5Y2P8D', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7W', NULL, NULL, 'reader', '2024-01-23 15:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8O', '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7Y', NULL, NULL, 'writer', '2024-01-20 10:00:00');

-- Blobs table
INSERT INTO blobs (id, digest, size_bytes, storage, key, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P8L', 'sha256:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 1024000, 'S3', 'blobs/2024/01/15/document1.pdf', '2024-01-15 14:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8M', 'sha256:a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2048000, 'S3', 'blobs/2024/01/16/presentation.pptx', '2024-01-16 11:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8N', 'sha256:2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae', 512000, 'GCS', 'blobs/2024/01/17/spreadsheet.xlsx', '2024-01-17 09:20:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8O', 'sha256:fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9', 3072000, 'S3', 'blobs/2024/01/18/video.mp4', '2024-01-18 16:10:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P8P', 'sha256:bef57ec7f53a6d40beb640a780a639c83bc29ac8a9816f1fc6c5c6dcd93c4721', 256000, 'DB', 'blobs/2024/01/19/image.jpg', '2024-01-19 13:25:00');

-- Files table
INSERT INTO files (id, drive_id, name, mime_type, size_bytes, md5_checksum, parent_id, parent_ids, starred, trashed, trashed_time, created_by, modified_by, created_time, modified_time, viewed_by_me_time, properties, is_shortcut, shortcut_target_id, shortcut_target_mime, kind, space, file_extension, full_file_extension, original_filename, web_view_link, web_content_link, thumbnail_link, icon_link, shared, owned_by_me, viewed_by_me, modified_by_me, explicitly_trashed, writers_can_share, version, head_revision_id, sha1_checksum, quota_bytes_used) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P8Q', '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'Project Documents', 'application/vnd.google-apps.folder', 0, NULL, NULL, '[]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7W', '01JBQM3K8TGHZX9RNVQM5Y2P7W', '2024-01-15 15:00:00', '2024-01-20 10:30:00', '2024-01-25 09:15:00', '{"color": "blue"}', false, NULL, NULL, 'drive#file', 'drive', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/01JBQM3K8TGHZX9RNVQM5Y2P8Q', NULL, NULL, 'https://ssl.gstatic.com/docs/doclist/images/icon_11_collection_list.png', true, true, true, false, false, true, 1, '01JBQM3K8TGHZX9RNVQM5Y2P8V', NULL, 0),
('01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'Technical Spec.pdf', 'application/pdf', 1024000, 'e3b0c44298fc1c149afbf4c8996fb924', '01JBQM3K8TGHZX9RNVQM5Y2P8Q', '["01JBQM3K8TGHZX9RNVQM5Y2P8Q"]', true, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7W', '01JBQM3K8TGHZX9RNVQM5Y2P7Y', '2024-01-15 15:15:00', '2024-01-22 14:20:00', '2024-01-26 11:30:00', '{"version": "1.2"}', false, NULL, NULL, 'drive#file', 'drive', 'pdf', 'pdf', 'Technical_Specifications_v1.pdf', 'https://drive.google.com/file/d/01JBQM3K8TGHZX9RNVQM5Y2P8R/view', 'https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2P8R', 'https://drive-thirdparty.googleusercontent.com/128/type/application/pdf', 'https://ssl.gstatic.com/docs/doclist/images/icon_12_pdf_list.png', true, true, true, true, false, true, 2, '01JBQM3K8TGHZX9RNVQM5Y2P8W', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 1024000),
('01JBQM3K8TGHZX9RNVQM5Y2P8S', '01JBQM3K8TGHZX9RNVQM5Y2P8C', 'Marketing Presentation', 'application/vnd.google-apps.presentation', 0, NULL, NULL, '[]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7X', '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-16 12:30:00', '2024-01-21 16:45:00', '2024-01-27 08:20:00', '{"template": "modern"}', false, NULL, NULL, 'drive#file', 'drive', NULL, NULL, NULL, 'https://docs.google.com/presentation/d/01JBQM3K8TGHZX9RNVQM5Y2P8S/edit', NULL, NULL, 'https://ssl.gstatic.com/docs/doclist/images/icon_11_presentation_list.png', true, true, true, true, false, true, 2, '01JBQM3K8TGHZX9RNVQM5Y2P8Y', NULL, 0),
('01JBQM3K8TGHZX9RNVQM5Y2P8T', '01JBQM3K8TGHZX9RNVQM5Y2P8D', 'Employee Handbook.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 512000, '2c26b46b68ffc68ff99b453c1d304134', NULL, '[]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7Z', '01JBQM3K8TGHZX9RNVQM5Y2P7Z', '2024-01-17 10:45:00', '2024-01-23 13:15:00', NULL, '{"confidential": true}', false, NULL, NULL, 'drive#file', 'drive', 'docx', 'docx', 'Employee_Handbook_v1.docx', 'https://drive.google.com/file/d/01JBQM3K8TGHZX9RNVQM5Y2P8T/view', 'https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2P8T', NULL, 'https://ssl.gstatic.com/docs/doclist/images/icon_12_word_list.png', false, true, false, true, false, false, 1, '01JBQM3K8TGHZX9RNVQM5Y2P8Z', '356a192b7913b04c54574d18c28d46e6395428ab', 512000),
('01JBQM3K8TGHZX9RNVQM5Y2P8U', '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'Shortcut to Marketing Presentation', 'application/vnd.google-apps.shortcut', 0, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P8Q', '["01JBQM3K8TGHZX9RNVQM5Y2P8Q"]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7W', '01JBQM3K8TGHZX9RNVQM5Y2P7W', '2024-01-18 09:30:00', '2024-01-18 09:30:00', '2024-01-24 15:45:00', NULL, true, '01JBQM3K8TGHZX9RNVQM5Y2P8S', 'application/vnd.google-apps.presentation', 'drive#file', 'drive', NULL, NULL, NULL, 'https://drive.google.com/file/d/01JBQM3K8TGHZX9RNVQM5Y2P8U/view', NULL, NULL, 'https://ssl.gstatic.com/docs/doclist/images/icon_11_presentation_list.png', false, true, true, false, false, true, 1, NULL, NULL, 0),
('01JBQM3K8TGHZX9RNVQM5Y2F91', '01JBQM3K8TGHZX9RNVQM5Y2P8C', 'Q1_Campaign_Strategy.pdf', 'application/pdf', 245760, NULL, NULL, '[]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7X', '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-21 11:10:00', '2024-01-21 11:10:00', NULL, NULL, false, NULL, NULL, 'drive#file', 'drive', 'pdf', 'pdf', 'Q1_Campaign_Strategy.pdf', 'https://drive.google.com/file/d/01JBQM3K8TGHZX9RNVQM5Y2F91/view', 'https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2F91', 'https://drive-thirdparty.googleusercontent.com/128/type/application/pdf', 'https://ssl.gstatic.com/docs/doclist/images/icon_12_pdf_list.png', true, false, false, false, false, true, 1, NULL, NULL, 245760),
('01JBQM3K8TGHZX9RNVQM5Y2F92', '01JBQM3K8TGHZX9RNVQM5Y2P8C', 'Social_Media_Banner.png', 'image/png', 512000, NULL, NULL, '[]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7X', '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-21 11:20:00', '2024-01-21 11:20:00', NULL, NULL, false, NULL, NULL, 'drive#file', 'drive', 'png', 'png', 'Social_Media_Banner.png', 'https://drive.google.com/file/d/01JBQM3K8TGHZX9RNVQM5Y2F92/view', 'https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2F92', 'https://drive-thirdparty.googleusercontent.com/128/type/image/png', 'https://ssl.gstatic.com/docs/doclist/images/icon_10_image_list.png', true, false, false, false, false, true, 1, NULL, NULL, 512000),
('01JBQM3K8TGHZX9RNVQM5Y2F93', '01JBQM3K8TGHZX9RNVQM5Y2P8C', 'Marketing_Calendar_2024.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 98304, NULL, NULL, '[]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7X', '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-21 11:30:00', '2024-01-21 11:30:00', NULL, NULL, false, NULL, NULL, 'drive#file', 'drive', 'xlsx', 'xlsx', 'Marketing_Calendar_2024.xlsx', 'https://drive.google.com/file/d/01JBQM3K8TGHZX9RNVQM5Y2F93/view', 'https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2F93', 'https://drive-thirdparty.googleusercontent.com/128/type/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'https://ssl.gstatic.com/docs/doclist/images/icon_12_spreadsheet_list.png', true, false, false, false, false, true, 1, NULL, NULL, 98304),
('01JBQM3K8TGHZX9RNVQM5Y2F94', '01JBQM3K8TGHZX9RNVQM5Y2P8C', 'Product_Overview.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 131072, NULL, NULL, '[]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7X', '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-21 11:40:00', '2024-01-21 11:40:00', NULL, NULL, false, NULL, NULL, 'drive#file', 'drive', 'docx', 'docx', 'Product_Overview.docx', 'https://drive.google.com/file/d/01JBQM3K8TGHZX9RNVQM5Y2F94/view', 'https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2F94', 'https://drive-thirdparty.googleusercontent.com/128/type/application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'https://ssl.gstatic.com/docs/doclist/images/icon_12_word_list.png', true, false, false, false, false, true, 1, NULL, NULL, 131072),
('01JBQM3K8TGHZX9RNVQM5Y2F95', '01JBQM3K8TGHZX9RNVQM5Y2P8C', 'Promo_Video_Draft.mp4', 'video/mp4', 52428800, NULL, NULL, '[]', false, false, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7X', '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-21 11:55:00', '2024-01-21 11:55:00', NULL, NULL, false, NULL, NULL, 'drive#file', 'drive', 'mp4', 'mp4', 'Promo_Video_Draft.mp4', 'https://drive.google.com/file/d/01JBQM3K8TGHZX9RNVQM5Y2F95/view', 'https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2F95', 'https://drive-thirdparty.googleusercontent.com/128/type/video/mp4', 'https://ssl.gstatic.com/docs/doclist/images/icon_11_video_list.png', true, false, false, false, false, true, 1, NULL, NULL, 52428800);
-- Revisions table
INSERT INTO revisions (id, file_id, revision_number, blob_id, md5_checksum, size_bytes, mime_type, keep_forever, published, published_link, created_time, modified_time, properties, last_modifying_user_id, kind, publish_auto, published_outside_domain, original_filename, export_links) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P8V', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 1, '01JBQM3K8TGHZX9RNVQM5Y2P8L', 'e3b0c44298fc1c149afbf4c8996fb924', 1024000, 'application/pdf', false, false, NULL, '2024-01-15 15:15:00', '2024-01-15 15:15:00', '{"draft": true}', '01JBQM3K8TGHZX9RNVQM5Y2P7W', 'drive#revision', false, false, 'Technical_Specifications_v1.pdf', '{"application/pdf": "https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2P8V&export=pdf", "text/plain": "https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2P8V&export=txt"}'),
('01JBQM3K8TGHZX9RNVQM5Y2P8W', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 2, '01JBQM3K8TGHZX9RNVQM5Y2P8L', 'e3b0c44298fc1c149afbf4c8996fb924', 1024000, 'application/pdf', true, false, NULL, '2024-01-22 14:20:00', '2024-01-22 14:20:00', '{"approved": true}', '01JBQM3K8TGHZX9RNVQM5Y2P7Y', 'drive#revision', true, false, 'Technical_Specifications_v2.pdf', '{"application/pdf": "https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2P8W&export=pdf", "text/plain": "https://drive.google.com/uc?id=01JBQM3K8TGHZX9RNVQM5Y2P8W&export=txt"}'),
('01JBQM3K8TGHZX9RNVQM5Y2P8X', '01JBQM3K8TGHZX9RNVQM5Y2P8S', 1, NULL, NULL, 0, 'application/vnd.google-apps.presentation', false, false, NULL, '2024-01-16 12:30:00', '2024-01-16 12:30:00', '{"slides": 15}', '01JBQM3K8TGHZX9RNVQM5Y2P7X', 'drive#revision', false, false, 'Marketing_Presentation_v1.pptx', '{"application/vnd.openxmlformats-officedocument.presentationml.presentation": "https://docs.google.com/presentation/d/01JBQM3K8TGHZX9RNVQM5Y2P8X/export/pptx", "application/pdf": "https://docs.google.com/presentation/d/01JBQM3K8TGHZX9RNVQM5Y2P8X/export/pdf"}'),
('01JBQM3K8TGHZX9RNVQM5Y2P8Y', '01JBQM3K8TGHZX9RNVQM5Y2P8S', 2, NULL, NULL, 0, 'application/vnd.google-apps.presentation', false, true, 'https://docs.google.com/presentation/d/published', '2024-01-21 16:45:00', '2024-01-21 16:45:00', '{"slides": 18}', '01JBQM3K8TGHZX9RNVQM5Y2P7X', 'drive#revision', true, true, 'Marketing_Presentation_v2.pptx', '{"application/vnd.openxmlformats-officedocument.presentationml.presentation": "https://docs.google.com/presentation/d/01JBQM3K8TGHZX9RNVQM5Y2P8Y/export/pptx", "application/pdf": "https://docs.google.com/presentation/d/01JBQM3K8TGHZX9RNVQM5Y2P8Y/export/pdf"}'),
('01JBQM3K8TGHZX9RNVQM5Y2P8Z', '01JBQM3K8TGHZX9RNVQM5Y2P8T', 1, '01JBQM3K8TGHZX9RNVQM5Y2P8N', '2c26b46b68ffc68ff99b453c1d304134', 512000, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', true, false, NULL, '2024-01-17 10:45:00', '2024-01-17 10:45:00', '{"pages": 42}', '01JBQM3K8TGHZX9RNVQM5Y2P7Z', 'drive#revision', false, false, 'Employee_Handbook_v1.docx', '{"application/vnd.openxmlformats-officedocument.wordprocessingml.document": "https://docs.google.com/document/d/01JBQM3K8TGHZX9RNVQM5Y2P8Z/export/docx", "application/pdf": "https://docs.google.com/document/d/01JBQM3K8TGHZX9RNVQM5Y2P8Z/export/pdf", "text/plain": "https://docs.google.com/document/d/01JBQM3K8TGHZX9RNVQM5Y2P8Z/export/txt"}');

-- Permissions table
INSERT INTO permissions (id, file_id, drive_id, role, type, user_id, group_id, email_address, domain, allow_file_discovery, kind, deleted, view, inherited, inherited_from, created_time, updated_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P90', '01JBQM3K8TGHZX9RNVQM5Y2P8R', NULL, 'owner', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7W', NULL, NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-15 15:15:00', '2024-01-15 15:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P91', '01JBQM3K8TGHZX9RNVQM5Y2P8R', NULL, 'writer', 'group', NULL, '01JBQM3K8TGHZX9RNVQM5Y2P81', NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-16 10:30:00', '2024-01-16 10:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P92', '01JBQM3K8TGHZX9RNVQM5Y2P8S', NULL, 'reader', 'domain', NULL, NULL, NULL, 'company.com', true, 'drive#permission', false, 'published', false, NULL, '2024-01-17 11:15:00', '2024-01-17 11:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P93', '01JBQM3K8TGHZX9RNVQM5Y2P8T', NULL, 'commenter', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7X', NULL, NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-18 14:45:00', '2024-01-20 09:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P94', NULL, '01JBQM3K8TGHZX9RNVQM5Y2P8E', 'reader', 'anyone', NULL, NULL, NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-19 16:20:00', '2024-01-19 16:20:00'),
-- Additional permissions to fix gaps
('01JBQM3K8TGHZX9RNVQM5Y2P95', '01JBQM3K8TGHZX9RNVQM5Y2P8R', NULL, 'commenter', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P80', NULL, NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-24 08:30:00', '2024-01-24 08:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P96', '01JBQM3K8TGHZX9RNVQM5Y2P8S', NULL, 'commenter', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7W', NULL, NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-22 11:15:00', '2024-01-22 11:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P97', '01JBQM3K8TGHZX9RNVQM5Y2P8T', NULL, 'reader', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7W', NULL, NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-23 15:05:00', '2024-01-23 15:05:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PC1', '01JBQM3K8TGHZX9RNVQM5Y2P8T', NULL, 'owner', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7Z', NULL, NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-17 10:45:00', '2024-01-17 10:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PC2', '01JBQM3K8TGHZX9RNVQM5Y2P8S', NULL, 'owner', 'user', '01JBQM3K8TGHZX9RNVQM5Y2P7X', NULL, NULL, NULL, false, 'drive#permission', false, 'published', false, NULL, '2024-01-16 12:30:00', '2024-01-16 12:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PC3', NULL, '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'owner', 'domain', NULL, NULL, NULL, 'company.com', false, 'drive#permission', false, 'published', false, NULL, '2024-01-20 10:00:00', '2024-01-20 10:00:00');

-- Comments table
INSERT INTO comments (id, file_id, author_id, content, anchor, resolved, deleted, quoted_file_content_mime_type, quoted_file_content_value, kind, html_content, created_time, modified_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P95', '01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P7Y', 'This section needs more detail on the implementation approach.', '{"r":"page3_lines15-20"}', false, false, 'text/plain', 'implementation approach details', 'drive#comment', '<p>This section needs more detail on the implementation approach.</p>', '2024-01-20 10:15:00', '2024-01-20 10:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P96', '01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P7W', 'Please review the timeline in the project schedule.', '{"r":"page5_table2"}', true, false, 'application/pdf', 'Project Timeline: Q1 2024 - Planning Phase', 'drive#comment', '<p>Please review the timeline in the project schedule.</p>', '2024-01-21 14:30:00', '2024-01-22 09:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P97', '01JBQM3K8TGHZX9RNVQM5Y2P8S', '01JBQM3K8TGHZX9RNVQM5Y2P7X', 'Great presentation! Could we add more examples on slide 10?', '{"slide": 10}', false, false, NULL, NULL, 'drive#comment', '<p>Great presentation! Could we add more examples on slide 10?</p>', '2024-01-22 11:20:00', '2024-01-22 11:20:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P98', '01JBQM3K8TGHZX9RNVQM5Y2P8T', '01JBQM3K8TGHZX9RNVQM5Y2P7Z', 'This policy needs legal review before publication.', '{"section":"benefits","paragraph":3}', false, false, 'text/plain', 'Employee benefits policy section', 'drive#comment', '<p>This policy needs legal review before publication.</p>', '2024-01-23 15:10:00', '2024-01-23 15:10:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P99', '01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P80', 'The budget calculations look correct to me.', '{"r":"page7_budget_table"}', true, false, 'application/vnd.ms-excel', 'Budget Summary: Total $500,000', 'drive#comment', '<p>The budget calculations look correct to me.</p>', '2024-01-24 08:45:00', '2024-01-25 12:30:00');

-- Replies table
INSERT INTO replies (id, comment_id, author_id, content, action, deleted, kind, html_content, created_time, modified_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P9A', '01JBQM3K8TGHZX9RNVQM5Y2P95', '01JBQM3K8TGHZX9RNVQM5Y2P7W', 'Good point! I will add more details about the API integration approach.', NULL, false, 'drive#reply', '<p>Good point! I will add more details about the API integration approach.</p>', '2024-01-20 15:30:00', '2024-01-20 15:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9B', '01JBQM3K8TGHZX9RNVQM5Y2P96', '01JBQM3K8TGHZX9RNVQM5Y2P7Y', 'Updated the timeline based on resource availability. Resolving this comment.', 'resolve', false, 'drive#reply', '<p>Updated the timeline based on resource availability. Resolving this comment.</p>', '2024-01-22 09:45:00', '2024-01-22 09:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9C', '01JBQM3K8TGHZX9RNVQM5Y2P97', '01JBQM3K8TGHZX9RNVQM5Y2P7W', 'Absolutely! I will add case studies from our recent campaigns.', NULL, false, 'drive#reply', '<p>Absolutely! I will add case studies from our recent campaigns.</p>', '2024-01-22 16:45:00', '2024-01-22 16:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9D', '01JBQM3K8TGHZX9RNVQM5Y2P98', '01JBQM3K8TGHZX9RNVQM5Y2P7W', 'I have scheduled a meeting with legal for next week.', NULL, false, 'drive#reply', '<p>I have scheduled a meeting with legal for next week.</p>', '2024-01-23 16:20:00', '2024-01-23 16:20:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9E', '01JBQM3K8TGHZX9RNVQM5Y2P99', '01JBQM3K8TGHZX9RNVQM5Y2P7W', 'Thanks for the review! Marking this as resolved.', 'resolve', false, 'drive#reply', '<p>Thanks for the review! Marking this as resolved.</p>', '2024-01-25 12:30:00', '2024-01-25 12:30:00');

-- Changes table
INSERT INTO changes (token, change_time, file_id, drive_id, change_type, payload, kind, removed) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P9F', '2024-01-15 15:15:00', '01JBQM3K8TGHZX9RNVQM5Y2P8R', NULL, 'file_created', '{"action": "create", "file_type": "pdf"}', 'drive#change', false),
('01JBQM3K8TGHZX9RNVQM5Y2P9G', '2024-01-22 14:20:00', '01JBQM3K8TGHZX9RNVQM5Y2P8R', NULL, 'file_updated', '{"action": "content_update", "revision": 2}', 'drive#change', false),
('01JBQM3K8TGHZX9RNVQM5Y2P9H', '2024-01-16 10:30:00', '01JBQM3K8TGHZX9RNVQM5Y2P8R', NULL, 'perm_created', '{"permission_type": "group", "role": "writer"}', 'drive#change', false),
('01JBQM3K8TGHZX9RNVQM5Y2P9I', '2024-01-20 10:15:00', '01JBQM3K8TGHZX9RNVQM5Y2P8R', NULL, 'comment_created', '{"comment_author": "01JBQM3K8TGHZX9RNVQM5Y2P7Y"}', 'drive#change', false),
('01JBQM3K8TGHZX9RNVQM5Y2P9J', '2024-01-15 13:00:00', NULL, '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'drive_created', '{"drive_name": "Engineering Projects"}', 'drive#change', false);

-- Change Tokens table
INSERT INTO change_tokens (scope, last_token) VALUES
('global', '01JBQM3K8TGHZX9RNVQM5Y2P9J'),
('user:01JBQM3K8TGHZX9RNVQM5Y2P7W', '01JBQM3K8TGHZX9RNVQM5Y2P9I'),
('drive:01JBQM3K8TGHZX9RNVQM5Y2P8B', '01JBQM3K8TGHZX9RNVQM5Y2P9H'),
('user:01JBQM3K8TGHZX9RNVQM5Y2P7X', '01JBQM3K8TGHZX9RNVQM5Y2P9G'),
('drive:01JBQM3K8TGHZX9RNVQM5Y2P8C', '01JBQM3K8TGHZX9RNVQM5Y2P9F');

-- Uploads table
INSERT INTO uploads (id, file_id, intended_mime, total_size, received_bytes, chunk_size, state, created_time, updated_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P9K', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 'application/pdf', 1024000, 1024000, 262144, 'completed', '2024-01-15 15:00:00', '2024-01-15 15:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9L', NULL, 'application/vnd.ms-excel', 2048000, 1536000, 262144, 'in_progress', '2024-01-20 09:30:00', '2024-01-20 14:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9M', NULL, 'image/jpeg', 512000, 0, 65536, 'initiated', '2024-01-21 11:15:00', '2024-01-21 11:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9N', '01JBQM3K8TGHZX9RNVQM5Y2P8T', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 768000, 768000, 262144, 'completed', '2024-01-17 10:30:00', '2024-01-17 10:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9O', NULL, 'video/mp4', NULL, 1048576, 1048576, 'finalizing', '2024-01-22 16:20:00', '2024-01-22 18:30:00');

-- Thumbnails table
INSERT INTO thumbnails (id, file_id, revision_id, kind, blob_id, width, height, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P9P', '01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P8V', 'pdf', '01JBQM3K8TGHZX9RNVQM5Y2P8P', 150, 200, '2024-01-15 15:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9Q', '01JBQM3K8TGHZX9RNVQM5Y2P8S', '01JBQM3K8TGHZX9RNVQM5Y2P8X', 'doc', '01JBQM3K8TGHZX9RNVQM5Y2P8P', 200, 150, '2024-01-16 13:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9R', '01JBQM3K8TGHZX9RNVQM5Y2P8T', '01JBQM3K8TGHZX9RNVQM5Y2P8Z', 'doc', '01JBQM3K8TGHZX9RNVQM5Y2P8P', 180, 240, '2024-01-17 11:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9S', '01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P8W', 'pdf', '01JBQM3K8TGHZX9RNVQM5Y2P8P', 150, 200, '2024-01-22 14:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9T', '01JBQM3K8TGHZX9RNVQM5Y2P8S', '01JBQM3K8TGHZX9RNVQM5Y2P8Y', 'doc', '01JBQM3K8TGHZX9RNVQM5Y2P8P', 200, 150, '2024-01-21 17:00:00');

-- Labels table
INSERT INTO labels (id, key, name, type, options, required, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P9U', 'priority', 'Priority Level', 'enum', '["low", "medium", "high", "critical"]', true, '2024-01-10 09:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9V', 'project_status', 'Project Status', 'enum', '["planning", "active", "review", "complete"]', false, '2024-01-10 09:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9W', 'budget_amount', 'Budget Amount', 'number', NULL, false, '2024-01-10 09:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9X', 'confidential', 'Confidential Document', 'boolean', NULL, false, '2024-01-10 09:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2P9Y', 'due_date', 'Due Date', 'date', NULL, false, '2024-01-10 10:00:00');

-- File Labels table
INSERT INTO file_labels (id, file_id, label_id, value_string, value_number, value_boolean, value_date, value_enum, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P9Z', '01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P9U', NULL, NULL, NULL, NULL, 'high', '2024-01-15 15:20:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA0', '01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P9W', NULL, 150000.00, NULL, NULL, NULL, '2024-01-15 15:25:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA1', '01JBQM3K8TGHZX9RNVQM5Y2P8T', '01JBQM3K8TGHZX9RNVQM5Y2P9X', NULL, NULL, true, NULL, NULL, '2024-01-17 10:50:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA2', '01JBQM3K8TGHZX9RNVQM5Y2P8S', '01JBQM3K8TGHZX9RNVQM5Y2P9Y', NULL, NULL, NULL, '2024-02-15', NULL, '2024-01-16 12:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA3', '01JBQM3K8TGHZX9RNVQM5Y2P8S', '01JBQM3K8TGHZX9RNVQM5Y2P9V', NULL, NULL, NULL, NULL, 'active', '2024-01-16 12:50:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA4', '01JBQM3K8TGHZX9RNVQM5Y2F93', '01JBQM3K8TGHZX9RNVQM5Y2P9X', NULL, NULL, NULL, NULL, 'active', '2024-01-16 12:50:00');

-- Share Links table
INSERT INTO share_links (id, file_id, permission_role, link_token, allow_discovery, expires_time, created_by, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PA4', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 'reader', 'abc123def456ghi789jkl012', false, '2024-03-15 23:59:59', '01JBQM3K8TGHZX9RNVQM5Y2P7W', '2024-01-20 11:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA5', '01JBQM3K8TGHZX9RNVQM5Y2P8S', 'commenter', 'mno345pqr678stu901vwx234', true, NULL, '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-21 14:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA6', '01JBQM3K8TGHZX9RNVQM5Y2P8T', 'reader', 'yz5abc678def901ghi234jkl567', false, '2024-02-28 23:59:59', '01JBQM3K8TGHZX9RNVQM5Y2P7Z', '2024-01-22 09:20:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA7', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 'writer', '890mno123pqr456stu789vwx012', false, '2024-04-01 23:59:59', '01JBQM3K8TGHZX9RNVQM5Y2P7W', '2024-01-23 16:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PA8', '01JBQM3K8TGHZX9RNVQM5Y2P8S', 'reader', '345yz6abc789def012ghi345jkl', true, '2024-06-30 23:59:59', '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-24 12:10:00');

-- Path Closure table
INSERT INTO path_closure (ancestor_id, descendant_id, depth) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2P8Q', '01JBQM3K8TGHZX9RNVQM5Y2P8Q', 0),
('01JBQM3K8TGHZX9RNVQM5Y2P8R', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 0),
('01JBQM3K8TGHZX9RNVQM5Y2P8S', '01JBQM3K8TGHZX9RNVQM5Y2P8S', 0),
('01JBQM3K8TGHZX9RNVQM5Y2P8T', '01JBQM3K8TGHZX9RNVQM5Y2P8T', 0),
('01JBQM3K8TGHZX9RNVQM5Y2P8U', '01JBQM3K8TGHZX9RNVQM5Y2P8U', 0),
('01JBQM3K8TGHZX9RNVQM5Y2P8Q', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 1),
('01JBQM3K8TGHZX9RNVQM5Y2P8Q', '01JBQM3K8TGHZX9RNVQM5Y2P8U', 1);

-- ID Pool table
INSERT INTO id_pool (id, reserved, reserved_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PAA', false, NULL),
('01JBQM3K8TGHZX9RNVQM5Y2PAB', true, '2024-01-25 10:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAC', false, NULL),
('01JBQM3K8TGHZX9RNVQM5Y2PAD', true, '2024-01-25 11:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAE', false, NULL);

-- Trash Log table
INSERT INTO trash_log (id, file_id, emptied_time, actor_id) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PAF', '01JBQM3K8TGHZX9RNVQM5Y2P8R', '2024-01-24 16:30:00', '01JBQM3K8TGHZX9RNVQM5Y2P7W'),
('01JBQM3K8TGHZX9RNVQM5Y2PAG', '01JBQM3K8TGHZX9RNVQM5Y2P8S', '2024-01-24 16:35:00', '01JBQM3K8TGHZX9RNVQM5Y2P7W'),
('01JBQM3K8TGHZX9RNVQM5Y2PAH', '01JBQM3K8TGHZX9RNVQM5Y2P8T', '2024-01-24 16:40:00', '01JBQM3K8TGHZX9RNVQM5Y2P7X'),
('01JBQM3K8TGHZX9RNVQM5Y2PAI', '01JBQM3K8TGHZX9RNVQM5Y2P8U', '2024-01-25 09:15:00', '01JBQM3K8TGHZX9RNVQM5Y2P80'),
('01JBQM3K8TGHZX9RNVQM5Y2PAJ', '01JBQM3K8TGHZX9RNVQM5Y2P8Q', '2024-01-25 14:20:00', NULL);

-- Drive Channels table
INSERT INTO drive_channels (id, resource_id, resource_uri, address, expiration, type, token, params, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PAK', 'AHtSGwKCAQkA-dxhUL-FrT4', 'https://www.googleapis.com/drive/v3/changes', 'https://webhook.example.com/drive/notifications', '2024-03-15 23:59:59', 'web_hook', 'webhook-token-123', '{"include_deleted": true}', '2024-01-20 10:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAL', 'BItSGwKCAQkA-exhUL-FrT5', 'https://www.googleapis.com/drive/v3/files/watch', 'https://webhook.example.com/file/notifications', '2024-04-01 23:59:59', 'web_hook', 'webhook-token-456', '{"include_permissions": false}', '2024-01-21 11:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAM', 'CJtSGwKCAQkA-fxhUL-FrT6', 'https://www.googleapis.com/drive/v3/drives/watch', 'https://webhook.example.com/drive/watch', '2024-02-28 23:59:59', 'web_hook', 'webhook-token-789', '{"target_drive": "01JBQM3K8TGHZX9RNVQM5Y2P8B"}', '2024-01-22 14:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAN', 'DKtSGwKCAQkA-gxhUL-FrT7', 'https://www.googleapis.com/drive/v3/changes', 'https://webhook.example.com/changes/global', '2024-05-15 23:59:59', 'web_hook', 'webhook-token-012', '{"page_size": 100}', '2024-01-23 09:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAO', 'ELtSGwKCAQkA-hxhUL-FrT8', 'https://www.googleapis.com/drive/v3/files/watch', 'https://webhook.example.com/file/specific', '2024-06-30 23:59:59', 'web_hook', 'webhook-token-345', '{"file_id": "01JBQM3K8TGHZX9RNVQM5Y2P8R"}', '2024-01-24 16:20:00');

-- Subscriptions table
INSERT INTO subscriptions (id, channel_id, resource_type, resource_id, callback_url, created_time, expires_time, active) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PAP', '01JBQM3K8TGHZX9RNVQM5Y2PAK', 'changes', NULL, 'https://api.example.com/webhooks/drive-changes', '2024-01-20 10:00:00', '2024-03-15 23:59:59', true),
('01JBQM3K8TGHZX9RNVQM5Y2PAQ', '01JBQM3K8TGHZX9RNVQM5Y2PAL', 'files', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 'https://api.example.com/webhooks/file-changes', '2024-01-21 11:30:00', '2024-04-01 23:59:59', true),
('01JBQM3K8TGHZX9RNVQM5Y2PAR', '01JBQM3K8TGHZX9RNVQM5Y2PAM', 'drives', '01JBQM3K8TGHZX9RNVQM5Y2P8B', 'https://api.example.com/webhooks/drive-specific', '2024-01-22 14:15:00', '2024-02-28 23:59:59', false),
('01JBQM3K8TGHZX9RNVQM5Y2PAS', '01JBQM3K8TGHZX9RNVQM5Y2PAN', 'changes', NULL, 'https://api.example.com/webhooks/global-changes', '2024-01-23 09:45:00', '2024-05-15 23:59:59', true),
('01JBQM3K8TGHZX9RNVQM5Y2PAT', '01JBQM3K8TGHZX9RNVQM5Y2PAO', 'files', '01JBQM3K8TGHZX9RNVQM5Y2P8S', 'https://api.example.com/webhooks/presentation-updates', '2024-01-24 16:20:00', '2024-06-30 23:59:59', true);

-- Webhook Deliveries table
INSERT INTO webhook_deliveries (id, subscription_id, channel_id, change_token, status, attempts, last_error, next_retry_time, created_time, updated_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PAU', '01JBQM3K8TGHZX9RNVQM5Y2PAP', '01JBQM3K8TGHZX9RNVQM5Y2PAK', '01JBQM3K8TGHZX9RNVQM5Y2P9F', 'delivered', 1, NULL, NULL, '2024-01-20 10:30:00', '2024-01-20 10:31:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAV', '01JBQM3K8TGHZX9RNVQM5Y2PAQ', '01JBQM3K8TGHZX9RNVQM5Y2PAL', '01JBQM3K8TGHZX9RNVQM5Y2P9G', 'failed', 3, 'Connection timeout after 30 seconds', '2024-01-22 15:00:00', '2024-01-22 14:20:00', '2024-01-22 14:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAW', '01JBQM3K8TGHZX9RNVQM5Y2PAS', '01JBQM3K8TGHZX9RNVQM5Y2PAN', '01JBQM3K8TGHZX9RNVQM5Y2P9H', 'delivered', 1, NULL, NULL, '2024-01-23 10:00:00', '2024-01-23 10:01:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAX', '01JBQM3K8TGHZX9RNVQM5Y2PAT', '01JBQM3K8TGHZX9RNVQM5Y2PAO', '01JBQM3K8TGHZX9RNVQM5Y2P9I', 'retrying', 2, 'HTTP 503 Service Unavailable', '2024-01-24 17:30:00', '2024-01-24 16:45:00', '2024-01-24 17:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PAY', '01JBQM3K8TGHZX9RNVQM5Y2PAP', '01JBQM3K8TGHZX9RNVQM5Y2PAK', '01JBQM3K8TGHZX9RNVQM5Y2P9J', 'pending', 0, NULL, '2024-01-25 09:00:00', '2024-01-25 08:55:00', '2024-01-25 08:55:00');

-- Access Proposals table
INSERT INTO access_proposals (id, file_id, requester_email, recipient_email, proposed_roles, proposed_view, request_message, status, resolved_at, resolved_by_email, created_at) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PAZ', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 'external.user@partner.com', 'john.smith@company.com', '["writer"]', NULL, 'Hi John, I need access to review the technical specifications for our joint project.', 'pending', NULL, NULL, '2024-01-24T09:30:00.000Z'),
('01JBQM3K8TGHZX9RNVQM5Y2PB0', '01JBQM3K8TGHZX9RNVQM5Y2P8S', 'client@customer.com', 'sarah.johnson@company.com', '["commenter"]', NULL, 'Could I get access to provide feedback on the marketing presentation?', 'approved', '2024-01-25T14:15:00.000Z', 'sarah.johnson@company.com', '2024-01-24T11:45:00.000Z'),
('01JBQM3K8TGHZX9RNVQM5Y2PB1', '01JBQM3K8TGHZX9RNVQM5Y2P8T', 'contractor@external.com', 'emily.davis@company.com', '["reader"]', NULL, 'I need to review the employee handbook as part of my compliance audit.', 'denied', '2024-01-25T10:30:00.000Z', 'emily.davis@company.com', '2024-01-24T14:20:00.000Z'),
('01JBQM3K8TGHZX9RNVQM5Y2PB2', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 'vendor@supplier.com', 'alex.rodriguez@company.com', '["writer"]', NULL, 'Need to update technical specifications based on our latest discussions.', 'pending', NULL, NULL, '2024-01-25T08:15:00.000Z'),
('01JBQM3K8TGHZX9RNVQM5Y2PB3', '01JBQM3K8TGHZX9RNVQM5Y2P8S', 'intern@company.com', 'sarah.johnson@company.com', '["reader", "commenter"]', 'published', 'Could I get access to learn from the marketing presentation examples?', 'approved', '2024-01-25T16:45:00.000Z', 'sarah.johnson@company.com', '2024-01-25T13:30:00.000Z'),
('01JBQM3K8TGHZX9RNVQM5Y2PB4', '01JBQM3K8TGHZX9RNVQM5Y2P8Q', 'consultant@external.com', 'john.smith@company.com', '["writer"]', NULL, 'I need access to review the project documents for our upcoming meeting.', 'pending', NULL, NULL, '2024-01-26T10:00:00.000Z'),
('01JBQM3K8TGHZX9RNVQM5Y2PB5', '01JBQM3K8TGHZX9RNVQM5Y2P8T', 'auditor@external.com', 'emily.davis@company.com', '["reader"]', NULL, 'Compliance audit requires access to review HR policies and procedures.', 'pending', NULL, NULL, '2024-01-26T14:30:00.000Z'),
('01JBQM3K8TGHZX9RNVQM5Y2PB6', '01JBQM3K8TGHZX9RNVQM5Y2P8R', 'partner@collaborator.com', 'alex.rodriguez@company.com', '["writer", "commenter"]', 'published', 'Need collaborative access to finalize the technical specifications document.', 'pending', NULL, NULL, '2024-01-26T16:45:00.000Z');

-- Operations table
INSERT INTO operations (id, name, operation_type, status, operation_metadata, response_data, error_data, created_at, completed_at) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PB4', 'export_pdf_document', 'export', 'done', '{"format": "pdf", "file_id": "01JBQM3K8TGHZX9RNVQM5Y2P8R", "quality": "high"}', '{"download_url": "https://export.googleapis.com/download/drive/v3/files/exported_file.pdf", "size": 1048576}', NULL, '2024-01-20 09:30:00', '2024-01-20 09:32:15'),
('01JBQM3K8TGHZX9RNVQM5Y2PB5', 'download_presentation', 'download', 'done', '{"file_id": "01JBQM3K8TGHZX9RNVQM5Y2P8S", "include_comments": true}', '{"download_url": "https://drive.googleapis.com/download/presentation.pptx", "size": 2097152, "checksum": "md5:a1b2c3d4e5f6"}', NULL, '2024-01-21 14:15:00', '2024-01-21 14:17:30'),
('01JBQM3K8TGHZX9RNVQM5Y2PB6', 'bulk_export_drive', 'export', 'running', '{"drive_id": "01JBQM3K8TGHZX9RNVQM5Y2P8B", "format": "zip", "include_folders": true}', NULL, NULL, '2024-01-22 10:45:00', NULL),
('01JBQM3K8TGHZX9RNVQM5Y2PB7', 'copy_file_batch', 'copy', 'error', '{"source_files": ["01JBQM3K8TGHZX9RNVQM5Y2P8R", "01JBQM3K8TGHZX9RNVQM5Y2P8S"], "destination_drive": "01JBQM3K8TGHZX9RNVQM5Y2P8C"}', NULL, '{"error_code": "INSUFFICIENT_PERMISSIONS", "message": "User does not have write access to destination drive", "timestamp": "2024-01-23T08:30:00Z"}', '2024-01-23 08:15:00', '2024-01-23 08:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PB8', 'import_documents', 'import', 'done', '{"source": "google_docs", "conversion": "auto", "preserve_formatting": true}', '{"imported_files": [{"id": "01JBQM3K8TGHZX9RNVQM5Y2P8T", "original_name": "Employee_Handbook_v2.docx"}], "total_imported": 1}', NULL, '2024-01-24 11:20:00', '2024-01-24 11:25:45'),
('01JBQM3K8TGHZX9RNVQM5Y2PB9', 'generate_thumbnails', 'thumbnail', 'running', '{"file_ids": ["01JBQM3K8TGHZX9RNVQM5Y2P8R", "01JBQM3K8TGHZX9RNVQM5Y2P8S"], "sizes": [150, 300, 600]}', '{"processed": 1, "total": 2, "progress": 50}', NULL, '2024-01-25 15:00:00', NULL);

-- Apps table
INSERT INTO apps
    (id, name, object_type, product_id, product_url, supports_create, supports_import, supports_multi_open, supports_offline_create, has_drive_wide_scope, installed, authorized, use_by_default, primary_mime_types, secondary_mime_types, primary_file_extensions, secondary_file_extensions, create_url, create_in_folder_template, open_url_template, short_description, long_description, icons, created_at, updated_at, installed_by)
VALUES
    ('01JBQM3K8TGHZX9RNVQM5Y2PBA', 'Google Docs', 'document', '1234567890', 'https://docs.google.com', true, true, true, true, false, true, true, true, '["application/vnd.google-apps.document"]', '["application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/rtf", "text/plain"]', '["gdoc"]', '["docx", "doc", "rtf", "txt"]', 'https://docs.google.com/document/create', 'https://docs.google.com/document/create?usp=drive_web&parent={folderId}', 'https://docs.google.com/document/d/{fileId}/edit', 'Create and edit documents online', 'Google Docs is an online word processor that lets you create and format documents and work with other people in real time.', '[{"kind": "drive#app#icon", "category": "document", "size": 16, "iconUrl": "https://ssl.gstatic.com/docs/doclist/images/mediatype/icon_1_document_x16.png"}]', '2024-01-10 10:00:00', '2024-01-25 10:00:00', '01JBQM3K8TGHZX9RNVQM5Y2P7W'),
    ('01JBQM3K8TGHZX9RNVQM5Y2PBB', 'Google Sheets', 'spreadsheet', '2345678901', 'https://sheets.google.com', true, true, true, true, false, true, true, true, '["application/vnd.google-apps.spreadsheet"]', '["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel", "text/csv"]', '["gsheet"]', '["xlsx", "xls", "csv", "ods"]', 'https://sheets.google.com/create', 'https://sheets.google.com/create?usp=drive_web&parent={folderId}', 'https://sheets.google.com/spreadsheets/d/{fileId}/edit', 'Create and edit spreadsheets online', 'Google Sheets is an online spreadsheet application that lets you create and format spreadsheets and work with other people in real time.', '[{"kind": "drive#app#icon", "category": "spreadsheet", "size": 16, "iconUrl": "https://ssl.gstatic.com/docs/doclist/images/mediatype/icon_1_spreadsheet_x16.png"}]', '2024-01-10 10:15:00', '2024-01-25 10:15:00', '01JBQM3K8TGHZX9RNVQM5Y2P7X'),
    ('01JBQM3K8TGHZX9RNVQM5Y2PBC', 'Google Slides', 'presentation', '3456789012', 'https://slides.google.com', true, true, true, true, false, true, true, true, '["application/vnd.google-apps.presentation"]', '["application/vnd.openxmlformats-officedocument.presentationml.presentation", "application/vnd.ms-powerpoint"]', '["gslides"]', '["pptx", "ppt", "odp"]', 'https://slides.google.com/create', 'https://slides.google.com/create?usp=drive_web&parent={folderId}', 'https://slides.google.com/presentation/d/{fileId}/edit', 'Create and edit presentations online', 'Google Slides is an online presentation application that lets you create and format presentations and work with other people in real time.', '[{"kind": "drive#app#icon", "category": "presentation", "size": 16, "iconUrl": "https://ssl.gstatic.com/docs/doclist/images/mediatype/icon_1_presentation_x16.png"}]', '2024-01-10 10:30:00', '2024-01-25 10:30:00', '01JBQM3K8TGHZX9RNVQM5Y2P7Y'),
    ('01JBQM3K8TGHZX9RNVQM5Y2PBD', 'Adobe Acrobat Reader', 'viewer', '4567890123', 'https://www.adobe.com/acrobat', false, false, true, false, true, true, true, false, '["application/pdf"]', '[]', '["pdf"]', '[]', NULL, NULL, 'https://drive.google.com/viewerng/viewer?embedded=true&chrome=false&dov={fileId}', 'View PDF documents', 'Adobe Acrobat Reader is a reliable, free global standard for viewing, printing, signing, and commenting on PDF documents.', '[{"kind": "drive#app#icon", "category": "application", "size": 16, "iconUrl": "https://ssl.gstatic.com/docs/doclist/images/icon_10_pdf_list.png"}]', '2024-01-10 11:00:00', '2024-01-25 11:00:00', '01JBQM3K8TGHZX9RNVQM5Y2P7Z'),
    ('01JBQM3K8TGHZX9RNVQM5Y2PBE', 'Photo Editor Pro', 'editor', '5678901234', 'https://photoeditor.example.com', true, true, false, false, false, false, false, false, '["image/jpeg", "image/png"]', '["image/gif", "image/bmp", "image/tiff"]', '["jpg", "jpeg", "png"]', '["gif", "bmp", "tiff", "webp"]', 'https://photoeditor.example.com/create?parent={folderId}', 'https://photoeditor.example.com/create?parent={folderId}', 'https://photoeditor.example.com/edit?fileId={fileId}', 'Professional photo editing tool', 'Photo Editor Pro is a comprehensive photo editing application with advanced features for professional image manipulation and enhancement.', '[{"kind": "drive#app#icon", "category": "photo", "size": 16, "iconUrl": "https://photoeditor.example.com/icon16.png"}]', '2024-01-10 11:30:00', '2024-01-25 11:30:00', '01JBQM3K8TGHZX9RNVQM5Y2P80'),
    ('01JBQM3K8TGHZX9RNVQM5Y2PBF', 'Code Editor', 'editor', '6789012345', 'https://codeeditor.example.com', true, true, true, true, true, true, true, false, '["text/plain", "application/javascript"]', '["text/html", "text/css", "application/json", "text/x-python"]', '["js", "txt"]', '["html", "css", "json", "py", "java", "cpp"]', 'https://codeeditor.example.com/new', 'https://codeeditor.example.com/new?parent={folderId}', 'https://codeeditor.example.com/edit/{fileId}', 'Online code editor and IDE', 'Code Editor is a powerful online integrated development environment that supports multiple programming languages with syntax highlighting, debugging, and collaboration features.', '[{"kind": "drive#app#icon", "category": "text", "size": 16, "iconUrl": "https://codeeditor.example.com/icons/editor16.png"}]', '2024-01-10 12:00:00', '2024-01-25 12:00:00', '01JBQM3K8TGHZX9RNVQM5Y2P80');

-- Channels table
INSERT INTO channels (id, resource_id, resource_uri, type, address, token, payload, params, expiration, active, user_id, created_time) VALUES
('01JBQM3K8TGHZX9RNVQM5Y2PBG', 'AHtSGwKCAQkA-dxhUL-FrT4-main', 'https://www.googleapis.com/drive/v3/changes', 'webhook', 'https://webhook.example.com/drive/changes', 'webhook-secret-token-001', true, '{"include_deleted": true, "include_permissions_for_view": "published", "page_size": 100}', '1711929599000', true, '01JBQM3K8TGHZX9RNVQM5Y2P7W', '2024-01-15 10:00:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PBH', 'BItSGwKCAQkA-exhUL-FrT5-file', 'https://www.googleapis.com/drive/v3/files/01JBQM3K8TGHZX9RNVQM5Y2P8R/watch', 'webhook', 'https://webhook.example.com/file/updates', 'webhook-secret-token-002', true, '{"acknowledge_abuse": false, "supports_all_drives": true}', '1712102399000', true, '01JBQM3K8TGHZX9RNVQM5Y2P7W', '2024-01-16 14:30:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PBI', 'CJtSGwKCAQkA-fxhUL-FrT6-drive', 'https://www.googleapis.com/drive/v3/drives/01JBQM3K8TGHZX9RNVQM5Y2P8B/watch', 'webhook', 'https://webhook.example.com/drive/engineering/notifications', 'webhook-secret-token-003', false, '{"use_domain_admin_access": true, "supports_all_drives": true}', '1709424000000', true, '01JBQM3K8TGHZX9RNVQM5Y2P7Y', '2024-01-17 09:15:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PBJ', 'DKtSGwKCAQkA-gxhUL-FrT7-perm', 'https://www.googleapis.com/drive/v3/files/01JBQM3K8TGHZX9RNVQM5Y2P8S/permissions/watch', 'webhook', 'https://api.internal.company.com/webhooks/permissions', 'internal-webhook-token-004', true, '{"send_notification_emails": false, "email_message": "Permission changes detected"}', '1719705599000', false, '01JBQM3K8TGHZX9RNVQM5Y2P7X', '2024-01-18 16:45:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PBK', 'ELtSGwKCAQkA-hxhUL-FrT8-comm', 'https://www.googleapis.com/drive/v3/files/01JBQM3K8TGHZX9RNVQM5Y2P8R/comments/watch', 'webhook', 'https://collaboration.example.com/api/v1/comment-notifications', 'collab-webhook-secret-005', true, '{"include_deleted": false, "fields": "id,content,author,created_time,resolved"}', '1717113599000', true, '01JBQM3K8TGHZX9RNVQM5Y2P7Y', '2024-01-19 11:20:00'),
('01JBQM3K8TGHZX9RNVQM5Y2PBL', 'FMtSGwKCAQkA-ixhUL-FrT9-bulk', 'https://www.googleapis.com/drive/v3/changes', 'webhook', 'https://analytics.company.com/webhooks/drive-activity', 'analytics-token-006', true, '{"include_corpus_removals": true, "include_items_from_all_drives": true, "restrict_to_my_drive": false}', '1714521599000', true, '01JBQM3K8TGHZX9RNVQM5Y2P80', '2024-01-20 08:30:00');

-- ============================================
-- End of Seed Data
-- ============================================

-- ============================================
-- Agent Identity Patch (cross-MCP consistent identities)
-- ============================================
-- IT 服务台一线工程师 (工程盘协作活跃用户)
UPDATE users SET display_name='Ivan Park', email='ivan.park@techcorp.com', auth_token='AGT_IT_L1_TOKEN_V1'
WHERE id='01JBQM3K8TGHZX9RNVQM5Y2P7Y';

-- IT 问题/变更处理工程师 (Engineering Drive organizer)
UPDATE users SET display_name='Nina Patel', email='nina.patel@techcorp.com', auth_token='AGT_IT_CHG_TOKEN_V1'
WHERE id='01JBQM3K8TGHZX9RNVQM5Y2P7W';

-- HR 服务专员 (HR Documents 相关用户)
UPDATE users SET display_name='Helen Zhou', email='helen.zhou@techcorp.com', auth_token='AGT_HR_SRVC_TOKEN_V1'
WHERE id='01JBQM3K8TGHZX9RNVQM5Y2P7Z';

-- 客户支持专员 (对外沟通与共享协作角色)
UPDATE users SET display_name='Carlos Mendez', email='carlos.mendez@techcorp.com', auth_token='AGT_CSM_SUP_TOKEN_V1'
WHERE id='01JBQM3K8TGHZX9RNVQM5Y2P7X';

-- 知识库维护专员 (跨盘文档/访问治理)
UPDATE users SET display_name='Priya Nair', email='priya.nair@techcorp.com', auth_token='AGT_KB_SPEC_TOKEN_V1'
WHERE id='01JBQM3K8TGHZX9RNVQM5Y2P80';

-- 协作运营专员 (外部协作方联动)
UPDATE users SET display_name='Olivia Chen', email='olivia.chen@techcorp.com', auth_token='AGT_COLLAB_OPS_TOKEN_V1'
WHERE id='01JBQM3K8TGHZX9RNVQM5Y2P81H';

-- 开发工程师（基层）
UPDATE users SET display_name='Ethan Walker', email='ethan.walker@techcorp.com', auth_token='AGT_DEV_ENG_TOKEN_V1'
WHERE id='01JBQM3K8TGHZX9RNVQM5Y2P81C';

-- QA/测试工程师（基层）
UPDATE users SET display_name='Mia Kim', email='mia.kim@techcorp.com', auth_token='AGT_QA_ENG_TOKEN_V1'
WHERE id='01JBQM3K8TGHZX9RNVQM5Y2P81G';
