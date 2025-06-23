delete from TBL_AA_RES2RES where resources_id='DEF-func-maintain-codeadmin';
delete from TBL_AA_RES2RES where parent_res_id='DEF-func-maintain-codeadmin';
delete from TBL_AA_RES2RES where resources_id like 'DEF-uri-codeadmin-%';
delete from TBL_AA_RESOURCES where resources_id='DEF-func-maintain-codeadmin';
delete from TBL_AA_RESOURCES where resources_id='DEF-weburi-codeadmin-type-m';
delete from TBL_AA_RESOURCES where resources_id='DEF-weburi-codeadmin-code-m';
delete from TBL_AA_RESOURCES where resources_id like 'DEF-uri-codeadmin-%';




-- URI--
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-get', 'IConnect', 'CodeAdmin_App_List', 'Get application list','/api/appList**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-type-getall', 'IConnect', 'CodeAdmin_Get_All_CodeTypes', 'Get code types by application','/api/codeType**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-itype-get', 'IConnect', 'CodeAdmin_Get_Internal_CodeTypes', 'Get internal code types','/api/internalCodeType**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-ipType-get', 'IConnect', 'CodeAdmin_Get_Internal_Parent_Codetype', 'Get internal parent code types','/api/internalParentCodeTypes**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-exType-get', 'IConnect', 'CodeAdmin_Get_External_Codetype', 'Get external codetype','/api/externalCodeType**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-type-search', 'IConnect', 'CodeAdmin_Search_Codetype', 'Search codetypes','/api/codeTypes**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-getTypeById', 'IConnect', 'CodeAdmin_Get_Codetype_By_Id', 'Get codetype by id','/api/codeType/**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-createType', 'IConnect', 'CodeAdmin_Create_Codetype', 'Create codetype','/api/codeType**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-updateType', 'IConnect', 'CodeAdmin_Update_Codetype', 'Update codetype','/api/codeType**/**[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-delTypes', 'IConnect', 'CodeAdmin_Delete_Codetypes', 'Delete codetypes','/api/codeTypes**/**[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-searchCodes', 'IConnect', 'CodeAdmin_Search_Codes', 'Search codes','/api/codes**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-code-getbyid', 'IConnect', 'CodeAdmin_Get_Code_By_Id', 'Get code by Id','/api/code**/**[GET]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-code-create', 'IConnect', 'CodeAdmin_Create_Code', 'Create code','/api/code*/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-cCodes-add', 'IConnect', 'CodeAdmin_Add_ChildCodes', 'Add child codes','/api/codes**/**[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-code-update', 'IConnect', 'CodeAdmin_Update_Code', 'Update code','/api/code**/**[PUT]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-codes-del', 'IConnect', 'CodeAdmin_Delete_Codes', 'Delete codes','/api/code**/**[DELETE]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-codeadmin-codes-reml', 'IConnect', 'CodeAdmin_Remove_Codes', 'Update code','/api/codes**/**[POST]', 'URI', null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- code WEBURI
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-codeadmin-menu', 'IConnect', 'Maintain Code Menu',null, 'admin/ic-codetype', 'WEBURI',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '0');

-- Function --
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-maintain-codeadmin', 'IConnect', 'Codeadmin Function', null,'-', 'FUNCTION',null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '0');

-- function2res--
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-get', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-type-getall', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-itype-get', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-ipType-get', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-exType-get', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-type-search', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-getTypeById', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-createType', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-updateType', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-delTypes', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-searchCodes', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-code-getbyid', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-code-create', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-cCodes-add', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-code-update', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-codes-del', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-codeadmin-codes-reml', 'DEF-func-maintain-codeadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');

-- role2function--
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-maintain-codeadmin', 'DEF-role-appadmin',  null, null, '2016-06-01 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-maintain-codeadmin', 'DEF-role-configadmin',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-codeadmin-menu', 'DEF-func-maintain-codeadmin',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2016-06-01 00:00:00', 'SYSTEM', '1');

