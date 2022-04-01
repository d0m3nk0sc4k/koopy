from flask import Flask
from flask_restful import Api
from resources.user import *
from resources.product import *
from resources.family import *
from resources.list import *

app = Flask(__name__)
api = Api(app)

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

# LIST API
api.add_resource(ListInfo, '/api/list/<string:list_id>')
api.add_resource(NewList, '/api/list/new')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
