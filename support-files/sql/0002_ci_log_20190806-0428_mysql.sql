USE devops_ci_log;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for T_LOG_INDICES
-- ----------------------------

CREATE TABLE IF NOT EXISTS `T_LOG_INDICES` (
  `ID` varchar(64) NOT NULL,
  `INDEX_NAME` varchar(20) NOT NULL,
  `LAST_LINE_NUM` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_TYPE_MAPPING` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `T_LOG_INDICES_V2`
(
    `ID`            bigint(20)  NOT NULL AUTO_INCREMENT,
    `BUILD_ID`      varchar(64) NOT NULL,
    `INDEX_NAME`    varchar(20) NOT NULL,
    `LAST_LINE_NUM` bigint(20)  NOT NULL DEFAULT '1' COMMENT '最后行号',
    `CREATED_TIME`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `UPDATED_TIME`  timestamp   NOT NULL DEFAULT '2019-11-11 00:00:00' COMMENT '修改时间',
    `ENABLE`        bit(1)      NOT NULL DEFAULT b'0' COMMENT 'build is enable v2 or not',
    PRIMARY KEY (`ID`),
    UNIQUE KEY `BUILD_ID` (`BUILD_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `T_LOG_STATUS_V2`
(
    `ID`            bigint(20)  NOT NULL AUTO_INCREMENT,
    `BUILD_ID`      varchar(64) NOT NULL,
    `TAG`           varchar(64)          DEFAULT NULL,
    `EXECUTE_COUNT` int(11)     NOT NULL,
    `FINISHED`      bit(1)      NOT NULL DEFAULT b'0' COMMENT 'build is finished or not',
    `CREATED_TIME`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `JOB_ID`        varchar(64)          DEFAULT NULL,
    PRIMARY KEY (`ID`),
    UNIQUE KEY `BUILD_ID_2` (`BUILD_ID`, `TAG`, `EXECUTE_COUNT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
