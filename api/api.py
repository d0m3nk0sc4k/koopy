from flask import Flask
from flask_restful import Api
from resources.user import *

app = Flask(__name__)
api = Api(app)

api.add_resource(UserInfo, '/api/user/<string:user_id>')
api.add_resource(UserRegistration, '/api/user/register')
api.add_resource(UserLogin, '/api/user/login')
api.add_resource(UserDelete, '/api/user/delete')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')