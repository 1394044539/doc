/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/9/6 17:17:13                            */
/*==============================================================*/


drop table if exists novel;

drop table if exists novel_chapter;

drop table if exists novel_comment;

drop table if exists novel_data;

drop table if exists novel_file;

drop table if exists novel_type_rel;

drop table if exists novel_volume;

drop table if exists sys_dict;

drop table if exists sys_dict_param;

drop table if exists sys_log;

drop table if exists sys_notice;

drop table if exists sys_permission;

drop table if exists sys_role;

drop table if exists sys_role_permission;

drop table if exists sys_user;

drop table if exists sys_user_role;

drop table if exists user_collection;

/*==============================================================*/
/* Table: novel                                                 */
/*==============================================================*/
create table novel
(
   novel_id             varchar(32) not null comment '����id',
   novel_author         varchar(32) comment '����',
   public_time          datetime comment '��������',
   novel_name           varchar(128) comment 'С˵��',
   total_line           int comment '������',
   total_word           bigint comment '������',
   novel_img            varchar(512) comment '����',
   novel_desc           varchar(512) comment 'С˵����',
   novel_introduce      varchar(1024) comment 'С˵����',
   novel_hot            bigint comment 'С˵�ȶ�',
   novel_up             bigint comment 'С˵���޴���',
   novel_click          bigint comment 'С˵�������',
   novel_comment        bigint comment 'С˵���۴���',
   novel_share          bigint comment 'С˵�������',
   novel_collect        bigint comment 'С˵�ղش���',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (novel_id)
)
type = InnoDB;

alter table novel comment 'С˵��';

/*==============================================================*/
/* Table: novel_chapter                                         */
/*==============================================================*/
create table novel_chapter
(
   chapter_id           varchar(32) not null comment '����id',
   volume_id            varchar(32) comment '�־�id',
   chapter_name         varchar(128) comment '�½���',
   chapter_order        int comment '�½�����',
   start_line           int comment '��ʼ����',
   end_line             int comment '��������',
   total_line           int comment '������',
   epub_path            varchar(64) comment 'epub·��',
   parent_id            varchar(32) comment '���½�id',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (chapter_id)
)
type = InnoDB;

alter table novel_chapter comment 'С˵�½ڱ�';

/*==============================================================*/
/* Table: novel_comment                                         */
/*==============================================================*/
create table novel_comment
(
   comment_id           varchar(32) comment '����id',
   comment_type         tinyint comment '��������(0:С˵,1:�־�,2:�½�)',
   novel_id             varchar(32) comment 'С˵id',
   volume_id            varchar(32) comment '�־�id',
   chapter_id           varchar(32) comment '�½�id',
   comment_content      varchar(512) comment '��������',
   comment_level        tinyint comment '���۲㼶(0:��һ������,1:�ظ���һ�����۵���,2:�ظ��ڶ����˵ģ�ʣ�µĶ��������)',
   reply_id             varchar(32) comment '�ظ�������id',
   comment_up           bigint comment '���۵�����',
   comment_num          bigint comment '��������',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����'
)
type = InnoDB;

alter table novel_comment comment 'С˵���۱�';

/*==============================================================*/
/* Table: novel_data                                            */
/*==============================================================*/
create table novel_data
(
   novel_data_id        varchar(32) not null comment 'С˵��������',
   novel_id             varchar(32) comment 'С˵id',
   total_hot            bigint comment '���ȶ�',
   total_up             bigint comment '�ܵ���',
   total_click          bigint comment '�ܵ��',
   total_comment        bigint comment '������',
   total_collect        bigint comment '���ղ�',
   total_share          bigint comment '�ܷ���',
   month_hot            bigint comment '���ȶ�',
   month_up             bigint comment '�µ���',
   month_click          bigint comment '�µ��',
   month_comment        bigint comment '������',
   month_collect        bigint comment '���ղ�',
   month_share          bigint comment '�·���',
   week_hot             bigint comment '���ȶ�',
   week_up              bigint comment '�ܵ���',
   week_clike           bigint comment '�ܵ��',
   week_comment         bigint comment '������',
   week_collect         bigint comment '���ղ�',
   week_share           bigint comment '�ܷ���',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (novel_data_id)
)
type = InnoDB;

alter table novel_data comment 'С˵���ݱ�';

/*==============================================================*/
/* Table: novel_file                                            */
/*==============================================================*/
create table novel_file
(
   file_id              varchar(32) not null comment '�ļ�id',
   file_name            varchar(128) comment '�ļ���',
   file_path            varchar(512) comment '�ļ�·��',
   file_type            varchar(16) comment '�ļ�����',
   file_md5             varchar(32) comment '�ļ�md5',
   file_size            bigint(20) comment '�ļ���С',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (file_id)
)
type = InnoDB;

alter table novel_file comment 'С˵�ļ���';

/*==============================================================*/
/* Table: novel_type_rel                                        */
/*==============================================================*/
create table novel_type_rel
(
   novel_type_rel_id    varchar(32) not null comment '����id',
   novel_id             varchar(32) comment 'С˵id',
   type_code            varchar(32) comment '���ͱ���',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (novel_type_rel_id)
)
type = InnoDB;

alter table novel_type_rel comment 'С˵���͹�����';

/*==============================================================*/
/* Table: novel_volume                                          */
/*==============================================================*/
create table novel_volume
(
   volume_id            varchar(32) not null comment '����id',
   novel_id             varchar(32) comment 'С˵id',
   file_id              varchar(32) comment '�ļ�id',
   volume_name          varchar(128) comment '�־���',
   volume_img           varchar(512) comment '����',
   public_time          datetime comment '����ʱ��',
   volume_desc          varchar(1024) comment '�־�����',
   volume_order         int comment '�־�����',
   total_line           int comment '������',
   total_word           bigint comment '������',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (volume_id)
)
type = InnoDB;

alter table novel_volume comment 'С˵�־��';

/*==============================================================*/
/* Table: sys_dict                                              */
/*==============================================================*/
create table sys_dict
(
   dict_id              varchar(32) not null comment '����id',
   dict_code            varchar(32) comment '�ֵ����',
   dict_name            varchar(32) comment '�ֵ�����',
   dict_desc            varchar(512) comment '�ֶ�����',
   dict_type            tinyint(4) comment '�ֵ�����',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (dict_id)
)
type = InnoDB;

alter table sys_dict comment '�ֵ��';

/*==============================================================*/
/* Table: sys_dict_param                                        */
/*==============================================================*/
create table sys_dict_param
(
   dict_param_id        varchar(32) not null comment '����id',
   dict_id              varchar(32) comment '���ֵ�id',
   param_code           varchar(32) comment '��������',
   param_name           varchar(32) comment '��������',
   param_desc           varchar(512 comment '��������',
   param_order          int comment '��������',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (dict_param_id)
)
type = InnoDB;

alter table sys_dict_param comment '�ֶ������';

/*==============================================================*/
/* Table: sys_log                                               */
/*==============================================================*/
create table sys_log
(
   log_id               varchar(32) not null comment '����id',
   operator_user_name   varchar(16) comment '�������û���',
   operator_account_name varchar(16) comment '�������˻�',
   operator_user_id     varchar(32) comment '������id',
   method               varchar(8) comment '����ʽ',
   param                varchar(1024) comment '�������',
   ip                   varchar(16) comment '�����ַ',
   path                 varchar(512) comment '����·��',
   log_desc             varchar(512) comment '��־����',
   log_type             tinyint(4) comment '��־���ͣ�ͨ������0;����Ϊ1��',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (log_id)
)
type = InnoDB;

alter table sys_log comment '��־��';

/*==============================================================*/
/* Table: sys_notice                                            */
/*==============================================================*/
create table sys_notice
(
   notice_id            varchar(32) comment '����id',
   notice_title         varchar(64) comment '�������',
   notice_content       text comment '��������',
   is_open              tinyint comment '�Ƿ���ҳ��(0:��,1:��)',
   main_show            tinyint comment '��ҳչʾ(0:��չʾ,1:չʾ)',
   notice_order         int comment '��ҳ����',
   is_public            tinyint comment '�Ƿ񷢲�(0:��,1:��)',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����'
)
type = InnoDB;

alter table sys_notice comment 'ϵͳ�����';

/*==============================================================*/
/* Table: sys_permission                                        */
/*==============================================================*/
create table sys_permission
(
   permission_id        varchar(32) not null comment '����id',
   permission_code      varchar(16) comment 'Ȩ�ޱ���',
   permission_name      varchar(16) comment 'Ȩ������',
   permission_desc      varchar(512) comment 'Ȩ������',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (permission_id)
)
type = InnoDB;

alter table sys_permission comment 'Ȩ�ޱ�';

/*==============================================================*/
/* Table: sys_role                                              */
/*==============================================================*/
create table sys_role
(
   role_id              varchar(32) not null comment '��ɫid',
   role_code            varchar(16) comment '��ɫ���',
   role_name            varchar(16) comment '��ɫ����',
   role_desc            varchar(512) comment '��ɫ����',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (role_id)
)
type = InnoDB;

alter table sys_role comment '��ɫ��';

/*==============================================================*/
/* Table: sys_role_permission                                   */
/*==============================================================*/
create table sys_role_permission
(
   role_permission_id   varchar(32) not null comment '����id',
   role_id              varchar(32) comment '��ɫid',
   permission_id        varchar(32) comment 'Ȩ��id',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (role_permission_id)
)
type = InnoDB;

alter table sys_role_permission comment '��ɫȨ�޹�����';

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user
(
   user_id              varchar(32) not null comment '����id',
   user_name            varchar(16) comment '�û�����',
   account_name         varchar(16) comment '�û��˺�',
   phone                varchar(15) comment '�ֻ���',
   email                varchar(254) comment '����',
   password             varchar(64) comment '����',
   identity_card        varchar(20) comment '���֤',
   true_name            varchar(8) comment '��ʵ����',
   photo                varchar(128) comment 'ͷ��',
   qq_number            varchar(16) comment 'QQ��',
   wechat_number        varchar(32) comment '΢�ź�',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (user_id)
)
type = InnoDB;

alter table sys_user comment '�û���';

/*==============================================================*/
/* Table: sys_user_role                                         */
/*==============================================================*/
create table sys_user_role
(
   user_role_id         varchar(32) not null comment '����id',
   user_id              varchar(32) comment '�û�id',
   role_id              varchar(32) comment '��ɫid',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����',
   primary key (user_role_id)
)
type = InnoDB;

alter table sys_user_role comment '�û���ɫ������';

/*==============================================================*/
/* Table: user_collection                                       */
/*==============================================================*/
create table user_collection
(
   collection_id        varchar(32) comment '����id',
   collection_type      tinyint comment '�ղ�����(0:�־�,1:С˵,2:�ļ���)',
   catalog_name         varchar(32) comment '�ļ�������',
   parent_id            varchar(32) comment '�ļ���id',
   volume_id            varchar(32) comment '�־�id',
   novel_id             varchar(32) comment 'С˵id',
   create_time          datetime comment '����ʱ��',
   create_by            varchar(32) comment '������',
   update_time          datetime comment '����ʱ��',
   update_by            varchar(32) comment '������',
   is_delete            tinyint(4) comment '0����1����'
)
type = InnoDB;

alter table user_collection comment '�û��ղر�';

