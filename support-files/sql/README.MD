# 数据库脚本说明
## 脚本编写要求：

- 唯一要求：所有脚本必须是可反复执行无差别（幂等）：
  - 不允许直接删除表或数据库后再重新创建的语句
  - 建表语句可用判断后再创建：CREATE TABLE IF NOT EXISTS `表名`
  - 索引字段ALTER修改可用更新脚本存储过程，存储过程中在修改字段时先判断是否存在

## 脚本说明：
### 创建数据库
0001_ci_create-database_20190806-0424_mysql.sql
该文件为全量数据库创建sql，时间戳无意义，不是关注重点
### 全量建表脚本：
0002_数据库名_时间戳_mysql.sql
用于存放当前数据库下所有表的创表脚本
####要求：
- 请使用 CREATE TABLE IF NOT EXISTS `表名` 来创建表
- 请使用utf8mb4而不是utf8

### 初始化脚本：
0003_数据库名-init_时间戳_mysql.sql
负责更新数据库初始化数据的，需要保证插入或修改的数据不重复。

### 更新脚本：
0004_数据库名-update_xxxx说明_时间戳_mysql.sql
存放有需要更新的数据库表结构的脚本，多次执行必须符合幂等要求。
#### 要求：
- 如后面发布有新建表，请符合上述全量建表脚本要求
- sql