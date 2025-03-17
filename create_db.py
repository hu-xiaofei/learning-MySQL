import mysql.connector

connection = mysql.connector.connect(host='localhost', #代表连接的位置
                                    port='3306', #端口号
                                    user='root', #用户名
                                    password='021125')

#创建游标对象cursor
cursor = connection.cursor() 

#创建数据库,名称为qq
#cursor.execute('CREATE DATABASE `qq`;') 

#获得所有数据库名称
# cursor.execute('SHOW DATABASES;')
# records = cursor.fetchall()
# for r in records:
#     print(r)

#使用qq数据库
cursor.execute('USE `sql_tutorial`;')

#创建表
cursor.execute('CREATE TABLE `qq` (qq INT);')

#关闭游标
#cursor.close() 
#关闭连接
#connection.close() 

