delete from TBL_AA_RES2RES where parent_res_id='DEF-func-acm-application';
delete from TBL_AA_RES2RES where parent_res_id='DEF-func-acm-user';
delete from TBL_AA_RES2RES where parent_res_id='DEF-func-acm-group';
delete from TBL_AA_RES2RES where parent_res_id='DEF-func-acm-function';
delete from TBL_AA_RES2RES where parent_res_id = 'DEF-func-acm-resource';
delete from TBL_AA_RES2RES where parent_res_id='DEF-func-acm-role';
delete from TBL_AA_RESOURCES where resource_path like '/api/%';
delete from TBL_AA_RESOURCES where resources_id='DEF-uri-app-get';
delete from TBL_AA_RESOURCES where resources_id like 'DEF-weburi-acm-%';


-- For applications URI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-app-get', 'IConnect', 'Get applications', null,'/api/applications**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-app-getById', 'IConnect', 'Get application by Id', null,'/api/application**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-app-create', 'IConnect', 'Create application', null,'/api/application**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-app-update', 'IConnect', 'Update application', null,'/api/application**/**[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- For applications WEBURI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-acm-app', 'IConnect', 'Maintain Application Menu',null, 'admin/acm/ic-application', 'WEBURI',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- For applications res2res--
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-app-get', 'DEF-func-acm-application',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-app-getById', 'DEF-func-acm-application',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-app-create', 'DEF-func-acm-application',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-app-update', 'DEF-func-acm-application',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-acm-app', 'DEF-func-acm-application',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');




-- For users URI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-getById', 'IConnect', 'Get user by Id', null,'/api/users/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-create', 'IConnect', 'Create user', null,'/api/users**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-update', 'IConnect', 'Update user', null,'/api/users/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-delete', 'IConnect', 'Delete users', null,'/api/users**/**[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-deleteById', 'IConnect', 'Delete users by Id', null,'/api/users/*[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-get', 'IConnect', 'Get users', null,'/api/users**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-getLoginById', 'IConnect', 'Get subjectLogins by subject id', null,'/api/subject/logins/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-assingedGroup', 'IConnect', 'Get assigned groups by subject id', null,'/api/subject/assignedGroups/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-assingedGroupAndP', 'IConnect', 'Get assigned groups and parents by subject id', null,'/api/subject/assignedGroupsIncludeParents/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-assingedRoles', 'IConnect', 'Get assigned roles by subject Id', null,'/api/subject/assignedRoles/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-unAssingedGroups', 'IConnect', 'Get unassigned groups to user by subject Id', null,'/api/subject/unAssignedGroups**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-unAssingedRoles', 'IConnect', 'Get unassigned roles for user by subject Id', null,'/api/subject/unAssignedRoles**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-assignGroups2User', 'IConnect', 'Assign groups to user', null,'/api/subject/assignGroups/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-assignRoles2User', 'IConnect', 'Assign roles to user', null,'/api/subject/assignRoles/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-unassignGroup', 'IConnect', 'Unassign groups from user', null,'/api/subject/unAssignGroups/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-unassignRoles', 'IConnect', 'Unassign roles from user', null,'/api/subject/unAssignRoles/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-user-resetPwd', 'IConnect', 'Reset password for user', null,'/api/subject/resetPassword**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- For users WEBURI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-acm-user', 'IConnect', 'Maintain User Menu',null, 'admin/acm/ic-user', 'WEBURI',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- For users res2res--

INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-getById', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-create', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-update', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-delete', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-deleteById', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-get', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-getLoginById', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-assingedGroup', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-assingedGroupAndP', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-assingedRoles', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-unAssingedGroups', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-unAssingedRoles', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-assignGroups2User', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-assignRoles2User', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-unassignGroup', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-unassignRoles', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-user-resetPwd', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-acm-user', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');

-- For groups --
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-getById', 'IConnect', 'Get group by Id', null,'/api/groups/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-get', 'IConnect', 'Get groups', null,'/api/groups**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-create', 'IConnect', 'Create groups', null,'/api/groups**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-update', 'IConnect', 'Update group', null,'/api/groups/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-assignedUsers', 'IConnect', 'Get assigned users to group', null,'/api/group/assignedUsers/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-assignedAdmins', 'IConnect', 'Get assigned admins to group', null,'/api/group/assignedAdmins/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-assignedRoles', 'IConnect', 'Get assigned roles to group', null,'/api/group/assignedRoles/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-delete', 'IConnect', 'Delete groups', null,'/api/groups**/**[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-deleteById', 'IConnect', 'Delete group by Id', null,'/api/groups/*[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-unassignedUsers', 'IConnect', 'Get unassigned user for group', null,'/api/group/unAssignedUsers**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-unassignedAdmins', 'IConnect', 'Get unassigned admins for group', null,'/api/group/unAssignedAdmins**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-unassignedRoles', 'IConnect', 'Get unassigned roles for group', null,'/api/group/unAssignedRoles**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-addUsers', 'IConnect', 'Add users to group', null,'/api/group/assignUsers/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-assignRoles', 'IConnect', 'Assign roles to group', null,'/api/group/assignRoles/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-unassignUsers', 'IConnect', 'Remove users from group', null,'/api/group/unAssignUsers/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-group-unassignRoles', 'IConnect', 'Unassign roles from group', null,'/api/group/unAssignRoles/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- For groups WEBURI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-acm-group', 'IConnect', 'Maintain Group Menu',null, 'admin/acm/ic-group', 'WEBURI',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- For groups res2res--
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-getById', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-get', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-create', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-update', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-assignedUsers', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-assignedAdmins', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-assignedRoles', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-delete', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-deleteById', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-unassignedUsers', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-unassignedAdmins', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-unassignedRoles', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-addUsers', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-assignRoles', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-unassignUsers', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-group-unassignRoles', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-acm-group', 'DEF-func-acm-group',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');


-- For function URI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-getById', 'IConnect', 'Get function by Id', null,'/api/functions/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-create', 'IConnect', 'Create function', null,'/api/functions**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-update', 'IConnect', 'Update function', null,'/api/functions/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-delete', 'IConnect', 'Delete functions', null,'/api/functions**/**[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-deleteById', 'IConnect', 'Delete function by Id', null,'/api/functions/*[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-get', 'IConnect', 'Get functions', null,'/api/functions**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-unassignedRes', 'IConnect', 'Get unassigned resources of function', null,'/api/functionUnassignedResources**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-unassignedRoles', 'IConnect', 'Get unassigned roles of function', null,'/api/functionUnassignedRoles**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-assignRes', 'IConnect', 'Add resources to function', null,'/api/functionAddResources/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-unassignRes', 'IConnect', 'Remove resources from function', null,'/api/functionRemoveResources/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-assignRoles', 'IConnect', 'Assign roles to function', null,'/api/functionAddRoles/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-fun-unassignRoles', 'IConnect', 'Unassign roles to function', null,'/api/functionRemoveRoles/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- For function WEBURI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-acm-func', 'IConnect', 'Maintain Function Menu',null, 'admin/acm/ic-function', 'WEBURI',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');


-- For resource --
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-getById', 'IConnect', 'Get resource by Id', null,'/api/resources/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-create', 'IConnect', 'Create resource', null,'/api/resources**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-update', 'IConnect', 'Update resource', null,'/api/resources/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-delete', 'IConnect', 'Delete resources', null,'/api/resources**/**[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-deleteById', 'IConnect', 'Delete resource by Id', null,'/api/resources/*[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-get', 'IConnect', 'Get resources', null,'/api/resources**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-unassignedFuncs', 'IConnect', 'Get unassigned functions of resource', null,'/api/resourceUnassignedFunctions**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-assignedFuncs', 'IConnect', 'Add resource to functions', null,'/api/resourceAddFunctions/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-res-unassignFuncs', 'IConnect', 'Remove resource from functions', null,'/api/resourceRemoveFunctions/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');


INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-getById', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-create', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-update', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-delete', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-deleteById', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-get', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-unassignedRes', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-unassignedRoles', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-assignRes', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-unassignRes', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-assignRoles', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-fun-unassignRoles', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-acm-func', 'DEF-func-acm-function',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');


-- For resource --
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-acm-resource', 'IConnect', 'Maintain Resource Menu',null, 'admin/acm/ic-resource', 'WEBURI',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-acm-resource', 'IConnect', 'FUNCTION-Maintian resource', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-acm-resource', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-acm-resource', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');

INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-getById', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-create', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-update', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-delete', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-deleteById', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-get', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-unassignedFuncs', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-assignedFuncs', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-res-unassignFuncs', 'DEF-func-acm-resource',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');

-- For role URI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-getById', 'IConnect', 'Get role by Id', null,'/api/roles/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-get', 'IConnect', 'Get roles', null,'/api/roles**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-create', 'IConnect', 'Create role', null,'/api/roles**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-update', 'IConnect', 'Update role', null,'/api/roles/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-delete', 'IConnect', 'Delete roles', null,'/api/roles**/**[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-deleteById', 'IConnect', 'Delete role by Id', null,'/api/roles/*[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-assignedUsers', 'IConnect', 'Get users which have this role', null,'/api/role/assignedRoleUsers/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-assignedFuncs', 'IConnect', 'Get assigned functions to this role', null,'/api/role/assignedFuncs/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-assignedGroups', 'IConnect', 'Get groups which have this role', null,'/api/role/assignedGroups/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-unassignedUser', 'IConnect', 'Get users which does not have the role', null,'/api/role/unAssignedUsers**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-unassignedFuncs', 'IConnect', 'Get unassigned function to this role', null,'/api/role/unAssignedFuncs**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-unassignedGroups', 'IConnect', 'Get groups which does not have this role', null,'/api/role/unAssignedGroups**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-assignUsers', 'IConnect', 'Assign role to users', null,'/api/role/assignUsers/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-assignFuncs', 'IConnect', 'Assign functions to role', null,'/api/role/assignFuncs/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-assignGroups', 'IConnect', 'Add role to groups', null,'/api/role/assignGroups/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-unassignUsers', 'IConnect', 'Remove role from users', null,'/api/role/unAssignUsers/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-unassignFuncs', 'IConnect', 'Unassign functions from role', null,'/api/role/unAssignFuncs/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-unassignGroups', 'IConnect', 'Remove role from groups', null,'/api/role/unAssignGroups/*[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-role-getapp', 'IConnect', 'Get application list', null,'/api/applications**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
-- For function WEBURI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-acm-role', 'IConnect', 'Maintain Role Menu',null, 'admin/acm/ic-role', 'WEBURI',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
-- For function res2res--
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-getById', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-get', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-create', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-update', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-delete', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-deleteById', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-assignedUsers', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-assignedFuncs', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-assignedGroups', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-unassignedUser', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-unassignedFuncs', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-unassignedGroups', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-assignUsers', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-assignFuncs', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-assignGroups', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-unassignUsers', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-unassignFuncs', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-unassignGroups', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-getapp', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-acm-role', 'DEF-func-acm-role',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-role-getapp', 'DEF-func-acm-user',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');

-- ----------------------------
-- appadmin to see the administration
-- ----------------------------
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-metrics', 'IConnect', 'Application Metrics Page', NULL, '*-metrics', 'WEBURI', NULL, NULL, '2017-07-04 15:48:00', 'SYSTEM', '2017-07-04 15:48:09', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-health-check', 'IConnect', 'Health Checks Page', NULL, '*-health', 'WEBURI', NULL, NULL, '2017-07-04 15:49:06', 'SYSTEM', '2017-07-04 15:49:15', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-configuration', 'IConnect', 'Configuration Page', NULL, '*-configuration', 'WEBURI', NULL, NULL, '2017-07-04 15:51:12', 'SYSTEM', '2017-07-04 15:51:18', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-logs', 'IConnect', 'Logs Page', NULL, 'logs', 'WEBURI', NULL, NULL, '2017-07-04 15:52:12', 'SYSTEM', '2017-07-04 15:52:21', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-api-docs', 'IConnect', 'API Page', NULL, 'docs', 'WEBURI', NULL, NULL, '2017-07-04 15:53:41', 'SYSTEM', '2017-07-04 15:53:45', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-swagger-ui', 'IConnect', 'Swagger UI', NULL, '/swagger-ui/**', 'URI', NULL, NULL, '2017-07-04 15:53:41', 'SYSTEM', '2017-07-04 15:53:45', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-metrics', 'IConnect', 'Metrics Function', NULL, '-', 'FUNCTION', NULL, NULL, '2017-07-04 15:57:26', 'SYSTEM', '2017-07-04 15:57:33', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-health-check', 'IConnect', 'Health Checks Function', NULL, '-', 'FUNCTION', NULL, NULL, '2017-07-04 15:59:24', 'SYSTEM', '2017-07-04 15:59:28', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-configuration', 'IConnect', 'Configuration Function', NULL, '-', 'FUNCTION', NULL, NULL, '2017-07-04 16:00:16', 'SYSTEM', '2017-07-04 16:00:19', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-logs', 'IConnect', 'Logs Function', NULL, '-', 'FUNCTION', NULL, NULL, '2017-07-04 16:01:06', 'SYSTEM', '2017-07-04 16:01:10', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-api-docs', 'IConnect', 'API Function', NULL, '-', 'FUNCTION', NULL, NULL, '2017-07-04 16:01:53', 'SYSTEM', '2017-07-04 16:01:56', 'SYSTEM', 0);
INSERT INTO `TBL_AA_RESOURCES` (`RESOURCES_ID`, `APP_ID`, `RESOURCE_NAME`, `RESOURCE_DESC`, `RESOURCE_PATH`, `RESOURCE_TYPE`, `EFFECTIVE_FROM`, `EFFECTIVE_TO`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-swagger-ui', 'IConnect', 'Swagger UI', NULL, '-', 'FUNCTION', NULL, NULL, '2017-07-04 16:01:53', 'SYSTEM', '2017-07-04 16:01:56', 'SYSTEM', 0);

INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-metrics', 'DEF-func-app-metrics', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-health-check', 'DEF-func-app-health-check', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-configuration', 'DEF-func-app-configuration', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-logs', 'DEF-func-app-logs', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-api-docs', 'DEF-func-app-api-docs', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-weburi-app-swagger-ui', 'DEF-func-app-swagger-ui', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-metrics', 'DEF-role-appadmin', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-health-check', 'DEF-role-appadmin', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-configuration', 'DEF-role-appadmin', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-logs', 'DEF-role-appadmin', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-api-docs', 'DEF-role-appadmin', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);
INSERT INTO `TBL_AA_RES2RES` (`RESOURCES_ID`, `PARENT_RES_ID`, `EFFECTIVE_DT`, `EXPIRY_DT`, `CREATED_DT`, `CREATED_BY`, `UPDATED_DT`, `UPDATED_BY`, `VERSION`) VALUES ('DEF-func-app-swagger-ui', 'DEF-role-appadmin', NULL, NULL, '2017-07-04 16:08:48', 'SYSTEM', '2017-07-04 16:08:52', 'SYSTEM', 1);

-- login control function  grant to appadmin
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-UserToken', 'IConnect', 'Admin User-Token User',null, 'admin/acm/ic-user-token', 'WEBURI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-UserToken', 'IConnect', 'FUNCTION--User Token',null, '-', 'FUNCTION',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-userTokenQuery', 'IConnect', 'User Token Query',null,'/api/userToken/*[GET]', 'URI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-UserToken', 'DEF-func-UserToken',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-userTokenQuery', 'DEF-func-UserToken',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-UserToken', 'DEF-role-appadmin',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');

-- approval template grant to appadmin and config configadmin
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-ApprovalTemplate', 'IConnect', 'Admin Approval-Template User',null, 'admin/ic-approvalTemplate', 'WEBURI',  null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-ApprovalTemplate', 'IConnect', 'FUNCTION--Approval Template', null, '-', 'FUNCTION', null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-approvalTemplateQuery', 'IConnect', 'Approval Template Query', null,'/api/approvalTemplates/*[GET]', 'URI', null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-ApprovalTemplate', 'DEF-func-ApprovalTemplate',  null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-approvalTemplateQuery', 'DEF-func-ApprovalTemplate',  null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-ApprovalTemplate', 'DEF-role-appadmin', null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-ApprovalTemplate', 'DEF-role-configadmin', null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');

-- Report admin function  grant to appadmin
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-reportTemplate', 'IConnect', 'Admin reportTemplate User',null, 'reportTemplate', 'WEBURI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-reportTemplate', 'IConnect', 'FUNCTION--reportTemplate',null, '-', 'FUNCTION',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-reportTemplateQuery', 'IConnect', 'reportTemplate Query',null,'/api/reports/*[GET]', 'URI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-reportTemplate', 'DEF-func-reportTemplate',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-reportTemplateQuery', 'DEF-func-reportTemplate',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-reportTemplate', 'DEF-role-appadmin',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');

INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-generatedReport', 'IConnect', 'Admin generatedReport User',null, 'generatedReport', 'WEBURI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-generatedReport', 'IConnect', 'FUNCTION--generatedReport',null, '-', 'FUNCTION',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-generatedReportQuery', 'IConnect', 'generatedReport Query',null,'/api/reportTemplate/*[GET]', 'URI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-generatedReport', 'DEF-func-generatedReport',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-generatedReportQuery', 'DEF-func-generatedReport',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-generatedReport', 'DEF-role-appadmin',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');

-- WorkFlow admin function  grant to appadmin
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-activiti', 'IConnect', 'Admin activiti User',null, 'activiti', 'WEBURI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-activiti', 'IConnect', 'FUNCTION--activiti',null, '-', 'FUNCTION',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-activitiQuery', 'IConnect', 'activiti Query',null,'/api/workflow/*[GET]', 'URI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-activiti', 'DEF-func-activiti',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-activitiQuery', 'DEF-func-activiti',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-activiti', 'DEF-role-appadmin',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');

INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-inbox', 'IConnect', 'Admin inbox User',null, 'inbox', 'WEBURI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-inbox', 'IConnect', 'FUNCTION--inbox',null, '-', 'FUNCTION',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-inboxQuery', 'IConnect', 'inbox Query',null,'/api/workflow/*[GET]', 'URI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-inbox', 'DEF-func-inbox',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-inboxQuery', 'DEF-func-inbox',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-inbox', 'DEF-role-appadmin',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');

-- WorkFlow admin function  grant to appadmin
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-jobInstance', 'IConnect', 'Admin jobInstance User',null, 'job-instance', 'WEBURI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-jobInstance', 'IConnect', 'FUNCTION--jobInstance',null, '-', 'FUNCTION',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-jobInstanceQuery', 'IConnect', 'jobInstance Query',null,'/api/job-instances/*[GET]', 'URI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-jobInstance', 'DEF-func-jobInstance',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-jobInstanceQuery', 'DEF-func-jobInstance',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-jobInstance', 'DEF-role-appadmin',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');

INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-jobExecution', 'IConnect', 'Admin jobExecution User',null, 'job-execution', 'WEBURI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-jobExecution', 'IConnect', 'FUNCTION--jobExecution',null, '-', 'FUNCTION',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-jobExecutionQuery', 'IConnect', 'jobExecution Query',null,'/api/job-executions/*[GET]', 'URI',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-jobExecution', 'DEF-func-jobExecution',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-jobExecutionQuery', 'DEF-func-jobExecution',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-jobExecution', 'DEF-role-appadmin',null,null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
