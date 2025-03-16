create database `sql_tutorial`; -- 关键字大小写都可以
-- 最好加一个`xxx`来区分是关键字还是变量
SHOW databases;  -- 展示现存的数据库
DROP DATABASE `sql_tutorial`; -- 删除某一个数据库
USE `sql_tutorial`;

INT           -- 整数
DECIMAL(m,n)  -- 浮点数，m位数，小数点部分占n位
VARCHAR(n)    -- 字符串，最多存放n个字符
BLOB          -- (Binary Large Object)图片 视频 档案...
DATA          -- 'YYYY-MM-DD' 日期
TIMESTAMP     -- 'YYYY-MM-DD HH:MM:SS' 记录时间

CREATE TABLE `student`(
	`student_id` INT,
    `name`VARCHAR(20),
    `major`VARCHAR(20),
    PRIMARY KEY(`student_id`)
); -- 创建表格,另一种方式

DESCRIBE `student`; -- 显示表格

DROP TABLE `student`;-- 删除表格

ALTER TABLE `student` ADD gpa DECIMAL(3,2); -- 添加表格属性
ALTER TABLE `student` DROP COLUMN gpa; -- 删除表格内属性

INSERT INTO `student` VALUES(1,'小白','历史'); -- 在表格中存入一项数据 
INSERT INTO `student` VALUES(2,'小黑',NULL);
INSERT INTO `student` (`name`,`major`,`student_id`) VALUES('小蓝', '英语',3);-- 可自行改变填入顺序

SELECT * FROM `student`; -- 把students中所有资料搜寻出来

-- constraints 限制 约束
CREATE TABLE `student`(
	`student_id` INT,
    `name`VARCHAR(20) NOT NULL, -- 不可以为空
    `major`VARCHAR(20) UNIQUE, -- 每个值不可相同
    PRIMARY KEY(`student_id`)
); 

CREATE TABLE `student`(
	`student_id` INT AUTO_INCREMENT, -- 每次可自增，不用再每次输入
    `name`VARCHAR(20), 
    `major`VARCHAR(20) DEFAULT'电子信息', -- 设定预设值
    PRIMARY KEY(`student_id`)
); 

-- 修改删除数据
UPDATE `student`
SET `major` = '英语文学'
WHERE `major` ='英语'; -- 把所有major为英语的改为英语文学

UPDATE `student`
SET `major` = '生物'
WHERE `student_id` = 3 ; -- 把student_id为3的major改为生物

UPDATE `student`
SET `major` = '生化'
WHERE `major`='生物'OR`major`='化学'; -- 生物系和化学系合并为生化

UPDATE `student`
SET `name` = '小灰',`major`='物理'
WHERE `student_id`=3; -- 把student_id为3的name和major改为对应数据

DELETE FROM `student`
WHERE `student_id` = 4; -- 删除id为4的数据

DELETE FROM `student`
WHERE `name` = '小灰' AND `major`=`物理`; -- 删除对应条件的数据

DELETE FROM `student`
WHERE `score` <= 60; -- 删除对应条件的数据

DELETE FROM `student`; -- 删除其中所有数据

-- 搜寻资料
SELECT * FROM `student`; -- * 代表所有属性
SELECT `name`,`major` FROM `student`; -- 取得其中两个属性

SELECT *
FROM `student`
ORDER BY `score`; -- 以score的顺序排序（默认ASC升序）

SELECT *
FROM `student`
ORDER BY `score` DESC; -- 以score的降序排序

SELECT *
FROM `student`
ORDER BY `score`,`student_id`; -- 先根据score排序，若score相同，则根据student_id排序

SELECT *
FROM `student`
LIMIT 3; -- 只传送前三个资料

SELECT *
FROM `student`
WHERE `major`='英语' AND`student_id`=1; -- 回传两个条件都符合的alter

SELECT *
FROM `student`
WHERE `major`='英语' OR `score`>20; -- 回传任意满足其中一个条件的

SELECT *
FROM `student`
WHERE `major`IN ('历史','英语','生物');-- 两种方式等同
-- WHERE `major`='历史' OR `major`='英语' OR `major`='生物';


SELECT * FROM `employee`;

SELECT * FROM `client`;

SELECT *
FROM `employee`
ORDER BY `salary`;

SELECT *
FROM `employee`
ORDER BY `salary`DESC
LIMIT 3;

SELECT `name`FROM `employee`;

-- aggregate functions 聚合函数

-- 1.取得员工人数
SELECT COUNT(*) FROM `employee`;-- 所有员工数量
SELECT COUNT(`sup_id`) FROM `employee`;-- 有sup_id属性的数据有几笔

-- wildcards 通配符 %(百分号)匹配零个或多个字符  _(下划线)匹配单个字符
SELECT *
FROM `client`
WHERE `phone` LIKE '234%';-- 取出电话号码中有234XXX的

SELECT *
FROM `client`
WHERE `phone` LIKE '%234';-- 取出电话号码中有XXX234的

SELECT *
FROM `client`
WHERE `phone` LIKE '%234%';-- 取出电话号码中有XXX234XXX的

SELECT *
FROM `client`
WHERE `name` LIKE '张%';-- 取出姓张的客户

SELECT *
FROM `employee`
WHERE `birth_day` LIKE '_____12%';-- 生日在12月的人，5个_,表示前面5个字符

-- union 并集
SELECT `name`
FROM `employee`
UNION
SELECT `client_name`
FROM `client`; -- 搜索客户和员工的名字，并集合在一张表上


