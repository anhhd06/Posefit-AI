from pickle import TRUE
import mysql
from mysql.connector import errorcode
from flask import Flask, jsonify
import mysql.connector
from app import db
app = Flask(__name__)

@app.route("/test-db", methods=["GET"])
def test_db():
    # lấy kết nối đến database, dùng try để bắt lỗi
    try:
        cnx = db.get_db_connection()
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
        return jsonify({"status": "error", "message": str(err)}) ,500
        
    # chuyển sang dic đưa lên web
    cursor = cnx.cursor(dictionary= True)
    query = ("SELECT * FROM exercises")
    cursor.execute(query)

    rows = cursor.fetchall()
    for row in rows:
        for key, value in row.items():
            if isinstance(value,set):
                row[key] = list(value)

    # ngắt
    cursor.close()
    cnx.close()
    return jsonify(rows,{"status": "ok"})

if __name__ == "__main__":
    app.run(debug=True)