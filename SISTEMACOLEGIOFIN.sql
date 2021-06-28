/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     24/6/2021 0:20:27                            */
/*==============================================================*/


drop index ASIGNATURA_PK;

drop table ASIGNATURA;

drop index CALI_MATRICULA_FK;

drop index PROFES_CALIFI_FK;

drop index ASIG_CALIFI_FK;

drop index CALIF_ESTU_FK;

drop index CALIFICACION_PK;

drop table CALIFICACION;

drop index PROFE_CURSO_FK;

drop index INSTITU_CURS_FK;

drop index CURSO_PK;

drop table CURSO;

drop index ESTU_CURSO_FK;

drop index ESTU_REPRE_FK;

drop index ESTUDIANTE_PK;

drop table ESTUDIANTE;

drop index CURSO_MATRICULA_FK;

drop index INSTITUC_MATRICUL_FK;

drop index ESTU_MATRI_FK;

drop index MATRICULA_PK;

drop table MATRICULA;

drop index PERIODO_PK;

drop table PERIODO;

drop index PROFESOR_PK;

drop table PROFESOR;

drop index PROFE_ASIG_FK;

drop index PROFE_ASIG2_FK;

drop index PROFE_ASIG_PK;

drop table PROFE_ASIG;

drop index REPRESENTANTE_PK;

drop table REPRESENTANTE;

drop index REPRESENT_TUTOR_FK;

drop index REPRESENT_TUTOR2_FK;

drop index REPRESENT_TUTOR_PK;

drop table REPRESENT_TUTOR;

drop index TUTOR_PK;

drop table TUTOR;

/*==============================================================*/
/* Table: ASIGNATURA                                            */
/*==============================================================*/
create table ASIGNATURA (
   ID_ASIGNATURA        SERIAL               not null,
   NOMBRE_ASIGNATURA    VARCHAR(60)          not null,
   PROFESOR_ASIGNATURA  VARCHAR(60)          not null,
   constraint PK_ASIGNATURA primary key (ID_ASIGNATURA)
);

/*==============================================================*/
/* Index: ASIGNATURA_PK                                         */
/*==============================================================*/
create unique index ASIGNATURA_PK on ASIGNATURA (
ID_ASIGNATURA
);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION (
   ID_CALIFICACION      SERIAL               not null,
   ID_ESTUDIANTE        INT4                 null,
   ID_ASIGNATURA        INT4                 null,
   ID_PROFESOR          INT4                 null,
   ID_MATRICULA         INT4                 null,
   NOMBRE_DEL_ESTUDIANTE VARCHAR(60)          not null,
   NOMBRE_DEL_PROFESOR  VARCHAR(60)          not null,
   CURSO                VARCHAR(10)          not null,
   NOTA_PARCIAL_1       INT4                 not null,
   NOTA_PARCIAL_2       INT4                 not null,
   NOTA_FINAL           INT4                 null,
   PERIODO              VARCHAR(5)           not null,
   constraint PK_CALIFICACION primary key (ID_CALIFICACION)
);

/*==============================================================*/
/* Index: CALIFICACION_PK                                       */
/*==============================================================*/
create unique index CALIFICACION_PK on CALIFICACION (
ID_CALIFICACION
);

/*==============================================================*/
/* Index: CALIF_ESTU_FK                                         */
/*==============================================================*/
create  index CALIF_ESTU_FK on CALIFICACION (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Index: ASIG_CALIFI_FK                                        */
/*==============================================================*/
create  index ASIG_CALIFI_FK on CALIFICACION (
ID_ASIGNATURA
);

/*==============================================================*/
/* Index: PROFES_CALIFI_FK                                      */
/*==============================================================*/
create  index PROFES_CALIFI_FK on CALIFICACION (
ID_PROFESOR
);

/*==============================================================*/
/* Index: CALI_MATRICULA_FK                                     */
/*==============================================================*/
create  index CALI_MATRICULA_FK on CALIFICACION (
ID_MATRICULA
);

/*==============================================================*/
/* Table: CURSO                                                 */
/*==============================================================*/
create table CURSO (
   ID_CURSO             SERIAL               not null,
   ID_PERIODO           INT4                 null,
   ID_PROFESOR          INT4                 null,
   NOMBRE_DE_CURSO      VARCHAR(60)          not null,
   UBICACION_DEL_CURSO  VARCHAR(60)          not null,
   CANTIDAD_ESTUDIANTE_CURSO INT4                 not null,
   constraint PK_CURSO primary key (ID_CURSO)
);

/*==============================================================*/
/* Index: CURSO_PK                                              */
/*==============================================================*/
create unique index CURSO_PK on CURSO (
ID_CURSO
);

/*==============================================================*/
/* Index: INSTITU_CURS_FK                                       */
/*==============================================================*/
create  index INSTITU_CURS_FK on CURSO (
ID_PERIODO
);

/*==============================================================*/
/* Index: PROFE_CURSO_FK                                        */
/*==============================================================*/
create  index PROFE_CURSO_FK on CURSO (
ID_PROFESOR
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   ID_ESTUDIANTE        SERIAL               not null,
   ID_REPRESENTANTE     INT4                 null,
   ID_CURSO             INT4                 null,
   C_I                  VARCHAR(10)          not null,
   NOMBRE_E             VARCHAR(60)          not null,
   APELLIDOS_E          VARCHAR(60)          not null,
   GENERO_E             VARCHAR(60)          not null,
   FECHA_DE_NACIMIENTO_E DATE                 not null,
   DIRECCION_E          VARCHAR(60)          not null,
   TELEFONO_E           VARCHAR(10)          null,
   constraint PK_ESTUDIANTE primary key (ID_ESTUDIANTE)
);

/*==============================================================*/
/* Index: ESTUDIANTE_PK                                         */
/*==============================================================*/
create unique index ESTUDIANTE_PK on ESTUDIANTE (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Index: ESTU_REPRE_FK                                         */
/*==============================================================*/
create  index ESTU_REPRE_FK on ESTUDIANTE (
ID_REPRESENTANTE
);

/*==============================================================*/
/* Index: ESTU_CURSO_FK                                         */
/*==============================================================*/
create  index ESTU_CURSO_FK on ESTUDIANTE (
ID_CURSO
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA (
   ID_MATRICULA         SERIAL               not null,
   ID_ESTUDIANTE        INT4                 null,
   ID_PERIODO           INT4                 null,
   ID_CURSO             INT4                 null,
   NOTA_PARCIAL1        INT4                 not null,
   NOTA_PACIAL2         INT4                 not null,
   NOTA_FINAL           INT4                 not null,
   constraint PK_MATRICULA primary key (ID_MATRICULA)
);

/*==============================================================*/
/* Index: MATRICULA_PK                                          */
/*==============================================================*/
create unique index MATRICULA_PK on MATRICULA (
ID_MATRICULA
);

/*==============================================================*/
/* Index: ESTU_MATRI_FK                                         */
/*==============================================================*/
create  index ESTU_MATRI_FK on MATRICULA (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Index: INSTITUC_MATRICUL_FK                                  */
/*==============================================================*/
create  index INSTITUC_MATRICUL_FK on MATRICULA (
ID_PERIODO
);

/*==============================================================*/
/* Index: CURSO_MATRICULA_FK                                    */
/*==============================================================*/
create  index CURSO_MATRICULA_FK on MATRICULA (
ID_CURSO
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO (
   ID_PERIODO           SERIAL               not null,
   FECHA_DE_INCIO_DEL_PERIODO DATE                 not null,
   FECHA_DE_FIN_DE_PERIODO DATE                 not null,
   PERIODO              VARCHAR(5)           not null,
   constraint PK_PERIODO primary key (ID_PERIODO)
);

/*==============================================================*/
/* Index: PERIODO_PK                                            */
/*==============================================================*/
create unique index PERIODO_PK on PERIODO (
ID_PERIODO
);

/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
create table PROFESOR (
   ID_PROFESOR          SERIAL               not null,
   C_I_PROFESOR         VARCHAR(10)          not null,
   NOMBRE_DEL_PROFESOR  VARCHAR(60)          not null,
   APELLIDO_DEL_PROFESOR VARCHAR(60)          not null,
   FECHA_DE_NACIMIENTO  DATE                 not null,
   constraint PK_PROFESOR primary key (ID_PROFESOR)
);

/*==============================================================*/
/* Index: PROFESOR_PK                                           */
/*==============================================================*/
create unique index PROFESOR_PK on PROFESOR (
ID_PROFESOR
);

/*==============================================================*/
/* Table: PROFE_ASIG                                            */
/*==============================================================*/
create table PROFE_ASIG (
   ID_ASIGNATURA        INT4                 not null,
   ID_PROFESOR          INT4                 not null,
   constraint PK_PROFE_ASIG primary key (ID_ASIGNATURA, ID_PROFESOR)
);

/*==============================================================*/
/* Index: PROFE_ASIG_PK                                         */
/*==============================================================*/
create unique index PROFE_ASIG_PK on PROFE_ASIG (
ID_ASIGNATURA,
ID_PROFESOR
);

/*==============================================================*/
/* Index: PROFE_ASIG2_FK                                        */
/*==============================================================*/
create  index PROFE_ASIG2_FK on PROFE_ASIG (
ID_PROFESOR
);

/*==============================================================*/
/* Index: PROFE_ASIG_FK                                         */
/*==============================================================*/
create  index PROFE_ASIG_FK on PROFE_ASIG (
ID_ASIGNATURA
);

/*==============================================================*/
/* Table: REPRESENTANTE                                         */
/*==============================================================*/
create table REPRESENTANTE (
   ID_REPRESENTANTE     SERIAL               not null,
   C_I_DEL_PADRE        VARCHAR(10)          not null,
   NOMBRES_DEL_PADRE    VARCHAR(60)          not null,
   APELLIDOS_DEL_PADRE  VARCHAR(60)          not null,
   DIRECCION_DOMI_PADRE VARCHAR(60)          not null,
   TELEFONO_TRABAJO_PADRE VARCHAR(10)          null,
   TELEFONO_ADOMICILIO_PADRE VARCHAR(60)          null,
   PADRE_PRESENTE       VARCHAR(10)          not null,
   C_I_DE_LA_MADRE      VARCHAR(10)          not null,
   NOMBRES_DE_LA_MADRE  VARCHAR(60)          not null,
   APELLIDOS_DE_LA_MADRE VARCHAR(60)          not null,
   DIRECCION_DOMI_MADRE VARCHAR(60)          not null,
   TELEFONO_DOMI_MADRE  VARCHAR(10)          null,
   TELEFONO_TRABAJO_MADRE VARCHAR(10)          null,
   MADRE_PRESENTE       VARCHAR(10)          not null,
   REPRESENTANTE_LEGAL_ VARCHAR(5)           null,
   constraint PK_REPRESENTANTE primary key (ID_REPRESENTANTE)
);

/*==============================================================*/
/* Index: REPRESENTANTE_PK                                      */
/*==============================================================*/
create unique index REPRESENTANTE_PK on REPRESENTANTE (
ID_REPRESENTANTE
);

/*==============================================================*/
/* Table: REPRESENT_TUTOR                                       */
/*==============================================================*/
create table REPRESENT_TUTOR (
   ID_REPRESENTANTE     INT4                 not null,
   ID_TUTOR             INT4                 not null,
   constraint PK_REPRESENT_TUTOR primary key (ID_REPRESENTANTE, ID_TUTOR)
);

/*==============================================================*/
/* Index: REPRESENT_TUTOR_PK                                    */
/*==============================================================*/
create unique index REPRESENT_TUTOR_PK on REPRESENT_TUTOR (
ID_REPRESENTANTE,
ID_TUTOR
);

/*==============================================================*/
/* Index: REPRESENT_TUTOR2_FK                                   */
/*==============================================================*/
create  index REPRESENT_TUTOR2_FK on REPRESENT_TUTOR (
ID_TUTOR
);

/*==============================================================*/
/* Index: REPRESENT_TUTOR_FK                                    */
/*==============================================================*/
create  index REPRESENT_TUTOR_FK on REPRESENT_TUTOR (
ID_REPRESENTANTE
);

/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR (
   ID_TUTOR             SERIAL               not null,
   C_I_DELTUTOR         VARCHAR(10)          null,
   NOMBRE_DEL_TUTOR     VARCHAR(10)          null,
   APELLIDO_DEL_TUTOR   VARCHAR(10)          null,
   TELEFONO_TUTOR       VARCHAR(10)          null,
   TELEFONO_TRABAJO_TUTOR VARCHAR(10)          null,
   DIRECCION_ADOM_TUTOR VARCHAR(60)          null,
   constraint PK_TUTOR primary key (ID_TUTOR)
);

/*==============================================================*/
/* Index: TUTOR_PK                                              */
/*==============================================================*/
create unique index TUTOR_PK on TUTOR (
ID_TUTOR
);

alter table CALIFICACION
   add constraint FK_CALIFICA_ASIG_CALI_ASIGNATU foreign key (ID_ASIGNATURA)
      references ASIGNATURA (ID_ASIGNATURA)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_CALIF_EST_ESTUDIAN foreign key (ID_ESTUDIANTE)
      references ESTUDIANTE (ID_ESTUDIANTE)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_CALI_MATR_MATRICUL foreign key (ID_MATRICULA)
      references MATRICULA (ID_MATRICULA)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_PROFES_CA_PROFESOR foreign key (ID_PROFESOR)
      references PROFESOR (ID_PROFESOR)
      on delete restrict on update restrict;

alter table CURSO
   add constraint FK_CURSO_INSTITU_C_PERIODO foreign key (ID_PERIODO)
      references PERIODO (ID_PERIODO)
      on delete restrict on update restrict;

alter table CURSO
   add constraint FK_CURSO_PROFE_CUR_PROFESOR foreign key (ID_PROFESOR)
      references PROFESOR (ID_PROFESOR)
      on delete restrict on update restrict;

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_ESTU_CURS_CURSO foreign key (ID_CURSO)
      references CURSO (ID_CURSO)
      on delete restrict on update restrict;

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_ESTU_REPR_REPRESEN foreign key (ID_REPRESENTANTE)
      references REPRESENTANTE (ID_REPRESENTANTE)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_CURSO_MAT_CURSO foreign key (ID_CURSO)
      references CURSO (ID_CURSO)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_ESTU_MATR_ESTUDIAN foreign key (ID_ESTUDIANTE)
      references ESTUDIANTE (ID_ESTUDIANTE)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_INSTITUC__PERIODO foreign key (ID_PERIODO)
      references PERIODO (ID_PERIODO)
      on delete restrict on update restrict;

alter table PROFE_ASIG
   add constraint FK_PROFE_AS_PROFE_ASI_ASIGNATU foreign key (ID_ASIGNATURA)
      references ASIGNATURA (ID_ASIGNATURA)
      on delete restrict on update restrict;

alter table PROFE_ASIG
   add constraint FK_PROFE_AS_PROFE_ASI_PROFESOR foreign key (ID_PROFESOR)
      references PROFESOR (ID_PROFESOR)
      on delete restrict on update restrict;

alter table REPRESENT_TUTOR
   add constraint FK_REPRESEN_REPRESENT_REPRESEN foreign key (ID_REPRESENTANTE)
      references REPRESENTANTE (ID_REPRESENTANTE)
      on delete restrict on update restrict;

alter table REPRESENT_TUTOR
   add constraint FK_REPRESEN_REPRESENT_TUTOR foreign key (ID_TUTOR)
      references TUTOR (ID_TUTOR)
      on delete restrict on update restrict;

