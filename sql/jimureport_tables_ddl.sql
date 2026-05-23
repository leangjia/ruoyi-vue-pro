-- JimuReport v2.3.2 Core Tables
USE `ruoyi-vue-pro`;

CREATE TABLE `jimu_dict` (
  `id` varchar(32) NOT NULL,
  `dict_name` varchar(100) DEFAULT NULL,
  `dict_code` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `del_flag` int(1) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` int(1) unsigned zerofill DEFAULT '0',
  `tenant_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sd_dict_code` (`dict_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `jimu_dict_item` (
  `id` varchar(32) NOT NULL,
  `dict_id` varchar(32) DEFAULT NULL,
  `item_text` varchar(100) DEFAULT NULL,
  `item_value` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort_order` int(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sdi_role_dict_id` (`dict_id`) USING BTREE,
  KEY `idx_sdi_role_sort_order` (`sort_order`) USING BTREE,
  KEY `idx_sdi_status` (`status`) USING BTREE,
  KEY `idx_sdi_dict_val` (`dict_id`,`item_value`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `jimu_report` (
  `id` varchar(32) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `json_str` longtext,
  `api_url` varchar(255) DEFAULT NULL,
  `thumb` text,
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `api_method` varchar(255) DEFAULT NULL,
  `api_code` varchar(255) DEFAULT NULL,
  `template` tinyint(1) DEFAULT NULL,
  `view_count` bigint(15) DEFAULT '0',
  `css_str` text,
  `js_str` text,
  `py_str` text,
  `tenant_id` varchar(10) DEFAULT NULL,
  `update_count` int(11) DEFAULT '0',
  `submit_form` tinyint(1) DEFAULT NULL,
  `is_multi_sheet` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_jmreport_code` (`code`) USING BTREE,
  KEY `uniq_jmreport_createby` (`create_by`) USING BTREE,
  KEY `uniq_jmreport_delflag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='在线excel设计器';

CREATE TABLE `jimu_report_category` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `iz_leaf` int(1) DEFAULT NULL,
  `source_type` varchar(10) DEFAULT NULL,
  `create_by` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `tenant_id` varchar(11) DEFAULT NULL,
  `del_flag` int(1) DEFAULT NULL,
  `sort_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='分类';

CREATE TABLE `jimu_report_data_source` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `report_id` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `db_type` varchar(10) DEFAULT NULL,
  `db_driver` varchar(100) DEFAULT NULL,
  `db_url` varchar(500) DEFAULT NULL,
  `db_username` varchar(100) DEFAULT NULL,
  `db_password` varchar(100) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `connect_times` int(11) DEFAULT '0',
  `tenant_id` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jmdatasource_report_id` (`report_id`) USING BTREE,
  KEY `idx_jmdatasource_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

CREATE TABLE `jimu_report_db` (
  `id` varchar(36) NOT NULL,
  `jimu_report_id` varchar(32) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `db_code` varchar(32) DEFAULT NULL,
  `db_ch_name` varchar(50) DEFAULT NULL,
  `db_type` varchar(32) DEFAULT NULL,
  `db_table_name` varchar(32) DEFAULT NULL,
  `db_dyn_sql` longtext,
  `db_key` varchar(32) DEFAULT NULL,
  `tb_db_key` varchar(32) DEFAULT NULL,
  `tb_db_table_name` varchar(32) DEFAULT NULL,
  `java_type` varchar(32) DEFAULT NULL,
  `java_value` varchar(255) DEFAULT NULL,
  `api_url` varchar(255) DEFAULT NULL,
  `api_method` varchar(255) DEFAULT NULL,
  `is_list` varchar(10) DEFAULT '0',
  `is_page` varchar(10) DEFAULT NULL,
  `db_source` varchar(255) DEFAULT NULL,
  `db_source_type` varchar(50) DEFAULT NULL,
  `json_data` text,
  `api_convert` varchar(255) DEFAULT NULL,
  `iz_shared_source` int(1) DEFAULT NULL,
  `jimu_shared_source_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jmreportdb_db_key` (`db_key`) USING BTREE,
  KEY `idx_jimu_report_id` (`jimu_report_id`) USING BTREE,
  KEY `idx_db_source_id` (`db_source`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `jimu_report_db_field` (
  `id` varchar(36) NOT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `jimu_report_db_id` varchar(32) DEFAULT NULL,
  `field_name` varchar(80) DEFAULT NULL,
  `field_name_physics` varchar(200) DEFAULT NULL,
  `field_text` varchar(50) DEFAULT NULL,
  `widget_type` varchar(50) DEFAULT NULL,
  `widget_width` int(10) DEFAULT NULL,
  `order_num` int(3) DEFAULT NULL,
  `search_flag` int(3) DEFAULT '0',
  `search_mode` int(3) DEFAULT NULL,
  `dict_code` varchar(255) DEFAULT NULL,
  `search_value` varchar(100) DEFAULT NULL,
  `search_format` varchar(50) DEFAULT NULL,
  `ext_json` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jrdf_jimu_report_db_id` (`jimu_report_db_id`) USING BTREE,
  KEY `idx_dbfield_order_num` (`order_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `jimu_report_db_param` (
  `id` varchar(36) NOT NULL,
  `jimu_report_head_id` varchar(36) NOT NULL,
  `param_name` varchar(32) NOT NULL,
  `param_txt` varchar(32) DEFAULT NULL,
  `param_value` varchar(1000) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `search_flag` int(1) DEFAULT NULL,
  `widget_type` varchar(50) DEFAULT NULL,
  `search_mode` int(1) DEFAULT NULL,
  `dict_code` varchar(255) DEFAULT NULL,
  `search_format` varchar(50) DEFAULT NULL,
  `ext_json` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jrdp_jimu_report_head_id` (`jimu_report_head_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `jimu_report_export_job` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `exec_interval` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_conf` text COLLATE utf8mb4_unicode_ci,
  `last_run_time` datetime DEFAULT NULL,
  `receiver_email` text COLLATE utf8mb4_unicode_ci,
  `file_sync_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `tenant_id` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='积木报表导出计划表';

CREATE TABLE `jimu_report_export_log` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `batch_no` varchar(50) DEFAULT NULL,
  `export_channel` varchar(20) DEFAULT NULL,
  `export_from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_type` varchar(10) DEFAULT NULL,
  `report_id` text,
  `download_path` varchar(255) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `err_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_by` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `tenant_id` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积木报表自动导出记录表';

CREATE TABLE `jimu_report_ext_data` (
  `id` varchar(32) NOT NULL,
  `biz_type` varchar(100) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `descr` varchar(500) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `data_value` longtext,
  `metadata` varchar(500) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_biz` (`biz_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通用扩展数据表';

CREATE TABLE `jimu_report_icon_lib` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_by` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积木图库表';

CREATE TABLE `jimu_report_link` (
  `id` varchar(32) NOT NULL,
  `report_id` varchar(32) DEFAULT NULL,
  `parameter` text,
  `eject_type` varchar(1) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `api_method` varchar(1) DEFAULT NULL,
  `link_type` varchar(1) DEFAULT NULL,
  `api_url` varchar(1000) DEFAULT NULL,
  `link_chart_id` varchar(50) DEFAULT NULL,
  `expression` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uniq_link_reportid` (`report_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='超链接配置表';

CREATE TABLE `jimu_report_map` (
  `id` varchar(64) NOT NULL,
  `label` varchar(125) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `data` longtext,
  `create_by` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT NULL,
  `sys_org_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_jmreport_map_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='地图配置表';

CREATE TABLE `jimu_report_share` (
  `id` varchar(32) NOT NULL,
  `report_id` varchar(32) DEFAULT NULL,
  `preview_url` varchar(1000) DEFAULT NULL,
  `preview_lock` varchar(4) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `term_of_validity` varchar(1) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `preview_lock_status` varchar(1) DEFAULT NULL,
  `share_token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_report_id` (`report_id`),
  KEY `idx_jrs_share_token` (`share_token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积木报表预览权限表';

CREATE TABLE `jimu_report_sheet` (
  `id` varchar(64) NOT NULL,
  `report_id` varchar(64) NOT NULL,
  `sheet_name` varchar(255) NOT NULL,
  `sheet_order` int(11) NOT NULL,
  `json_str` longtext,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_report_id` (`report_id`),
  KEY `idx_sheet_order` (`report_id`,`sheet_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报表Sheet表';

CREATE TABLE `onl_drag_comp` (
  `id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `comp_name` varchar(50) DEFAULT NULL,
  `comp_type` varchar(20) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `comp_config` longtext,
  `status` varchar(2) CHARACTER SET utf8 DEFAULT '0',
  `create_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组件库';

CREATE TABLE `onl_drag_dataset_head` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(36) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `db_source` varchar(100) DEFAULT NULL,
  `query_sql` varchar(5000) DEFAULT '0',
  `content` varchar(1000) DEFAULT NULL,
  `iz_agent` varchar(10) DEFAULT '0',
  `data_type` varchar(50) DEFAULT NULL,
  `api_method` varchar(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `low_app_id` varchar(32) DEFAULT NULL,
  `tenant_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `onl_drag_dataset_item` (
  `id` varchar(32) NOT NULL,
  `head_id` varchar(36) NOT NULL,
  `field_name` varchar(36) DEFAULT NULL,
  `field_txt` varchar(1000) DEFAULT NULL,
  `field_type` varchar(10) DEFAULT NULL,
  `widget_type` varchar(30) DEFAULT NULL,
  `dict_code` varchar(500) DEFAULT NULL,
  `dict_table` varchar(125) DEFAULT NULL,
  `dict_text` varchar(125) DEFAULT NULL,
  `iz_show` varchar(5) DEFAULT NULL,
  `iz_search` varchar(10) DEFAULT NULL,
  `iz_total` varchar(5) DEFAULT NULL,
  `search_mode` varchar(10) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_oddi_head_id` (`head_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `onl_drag_dataset_param` (
  `id` varchar(36) NOT NULL,
  `head_id` varchar(36) NOT NULL,
  `param_name` varchar(32) NOT NULL,
  `param_txt` varchar(32) DEFAULT NULL,
  `param_value` varchar(1000) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `iz_search` int(11) DEFAULT NULL,
  `widget_type` varchar(50) DEFAULT NULL,
  `search_mode` int(11) DEFAULT NULL,
  `dict_code` varchar(255) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_oddp_head_id` (`head_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `onl_drag_page` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `background_color` varchar(10) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `design_type` int(1) DEFAULT NULL,
  `theme` varchar(10) DEFAULT NULL,
  `style` varchar(20) DEFAULT NULL,
  `cover_url` varchar(500) DEFAULT NULL,
  `des_json` varchar(1000) DEFAULT NULL,
  `template` longtext,
  `protection_code` varchar(32) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `iz_template` varchar(10) DEFAULT '0',
  `create_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `low_app_id` varchar(50) DEFAULT NULL,
  `tenant_id` int(10) DEFAULT NULL,
  `update_count` int(10) DEFAULT '1',
  `visits_num` int(11) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='可视化拖拽界面';

CREATE TABLE `onl_drag_page_comp` (
  `id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `page_Id` varchar(50) DEFAULT NULL,
  `comp_id` varchar(32) DEFAULT NULL,
  `component` varchar(50) DEFAULT NULL,
  `config` longtext,
  `create_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='可视化拖拽页面组件';

CREATE TABLE `onl_drag_share` (
  `id` varchar(32) NOT NULL,
  `drag_id` varchar(32) DEFAULT NULL,
  `preview_url` varchar(1000) DEFAULT NULL,
  `preview_lock` varchar(4) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `term_of_validity` varchar(1) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `preview_lock_status` varchar(1) DEFAULT NULL,
  `share_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_ods_drag_id` (`drag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='仪表盘预览分享表';

CREATE TABLE `onl_drag_table_relation` (
  `id` varchar(50) NOT NULL,
  `aggregation_name` varchar(100) DEFAULT NULL,
  `aggregation_desc` varchar(100) DEFAULT NULL,
  `relation_forms` longtext,
  `filter_condition` longtext,
  `header_fields` longtext,
  `calculate_fields` longtext,
  `validate_info` longtext,
  `del_flag` tinyint(1) DEFAULT NULL,
  `low_app_id` varchar(50) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `create_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_aggregation_name` (`aggregation_name`) USING BTREE,
  KEY `idx_del_flag` (`del_flag`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE,
  KEY `idx_create_by` (`create_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='仪表盘聚合表';

