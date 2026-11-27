from flask import Flask
from dotenv import load_dotenv
import os
def create_app():
    # 1. Khởi tạo app
    app = Flask(__name__)

    # 2. Khởi tạo secret key kết nối database
    load_dotenv()
    app.secret_key = os.getenv("SECRET_KEY")

    # 3. Import và kết nối blueprint
    from .auth import auth_bp
    from .main import main_bp
    app.register_blueprint(auth.auth_bp)
    app.register_blueprint(main.main_bp)
    # 4. Trả về app
    return app
