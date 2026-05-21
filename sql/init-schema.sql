/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_BYTEAR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8mb3_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `COMPLETED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_entitylink` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_SUPER_PROCINST` (`SUPER_PROCESS_INSTANCE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `IN_PROGRESS_TIME_` datetime(3) DEFAULT NULL,
  `IN_PROGRESS_STARTED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `CLAIMED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `SUSPENDED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `IN_PROGRESS_DUE_DATE_` datetime(3) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_tsk_log` (
  `ID_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ACT_HI_TSK_LOG_TASK` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8mb3_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_token` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DERIVED_VERSION_` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_actinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `COMPLETED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_TASK` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_entitylink` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_IDX_EVENT_SUBSCR_EXEC_ID` (`EXECUTION_ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_PROC_ID` (`PROC_INST_ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_SCOPEREF_` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_EXEC_REF_ID_` (`REFERENCE_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_external_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IN_PROGRESS_TIME_` datetime(3) DEFAULT NULL,
  `IN_PROGRESS_STARTED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `CLAIMED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `SUSPENDED_BY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `IN_PROGRESS_DUE_DATE_` datetime(3) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `SUB_TASK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_TIMER_JOB_DUEDATE` (`DUEDATE_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_channel_definition` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_definition` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_deployment` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_resource` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_EVENT_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `FLW_FK_EVENT_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `flw_event_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ru_batch` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ru_batch_part` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_api_access_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏃ュ織涓婚敭',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閾捐矾杩借釜缂栧彿',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛绫诲瀷',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '搴旂敤鍚?,
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '璇锋眰鏂规硶鍚?,
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '璇锋眰鍦板潃',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '璇锋眰鍙傛暟',
  `response_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '鍝嶅簲缁撴灉',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '娴忚鍣?UA',
  `operate_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鎿嶄綔妯″潡',
  `operate_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鎿嶄綔鍚?,
  `operate_type` tinyint DEFAULT '0' COMMENT '鎿嶄綔鍒嗙被',
  `begin_time` datetime NOT NULL COMMENT '寮€濮嬭姹傛椂闂?,
  `end_time` datetime NOT NULL COMMENT '缁撴潫璇锋眰鏃堕棿',
  `duration` int NOT NULL COMMENT '鎵ц鏃堕暱',
  `result_code` int NOT NULL DEFAULT '0' COMMENT '缁撴灉鐮?,
  `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '缁撴灉鎻愮ず',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='API 璁块棶鏃ュ織琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_api_error_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閾捐矾杩借釜缂栧彿',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛绫诲瀷',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '搴旂敤鍚?,
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '璇锋眰鏂规硶鍚?,
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '璇锋眰鍦板潃',
  `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '璇锋眰鍙傛暟',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '娴忚鍣?UA',
  `exception_time` datetime NOT NULL COMMENT '寮傚父鍙戠敓鏃堕棿',
  `exception_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '寮傚父鍚?,
  `exception_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '寮傚父瀵艰嚧鐨勬秷鎭?,
  `exception_root_cause_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '寮傚父瀵艰嚧鐨勬牴娑堟伅',
  `exception_stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '寮傚父鐨勬爤杞ㄨ抗',
  `exception_class_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '寮傚父鍙戠敓鐨勭被鍏ㄥ悕',
  `exception_file_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '寮傚父鍙戠敓鐨勭被鏂囦欢',
  `exception_method_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '寮傚父鍙戠敓鐨勬柟娉曞悕',
  `exception_line_number` int NOT NULL COMMENT '寮傚父鍙戠敓鐨勬柟娉曟墍鍦ㄨ',
  `process_status` tinyint NOT NULL COMMENT '澶勭悊鐘舵€?,
  `process_time` datetime DEFAULT NULL COMMENT '澶勭悊鏃堕棿',
  `process_user_id` int DEFAULT '0' COMMENT '澶勭悊鐢ㄦ埛缂栧彿',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23915 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绯荤粺寮傚父鏃ュ織';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_codegen_column` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `table_id` bigint NOT NULL COMMENT '琛ㄧ紪鍙?,
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀛楁鍚?,
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀛楁绫诲瀷',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀛楁鎻忚堪',
  `nullable` bit(1) NOT NULL COMMENT '鏄惁鍏佽涓虹┖',
  `primary_key` bit(1) NOT NULL COMMENT '鏄惁涓婚敭',
  `ordinal_position` int NOT NULL COMMENT '鎺掑簭',
  `java_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 灞炴€х被鍨?,
  `java_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 灞炴€у悕',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '瀛楀吀绫诲瀷',
  `example` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鏁版嵁绀轰緥',
  `create_operation` bit(1) NOT NULL COMMENT '鏄惁涓?Create 鍒涘缓鎿嶄綔鐨勫瓧娈?,
  `update_operation` bit(1) NOT NULL COMMENT '鏄惁涓?Update 鏇存柊鎿嶄綔鐨勫瓧娈?,
  `list_operation` bit(1) NOT NULL COMMENT '鏄惁涓?List 鏌ヨ鎿嶄綔鐨勫瓧娈?,
  `list_operation_condition` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=' COMMENT 'List 鏌ヨ鎿嶄綔鐨勬潯浠剁被鍨?,
  `list_operation_result` bit(1) NOT NULL COMMENT '鏄惁涓?List 鏌ヨ鎿嶄綔鐨勮繑鍥炲瓧娈?,
  `html_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鏄剧ず绫诲瀷',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_table_id` (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2880 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='浠ｇ爜鐢熸垚琛ㄥ瓧娈靛畾涔?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_codegen_table` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `data_source_config_id` bigint NOT NULL COMMENT '鏁版嵁婧愰厤缃殑缂栧彿',
  `scene` tinyint NOT NULL DEFAULT '1' COMMENT '鐢熸垚鍦烘櫙',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '琛ㄥ悕绉?,
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '琛ㄦ弿杩?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯″潡鍚?,
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '涓氬姟鍚?,
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '绫诲悕绉?,
  `class_comment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绫绘弿杩?,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浣滆€?,
  `template_type` tinyint NOT NULL DEFAULT '1' COMMENT '妯℃澘绫诲瀷',
  `front_type` tinyint NOT NULL COMMENT '鍓嶇绫诲瀷',
  `parent_menu_id` bigint DEFAULT NULL COMMENT '鐖惰彍鍗曠紪鍙?,
  `master_table_id` bigint DEFAULT NULL COMMENT '涓昏〃鐨勭紪鍙?,
  `sub_join_column_id` bigint DEFAULT NULL COMMENT '瀛愯〃鍏宠仈涓昏〃鐨勫瓧娈电紪鍙?,
  `sub_join_many` bit(1) DEFAULT NULL COMMENT '涓昏〃涓庡瓙琛ㄦ槸鍚︿竴瀵瑰',
  `tree_parent_column_id` bigint DEFAULT NULL COMMENT '鏍戣〃鐨勭埗瀛楁缂栧彿',
  `tree_name_column_id` bigint DEFAULT NULL COMMENT '鏍戣〃鐨勫悕瀛楀瓧娈电紪鍙?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='浠ｇ爜鐢熸垚琛ㄥ畾涔?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鍙傛暟涓婚敭',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍙傛暟鍒嗙粍',
  `type` tinyint NOT NULL COMMENT '鍙傛暟绫诲瀷',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍙傛暟鍚嶇О',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍙傛暟閿悕',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍙傛暟閿€?,
  `visible` bit(1) NOT NULL COMMENT '鏄惁鍙',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_config_key` (`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鍙傛暟閰嶇疆琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_data_source_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭缂栧彿',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍙傛暟鍚嶇О',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鏁版嵁婧愯繛鎺?,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛鍚?,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '瀵嗙爜',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鏁版嵁婧愰厤缃〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏂囦欢缂栧彿',
  `config_id` bigint DEFAULT NULL COMMENT '閰嶇疆缂栧彿',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鏂囦欢鍚?,
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鏂囦欢璺緞',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鏂囦欢 URL',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鏂囦欢绫诲瀷',
  `size` int NOT NULL COMMENT '鏂囦欢澶у皬',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鏂囦欢琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閰嶇疆鍚?,
  `storage` tinyint NOT NULL COMMENT '瀛樺偍鍣?,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `master` bit(1) NOT NULL COMMENT '鏄惁涓轰富閰嶇疆',
  `config` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀛樺偍閰嶇疆',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鏂囦欢閰嶇疆琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file_content` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `config_id` bigint NOT NULL COMMENT '閰嶇疆缂栧彿',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鏂囦欢璺緞',
  `content` mediumblob NOT NULL COMMENT '鏂囦欢鍐呭',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_config_id_path` (`config_id`,`path`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鏂囦欢琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '浠诲姟缂栧彿',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浠诲姟鍚嶇О',
  `status` tinyint NOT NULL COMMENT '浠诲姟鐘舵€?,
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '澶勭悊鍣ㄧ殑鍚嶅瓧',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶勭悊鍣ㄧ殑鍙傛暟',
  `cron_expression` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRON 琛ㄨ揪寮?,
  `retry_count` int NOT NULL DEFAULT '0' COMMENT '閲嶈瘯娆℃暟',
  `retry_interval` int NOT NULL DEFAULT '0' COMMENT '閲嶈瘯闂撮殧',
  `monitor_timeout` int NOT NULL DEFAULT '0' COMMENT '鐩戞帶瓒呮椂鏃堕棿',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瀹氭椂浠诲姟琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏃ュ織缂栧彿',
  `job_id` bigint NOT NULL COMMENT '浠诲姟缂栧彿',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '澶勭悊鍣ㄧ殑鍚嶅瓧',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶勭悊鍣ㄧ殑鍙傛暟',
  `execute_index` tinyint NOT NULL DEFAULT '1' COMMENT '绗嚑娆℃墽琛?,
  `begin_time` datetime NOT NULL COMMENT '寮€濮嬫墽琛屾椂闂?,
  `end_time` datetime DEFAULT NULL COMMENT '缁撴潫鎵ц鏃堕棿',
  `duration` int DEFAULT NULL COMMENT '鎵ц鏃堕暱',
  `status` tinyint NOT NULL COMMENT '浠诲姟鐘舵€?,
  `result` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '缁撴灉鏁版嵁',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_job_id` (`job_id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瀹氭椂浠诲姟鏃ュ織琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_cal_holiday` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `day` datetime DEFAULT NULL COMMENT 'day',
  `type` int DEFAULT NULL COMMENT 'type',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_cal_holiday';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_cal_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calendar_type` tinyint DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `shift_type` tinyint DEFAULT NULL,
  `shift_method` tinyint DEFAULT NULL,
  `shift_count` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_cal_plan_shift` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_cal_plan_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_cal_team` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `calendar_type` int DEFAULT NULL COMMENT 'calendar_type',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_cal_team';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_cal_team_member` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team_id` bigint DEFAULT NULL COMMENT 'team_id',
  `user_id` bigint DEFAULT NULL COMMENT 'user_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_cal_team_member';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_cal_team_shift` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `shift_id` bigint DEFAULT NULL,
  `day` timestamp NULL DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_check_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `start_date` datetime DEFAULT NULL COMMENT 'start_date',
  `end_date` datetime DEFAULT NULL COMMENT 'end_date',
  `cycle_type` int DEFAULT NULL COMMENT 'cycle_type',
  `cycle_count` int DEFAULT NULL COMMENT 'cycle_count',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_check_plan';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_check_plan_machinery` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `plan_id` bigint DEFAULT NULL COMMENT 'plan_id',
  `machinery_id` bigint DEFAULT NULL COMMENT 'machinery_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_check_plan_machinery';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_check_plan_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `plan_id` bigint DEFAULT NULL COMMENT 'plan_id',
  `subject_id` bigint DEFAULT NULL COMMENT 'subject_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_check_plan_subject';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_check_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `plan_id` bigint DEFAULT NULL COMMENT 'plan_id',
  `machinery_id` bigint DEFAULT NULL COMMENT 'machinery_id',
  `check_time` datetime DEFAULT NULL COMMENT 'check_time',
  `user_id` bigint DEFAULT NULL COMMENT 'user_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_check_record';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_check_record_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `record_id` bigint DEFAULT NULL COMMENT 'record_id',
  `subject_id` bigint DEFAULT NULL COMMENT 'subject_id',
  `check_status` int DEFAULT NULL COMMENT 'check_status',
  `check_result` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'check_result',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_check_record_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_machinery` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `brand` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'brand',
  `specification` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'specification',
  `machinery_type_id` bigint DEFAULT NULL COMMENT 'machinery_type_id',
  `workshop_id` bigint DEFAULT NULL COMMENT 'workshop_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `last_mainten_time` datetime DEFAULT NULL COMMENT 'last_mainten_time',
  `last_check_time` datetime DEFAULT NULL COMMENT 'last_check_time',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_machinery';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_machinery_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `parent_id` bigint DEFAULT NULL COMMENT 'parent_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `sort` int DEFAULT NULL COMMENT 'sort',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_machinery_type';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_mainten_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `plan_id` bigint DEFAULT NULL COMMENT 'plan_id',
  `machinery_id` bigint DEFAULT NULL COMMENT 'machinery_id',
  `mainten_time` datetime DEFAULT NULL COMMENT 'mainten_time',
  `user_id` bigint DEFAULT NULL COMMENT 'user_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_mainten_record';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_mainten_record_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `record_id` bigint DEFAULT NULL COMMENT 'record_id',
  `subject_id` bigint DEFAULT NULL COMMENT 'subject_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `result` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'result',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_mainten_record_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_repair` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `machinery_id` bigint DEFAULT NULL COMMENT 'machinery_id',
  `require_date` datetime DEFAULT NULL COMMENT 'require_date',
  `finish_date` datetime DEFAULT NULL COMMENT 'finish_date',
  `confirm_date` datetime DEFAULT NULL COMMENT 'confirm_date',
  `result` int DEFAULT NULL COMMENT 'result',
  `accepted_user_id` bigint DEFAULT NULL COMMENT 'accepted_user_id',
  `confirm_user_id` bigint DEFAULT NULL COMMENT 'confirm_user_id',
  `source_doc_type` int DEFAULT NULL COMMENT 'source_doc_type',
  `source_doc_id` bigint DEFAULT NULL COMMENT 'source_doc_id',
  `source_doc_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'source_doc_code',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_repair';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_repair_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `repair_id` bigint DEFAULT NULL COMMENT 'repair_id',
  `subject_id` bigint DEFAULT NULL COMMENT 'subject_id',
  `malfunction` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'malfunction',
  `malfunction_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'malfunction_url',
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'description',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_repair_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_dv_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `content` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'content',
  `standard` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'standard',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_dv_subject';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_auto_code_part` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rule_id` bigint NOT NULL,
  `sort` int NOT NULL,
  `type` tinyint NOT NULL,
  `length` int NOT NULL,
  `date_format` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fix_character` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_start_no` int DEFAULT NULL,
  `serial_step` int DEFAULT NULL,
  `cycle_flag` tinyint(1) DEFAULT '0',
  `cycle_method` tinyint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_auto_code_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rule_id` bigint NOT NULL,
  `result` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_no` bigint DEFAULT NULL,
  `input_char` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_auto_code_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_length` int DEFAULT NULL,
  `padded` tinyint(1) NOT NULL DEFAULT '0',
  `padded_char` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `padded_method` tinyint DEFAULT NULL,
  `status` tinyint NOT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_client` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `nickname` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'nickname',
  `english_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'english_name',
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'description',
  `logo` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'logo',
  `type` int DEFAULT NULL COMMENT 'type',
  `address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'address',
  `website` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'website',
  `email` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'email',
  `telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'telephone',
  `contact1_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact1_name',
  `contact1_telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact1_telephone',
  `contact1_email` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact1_email',
  `contact2_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact2_name',
  `contact2_telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact2_telephone',
  `contact2_email` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact2_email',
  `credit_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'credit_code',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_client';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `specification` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'specification',
  `unit_measure_id` bigint DEFAULT NULL COMMENT 'unit_measure_id',
  `item_type_id` bigint DEFAULT NULL COMMENT 'item_type_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `safe_stock_flag` bit(1) DEFAULT NULL COMMENT 'safe_stock_flag',
  `min_stock` decimal(19,2) DEFAULT NULL COMMENT 'min_stock',
  `max_stock` decimal(19,2) DEFAULT NULL COMMENT 'max_stock',
  `high_value` bit(1) DEFAULT NULL COMMENT 'high_value',
  `batch_flag` bit(1) DEFAULT NULL COMMENT 'batch_flag',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_item';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_item_batch_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `produce_date_flag` bit(1) DEFAULT NULL COMMENT 'produce_date_flag',
  `expire_date_flag` bit(1) DEFAULT NULL COMMENT 'expire_date_flag',
  `receipt_date_flag` bit(1) DEFAULT NULL COMMENT 'receipt_date_flag',
  `vendor_flag` bit(1) DEFAULT NULL COMMENT 'vendor_flag',
  `client_flag` bit(1) DEFAULT NULL COMMENT 'client_flag',
  `sales_order_code_flag` bit(1) DEFAULT NULL COMMENT 'sales_order_code_flag',
  `purchase_order_code_flag` bit(1) DEFAULT NULL COMMENT 'purchase_order_code_flag',
  `work_order_flag` bit(1) DEFAULT NULL COMMENT 'work_order_flag',
  `task_flag` bit(1) DEFAULT NULL COMMENT 'task_flag',
  `workstation_flag` bit(1) DEFAULT NULL COMMENT 'workstation_flag',
  `tool_flag` bit(1) DEFAULT NULL COMMENT 'tool_flag',
  `mold_flag` bit(1) DEFAULT NULL COMMENT 'mold_flag',
  `lot_number_flag` bit(1) DEFAULT NULL COMMENT 'lot_number_flag',
  `quality_status_flag` bit(1) DEFAULT NULL COMMENT 'quality_status_flag',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_item_batch_config';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_item_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `parent_id` bigint DEFAULT NULL COMMENT 'parent_id',
  `item_or_product` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'item_or_product',
  `sort` int DEFAULT NULL COMMENT 'sort',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_item_type';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_product_bom` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `bom_item_id` bigint DEFAULT NULL COMMENT 'bom_item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_product_bom';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_product_sip` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `sort` int DEFAULT NULL COMMENT 'sort',
  `process_id` bigint DEFAULT NULL COMMENT 'process_id',
  `title` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'title',
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'description',
  `url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'url',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_product_sip';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_product_sop` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `sort` int DEFAULT NULL COMMENT 'sort',
  `process_id` bigint DEFAULT NULL COMMENT 'process_id',
  `title` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'title',
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'description',
  `url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'url',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_product_sop';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_unit_measure` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `primary_flag` bit(1) DEFAULT NULL COMMENT 'primary_flag',
  `primary_id` bigint DEFAULT NULL COMMENT 'primary_id',
  `change_rate` decimal(19,2) DEFAULT NULL COMMENT 'change_rate',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_unit_measure';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_vendor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `nickname` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'nickname',
  `english_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'english_name',
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'description',
  `logo` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'logo',
  `level` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'level',
  `score` int DEFAULT NULL COMMENT 'score',
  `address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'address',
  `website` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'website',
  `email` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'email',
  `telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'telephone',
  `contact1_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact1_name',
  `contact1_telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact1_telephone',
  `contact1_email` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact1_email',
  `contact2_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact2_name',
  `contact2_telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact2_telephone',
  `contact2_email` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact2_email',
  `credit_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'credit_code',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_vendor';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_workshop` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `area` decimal(19,2) DEFAULT NULL COMMENT 'area',
  `charge_user_id` bigint DEFAULT NULL COMMENT 'charge_user_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_workshop';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_workstation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'address',
  `workshop_id` bigint DEFAULT NULL COMMENT 'workshop_id',
  `process_id` bigint DEFAULT NULL COMMENT 'process_id',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_workstation';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_workstation_machine` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `machinery_id` bigint DEFAULT NULL COMMENT 'machinery_id',
  `quantity` int DEFAULT NULL COMMENT 'quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_workstation_machine';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_workstation_tool` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `tool_type_id` bigint DEFAULT NULL COMMENT 'tool_type_id',
  `quantity` int DEFAULT NULL COMMENT 'quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_workstation_tool';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_md_workstation_worker` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `post_id` bigint DEFAULT NULL COMMENT 'post_id',
  `quantity` int DEFAULT NULL COMMENT 'quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_md_workstation_worker';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_andon_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `reason` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'reason',
  `level` int DEFAULT NULL COMMENT 'level',
  `handler_role_id` bigint DEFAULT NULL COMMENT 'handler_role_id',
  `handler_user_id` bigint DEFAULT NULL COMMENT 'handler_user_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_andon_config';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_andon_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_id` bigint DEFAULT NULL COMMENT 'config_id',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `user_id` bigint DEFAULT NULL COMMENT 'user_id',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `process_id` bigint DEFAULT NULL COMMENT 'process_id',
  `reason` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'reason',
  `level` int DEFAULT NULL COMMENT 'level',
  `status` int DEFAULT NULL COMMENT 'status',
  `handle_time` datetime DEFAULT NULL COMMENT 'handle_time',
  `handler_user_id` bigint DEFAULT NULL COMMENT 'handler_user_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_andon_record';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_card` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `transfered_quantity` decimal(19,2) DEFAULT NULL COMMENT 'transfered_quantity',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_card';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_card_process` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `card_id` bigint DEFAULT NULL COMMENT 'card_id',
  `sort` int DEFAULT NULL COMMENT 'sort',
  `process_id` bigint DEFAULT NULL COMMENT 'process_id',
  `input_time` datetime DEFAULT NULL COMMENT 'input_time',
  `output_time` datetime DEFAULT NULL COMMENT 'output_time',
  `input_quantity` decimal(19,2) DEFAULT NULL COMMENT 'input_quantity',
  `output_quantity` decimal(19,2) DEFAULT NULL COMMENT 'output_quantity',
  `unqualified_quantity` decimal(19,2) DEFAULT NULL COMMENT 'unqualified_quantity',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `user_id` bigint DEFAULT NULL COMMENT 'user_id',
  `ipqc_id` bigint DEFAULT NULL COMMENT 'ipqc_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_card_process';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `channel` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_time` timestamp NULL DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `route_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  `lot_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_quantity` decimal(14,2) DEFAULT NULL,
  `feedback_quantity` decimal(14,2) DEFAULT NULL,
  `qualified_quantity` decimal(14,2) DEFAULT NULL,
  `unqualified_quantity` decimal(14,2) DEFAULT NULL,
  `uncheck_quantity` decimal(14,2) DEFAULT NULL,
  `labor_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `material_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `other_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `feedback_user_id` bigint DEFAULT NULL,
  `approve_user_id` bigint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_process` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `attention` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'attention',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_process';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_process_content` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `process_id` bigint DEFAULT NULL COMMENT 'process_id',
  `sort` int DEFAULT NULL COMMENT 'sort',
  `content` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'content',
  `device` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'device',
  `material` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'material',
  `doc_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'doc_url',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_process_content';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_route` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'description',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_route';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_route_process` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `route_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `next_process_id` bigint DEFAULT NULL,
  `link_type` int DEFAULT NULL,
  `prepare_time` int DEFAULT NULL,
  `wait_time` int DEFAULT NULL,
  `color_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_flag` tinyint(1) DEFAULT '0',
  `check_flag` tinyint(1) DEFAULT '0',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_route_product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `route_id` bigint DEFAULT NULL COMMENT 'route_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` int DEFAULT NULL COMMENT 'quantity',
  `production_time` decimal(19,2) DEFAULT NULL COMMENT 'production_time',
  `time_unit_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'time_unit_type',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_route_product';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_route_product_bom` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `route_id` bigint DEFAULT NULL COMMENT 'route_id',
  `process_id` bigint DEFAULT NULL COMMENT 'process_id',
  `product_id` bigint DEFAULT NULL COMMENT 'product_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_route_product_bom';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `route_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `quantity` decimal(14,2) DEFAULT NULL,
  `produced_quantity` decimal(14,2) DEFAULT NULL,
  `qualify_quantity` decimal(14,2) DEFAULT NULL,
  `unqualify_quantity` decimal(14,2) DEFAULT NULL,
  `changed_quantity` decimal(14,2) DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `color_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finish_date` timestamp NULL DEFAULT NULL,
  `cancel_date` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_task_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint DEFAULT NULL COMMENT 'task_id',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `source_doc_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'source_doc_type',
  `source_doc_id` bigint DEFAULT NULL COMMENT 'source_doc_id',
  `source_line_id` bigint DEFAULT NULL COMMENT 'source_line_id',
  `source_doc_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'source_doc_code',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `unit_measure_id` bigint DEFAULT NULL COMMENT 'unit_measure_id',
  `issued_quantity` decimal(19,2) DEFAULT NULL COMMENT 'issued_quantity',
  `available_quantity` decimal(19,2) DEFAULT NULL COMMENT 'available_quantity',
  `used_quantity` decimal(19,2) DEFAULT NULL COMMENT 'used_quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_task_issue';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_work_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `order_source_type` int DEFAULT NULL COMMENT 'order_source_type',
  `order_source_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'order_source_code',
  `product_id` bigint DEFAULT NULL COMMENT 'product_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `quantity_produced` decimal(19,2) DEFAULT NULL COMMENT 'quantity_produced',
  `quantity_changed` decimal(19,2) DEFAULT NULL COMMENT 'quantity_changed',
  `quantity_scheduled` decimal(19,2) DEFAULT NULL COMMENT 'quantity_scheduled',
  `client_id` bigint DEFAULT NULL COMMENT 'client_id',
  `vendor_id` bigint DEFAULT NULL COMMENT 'vendor_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `request_date` datetime DEFAULT NULL COMMENT 'request_date',
  `parent_id` bigint DEFAULT NULL COMMENT 'parent_id',
  `finish_date` datetime DEFAULT NULL COMMENT 'finish_date',
  `cancel_date` datetime DEFAULT NULL COMMENT 'cancel_date',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_work_order';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_work_order_bom` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_work_order_bom';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_work_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint DEFAULT NULL COMMENT 'user_id',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `type` int DEFAULT NULL COMMENT 'type',
  `clock_in_time` datetime DEFAULT NULL COMMENT 'clock_in_time',
  `clock_out_time` datetime DEFAULT NULL COMMENT 'clock_out_time',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_work_record';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_pro_work_record_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint DEFAULT NULL COMMENT 'user_id',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `type` int DEFAULT NULL COMMENT 'type',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_pro_work_record_log';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_defect` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `level` int DEFAULT NULL COMMENT 'level',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_defect';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_defect_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `qc_type` int DEFAULT NULL COMMENT 'qc_type',
  `qc_id` bigint DEFAULT NULL COMMENT 'qc_id',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `level` int DEFAULT NULL COMMENT 'level',
  `quantity` int DEFAULT NULL COMMENT 'quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_defect_record';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_indicator` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `tool` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'tool',
  `result_type` int DEFAULT NULL COMMENT 'result_type',
  `result_specification` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'result_specification',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_indicator';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_indicator_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qc_id` bigint DEFAULT NULL,
  `qc_type` int DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `sn` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_indicator_result_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `result_id` bigint DEFAULT NULL COMMENT 'result_id',
  `indicator_id` bigint DEFAULT NULL COMMENT 'indicator_id',
  `value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'value',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_indicator_result_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_ipqc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `template_id` bigint DEFAULT NULL,
  `source_doc_type` int DEFAULT NULL,
  `source_doc_id` bigint DEFAULT NULL,
  `source_line_id` bigint DEFAULT NULL,
  `source_doc_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `check_quantity` decimal(14,2) DEFAULT NULL,
  `qualified_quantity` decimal(14,2) DEFAULT NULL,
  `unqualified_quantity` decimal(14,2) DEFAULT NULL,
  `labor_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `material_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `other_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `critical_rate` decimal(14,2) DEFAULT NULL,
  `major_rate` decimal(14,2) DEFAULT NULL,
  `minor_rate` decimal(14,2) DEFAULT NULL,
  `critical_quantity` int DEFAULT NULL,
  `major_quantity` int DEFAULT NULL,
  `minor_quantity` int DEFAULT NULL,
  `check_result` tinyint DEFAULT NULL,
  `inspect_date` timestamp NULL DEFAULT NULL,
  `inspector_user_id` bigint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_ipqc_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ipqc_id` bigint DEFAULT NULL COMMENT 'ipqc_id',
  `indicator_id` bigint DEFAULT NULL COMMENT 'indicator_id',
  `tool` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'tool',
  `check_method` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'check_method',
  `standard_value` decimal(19,2) DEFAULT NULL COMMENT 'standard_value',
  `unit_measure_id` bigint DEFAULT NULL COMMENT 'unit_measure_id',
  `max_threshold` decimal(19,2) DEFAULT NULL COMMENT 'max_threshold',
  `min_threshold` decimal(19,2) DEFAULT NULL COMMENT 'min_threshold',
  `critical_quantity` int DEFAULT NULL COMMENT 'critical_quantity',
  `major_quantity` int DEFAULT NULL COMMENT 'major_quantity',
  `minor_quantity` int DEFAULT NULL COMMENT 'minor_quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_ipqc_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_iqc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` bigint DEFAULT NULL,
  `source_doc_type` int DEFAULT NULL,
  `source_doc_id` bigint DEFAULT NULL,
  `source_line_id` bigint DEFAULT NULL,
  `source_doc_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `vendor_batch` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `received_quantity` decimal(24,6) DEFAULT NULL,
  `check_quantity` decimal(24,6) DEFAULT NULL,
  `qualified_quantity` decimal(24,6) DEFAULT NULL,
  `unqualified_quantity` decimal(24,6) DEFAULT NULL,
  `critical_rate` decimal(10,2) DEFAULT NULL,
  `major_rate` decimal(10,2) DEFAULT NULL,
  `minor_rate` decimal(10,2) DEFAULT NULL,
  `critical_quantity` int DEFAULT NULL,
  `major_quantity` int DEFAULT NULL,
  `minor_quantity` int DEFAULT NULL,
  `check_result` tinyint DEFAULT NULL,
  `receive_date` timestamp NULL DEFAULT NULL,
  `inspect_date` timestamp NULL DEFAULT NULL,
  `inspector_user_id` bigint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_iqc_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `iqc_id` bigint DEFAULT NULL COMMENT 'iqc_id',
  `indicator_id` bigint DEFAULT NULL COMMENT 'indicator_id',
  `tool` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'tool',
  `check_method` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'check_method',
  `standard_value` decimal(19,2) DEFAULT NULL COMMENT 'standard_value',
  `unit_measure_id` bigint DEFAULT NULL COMMENT 'unit_measure_id',
  `max_threshold` decimal(19,2) DEFAULT NULL COMMENT 'max_threshold',
  `min_threshold` decimal(19,2) DEFAULT NULL COMMENT 'min_threshold',
  `critical_quantity` int DEFAULT NULL COMMENT 'critical_quantity',
  `major_quantity` int DEFAULT NULL COMMENT 'major_quantity',
  `minor_quantity` int DEFAULT NULL COMMENT 'minor_quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_iqc_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_oqc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` bigint NOT NULL,
  `source_doc_type` int DEFAULT NULL,
  `source_doc_id` bigint DEFAULT NULL,
  `source_line_id` bigint DEFAULT NULL,
  `source_doc_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` bigint NOT NULL,
  `batch_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `min_check_quantity` int DEFAULT '1',
  `max_unqualified_quantity` int DEFAULT '0',
  `out_quantity` decimal(14,2) NOT NULL,
  `check_quantity` decimal(14,2) DEFAULT NULL,
  `qualified_quantity` decimal(14,2) DEFAULT '0.00',
  `unqualified_quantity` decimal(14,2) DEFAULT '0.00',
  `critical_rate` decimal(14,2) DEFAULT '0.00',
  `major_rate` decimal(14,2) DEFAULT '0.00',
  `minor_rate` decimal(14,2) DEFAULT '0.00',
  `critical_quantity` int DEFAULT '0',
  `major_quantity` int DEFAULT '0',
  `minor_quantity` int DEFAULT '0',
  `check_result` tinyint DEFAULT NULL,
  `out_date` timestamp NULL DEFAULT NULL,
  `inspect_date` timestamp NULL DEFAULT NULL,
  `inspector_user_id` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_oqc_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oqc_id` bigint DEFAULT NULL COMMENT 'oqc_id',
  `indicator_id` bigint DEFAULT NULL COMMENT 'indicator_id',
  `tool` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'tool',
  `check_method` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'check_method',
  `standard_value` decimal(19,2) DEFAULT NULL COMMENT 'standard_value',
  `unit_measure_id` bigint DEFAULT NULL COMMENT 'unit_measure_id',
  `max_threshold` decimal(19,2) DEFAULT NULL COMMENT 'max_threshold',
  `min_threshold` decimal(19,2) DEFAULT NULL COMMENT 'min_threshold',
  `critical_quantity` int DEFAULT NULL COMMENT 'critical_quantity',
  `major_quantity` int DEFAULT NULL COMMENT 'major_quantity',
  `minor_quantity` int DEFAULT NULL COMMENT 'minor_quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_oqc_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_rqc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` bigint NOT NULL,
  `source_doc_type` int DEFAULT NULL,
  `source_doc_id` bigint DEFAULT NULL,
  `source_line_id` bigint DEFAULT NULL,
  `source_doc_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `batch_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_quantity` decimal(14,2) DEFAULT NULL,
  `qualified_quantity` decimal(14,2) DEFAULT '0.00',
  `unqualified_quantity` decimal(14,2) DEFAULT '0.00',
  `critical_rate` decimal(14,2) DEFAULT '0.00',
  `major_rate` decimal(14,2) DEFAULT '0.00',
  `minor_rate` decimal(14,2) DEFAULT '0.00',
  `critical_quantity` int DEFAULT '0',
  `major_quantity` int DEFAULT '0',
  `minor_quantity` int DEFAULT '0',
  `check_result` tinyint DEFAULT NULL,
  `inspect_date` timestamp NULL DEFAULT NULL,
  `inspector_user_id` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_rqc_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rqc_id` bigint DEFAULT NULL COMMENT 'rqc_id',
  `indicator_id` bigint DEFAULT NULL COMMENT 'indicator_id',
  `tool` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'tool',
  `check_method` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'check_method',
  `standard_value` decimal(19,2) DEFAULT NULL COMMENT 'standard_value',
  `unit_measure_id` bigint DEFAULT NULL COMMENT 'unit_measure_id',
  `max_threshold` decimal(19,2) DEFAULT NULL COMMENT 'max_threshold',
  `min_threshold` decimal(19,2) DEFAULT NULL COMMENT 'min_threshold',
  `critical_quantity` int DEFAULT NULL COMMENT 'critical_quantity',
  `major_quantity` int DEFAULT NULL COMMENT 'major_quantity',
  `minor_quantity` int DEFAULT NULL COMMENT 'minor_quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_rqc_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `types` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'types',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_template';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_template_indicator` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `template_id` bigint DEFAULT NULL COMMENT 'template_id',
  `indicator_id` bigint DEFAULT NULL COMMENT 'indicator_id',
  `check_method` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'check_method',
  `standard_value` decimal(19,2) DEFAULT NULL COMMENT 'standard_value',
  `unit_measure_id` bigint DEFAULT NULL COMMENT 'unit_measure_id',
  `threshold_max` decimal(19,2) DEFAULT NULL COMMENT 'threshold_max',
  `threshold_min` decimal(19,2) DEFAULT NULL COMMENT 'threshold_min',
  `doc_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'doc_url',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_template_indicator';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_qc_template_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `template_id` bigint DEFAULT NULL COMMENT 'template_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity_check` int DEFAULT NULL COMMENT 'quantity_check',
  `quantity_unqualified` int DEFAULT NULL COMMENT 'quantity_unqualified',
  `critical_rate` decimal(19,2) DEFAULT NULL COMMENT 'critical_rate',
  `major_rate` decimal(19,2) DEFAULT NULL COMMENT 'major_rate',
  `minor_rate` decimal(19,2) DEFAULT NULL COMMENT 'minor_rate',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_qc_template_item';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_tm_tool` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `brand` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'brand',
  `specification` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'specification',
  `tool_type_id` bigint DEFAULT NULL COMMENT 'tool_type_id',
  `quantity` int DEFAULT NULL COMMENT 'quantity',
  `available_quantity` int DEFAULT NULL COMMENT 'available_quantity',
  `mainten_type` int DEFAULT NULL COMMENT 'mainten_type',
  `next_mainten_period` int DEFAULT NULL COMMENT 'next_mainten_period',
  `next_mainten_date` datetime DEFAULT NULL COMMENT 'next_mainten_date',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_tm_tool';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_tm_tool_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `code_flag` bit(1) DEFAULT NULL COMMENT 'code_flag',
  `mainten_type` int DEFAULT NULL COMMENT 'mainten_type',
  `mainten_period` int DEFAULT NULL COMMENT 'mainten_period',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_tm_tool_type';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_arrival_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `arrival_date` timestamp NULL DEFAULT NULL,
  `contact_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_telephone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_arrival_notice_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `notice_id` bigint DEFAULT NULL COMMENT 'notice_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `arrival_quantity` decimal(19,2) DEFAULT NULL COMMENT 'arrival_quantity',
  `qualified_quantity` decimal(19,2) DEFAULT NULL COMMENT 'qualified_quantity',
  `iqc_check_flag` bit(1) DEFAULT NULL COMMENT 'iqc_check_flag',
  `iqc_id` bigint DEFAULT NULL COMMENT 'iqc_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_arrival_notice_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_barcode` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_id` bigint DEFAULT NULL COMMENT 'config_id',
  `format` int DEFAULT NULL COMMENT 'format',
  `biz_type` int DEFAULT NULL COMMENT 'biz_type',
  `content` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'content',
  `biz_id` bigint DEFAULT NULL COMMENT 'biz_id',
  `biz_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'biz_code',
  `biz_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'biz_name',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_barcode';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_barcode_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `format` int DEFAULT NULL COMMENT 'format',
  `biz_type` int DEFAULT NULL COMMENT 'biz_type',
  `content_format` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'content_format',
  `content_example` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'content_example',
  `auto_generate_flag` bit(1) DEFAULT NULL COMMENT 'auto_generate_flag',
  `default_template` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'default_template',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_barcode_config';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_batch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `produce_date` timestamp NULL DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  `receipt_date` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `sales_order_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `tool_id` bigint DEFAULT NULL,
  `mold_id` bigint DEFAULT NULL,
  `lot_number` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_item_consume` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_order_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  `workstation_id` bigint NOT NULL,
  `process_id` bigint NOT NULL,
  `feedback_id` bigint NOT NULL,
  `consume_date` timestamp NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_item_consume_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `consume_id` bigint NOT NULL,
  `line_id` bigint NOT NULL,
  `material_stock_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(14,2) NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  `area_id` bigint NOT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_item_consume_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `consume_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(14,2) NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_item_receipt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iqc_id` bigint DEFAULT NULL,
  `notice_id` bigint DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `purchase_order_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_date` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_item_receipt_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `line_id` bigint NOT NULL,
  `receipt_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(14,2) DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_item_receipt_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receipt_id` bigint NOT NULL,
  `arrival_notice_line_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `received_quantity` decimal(14,2) DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_date` timestamp NULL DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  `lot_number` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_material_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_type_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `quantity` decimal(14,2) DEFAULT NULL,
  `receipt_time` timestamp NULL DEFAULT NULL,
  `frozen` tinyint(1) DEFAULT '0',
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_misc_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `source_doc_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'source_doc_type',
  `source_doc_id` bigint DEFAULT NULL COMMENT 'source_doc_id',
  `source_doc_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'source_doc_code',
  `issue_date` datetime DEFAULT NULL COMMENT 'issue_date',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_misc_issue';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_misc_issue_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `issue_id` bigint DEFAULT NULL COMMENT 'issue_id',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_misc_issue_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_misc_issue_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `issue_id` bigint DEFAULT NULL COMMENT 'issue_id',
  `source_doc_line_id` bigint DEFAULT NULL COMMENT 'source_doc_line_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_misc_issue_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_misc_receipt` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `source_doc_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'source_doc_type',
  `source_doc_id` bigint DEFAULT NULL COMMENT 'source_doc_id',
  `source_doc_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'source_doc_code',
  `receipt_date` datetime DEFAULT NULL COMMENT 'receipt_date',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_misc_receipt';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_misc_receipt_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `receipt_id` bigint DEFAULT NULL COMMENT 'receipt_id',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_misc_receipt_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_misc_receipt_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `receipt_id` bigint DEFAULT NULL COMMENT 'receipt_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_misc_receipt_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_outsource_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `vendor_id` bigint DEFAULT NULL COMMENT 'vendor_id',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `issue_date` datetime DEFAULT NULL COMMENT 'issue_date',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_outsource_issue';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_outsource_issue_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `issue_id` bigint DEFAULT NULL COMMENT 'issue_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_outsource_issue_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_outsource_issue_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `issue_id` bigint DEFAULT NULL COMMENT 'issue_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_outsource_issue_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_outsource_receipt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `receipt_date` timestamp NULL DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_outsource_receipt_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `receipt_id` bigint DEFAULT NULL COMMENT 'receipt_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_outsource_receipt_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_outsource_receipt_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `receipt_id` bigint DEFAULT NULL COMMENT 'receipt_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `production_date` datetime DEFAULT NULL COMMENT 'production_date',
  `expire_date` datetime DEFAULT NULL COMMENT 'expire_date',
  `lot_number` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'lot_number',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `iqc_id` bigint DEFAULT NULL COMMENT 'iqc_id',
  `iqc_check_flag` bit(1) DEFAULT NULL COMMENT 'iqc_check_flag',
  `quality_status` int DEFAULT NULL COMMENT 'quality_status',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_outsource_receipt_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_package` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `parent_id` bigint DEFAULT NULL COMMENT 'parent_id',
  `package_date` datetime DEFAULT NULL COMMENT 'package_date',
  `sales_order_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sales_order_code',
  `invoice_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'invoice_code',
  `client_id` bigint DEFAULT NULL COMMENT 'client_id',
  `length` decimal(19,2) DEFAULT NULL COMMENT 'length',
  `width` decimal(19,2) DEFAULT NULL COMMENT 'width',
  `height` decimal(19,2) DEFAULT NULL COMMENT 'height',
  `size_unit_id` bigint DEFAULT NULL COMMENT 'size_unit_id',
  `net_weight` decimal(19,2) DEFAULT NULL COMMENT 'net_weight',
  `gross_weight` decimal(19,2) DEFAULT NULL COMMENT 'gross_weight',
  `weight_unit_id` bigint DEFAULT NULL COMMENT 'weight_unit_id',
  `inspector_user_id` bigint DEFAULT NULL COMMENT 'inspector_user_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_package';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_package_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `package_id` bigint DEFAULT NULL COMMENT 'package_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `expire_date` datetime DEFAULT NULL COMMENT 'expire_date',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_package_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `task_id` bigint DEFAULT NULL COMMENT 'task_id',
  `issue_date` datetime DEFAULT NULL COMMENT 'issue_date',
  `required_time` datetime DEFAULT NULL COMMENT 'required_time',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_product_issue';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_issue_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `issue_id` bigint DEFAULT NULL COMMENT 'issue_id',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_product_issue_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_issue_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `issue_id` bigint DEFAULT NULL COMMENT 'issue_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_product_issue_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_produce` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_order_id` bigint DEFAULT NULL,
  `feedback_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `produce_date` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_produce_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produce_id` bigint DEFAULT NULL,
  `line_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `quantity` decimal(12,2) DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_produce_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produce_id` bigint DEFAULT NULL,
  `feedback_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `quantity` decimal(12,2) DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  `lot_number` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_receipt` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `receipt_date` datetime DEFAULT NULL COMMENT 'receipt_date',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_product_receipt';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_receipt_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `receipt_id` bigint DEFAULT NULL COMMENT 'receipt_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_product_receipt_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_receipt_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `receipt_id` bigint DEFAULT NULL COMMENT 'receipt_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_product_receipt_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_sales` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `client_id` bigint DEFAULT NULL COMMENT 'client_id',
  `sales_order_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sales_order_code',
  `notice_id` bigint DEFAULT NULL COMMENT 'notice_id',
  `sales_date` datetime DEFAULT NULL COMMENT 'sales_date',
  `contact_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact_name',
  `contact_telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact_telephone',
  `contact_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'contact_address',
  `carrier` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'carrier',
  `shipping_number` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'shipping_number',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_product_sales';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_sales_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `line_id` bigint NOT NULL,
  `sales_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(14,2) DEFAULT NULL,
  `material_stock_id` bigint DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_product_sales_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sales_id` bigint NOT NULL,
  `notice_line_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(20,6) NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material_stock_id` bigint DEFAULT NULL,
  `oqc_check_flag` tinyint DEFAULT NULL,
  `oqc_id` bigint DEFAULT NULL,
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `workstation_id` bigint DEFAULT NULL COMMENT 'workstation_id',
  `type` int DEFAULT NULL COMMENT 'type',
  `return_date` datetime DEFAULT NULL COMMENT 'return_date',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_return_issue';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_issue_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `issue_id` bigint DEFAULT NULL COMMENT 'issue_id',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_return_issue_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_issue_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `issue_id` bigint NOT NULL,
  `material_stock_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(12,2) NOT NULL DEFAULT '0.00',
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rqc_id` bigint DEFAULT NULL,
  `rqc_check_flag` tinyint(1) NOT NULL DEFAULT '0',
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_sales` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `sales_order_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sales_order_code',
  `client_id` bigint DEFAULT NULL COMMENT 'client_id',
  `return_date` datetime DEFAULT NULL COMMENT 'return_date',
  `return_reason` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'return_reason',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_return_sales';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_sales_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `return_id` bigint DEFAULT NULL COMMENT 'return_id',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_return_sales_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_sales_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `return_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(12,2) NOT NULL DEFAULT '0.00',
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rqc_id` bigint DEFAULT NULL,
  `rqc_check_flag` tinyint(1) NOT NULL DEFAULT '0',
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_vendor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `purchase_order_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'purchase_order_code',
  `vendor_id` bigint DEFAULT NULL COMMENT 'vendor_id',
  `return_date` datetime DEFAULT NULL COMMENT 'return_date',
  `return_reason` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'return_reason',
  `transport_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'transport_code',
  `transport_telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'transport_telephone',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_return_vendor';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_vendor_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `return_id` bigint DEFAULT NULL COMMENT 'return_id',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_return_vendor_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_return_vendor_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `return_id` bigint DEFAULT NULL COMMENT 'return_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_return_vendor_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_sales_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `sales_order_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sales_order_code',
  `client_id` bigint DEFAULT NULL COMMENT 'client_id',
  `sales_date` datetime DEFAULT NULL COMMENT 'sales_date',
  `recipient_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'recipient_name',
  `recipient_telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'recipient_telephone',
  `recipient_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'recipient_address',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_sales_notice';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_sales_notice_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `notice_id` bigint DEFAULT NULL COMMENT 'notice_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `oqc_check_flag` bit(1) DEFAULT NULL COMMENT 'oqc_check_flag',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_sales_notice_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_sn` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uuid` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'uuid',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `work_order_id` bigint DEFAULT NULL COMMENT 'work_order_id',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_sn';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_stock_taking_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `start_time` datetime DEFAULT NULL COMMENT 'start_time',
  `end_time` datetime DEFAULT NULL COMMENT 'end_time',
  `blind_flag` bit(1) DEFAULT NULL COMMENT 'blind_flag',
  `frozen` bit(1) DEFAULT NULL COMMENT 'frozen',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_stock_taking_plan';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_stock_taking_plan_param` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `plan_id` bigint DEFAULT NULL COMMENT 'plan_id',
  `type` int DEFAULT NULL COMMENT 'type',
  `value_id` bigint DEFAULT NULL COMMENT 'value_id',
  `value_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'value_code',
  `value_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'value_name',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_stock_taking_plan_param';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_stock_taking_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `taking_date` datetime DEFAULT NULL COMMENT 'taking_date',
  `type` int DEFAULT NULL COMMENT 'type',
  `user_id` bigint DEFAULT NULL COMMENT 'user_id',
  `plan_id` bigint DEFAULT NULL COMMENT 'plan_id',
  `blind_flag` bit(1) DEFAULT NULL COMMENT 'blind_flag',
  `frozen` bit(1) DEFAULT NULL COMMENT 'frozen',
  `start_time` datetime DEFAULT NULL COMMENT 'start_time',
  `end_time` datetime DEFAULT NULL COMMENT 'end_time',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_stock_taking_task';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_stock_taking_task_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint DEFAULT NULL COMMENT 'task_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `taking_quantity` decimal(19,2) DEFAULT NULL COMMENT 'taking_quantity',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_stock_taking_task_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_stock_taking_task_result` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint DEFAULT NULL COMMENT 'task_id',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `taking_quantity` decimal(19,2) DEFAULT NULL COMMENT 'taking_quantity',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_stock_taking_task_result';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` int DEFAULT NULL COMMENT 'type',
  `biz_type` int DEFAULT NULL COMMENT 'biz_type',
  `biz_id` bigint DEFAULT NULL COMMENT 'biz_id',
  `biz_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'biz_code',
  `biz_line_id` bigint DEFAULT NULL COMMENT 'biz_line_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `related_transaction_id` bigint DEFAULT NULL COMMENT 'related_transaction_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `batch_code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'batch_code',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area_id` bigint DEFAULT NULL COMMENT 'area_id',
  `transaction_time` datetime DEFAULT NULL COMMENT 'transaction_time',
  `erp_time` datetime DEFAULT NULL COMMENT 'erp_time',
  `receipt_time` datetime DEFAULT NULL COMMENT 'receipt_time',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_transaction';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_transfer` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `type` int DEFAULT NULL COMMENT 'type',
  `delivery_flag` bit(1) DEFAULT NULL COMMENT 'delivery_flag',
  `recipient_name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'recipient_name',
  `recipient_telephone` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'recipient_telephone',
  `destination_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'destination_address',
  `carrier` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'carrier',
  `shipping_number` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'shipping_number',
  `confirm_flag` bit(1) DEFAULT NULL COMMENT 'confirm_flag',
  `transfer_date` datetime DEFAULT NULL COMMENT 'transfer_date',
  `status` int DEFAULT NULL COMMENT 'status',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_transfer';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_transfer_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `line_id` bigint DEFAULT NULL COMMENT 'line_id',
  `transfer_id` bigint DEFAULT NULL COMMENT 'transfer_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `to_warehouse_id` bigint DEFAULT NULL COMMENT 'to_warehouse_id',
  `to_location_id` bigint DEFAULT NULL COMMENT 'to_location_id',
  `to_area_id` bigint DEFAULT NULL COMMENT 'to_area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_transfer_detail';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_transfer_line` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `transfer_id` bigint DEFAULT NULL COMMENT 'transfer_id',
  `material_stock_id` bigint DEFAULT NULL COMMENT 'material_stock_id',
  `item_id` bigint DEFAULT NULL COMMENT 'item_id',
  `quantity` decimal(19,2) DEFAULT NULL COMMENT 'quantity',
  `batch_id` bigint DEFAULT NULL COMMENT 'batch_id',
  `from_warehouse_id` bigint DEFAULT NULL COMMENT 'from_warehouse_id',
  `from_location_id` bigint DEFAULT NULL COMMENT 'from_location_id',
  `from_area_id` bigint DEFAULT NULL COMMENT 'from_area_id',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_transfer_line';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'address',
  `area` decimal(19,2) DEFAULT NULL COMMENT 'area',
  `charge_user_id` bigint DEFAULT NULL COMMENT 'charge_user_id',
  `frozen` bit(1) DEFAULT NULL COMMENT 'frozen',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_warehouse';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_warehouse_area` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `location_id` bigint DEFAULT NULL COMMENT 'location_id',
  `area` decimal(19,2) DEFAULT NULL COMMENT 'area',
  `max_load` decimal(19,2) DEFAULT NULL COMMENT 'max_load',
  `position_x` int DEFAULT NULL COMMENT 'position_x',
  `position_y` int DEFAULT NULL COMMENT 'position_y',
  `position_z` int DEFAULT NULL COMMENT 'position_z',
  `status` int DEFAULT NULL COMMENT 'status',
  `frozen` bit(1) DEFAULT NULL COMMENT 'frozen',
  `allow_item_mixing` bit(1) DEFAULT NULL COMMENT 'allow_item_mixing',
  `allow_batch_mixing` bit(1) DEFAULT NULL COMMENT 'allow_batch_mixing',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_warehouse_area';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes_wm_warehouse_location` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'code',
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'name',
  `warehouse_id` bigint DEFAULT NULL COMMENT 'warehouse_id',
  `area` decimal(19,2) DEFAULT NULL COMMENT 'area',
  `frozen` bit(1) DEFAULT NULL COMMENT 'frozen',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'remark',
  `creator` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `updater` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'deleted',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tenant_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='mes_wm_warehouse_location';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閮ㄩ棬id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閮ㄩ棬鍚嶇О',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '鐖堕儴闂╥d',
  `sort` int NOT NULL DEFAULT '0' COMMENT '鏄剧ず椤哄簭',
  `leader_user_id` bigint DEFAULT NULL COMMENT '璐熻矗浜?,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鑱旂郴鐢佃瘽',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '閭',
  `status` tinyint NOT NULL COMMENT '閮ㄩ棬鐘舵€侊紙0姝ｅ父 1鍋滅敤锛?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='閮ㄩ棬琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_data` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '瀛楀吀缂栫爜',
  `sort` int NOT NULL DEFAULT '0' COMMENT '瀛楀吀鎺掑簭',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '瀛楀吀鏍囩',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '瀛楀吀閿€?,
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '瀛楀吀绫诲瀷',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '鐘舵€侊紙0姝ｅ父 1鍋滅敤锛?,
  `color_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '棰滆壊绫诲瀷',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'css 鏍峰紡',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1061096 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瀛楀吀鏁版嵁琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '瀛楀吀涓婚敭',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '瀛楀吀鍚嶇О',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '瀛楀吀绫诲瀷',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '鐘舵€侊紙0姝ｅ父 1鍋滅敤锛?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `deleted_time` datetime DEFAULT NULL COMMENT '鍒犻櫎鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1061092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瀛楀吀绫诲瀷琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '璁块棶ID',
  `log_type` bigint NOT NULL COMMENT '鏃ュ織绫诲瀷',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閾捐矾杩借釜缂栧彿',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛绫诲瀷',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛璐﹀彿',
  `result` tinyint NOT NULL COMMENT '鐧婚檰缁撴灉',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '娴忚鍣?UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_username` (`username`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绯荤粺璁块棶璁板綍';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_account` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭',
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閭',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛鍚?,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀵嗙爜',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMTP 鏈嶅姟鍣ㄥ煙鍚?,
  `port` int NOT NULL COMMENT 'SMTP 鏈嶅姟鍣ㄧ鍙?,
  `ssl_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁寮€鍚?SSL',
  `starttls_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁寮€鍚?STARTTLS',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='閭璐﹀彿琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `user_id` bigint DEFAULT NULL COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint DEFAULT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `to_mails` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎺ユ敹閭鍦板潃',
  `cc_mails` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鎶勯€侀偖绠卞湴鍧€',
  `bcc_mails` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '瀵嗛€侀偖绠卞湴鍧€',
  `account_id` bigint NOT NULL COMMENT '閭璐﹀彿缂栧彿',
  `from_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍙戦€侀偖绠卞湴鍧€',
  `template_id` bigint NOT NULL COMMENT '妯℃澘缂栧彿',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘缂栫爜',
  `template_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '妯＄増鍙戦€佷汉鍚嶇О',
  `template_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閭欢鏍囬',
  `template_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閭欢鍐呭',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閭欢鍙傛暟',
  `send_status` tinyint NOT NULL DEFAULT '0' COMMENT '鍙戦€佺姸鎬?,
  `send_time` datetime DEFAULT NULL COMMENT '鍙戦€佹椂闂?,
  `send_message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鍙戦€佽繑鍥炵殑娑堟伅 ID',
  `send_exception` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鍙戦€佸紓甯?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='閭欢鏃ュ織琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘鍚嶇О',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘缂栫爜',
  `account_id` bigint NOT NULL COMMENT '鍙戦€佺殑閭璐﹀彿缂栧彿',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鍙戦€佷汉鍚嶇О',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘鏍囬',
  `content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘鍐呭',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍙傛暟鏁扮粍',
  `status` tinyint NOT NULL COMMENT '寮€鍚姸鎬?,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='閭欢妯＄増琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鑿滃崟ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鑿滃崟鍚嶇О',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鏉冮檺鏍囪瘑',
  `type` tinyint NOT NULL COMMENT '鑿滃崟绫诲瀷',
  `sort` int NOT NULL DEFAULT '0' COMMENT '鏄剧ず椤哄簭',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '鐖惰彍鍗旾D',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '璺敱鍦板潃',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '鑿滃崟鍥炬爣',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缁勪欢璺緞',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缁勪欢鍚?,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '鑿滃崟鐘舵€?,
  `visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '鏄惁鍙',
  `keep_alive` bit(1) NOT NULL DEFAULT b'1' COMMENT '鏄惁缂撳瓨',
  `always_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '鏄惁鎬绘槸鏄剧ず',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6611 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鑿滃崟鏉冮檺琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鍏憡ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍏憡鏍囬',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍏憡鍐呭',
  `type` tinyint NOT NULL COMMENT '鍏憡绫诲瀷锛?閫氱煡 2鍏憡锛?,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '鍏憡鐘舵€侊紙0姝ｅ父 1鍏抽棴锛?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='閫氱煡鍏憡琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notify_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鐢ㄦ埛ID',
  `user_id` bigint NOT NULL COMMENT '鐢ㄦ埛id',
  `user_type` tinyint NOT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `template_id` bigint NOT NULL COMMENT '妯＄増缂栧彿',
  `template_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘缂栫爜',
  `template_nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯＄増鍙戦€佷汉鍚嶇О',
  `template_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯＄増鍐呭',
  `template_type` int NOT NULL COMMENT '妯＄増绫诲瀷',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯＄増鍙傛暟',
  `read_status` bit(1) NOT NULL COMMENT '鏄惁宸茶',
  `read_time` datetime DEFAULT NULL COMMENT '闃呰鏃堕棿',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id_user_type_read_status` (`user_id`,`user_type`,`read_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绔欏唴淇℃秷鎭〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notify_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘鍚嶇О',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯＄増缂栫爜',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍙戦€佷汉鍚嶇О',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯＄増鍐呭',
  `type` tinyint NOT NULL COMMENT '绫诲瀷',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鍙傛暟鏁扮粍',
  `status` tinyint NOT NULL COMMENT '鐘舵€?,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绔欏唴淇℃ā鏉胯〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_access_token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `user_id` bigint NOT NULL COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint NOT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `user_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛淇℃伅',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '璁块棶浠ょ墝',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍒锋柊浠ょ墝',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹㈡埛绔紪鍙?,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鎺堟潈鑼冨洿',
  `expires_time` datetime NOT NULL COMMENT '杩囨湡鏃堕棿',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_access_token` (`access_token`) USING BTREE,
  KEY `idx_refresh_token` (`refresh_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54514 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 璁块棶浠ょ墝';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_approve` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `user_id` bigint NOT NULL COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint NOT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹㈡埛绔紪鍙?,
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鎺堟潈鑼冨洿',
  `approved` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鎺ュ彈',
  `expires_time` datetime NOT NULL COMMENT '杩囨湡鏃堕棿',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id_user_type_client_id` (`user_id`,`user_type`,`client_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 鎵瑰噯琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_client` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹㈡埛绔紪鍙?,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹㈡埛绔瘑閽?,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '搴旂敤鍚?,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '搴旂敤鍥炬爣',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '搴旂敤鎻忚堪',
  `status` tinyint NOT NULL COMMENT '鐘舵€?,
  `access_token_validity_seconds` int NOT NULL COMMENT '璁块棶浠ょ墝鐨勬湁鏁堟湡',
  `refresh_token_validity_seconds` int NOT NULL COMMENT '鍒锋柊浠ょ墝鐨勬湁鏁堟湡',
  `redirect_uris` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍙噸瀹氬悜鐨?URI 鍦板潃',
  `authorized_grant_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎺堟潈绫诲瀷',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鎺堟潈鑼冨洿',
  `auto_approve_scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鑷姩閫氳繃鐨勬巿鏉冭寖鍥?,
  `authorities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鏉冮檺',
  `resource_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '璧勬簮',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '闄勫姞淇℃伅',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_client_id` (`client_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 瀹㈡埛绔〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `user_id` bigint NOT NULL COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint NOT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎺堟潈鐮?,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹㈡埛绔紪鍙?,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鎺堟潈鑼冨洿',
  `expires_time` datetime NOT NULL COMMENT '杩囨湡鏃堕棿',
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鍙噸瀹氬悜鐨?URI 鍦板潃',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐘舵€?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 鎺堟潈鐮佽〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_refresh_token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `user_id` bigint NOT NULL COMMENT '鐢ㄦ埛缂栧彿',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍒锋柊浠ょ墝',
  `user_type` tinyint NOT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹㈡埛绔紪鍙?,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鎺堟潈鑼冨洿',
  `expires_time` datetime NOT NULL COMMENT '杩囨湡鏃堕棿',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_refresh_token` (`refresh_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2611 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 鍒锋柊浠ょ墝';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_operate_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏃ュ織涓婚敭',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閾捐矾杩借釜缂栧彿',
  `user_id` bigint NOT NULL COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛绫诲瀷',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎿嶄綔妯″潡绫诲瀷',
  `sub_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎿嶄綔鍚?,
  `biz_id` bigint NOT NULL COMMENT '鎿嶄綔鏁版嵁妯″潡缂栧彿',
  `action` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鎿嶄綔鍐呭',
  `success` bit(1) NOT NULL DEFAULT b'1' COMMENT '鎿嶄綔缁撴灉',
  `extra` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鎷撳睍瀛楁',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '璇锋眰鏂规硶鍚?,
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '璇锋眰鍦板潃',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐢ㄦ埛 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '娴忚鍣?UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鎿嶄綔鏃ュ織璁板綍 V2 鐗堟湰';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '宀椾綅ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宀椾綅缂栫爜',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宀椾綅鍚嶇О',
  `sort` int NOT NULL COMMENT '鏄剧ず椤哄簭',
  `status` tinyint NOT NULL COMMENT '鐘舵€侊紙0姝ｅ父 1鍋滅敤锛?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='宀椾綅淇℃伅琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '瑙掕壊ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瑙掕壊鍚嶇О',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瑙掕壊鏉冮檺瀛楃涓?,
  `sort` int NOT NULL COMMENT '鏄剧ず椤哄簭',
  `data_scope` tinyint NOT NULL DEFAULT '1' COMMENT '鏁版嵁鑼冨洿锛?锛氬叏閮ㄦ暟鎹潈闄?2锛氳嚜瀹氭暟鎹潈闄?3锛氭湰閮ㄩ棬鏁版嵁鏉冮檺 4锛氭湰閮ㄩ棬鍙婁互涓嬫暟鎹潈闄愶級',
  `data_scope_dept_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鏁版嵁鑼冨洿(鎸囧畾閮ㄩ棬鏁扮粍)',
  `status` tinyint NOT NULL COMMENT '瑙掕壊鐘舵€侊紙0姝ｅ父 1鍋滅敤锛?,
  `type` tinyint NOT NULL COMMENT '瑙掕壊绫诲瀷',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瑙掕壊淇℃伅琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鑷缂栧彿',
  `role_id` bigint NOT NULL COMMENT '瑙掕壊ID',
  `menu_id` bigint NOT NULL COMMENT '鑿滃崟ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瑙掕壊鍜岃彍鍗曞叧鑱旇〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `signature` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐭俊绛惧悕',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '娓犻亾缂栫爜',
  `status` tinyint NOT NULL COMMENT '寮€鍚姸鎬?,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `api_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐭俊 API 鐨勮处鍙?,
  `api_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐭俊 API 鐨勭閽?,
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐭俊鍙戦€佸洖璋?URL',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鐭俊娓犻亾';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎵嬫満鍙?,
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '楠岃瘉鐮?,
  `create_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍒涘缓 IP',
  `scene` tinyint NOT NULL COMMENT '鍙戦€佸満鏅?,
  `today_index` tinyint NOT NULL COMMENT '浠婃棩鍙戦€佺殑绗嚑鏉?,
  `used` tinyint NOT NULL COMMENT '鏄惁浣跨敤',
  `used_time` datetime DEFAULT NULL COMMENT '浣跨敤鏃堕棿',
  `used_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '浣跨敤 IP',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_mobile` (`mobile`) USING BTREE COMMENT '鎵嬫満鍙?
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鎵嬫満楠岃瘉鐮?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `channel_id` bigint NOT NULL COMMENT '鐭俊娓犻亾缂栧彿',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐭俊娓犻亾缂栫爜',
  `template_id` bigint NOT NULL COMMENT '妯℃澘缂栧彿',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘缂栫爜',
  `template_type` tinyint NOT NULL COMMENT '鐭俊绫诲瀷',
  `template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐭俊鍐呭',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐭俊鍙傛暟',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐭俊 API 鐨勬ā鏉跨紪鍙?,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎵嬫満鍙?,
  `user_id` bigint DEFAULT NULL COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint DEFAULT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `send_status` tinyint NOT NULL DEFAULT '0' COMMENT '鍙戦€佺姸鎬?,
  `send_time` datetime DEFAULT NULL COMMENT '鍙戦€佹椂闂?,
  `api_send_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐭俊 API 鍙戦€佺粨鏋滅殑缂栫爜',
  `api_send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐭俊 API 鍙戦€佸け璐ョ殑鎻愮ず',
  `api_request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐭俊 API 鍙戦€佽繑鍥炵殑鍞竴璇锋眰 ID',
  `api_serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐭俊 API 鍙戦€佽繑鍥炵殑搴忓彿',
  `receive_status` tinyint NOT NULL DEFAULT '0' COMMENT '鎺ユ敹鐘舵€?,
  `receive_time` datetime DEFAULT NULL COMMENT '鎺ユ敹鏃堕棿',
  `api_receive_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'API 鎺ユ敹缁撴灉鐨勭紪鐮?,
  `api_receive_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'API 鎺ユ敹缁撴灉鐨勮鏄?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1553 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鐭俊鏃ュ織';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `type` tinyint NOT NULL COMMENT '妯℃澘绫诲瀷',
  `status` tinyint NOT NULL COMMENT '寮€鍚姸鎬?,
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘缂栫爜',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘鍚嶇О',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妯℃澘鍐呭',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍙傛暟鏁扮粍',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐭俊 API 鐨勬ā鏉跨紪鍙?,
  `channel_id` bigint NOT NULL COMMENT '鐭俊娓犻亾缂栧彿',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐭俊娓犻亾缂栫爜',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鐭俊妯℃澘';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_social_client` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '搴旂敤鍚?,
  `social_type` tinyint NOT NULL COMMENT '绀句氦骞冲彴鐨勭被鍨?,
  `user_type` tinyint NOT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹㈡埛绔紪鍙?,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹㈡埛绔瘑閽?,
  `agent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '浠ｇ悊缂栧彿',
  `public_key` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'publicKey 鍏挜',
  `status` tinyint NOT NULL COMMENT '鐘舵€?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绀句氦瀹㈡埛绔〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_social_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭(鑷绛栫暐)',
  `type` tinyint NOT NULL COMMENT '绀句氦骞冲彴鐨勭被鍨?,
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绀句氦 openid',
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '绀句氦 token',
  `raw_token_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍘熷 Token 鏁版嵁锛屼竴鑸槸 JSON 鏍煎紡',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛鏄电О',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐢ㄦ埛澶村儚',
  `raw_user_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍘熷鐢ㄦ埛鏁版嵁锛屼竴鑸槸 JSON 鏍煎紡',
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鏈€鍚庝竴娆＄殑璁よ瘉 code',
  `state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鏈€鍚庝竴娆＄殑璁よ瘉 state',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type_openid` (`type`,`openid`) USING BTREE,
  KEY `idx_type_code_state` (`type`,`code`,`state`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绀句氦鐢ㄦ埛琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_social_user_bind` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭(鑷绛栫暐)',
  `user_id` bigint NOT NULL COMMENT '鐢ㄦ埛缂栧彿',
  `user_type` tinyint NOT NULL COMMENT '鐢ㄦ埛绫诲瀷',
  `social_type` tinyint NOT NULL COMMENT '绀句氦骞冲彴鐨勭被鍨?,
  `social_user_id` bigint NOT NULL COMMENT '绀句氦鐢ㄦ埛鐨勭紪鍙?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_type_social_user_id` (`user_type`,`social_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绀句氦缁戝畾琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tenant` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '绉熸埛缂栧彿',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绉熸埛鍚?,
  `contact_user_id` bigint DEFAULT NULL COMMENT '鑱旂郴浜虹殑鐢ㄦ埛缂栧彿',
  `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鑱旂郴浜?,
  `contact_mobile` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鑱旂郴鎵嬫満',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '绉熸埛鐘舵€?,
  `websites` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '缁戝畾鍩熷悕鏁扮粍',
  `package_id` bigint NOT NULL COMMENT '绉熸埛濂楅缂栧彿',
  `expire_time` datetime NOT NULL COMMENT '杩囨湡鏃堕棿',
  `account_count` int NOT NULL COMMENT '璐﹀彿鏁伴噺',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绉熸埛琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tenant_package` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '濂楅缂栧彿',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濂楅鍚?,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '绉熸埛鐘舵€侊紙0姝ｅ父 1鍋滅敤锛?,
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '澶囨敞',
  `menu_ids` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍏宠仈鐨勮彍鍗曠紪鍙?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绉熸埛濂楅琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛ID',
  `post_id` bigint NOT NULL DEFAULT '0' COMMENT '宀椾綅ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鐢ㄦ埛宀椾綅琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鑷缂栧彿',
  `user_id` bigint NOT NULL COMMENT '鐢ㄦ埛ID',
  `role_id` bigint NOT NULL COMMENT '瑙掕壊ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鐢ㄦ埛鍜岃鑹插叧鑱旇〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鐢ㄦ埛ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛璐﹀彿',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '瀵嗙爜',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛鏄电О',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶囨敞',
  `dept_id` bigint DEFAULT NULL COMMENT '閮ㄩ棬ID',
  `post_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '宀椾綅缂栧彿鏁扮粍',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鐢ㄦ埛閭',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鎵嬫満鍙风爜',
  `sex` tinyint DEFAULT '0' COMMENT '鐢ㄦ埛鎬у埆',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '澶村儚鍦板潃',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '甯愬彿鐘舵€侊紙0姝ｅ父 1鍋滅敤锛?,
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏈€鍚庣櫥褰旾P',
  `login_date` datetime DEFAULT NULL COMMENT '鏈€鍚庣櫥褰曟椂闂?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_username` (`username`) USING BTREE,
  KEY `idx_mobile` (`mobile`) USING BTREE,
  KEY `idx_email` (`email`) USING BTREE,
  KEY `idx_dept_id` (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鐢ㄦ埛淇℃伅琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_check_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_time` timestamp NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `total_quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(16,2) DEFAULT NULL,
  `actual_price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_check_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `inventory_id` bigint DEFAULT NULL,
  `inventory_detail_id` bigint DEFAULT NULL,
  `batch_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_date` timestamp NULL DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `receipt_time` timestamp NULL DEFAULT NULL,
  `quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `check_quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ??????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sku_id_warehouse_id` (`sku_id`,`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ???';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_inventory_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `sku_id` bigint NOT NULL,
  `quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `before_quantity` decimal(20,2) DEFAULT NULL,
  `after_quantity` decimal(20,2) DEFAULT NULL,
  `batch_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_date` timestamp NULL DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL,
  `total_price` decimal(16,2) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `order_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` int DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ?????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint NOT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ???';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_item_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ?????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_item_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL DEFAULT '0',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ?????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_item_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` bigint NOT NULL,
  `bar_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` decimal(10,1) DEFAULT NULL,
  `width` decimal(10,1) DEFAULT NULL,
  `height` decimal(10,1) DEFAULT NULL,
  `gross_weight` decimal(10,3) DEFAULT NULL,
  `net_weight` decimal(10,3) DEFAULT NULL,
  `cost_price` decimal(16,2) DEFAULT NULL,
  `selling_price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ?? SKU ?';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_merchant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint NOT NULL,
  `level` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ?????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_movement_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_time` timestamp NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_warehouse_id` bigint NOT NULL,
  `target_warehouse_id` bigint NOT NULL,
  `total_quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_movement_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `source_warehouse_id` bigint NOT NULL,
  `target_warehouse_id` bigint NOT NULL,
  `inventory_detail_id` bigint DEFAULT NULL,
  `batch_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_date` timestamp NULL DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) DEFAULT NULL,
  `total_price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ??????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_receipt_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `order_time` timestamp NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `biz_order_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_id` bigint DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `total_quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_receipt_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `batch_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_date` timestamp NULL DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) DEFAULT NULL,
  `total_price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ??????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_shipment_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `order_time` timestamp NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `biz_order_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_id` bigint DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `total_quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_shipment_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `inventory_detail_id` bigint DEFAULT NULL,
  `batch_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_date` timestamp NULL DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `quantity` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) DEFAULT NULL,
  `total_price` decimal(16,2) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ??????';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int DEFAULT '0',
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WMS ???';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo01_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍚嶅瓧',
  `sex` tinyint(1) NOT NULL COMMENT '鎬у埆',
  `birthday` datetime NOT NULL COMMENT '鍑虹敓骞?,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绠€浠?,
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '澶村儚',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绀轰緥鑱旂郴浜鸿〃';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo02_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍚嶅瓧',
  `parent_id` bigint NOT NULL COMMENT '鐖剁骇缂栧彿',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绀轰緥鍒嗙被琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo03_course` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `student_id` bigint NOT NULL COMMENT '瀛︾敓缂栧彿',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍚嶅瓧',
  `score` tinyint NOT NULL COMMENT '鍒嗘暟',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瀛︾敓璇剧▼琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo03_grade` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `student_id` bigint NOT NULL COMMENT '瀛︾敓缂栧彿',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍚嶅瓧',
  `teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐝富浠?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瀛︾敓鐝骇琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo03_student` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂栧彿',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鍚嶅瓧',
  `sex` tinyint NOT NULL COMMENT '鎬у埆',
  `birthday` datetime NOT NULL COMMENT '鍑虹敓鏃ユ湡',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绠€浠?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鍒涘缓鑰?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '鏇存柊鑰?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鍒犻櫎',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '绉熸埛缂栧彿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='瀛︾敓琛?;
/*!40101 SET character_set_client = @saved_cs_client */;
