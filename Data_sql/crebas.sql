/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/11/19 19:29:21                          */
/*==============================================================*/


drop table if exists Rotatitons;

drop table if exists carts;

drop table if exists city;

drop table if exists consultation;

drop table if exists doctors;

drop table if exists follow_doc;

drop table if exists follow_good;

drop table if exists goods;

drop table if exists hospitals;

drop table if exists medtypes;

drop table if exists model_change;

drop table if exists oprder_details;

drop table if exists orders;

drop table if exists registration;

drop table if exists room;

drop table if exists rotation_status;

drop table if exists user_recharge;

drop table if exists user_records;

drop table if exists users;

/*==============================================================*/
/* Table: Rotatitons                                            */
/*==============================================================*/
create table Rotatitons
(
   id                   int not null auto_increment,
   url                  varchar(256) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: carts                                                 */
/*==============================================================*/
create table carts
(
   c_id                 int not null auto_increment,
   u_id                 int,
   goods_id             int,
   c_goods_num          int not null,
   c_is_selected        bool not null,
   primary key (c_id)
);

/*==============================================================*/
/* Table: city                                                  */
/*==============================================================*/
create table city
(
   cityid               int not null auto_increment,
   cityname             varchar(50) not null,
   primary key (cityid)
);

/*==============================================================*/
/* Table: consultation                                          */
/*==============================================================*/
create table consultation
(
   con_id               int not null auto_increment,
   u_id                 int,
   d_id                 int,
   con_num              int not null,
   con_record           varchar(1000) not null,
   con_state            bool not null,
   primary key (con_id)
);

/*==============================================================*/
/* Table: doctors                                               */
/*==============================================================*/
create table doctors
(
   d_id                 int not null auto_increment,
   room_id              int,
   d_name               varchar(20) not null,
   d_relname            varchar(20) not null,
   d_Idcard             varchar(50) not null,
   d_skill              varchar(256) not null,
   primary key (d_id)
);

/*==============================================================*/
/* Table: follow_doc                                            */
/*==============================================================*/
create table follow_doc
(
   fd_id                int not null auto_increment,
   u_id                 int,
   d_id                 int,
   primary key (fd_id)
);

/*==============================================================*/
/* Table: follow_good                                           */
/*==============================================================*/
create table follow_good
(
   fd_id                int not null auto_increment,
   u_id                 int,
   goods_id             int,
   primary key (fd_id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   goods_id             int not null auto_increment,
   goods_name           varbinary(50) not null,
   url                  varchar(256) not null,
   price                float(10) not null,
   medtype              int not null,
   standards            varchar(30) not null,
   primary key (goods_id)
);

/*==============================================================*/
/* Table: hospitals                                             */
/*==============================================================*/
create table hospitals
(
   h_id                 int not null auto_increment,
   cityid               int,
   hname                varchar(50) not null,
   haddress             varchar(100) not null,
   hgrade               int not null,
   htext                varchar(100) not null,
   primary key (h_id)
);

/*==============================================================*/
/* Table: medtypes                                              */
/*==============================================================*/
create table medtypes
(
   m_id                 int not null auto_increment,
   medtype              int not null,
   medname              varchar(50) not null,
   primary key (m_id)
);

/*==============================================================*/
/* Table: model_change                                          */
/*==============================================================*/
create table model_change
(
   mc_id                int not null auto_increment,
   mc_name              varchar(50) not null,
   primary key (mc_id)
);

/*==============================================================*/
/* Table: oprder_details                                        */
/*==============================================================*/
create table oprder_details
(
   od_id                int not null auto_increment,
   u_id                 int,
   o_price              int not null,
   o_state              bool not null,
   primary key (od_id)
);

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   o_id                 int not null auto_increment,
   od_id                int not null,
   goods_id             int not null,
   o_nums               int not null,
   primary key (o_id)
);

/*==============================================================*/
/* Table: registration                                          */
/*==============================================================*/
create table registration
(
   reg_id               int not null auto_increment,
   u_id                 int,
   d_id                 int,
   room_id              int,
   primary key (reg_id)
);

/*==============================================================*/
/* Table: room                                                  */
/*==============================================================*/
create table room
(
   room_id              int not null auto_increment,
   h_id                 int,
   roomname             varchar(10) not null,
   primary key (room_id)
);

/*==============================================================*/
/* Table: rotation_status                                       */
/*==============================================================*/
create table rotation_status
(
   rs_id                int not null auto_increment,
   id                   int,
   rs_name              varchar(10) not null,
   primary key (rs_id)
);

/*==============================================================*/
/* Table: user_recharge                                         */
/*==============================================================*/
create table user_recharge
(
   ur_id                int not null auto_increment,
   u_id                 int,
   r_total              float not null,
   r_time               date not null,
   r_money              float not null,
   primary key (ur_id)
);

/*==============================================================*/
/* Table: user_records                                          */
/*==============================================================*/
create table user_records
(
   r_id                 int not null auto_increment,
   u_id                 int not null,
   r_height             float(5) not null,
   r_weight             float(5) not null,
   primary key (r_id)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   u_id                 int not null auto_increment,
   r_id                 int,
   u_name               varchar(20) not null,
   u_password           varchar(50) not null,
   u_tel                int not null,
   u_image              varchar(256) not null,
   is_doctor            bool not null,
   primary key (u_id)
);

alter table carts add constraint FK_Reference_11 foreign key (u_id)
      references users (u_id) on delete restrict on update restrict;

alter table carts add constraint FK_Reference_12 foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table consultation add constraint FK_Reference_24 foreign key (u_id)
      references users (u_id) on delete restrict on update restrict;

alter table consultation add constraint FK_Reference_25 foreign key (d_id)
      references doctors (d_id) on delete restrict on update restrict;

alter table doctors add constraint FK_Reference_16 foreign key (room_id)
      references room (room_id) on delete restrict on update restrict;

alter table follow_doc add constraint FK_Reference_5 foreign key (u_id)
      references users (u_id) on delete restrict on update restrict;

alter table follow_doc add constraint FK_Reference_6 foreign key (d_id)
      references doctors (d_id) on delete restrict on update restrict;

alter table follow_good add constraint FK_Reference_4 foreign key (u_id)
      references users (u_id) on delete restrict on update restrict;

alter table follow_good add constraint FK_Reference_7 foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table hospitals add constraint FK_Reference_21 foreign key (cityid)
      references city (cityid) on delete restrict on update restrict;

alter table oprder_details add constraint FK_Reference_8 foreign key (u_id)
      references users (u_id) on delete restrict on update restrict;

alter table orders add constraint FK_Reference_10 foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table orders add constraint FK_Reference_9 foreign key (od_id)
      references oprder_details (od_id) on delete restrict on update restrict;

alter table registration add constraint FK_Reference_13 foreign key (u_id)
      references users (u_id) on delete restrict on update restrict;

alter table registration add constraint FK_Reference_14 foreign key (d_id)
      references doctors (d_id) on delete restrict on update restrict;

alter table registration add constraint FK_Reference_15 foreign key (room_id)
      references room (room_id) on delete restrict on update restrict;

alter table room add constraint FK_Reference_17 foreign key (h_id)
      references hospitals (h_id) on delete restrict on update restrict;

alter table rotation_status add constraint FK_Reference_22 foreign key (id)
      references Rotatitons (id) on delete restrict on update restrict;

alter table user_recharge add constraint FK_Reference_23 foreign key (u_id)
      references users (u_id) on delete restrict on update restrict;

alter table users add constraint FK_Reference_1 foreign key (r_id)
      references user_records (r_id) on delete restrict on update restrict;

