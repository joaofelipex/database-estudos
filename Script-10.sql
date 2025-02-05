select * from acl.module where created_at >= '2024-09-25';
select * from acl.resource where created_at >= '2024-09-25';
select * from acl.endpoint where created_at >= '2024-09-25';
select * from acl.page where created_at >= '2024-09-25';
select * from acl.permission where created_at >= '2024-09-25';
select * from acl.page_permission_endpoint ppe where created_at >= '2024-09-25';
select * from acl.menu where created_at >= '2024-09-25';

delete from acl.module where created_at >= '2024-09-25';
delete from acl.resource where created_at >= '2024-09-25';
delete from acl.endpoint where created_at >= '2024-09-25';
delete from acl.page where created_at >= '2024-09-25';
delete from acl.permission where created_at >= '2024-09-25';
delete from acl.page_permission_endpoint ppe where created_at >= '2024-09-25';
delete from acl.menu where created_at >= '2024-09-25';


