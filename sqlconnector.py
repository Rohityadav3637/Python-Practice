import mysql.connector

conn=mysql.connector.connect(host='localhost',user='root',password='Rohit@18',)

my_cursor=conn.cursor()

my_cursor.execute("use flipkart")

print("sucessful connected")