-- ----------------------------
-- Records of tbl_aa_app
-- ----------------------------
INSERT INTO `TBL_AA_APP` VALUES ('IConnect', 'IConnect', 'IConnect', 'IConnect', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

-- ----------------------------
-- Records of tbl_aa_group
-- ----------------------------
INSERT INTO `TBL_AA_GROUP` VALUES ('DEF-group-groupA', 'GROUP A', null, null, 'DEF-group-organization', '8', '9', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP` VALUES ('DEF-group-organization', 'ORGANIZATION_GROUP', null, null, 'REQ-group-intranet', '7', '10', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP` VALUES ('REQ-group-extranet', 'EXTRANET_GROUP', null, null, 'REQ-group-universal', '4', '5', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP` VALUES ('REQ-group-internet', 'INTERNET_GROUP', null, null, 'REQ-group-universal', '2', '3', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP` VALUES ('REQ-group-intranet', 'INTRANET_GROUP', null, null, 'REQ-group-universal', '6', '11', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP` VALUES ('REQ-group-universal', 'UNIVERSAL_GROUP', null, null, null, '1', '12', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

-- ----------------------------
-- Records of tbl_aa_group_admin
-- ----------------------------
INSERT INTO `TBL_AA_GROUP_ADMIN` VALUES ('REQ-group-universal', 'S', 'DEF-user-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP_ADMIN` VALUES ('REQ-group-universal', 'S', 'DEF-user-configadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP_ADMIN` VALUES ('REQ-group-universal', 'S', 'DEF-user-groupadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP_ADMIN` VALUES ('REQ-group-universal', 'S', 'DEF-user-roleadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_GROUP_ADMIN` VALUES ('REQ-group-universal', 'S', 'DEF-user-useradmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

-- ----------------------------
-- Records of tbl_aa_res2res
-- ----------------------------
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-application', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-delegate', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-delegate', 'DEF-role-configadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-delegate', 'DEF-role-groupadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-delegate', 'DEF-role-roleadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-delegate', 'DEF-role-useradmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-function', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-group', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-group', 'DEF-role-groupadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-loginlog', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-loginlog', 'DEF-role-configadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-loginlog', 'DEF-role-useradmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-report', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-report', 'DEF-role-configadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-role', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-role', 'DEF-role-roleadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-user', 'DEF-role-appadmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-func-acm-user', 'DEF-role-useradmin', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-res-acm-application', 'DEF-func-acm-application', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-res-acm-delegate', 'DEF-func-acm-delegate', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-res-acm-function', 'DEF-func-acm-function', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-res-acm-group', 'DEF-func-acm-group', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-res-acm-loginlog', 'DEF-func-acm-report', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-res-acm-report', 'DEF-func-acm-loginlog', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-res-acm-role', 'DEF-func-acm-role', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RES2RES` VALUES ('DEF-res-acm-user', 'DEF-func-acm-user', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

-- ----------------------------
-- Records of TBL_AA_RESOURCES
-- ----------------------------
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-func-acm-application', 'IConnect', 'FUNCTION-Maintain Application', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-func-acm-delegate', 'IConnect', 'FUNCTION-Delegate Duties', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-func-acm-function', 'IConnect', 'FUNCTION-Maintian Function', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-func-acm-group', 'IConnect', 'FUNCTION-Maintian Group', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-func-acm-loginlog', 'IConnect', 'FUNCTION-View Login Log', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-func-acm-report', 'IConnect', 'FUNCTION-ACM Report', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-func-acm-role', 'IConnect', 'FUNCTION-Maintian Role', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-func-acm-user', 'IConnect', 'FUNCTION-Maintian User', null, '-', 'FUNCTION', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-res-acm-application', 'IConnect', 'ACM-RESOURCES-Application', null, '/view/app/', 'URI', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-res-acm-delegate', 'IConnect', 'ACM-RESOURCES-Delegate', null, '/view/user/userDelegation', 'URI', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-res-acm-function', 'IConnect', 'ACM-RESOURCES-Function', null, '/view/func/', 'URI', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-res-acm-group', 'IConnect', 'ACM-RESOURCES-Group', null, '/view/ga/', 'URI', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-res-acm-loginlog', 'IConnect', 'ACM-RESOURCES-Login Log', null, '/view/loginlog/', 'URI', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-res-acm-report', 'IConnect', 'ACM-RESOURCES-Report', null, '/view/report/', 'URI', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-res-acm-role', 'IConnect', 'ACM-RESOURCES-Role', null, '/view/role/', 'URI', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-res-acm-user', 'IConnect', 'ACM-RESOURCES-User', null, '/view/user/', 'URI', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-appadmin', 'IConnect', 'Application Admin Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-configadmin', 'IConnect', 'Config Admin Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-groupadmin', 'IConnect', 'Group Admin Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-internetuser', 'IConnect', 'Internet User Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-intranetuser', 'IConnect', 'Intranet User Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-partner1', 'IConnect', 'Extranet Partner1 Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-partner2', 'IConnect', 'Extranet Partner2 Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-roleadmin', 'IConnect', 'Role Admin Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_RESOURCES` VALUES ('DEF-role-useradmin', 'IConnect', 'User Admin Role', null, '-', 'LOG_ROLE', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

-- ----------------------------
-- Records of TBL_AA_SUBJECT
-- ----------------------------
INSERT INTO `TBL_AA_SUBJECT` VALUES ('DEF-user-appadmin', 'Application', 'Admin', 'appadmin@ncs.com.sg', null, null, null, 'A', '0', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT` VALUES ('DEF-user-configadmin', 'Config', 'Admin', 'configadmin@ncs.com.sg', null, null, null, 'A', '0', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT` VALUES ('DEF-user-groupadmin', 'Group', 'Admin', 'appadmin@ncs.com.sg', null, null, null, 'A', '0', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT` VALUES ('DEF-user-roleadmin', 'Role', 'Admin', 'roleadmin@ncs.com.sg', null, null, null, 'A', '0', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT` VALUES ('DEF-user-useradmin', 'User', 'Admin', 'useradmin@ncs.com.sg', null, null, null, 'A', '0', null, null, '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

-- ----------------------------
-- Records of TBL_AA_SUBJECT_LOGIN
-- ----------------------------
INSERT INTO `TBL_AA_SUBJECT_LOGIN` VALUES ('DEF-user-appadmin', 'PASSWORD', 'appadmin', '{bcrypt}$2a$10$y3AYlVF5VfBrb7hfWScK7ezDmpagkMn/HCdCAluM46DBy.JbPtHwK', null, null, null, '0', null, 'SYSTEM', null, 'SYSTEM', '0');
INSERT INTO `TBL_AA_SUBJECT_LOGIN` VALUES ('DEF-user-configadmin', 'PASSWORD', 'configadmin', '{bcrypt}$2a$10$NfpXbHgJnYZlI6YygTlLl.YhDJrxt0i0YwD02qQ.qdE503t9ph2QC', null, null, null, '0', null, 'SYSTEM', null, 'SYSTEM', '0');
INSERT INTO `TBL_AA_SUBJECT_LOGIN` VALUES ('DEF-user-groupadmin', 'PASSWORD', 'groupadmin', '{bcrypt}$2a$10$/JfqWpn1KhVV2mWxON03GewFpZM0zM0wX1yFzYWvr8z7a0Fv2cU/i', null, null, null, '0', null, 'SYSTEM', null, 'SYSTEM', '0');
INSERT INTO `TBL_AA_SUBJECT_LOGIN` VALUES ('DEF-user-roleadmin', 'PASSWORD', 'roleadmin', '{bcrypt}$2a$10$pLtVRmw.Lgy65YOkFWPLhOU7xIhR.DGBKjqHWV3Mt8u7WuILYkRKu', null, null, null, '0', null, 'SYSTEM', null, 'SYSTEM', '0');
INSERT INTO `TBL_AA_SUBJECT_LOGIN` VALUES ('DEF-user-useradmin', 'PASSWORD', 'useradmin', '{bcrypt}$2a$10$D0tl0BLYlQMEbpLSWCUCauEdV.YdSMlTtu3jFJUpUkN2OCQ3oZBIC', null, null, null, '0', null, 'SYSTEM', null, 'SYSTEM', '0');

-- ----------------------------
-- Records of TBL_AA_SUBJECT2GROUP
-- ----------------------------
INSERT INTO `TBL_AA_SUBJECT2GROUP` VALUES ('DEF-user-appadmin', 'REQ-group-universal', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT2GROUP` VALUES ('DEF-user-configadmin', 'REQ-group-universal', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT2GROUP` VALUES ('DEF-user-groupadmin', 'REQ-group-universal', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT2GROUP` VALUES ('DEF-user-roleadmin', 'REQ-group-universal', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT2GROUP` VALUES ('DEF-user-useradmin', 'REQ-group-universal', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');

-- ----------------------------
-- Records of TBL_AA_SUBJECT2RES
-- ----------------------------
INSERT INTO `TBL_AA_SUBJECT2RES` VALUES ('DEF-user-appadmin', 'DEF-role-appadmin', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT2RES` VALUES ('DEF-user-configadmin', 'DEF-role-configadmin', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT2RES` VALUES ('DEF-user-groupadmin', 'DEF-role-groupadmin', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT2RES` VALUES ('DEF-user-roleadmin', 'DEF-role-roleadmin', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO `TBL_AA_SUBJECT2RES` VALUES ('DEF-user-useradmin', 'DEF-role-useradmin', '2017-01-01 00:00:00', 'SYSTEM', null, null, '0');