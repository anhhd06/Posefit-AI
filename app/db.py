import mysql.connector
import os
from dotenv import load_dotenv
load_dotenv()
def get_db_connection():
    db_host = os.getenv("DB_HOST")
    db_user = os.getenv("DB_USER")
    db_pw = os.getenv("DB_PASSWORD")
    db_name = os.getenv("DB_NAME")
    cnx = mysql.connector.connect(host = db_host,user = db_user,password = db_pw,database = db_name)
    return cnx