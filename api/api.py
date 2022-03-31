from ast import Delete
from flask import Flask
from flask_restful import Api
from resources.user import *
from resources.product import *

app = Flask(__name__)
api = Api(app)

#  USER API
api.add_resource(UserInfo, '/api/user/<string:user_id>')
api.add_resource(UserRegistration, '/api/user/register')
api.add_resource(UserLogin, '/api/user/login')
api.add_resource(UserDelete, '/api/user/delete')

#  PRODUCT API
api.add_resource(ProductInfo, '/api/product/<string:product_name>')
api.add_resource(NewProduct, '/api/product/new')
api.add_resource(DeleteProduct, '/api/product/delete')
api.add_resource(UpdateProduct, '/api/product/update')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
