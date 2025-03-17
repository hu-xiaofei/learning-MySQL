import mysql.connector

connection = mysql.connector.connect(host='localhost', #代表连接的位置
                                    port='3306', #端口号
                                    user='root', #用户名
                                    password='021125',
                                    database='sql_tutorial')

cursor = connection.cursor()

#新增数据
cursor.execute("INSERT INTO `branch` VALUES (5, 'qq', NULL);")#注意单双引号的使用问题，当字符串 'qq' 已经在单引号内时，它与外部的单引号冲突了

#修改数据
cursor.execute("UPDATE `branch` SET branch_name = 'qq' WHERE branch_id = 5;")

#删除数据
cursor.execute('DELETE FROM `branch` WHERE branch_id = 5;')

cursor.close()
cursor.commit()#提交事务
connection.close()