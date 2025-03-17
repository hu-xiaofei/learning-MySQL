import mysql.connector

connection = mysql.connector.connect(host='localhost', #代表连接的位置
                                    port='3306', #端口号
                                    user='root', #用户名
                                    password='021125',
                                    database='sql_tutorial')

cursor = connection.cursor()

#获取部门表格里的所有资料
cursor.execute('SELECT * FROM `branch`;')

records = cursor.fetchall()
for r in records:
    print(r)