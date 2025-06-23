delete from TBL_AA_RES2RES where resources_id='DEF-func-maintain-param';
delete from TBL_AA_RES2RES where parent_res_id='DEF-func-maintain-param';
delete from TBL_AA_RES2RES where resources_id like 'DEF-uri-param-%';
delete from TBL_AA_RESOURCES where resources_id='DEF-func-maintain-param';
delete from TBL_AA_RESOURCES where resources_id='DEF-weburi-param';
delete from TBL_AA_RESOURCES where resources_id like 'DEF-uri-param-%';


-- URI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-param-get', 'IConnect', 'Param_Get', 'Get paramter','/paramadmin**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-param-create', 'IConnect', 'Param_Create', 'Create Parameter','/paramadmin**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-param-update', 'IConnect', 'Param_Update', 'Update Parameter','/paramadmin**/**[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-param-GetByAppAndKey', 'IConnect', 'Param_Get_By_App_And_Key', 'Get parameter by application and parameter key','/paramadmin/*/*[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-param-delete', 'IConnect', 'Param_Delete', 'Delete parameter','/paramadmin**[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-param-deleteByAppAndKey', 'IConnect', 'Param_Delete_By_App_And_Key', 'Delete parameter','/paramadmin/*/*[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-param-getAllByApp', 'IConnect', 'Param_Get_All_By_App', 'Get all parameters by application','/paramadmin/paramkeys**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- For applications WEBURI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-param', 'IConnect', 'Maintain Parameter Menu',null, 'admin/ic-param', 'WEBURI',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- Function --
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-maintain-param', 'IConnect', 'Maintain Parameters', null,'-', 'FUNCTION',null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- function2res--
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-param-get', 'DEF-func-maintain-param',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-param-create', 'DEF-func-maintain-param',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-param-update', 'DEF-func-maintain-param',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-param-GetByAppAndKey', 'DEF-func-maintain-param',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-param-delete', 'DEF-func-maintain-param',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-param-deleteByAppAndKey', 'DEF-func-maintain-param',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-param-getAllByApp', 'DEF-func-maintain-param',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-param', 'DEF-func-maintain-param',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');

-- role2function--
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-maintain-param', 'DEF-role-appadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');

-- grant parameter to configadmin
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-maintain-param', 'DEF-role-configadmin',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '1');

-- configadmin need /api/applicationList url ,grant this uri
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-app-getById', 'DEF-func-maintain-param',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '1');
