-- delte query Audit function
delete from TBL_AA_RES2RES where resources_id='DEF-func-queryAudit';
delete from TBL_AA_RES2RES where parent_res_id='DEF-func-queryAudit';
delete from TBL_AA_RESOURCES where resources_id='DEF-func-queryAudit';
delete from TBL_AA_RESOURCES where resources_id='DEF-weburi-queryAudit';
delete from TBL_AA_RESOURCES where resources_id='DEF-uri-queryAudit';

-- delte event Audit function
delete from TBL_AA_RES2RES where resources_id='DEF-func-EventAudit';
delete from TBL_AA_RES2RES where parent_res_id='DEF-func-EventAudit';
delete from TBL_AA_RESOURCES where resources_id='DEF-weburi-EventAudit';
delete from TBL_AA_RESOURCES where resources_id='DEF-func-EventAudit';
delete from TBL_AA_RESOURCES where resources_id='DEF-uri-eventAuditQuery';


-- For entity query Audit function and grant to appadmin --
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-queryAudit', 'IConnect', 'FUNCTION-Query Audit Log', null, '-', 'FUNCTION', null, null, '2018-05-09 00:00:00', 'SYSTEM', null, null, '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-queryAudit', 'IConnect', 'Maintain Audit Menu',null, 'admin/ic-entityaudit', 'WEBURI',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-queryAudit', 'IConnect', 'Get applications', null,'/api/log/audit[GET]', 'URI', null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '0');

INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-queryAudit', 'DEF-func-queryAudit',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-queryAudit', 'DEF-func-queryAudit',  null, null, '2018-05-09 00:00:00', 'SYSTEM', '2018-05-09 00:00:00', 'SYSTEM', '1');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-queryAudit', 'DEF-role-appadmin', null, null, '2018-05-09 00:00:00', 'SYSTEM', null, null, '0');


-- event audits
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-weburi-EventAudit', 'IConnect', 'Admin Audit-Event Audit',null, 'audits', 'WEBURI',  null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-func-EventAudit', 'IConnect', 'FUNCTION--Event Audit', null, '-', 'FUNCTION', null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RESOURCES VALUES ('DEF-uri-eventAuditQuery', 'IConnect', 'Event Audit Query', null,'/management/audits[GET]', 'URI', null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-weburi-EventAudit', 'DEF-func-EventAudit',  null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-uri-eventAuditQuery', 'DEF-func-EventAudit',  null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');
INSERT INTO TBL_AA_RES2RES VALUES ('DEF-func-EventAudit', 'DEF-role-appadmin', null, null, now(), 'SYSTEM', now(), 'SYSTEM', '0');


