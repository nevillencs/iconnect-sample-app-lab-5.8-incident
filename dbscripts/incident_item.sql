DROP TABLE IF EXISTS `tbl_incident`;
CREATE TABLE `tbl_incident` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `incident_date` date NOT NULL,
  `incident_name` varchar(20) NOT NULL,
  `incident_reference_id` varchar(6) NOT NULL,
  `incident_status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;


DROP TABLE IF EXISTS `tbl_item`;
CREATE TABLE `tbl_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(20) DEFAULT NULL,
  `item_reference_id` varchar(6) NOT NULL,
  `incident_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  CONSTRAINT `tbl_item_ibfk_1` FOREIGN KEY (`incident_id`) REFERENCES `tbl_incident` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

    create table iflow_approval_history (
       id bigint not null auto_increment,
        act_user_id varchar(255),
        action_date date,
        action_name varchar(255),
        comment longtext,
        new_req_status varchar(255),
        old_req_status varchar(255),
        request_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table iflow_approval_template (
       id varchar(255) not null,
        created_by varchar(255),
        created_dt datetime,
        updated_by varchar(255),
        updated_dt datetime,
        version integer not null,
        approval_behavior varchar(255) not null,
        approver_selection varchar(255) not null,
        enable_reject_all bit not null,
        enable_reject_step bit not null,
        enable_reject_to_applicant bit not null,
        multi_instance_type varchar(255) not null,
        process_owner varchar(255),
        request_type_key varchar(255) not null,
        template_key varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table iflow_approval_template_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype tinyint,
        created_by varchar(255),
        created_dt datetime,
        updated_by varchar(255),
        updated_dt datetime,
        version integer,
        approval_behavior varchar(255),
        approver_selection varchar(255),
        enable_reject_all bit,
        enable_reject_step bit,
        enable_reject_to_applicant bit,
        multi_instance_type varchar(255),
        process_owner varchar(255),
        request_type_key varchar(255),
        template_key varchar(255),
        primary key (id, rev)
    ) engine=InnoDB;

    create table iflow_approval_template_data (
       id varchar(255) not null,
        approver_display_name varchar(255),
        approver_id varchar(255),
        approver_seq integer not null,
        approver_title varchar(255),
        approvaltemplate_id varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table iflow_approval_template_data_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype tinyint,
        approver_display_name varchar(255),
        approver_id varchar(255),
        approver_seq integer,
        approver_title varchar(255),
        approvaltemplate_id varchar(255),
        primary key (id, rev)
    ) engine=InnoDB;

    create table iflow_approver (
       id bigint not null auto_increment,
        actual_approver_id varchar(255),
        approval_status varchar(255),
        approver_display_name varchar(255),
        approver_id varchar(255) not null,
        approver_seq integer not null,
        approver_title varchar(255),
        task_assigned_date date,
        task_completion_date date,
        request_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table iflow_attachment (
       id bigint not null auto_increment,
        approval_request_field_key varchar(255),
        file_name varchar(255),
        file_size bigint,
        file_type varchar(255),
        uploaded_date date,
        request_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table iflow_attachment_data (
       attachment_id bigint not null,
        attachment_data longblob,
        primary key (attachment_id)
    ) engine=InnoDB;

    create table iflow_req_general_approval (
       id bigint not null auto_increment,
        description varchar(4000),
        template_key varchar(255) not null,
        request_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table iflow_request (
       id bigint not null auto_increment,
        approval_behavior integer not null,
        approver_selection integer not null,
        completed_date date,
        created_date date not null,
        enable_reject_all bit,
        enable_reject_step bit,
        enable_reject_to_applicant bit,
        initiator varchar(255) not null,
        request_key varchar(255) not null,
        multi_instance_type varchar(255) not null,
        approval_status varchar(255),
        submitted_date date,
        summary varchar(255) not null,
        template_id varchar(255),
        updated_by varchar(255),
        updated_date date,
        primary key (id)
    ) engine=InnoDB;

    alter table tbl_aa_subject_aud
       add column version integer;

    alter table tbl_aa_subject_login_aud
       add column version integer;

    alter table tbl_code_int_aud
       add column version integer;

    alter table tbl_code_int
       add constraint UKqnygch9ujsv4fbwlowru9xn5v unique (codetype_id, code_id, locale);

    alter table tbl_codetype
       add constraint UKrq1qu8i1ak93so791m5bxagjj unique (app_id, codetype_id);

    alter table iflow_approval_history
       add constraint FK3nyl1j44w87oy5cyof1jhqmfp
       foreign key (request_id)
       references iflow_request (id);

    alter table iflow_approval_template_aud
       add constraint FK1l0jitimjpspqxcoq7o3h8cn0
       foreign key (rev)
       references tbl_audit_rev_info (id);

    alter table iflow_approval_template_data
       add constraint FKqlnflnb6kbjv172xf1bqt14mr
       foreign key (approvaltemplate_id)
       references iflow_approval_template (id);

    alter table iflow_approval_template_data_aud
       add constraint FKa4cinad6duxv9j2kf6vnjyc0c
       foreign key (rev)
       references tbl_audit_rev_info (id);

    alter table iflow_approver
       add constraint FKs8ybavpqx17c0hqfq0ukjws3a
       foreign key (request_id)
       references iflow_request (id);

    alter table iflow_attachment
       add constraint FKr82omejm6g1ho9k8x7knyu4o9
       foreign key (request_id)
       references iflow_request (id);

    alter table iflow_req_general_approval
       add constraint FKom44bqjeg1tohdp7bmgx193ar
       foreign key (request_id)
       references iflow_request (id);

    alter table tbl_aa_group
       add constraint FKl3dngjggjbs81vhy9vi9in6p7
       foreign key (group_parent_id)
       references tbl_aa_group (group_id);

    alter table tbl_aa_group2res
       add constraint FKp96rxi6x0ys313h2e6fo4x681
       foreign key (group_id)
       references tbl_aa_group (group_id);

    alter table tbl_aa_group2res
       add constraint FK1036r4do1vx26cb4pq7r0ekr3
       foreign key (resources_id)
       references tbl_aa_resources (resources_id);

    alter table tbl_aa_res2res
       add constraint FKgttn76xtnj624dcrf5dr84qq2
       foreign key (parent_res_id)
       references tbl_aa_resources (resources_id);

    alter table tbl_aa_res2res
       add constraint FK864eojudhiybflo08mgwf3kgh
       foreign key (resources_id)
       references tbl_aa_resources (resources_id);

    alter table tbl_aa_resources
       add constraint FK8citvikeypuculjv433h2mj98
       foreign key (app_id)
       references tbl_aa_app (app_id);

    alter table tbl_aa_subject2group
       add constraint FKatc341w8lonxhafjb1r2c7bq5
       foreign key (group_id)
       references tbl_aa_group (group_id);
    alter table tbl_aa_subject2group
       add constraint FK8ovoowdele802f0hmp07m0rms
       foreign key (subject_id)
       references tbl_aa_subject (subject_id);

    alter table tbl_aa_subject2res
       add constraint FKdp0pvt2fi5xm2gorfsijn30d2
       foreign key (resources_id)
       references tbl_aa_resources (resources_id);

    alter table tbl_aa_subject2res
       add constraint FKgo49wxi8yw26vkfsteubcq4ry
       foreign key (subject_id)
       references tbl_aa_subject (subject_id);

    alter table tbl_aa_subject_aud
       add constraint FK69diw02m2opqjd2nv26uueumq
       foreign key (rev)
       references tbl_audit_rev_info (id);

    alter table tbl_aa_subject_login
       add constraint FK7pf3i8480y9xrlqo1qfqs0r6i
       foreign key (subject_id)
       references tbl_aa_subject (subject_id);

    alter table tbl_aa_subject_login_aud
       add constraint FKd4vqymuflwa43cbo1avxt5yvw
       foreign key (rev)
       references tbl_audit_rev_info (id);

    alter table tbl_aa_user_token_info_aud
       add constraint FK1fftpwlwa5rlvi4yucjre4u3d
       foreign key (rev)
       references tbl_audit_rev_info (id);

    alter table tbl_audit_rev_info_ass
       add constraint FK8c5i11ei5tcioww9f4bfh5d48
       foreign key (rev_id)
       references tbl_audit_rev_info (id);
    alter table tbl_code_int
       add constraint FKq93ciewrafc8up71imn7ojxhd
       foreign key (codetype_id)
       references tbl_codetype (id);

    alter table tbl_code_int_aud
       add constraint FK8ef8db4s0f0mu785y303dq0b3
       foreign key (rev)
       references tbl_audit_rev_info (id);

    alter table tbl_codetype_aud
       add constraint FKmymikclg1nhgkwoj8ds7js9yo
       foreign key (rev)
       references tbl_audit_rev_info (id);

    alter table tbl_persistent_audit_evt_data
       add constraint FKi07h7oyh70igwu1rb02ulld15
       foreign key (event_id)
       references tbl_persistent_audit_event (event_id);
