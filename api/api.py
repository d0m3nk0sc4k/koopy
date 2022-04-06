from flask import Flask
from flask_restful import Api
from resources.user import *
from resources.product import *
from resources.family import *
from resources.list import *
from resources.homepage import *
from flask_jwt_extended import JWTManager

app = Flask(__name__)
api = Api(app)

app.config["JWT_SECRET_KEY"] = "super-secret"  # Change this "super secret" with something else!
jwt = JWTManager(app)

# FIRST PAGE
api.add_resource(Homepage, '/api/')

#  USER API
api.add_resource(UserInfo, '/api/user/<string:user_id>')
api.add_resource(NewUser, '/api/user/register')
api.add_resource(LoginUser, '/api/user/login')
api.add_resource(DeleteUser, '/api/user/delete')

#  PRODUCT API
api.add_resource(ProductInfo, '/api/product/<string:product_name>')
api.add_resource(NewProduct, '/api/product/new')
api.add_resource(DeleteProduct, '/api/product/delete')
api.add_resource(UpdateProduct, '/api/product/update')

# FAMILY API
api.add_resource(FamilyInfo, '/api/family/<string:family_id>')
api.add_resource(NewFamily, '/api/family/new')
api.add_resource(DeleteFamily, '/api/family/delete')
api.add_resource(JoinFamily, '/api/family/join')

# LIST API
api.add_resource(ListInfo, '/api/list/<string:list_id>')
api.add_resource(NewList, '/api/list/new')
api.add_resource(DeleteList, '/api/list/delete')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
