from flask import Blueprint

auth_bp = Blueprint('auth',__name__)

@auth_bp.route('/route-test')
def test():
    return "Auth BluePrint OK"
