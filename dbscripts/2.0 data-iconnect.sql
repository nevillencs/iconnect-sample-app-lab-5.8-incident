-- ----------------------------
-- Records of TBL_CODETYPE
-- ----------------------------
INSERT INTO `TBL_CODETYPE` VALUES ('acm_res', null, 'acm_res', null, null, 'ACM Resources Type', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('addr_type', null, 'addr_type', null, null, 'Address Type', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('application', null, 'application', null, null, 'Application List', 'TBL_AA_APP', null, 'APP_ID', 'APP_NAME', 'APP_NAME', null, null, null, null, null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('auditLevel', null, 'auditLevel', null, null, 'Log Audit Level', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('boolean_yn', null, 'boolean_yn', null, null, 'Yes / No', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('contact', null, 'contact', null, null, 'Types Of Contact', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('country', null, 'country', null, null, 'Country', 'TBL_CODE_COUNTRY', null, 'COUNTRY_ID', 'COUNTRY_DESC', null, 'STATUS', null, null, 'COUNTRY_LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('dateType', null, 'dateType', null, null, 'time date Type', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);

INSERT INTO `TBL_CODETYPE` VALUES ('loginType', null, 'loginType', null, null, 'loginType', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('martial', null, 'martial', null, null, 'Martial Status', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('process_st', null, 'process_st', null, null, 'Process Status', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('pubDest', null, 'pubDest', null, null, 'publisher Dest', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('pubStatus', null, 'pubStatus', null, null, 'publisher Status', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('rec_type', null, 'rec_type', null, null, 'Record Type', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('salutation', null, 'salutation', null, null, 'Salutation', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('schStatus', null, 'schStatus', null, null, 'Schedule status', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('simple_status', null, 'simple_status', null, null, 'simple status', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('status', null, 'status', null, null, 'Status', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('task_st', null, 'task_st', null, null, 'Task Status', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('translogtype', null, 'translogtype', null, null, 'Transaction Type', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);
INSERT INTO `TBL_CODETYPE` VALUES ('wregion', null, 'wregion', null, null, 'World Region', 'TBL_CODE_INT', 'CODETYPE_ID', 'CODE_ID', 'CODE_DESC', 'CODE_SEQ', null, null, null, 'LOCALE', null, null);


-- ----------------------------
-- Records of TBL_CODE_INT
-- ----------------------------
INSERT INTO `TBL_CODE_INT` VALUES ('acm_res_ACTION', 'acm_res', 'WEBURI', null, null, 'WEBURI', '2', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('acm_res_URI', 'acm_res', 'URI', null, null, 'URI', '1', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('loginType_LDAP', 'loginType', 'LDAP', null, null, 'LDAP Login', '2', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('loginType_PASSWORD', 'loginType', 'PASSWORD', null, null, 'Password Login', '1', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('loginType_SINGPASS', 'loginType', 'SINGPASS', null, null, 'Singpass Login', '3', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('process_st_A', 'process_st', 'A', null, null, 'Active', '1', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('process_st_C', 'process_st', 'C', null, null, 'Completed', '2', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('process_st_F', 'process_st', 'F', null, null, 'Failed', '6', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('process_st_K', 'process_st', 'K', null, null, 'Creating', '5', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('process_st_S', 'process_st', 'S', null, null, 'Suspended', '3', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('process_st_T', 'process_st', 'T', null, null, 'Terminated', '4', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('pubDest_File', 'pubDest', 'File', null, null, 'File', '2', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('pubDest_FTP', 'pubDest', 'FTP', null, null, 'FTP', '1', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('pubStatus_A', 'pubStatus', 'A', null, null, 'Active', '1', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('pubStatus_I', 'pubStatus', 'I', null, null, 'Inactive', '2', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('schStatus_C', 'schStatus', 'C', null, null, 'Successful', '6', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('schStatus_F', 'schStatus', 'F', null, null, 'Failed', '4', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('schStatus_N', 'schStatus', 'N', null, null, 'Unscheduled', '5', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('schStatus_P', 'schStatus', 'P', null, null, 'Published', '2', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('schStatus_S', 'schStatus', 'S', null, null, 'Scheduled', '1', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('schStatus_U', 'schStatus', 'U', null, null, 'Unpublished', '3', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('status_A', 'status', 'A', null, null, 'Active', '1', 'A', null, null, null, '2016-06-13 16:10:19', 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('status_I', 'status', 'I', null, null, 'Inactive', '3', 'A', null, null, null, '2016-06-13 16:10:19', 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('status_P', 'status', 'P', null, null, 'Pending', '5', 'P', null, null, null, '2016-06-13 16:10:19', 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('status_R', 'status', 'R', null, null, 'Revoked', '4', 'A', null, null, null, '2016-06-13 16:10:19', 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('status_S', 'status', 'S', null, null, 'Suspended', '2', 'A', null, null, null, '2016-06-13 16:10:19', 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('task_st_C', 'task_st', 'C', null, null, 'Complete Failed', '3', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('task_st_P', 'task_st', 'P', null, null, 'Processing', '2', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('task_st_S', 'task_st', 'S', null, null, 'Skip Failed', '3', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('task_st_W', 'task_st', 'W', null, null, 'Waiting', '1', 'A', null, null, 'DEF-user-useradmin', null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('translogtype_DELETE', 'translogtype', 'DELETE', null, null, 'DELETE', '3', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('translogtype_INSERT', 'translogtype', 'INSERT', null, null, 'INSERT', '1', 'A', null, null, null, null, 'en', '0');
INSERT INTO `TBL_CODE_INT` VALUES ('translogtype_UPDATE', 'translogtype', 'UPDATE', null, null, 'UPDATE', '2', 'A', null, null, null, null, 'en', '0');

