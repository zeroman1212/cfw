--------------------------------------------
-- Export file for user CFW               --
-- Created by road on 2012/1/20, 15:59:59 --
--------------------------------------------

spool initdb_120120.log

prompt
prompt Creating table SYS_ACCOUNT
prompt ==========================
prompt
create table CFW.SYS_ACCOUNT
(
  ACCOUNT       VARCHAR2(20) not null,
  NAME          VARCHAR2(20) not null,
  PASSWORD      NUMBER(4) not null,
  ROLEID        NUMBER(4) not null,
  SEX           NUMBER(1) not null,
  TELEPHONE     VARCHAR2(30),
  POSITION      VARCHAR2(20),
  CREATETIME    DATE not null,
  CREATEACCOUNT VARCHAR2(20) not null,
  HOMEPAGE      VARCHAR2(100),
  EMAIL         VARCHAR2(50),
  OWNERID       NUMBER(4),
  OWNERTYPE     NUMBER(2),
  NOTE          VARCHAR2(20)
)
tablespace SZHLEEMAS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table CFW.SYS_ACCOUNT
  is 'ϵͳ�û��˺ű�';
comment on column CFW.SYS_ACCOUNT.ACCOUNT
  is '�û��˺�';
comment on column CFW.SYS_ACCOUNT.NAME
  is '�û�����';
comment on column CFW.SYS_ACCOUNT.PASSWORD
  is '�û�����';
comment on column CFW.SYS_ACCOUNT.ROLEID
  is '��ɫ����';
comment on column CFW.SYS_ACCOUNT.SEX
  is '�û��Ա�';
comment on column CFW.SYS_ACCOUNT.TELEPHONE
  is '��ϵ�绰';
comment on column CFW.SYS_ACCOUNT.POSITION
  is 'ְ��';
comment on column CFW.SYS_ACCOUNT.CREATETIME
  is '����ʱ��';
comment on column CFW.SYS_ACCOUNT.CREATEACCOUNT
  is '������';
comment on column CFW.SYS_ACCOUNT.HOMEPAGE
  is '��¼��Ϣ';
comment on column CFW.SYS_ACCOUNT.EMAIL
  is '�����ʼ�';
comment on column CFW.SYS_ACCOUNT.OWNERID
  is '�����������';
comment on column CFW.SYS_ACCOUNT.OWNERTYPE
  is '������������';
comment on column CFW.SYS_ACCOUNT.NOTE
  is '��ע';
alter table CFW.SYS_ACCOUNT
  add constraint PK_SYS_ACCOUNT primary key (ACCOUNT)
  using index 
  tablespace SZHLEEMAS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_DEPARTMENT
prompt =============================
prompt
create table CFW.SYS_DEPARTMENT
(
  DEPARTMENTID  NUMBER(4) not null,
  DISC          VARCHAR2(20) not null,
  OWNERTYPE     NUMBER(4) not null,
  OWNERID       NUMBER(4) not null,
  CREATETIME    DATE not null,
  CREATEACCOUNT VARCHAR2(20) not null
)
tablespace SZHLEEMAS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table CFW.SYS_DEPARTMENT
  is '���Ŷ����';
comment on column CFW.SYS_DEPARTMENT.DEPARTMENTID
  is '���ű���';
comment on column CFW.SYS_DEPARTMENT.DISC
  is '��������';
comment on column CFW.SYS_DEPARTMENT.OWNERTYPE
  is '�ϼ��������';
comment on column CFW.SYS_DEPARTMENT.OWNERID
  is '�ϼ����ű���';
comment on column CFW.SYS_DEPARTMENT.CREATETIME
  is '����ʱ��';
comment on column CFW.SYS_DEPARTMENT.CREATEACCOUNT
  is '������';
alter table CFW.SYS_DEPARTMENT
  add constraint SYS_SYS_DEPARTMENT primary key (DEPARTMENTID)
  using index 
  tablespace SZHLEEMAS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_MODULEDEF
prompt ============================
prompt
create table CFW.SYS_MODULEDEF
(
  MODULEID       VARCHAR2(8) not null,
  SYSTEMID       NUMBER(1) not null,
  NAME           VARCHAR2(20) not null,
  MASK           NUMBER(2) not null,
  IPGROUPID      NUMBER(4),
  URL            VARCHAR2(100),
  PARENTMODULEID VARCHAR2(8) not null,
  SORTNO         NUMBER(2) not null,
  ICON           VARCHAR2(100),
  NOTE           VARCHAR2(100)
)
tablespace SZHLEEMAS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table CFW.SYS_MODULEDEF
  is 'ϵͳ����ģ�鶨���';
comment on column CFW.SYS_MODULEDEF.MODULEID
  is 'ģ�����';
comment on column CFW.SYS_MODULEDEF.SYSTEMID
  is '��ϵͳ����';
comment on column CFW.SYS_MODULEDEF.NAME
  is 'ģ������';
comment on column CFW.SYS_MODULEDEF.MASK
  is '��������';
comment on column CFW.SYS_MODULEDEF.IPGROUPID
  is 'IP����';
comment on column CFW.SYS_MODULEDEF.URL
  is '��ӦURL';
comment on column CFW.SYS_MODULEDEF.PARENTMODULEID
  is '�ϼ�ģ�����';
comment on column CFW.SYS_MODULEDEF.SORTNO
  is 'ģ�������';
comment on column CFW.SYS_MODULEDEF.ICON
  is '�˵�ͼ��';
comment on column CFW.SYS_MODULEDEF.NOTE
  is 'ģ�鱸ע,����ע��';
alter table CFW.SYS_MODULEDEF
  add constraint PK_SYS_MODULEDEF primary key (MODULEID)
  using index 
  tablespace SZHLEEMAS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
create table CFW.SYS_ROLE
(
  ROLEID        NUMBER(4) not null,
  NAME          VARCHAR2(20) not null,
  CREATETIME    DATE not null,
  CREATEACCOUNT VARCHAR2(20) not null,
  ROLECOMMENT   VARCHAR2(200)
)
tablespace SZHLEEMAS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table CFW.SYS_ROLE
  is 'ϵͳ��ɫ��';
comment on column CFW.SYS_ROLE.ROLEID
  is '��ɫ����';
comment on column CFW.SYS_ROLE.NAME
  is '��ɫ����';
comment on column CFW.SYS_ROLE.CREATETIME
  is '����ʱ��';
comment on column CFW.SYS_ROLE.CREATEACCOUNT
  is '������';
comment on column CFW.SYS_ROLE.ROLECOMMENT
  is '��ע';
alter table CFW.SYS_ROLE
  add constraint PK_SYS_ROLE primary key (ROLEID)
  using index 
  tablespace SZHLEEMAS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLEMODULE
prompt =============================
prompt
create table CFW.SYS_ROLEMODULE
(
  ROLEID   NUMBER(4) not null,
  MODULEID VARCHAR2(8) not null,
  MASK     NUMBER(2) not null
)
tablespace SZHLEEMAS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table CFW.SYS_ROLEMODULE
  is '��ɫ����ģ���';
comment on column CFW.SYS_ROLEMODULE.ROLEID
  is '��ɫ����';
comment on column CFW.SYS_ROLEMODULE.MODULEID
  is 'ģ�����';
comment on column CFW.SYS_ROLEMODULE.MASK
  is '��������';
alter table CFW.SYS_ROLEMODULE
  add constraint PK_SYS_ROLEMODULE primary key (ROLEID, MODULEID)
  using index 
  tablespace SZHLEEMAS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_SYS_ROLE
prompt ==============================
prompt
create sequence CFW.SEQ_SYS_ROLE
minvalue 1
maxvalue 9999
start with 261
increment by 1
cache 20;


spool off
