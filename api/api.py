#!/usr/bin/env python3
from flask import Flask
from flask_restful import Api
from resources.user import *
from resources.product import *
from resources.family import *
from resources.list import *
from resources.homepage import *
from flask_jwt_extended import JWTManager
from flasgger import Swagger

app = Flask(__name__)
api = Api(app)

app.config["JWT_SECRET_KEY"] = "ijpdhnmUb2iArs9x9pLn93EsZgmshLYrbzGpv$f4xQgP@eEWbH$h$N9AfwH3DN@5yX@nBm^3MBGEu$MZ#3Ur4ehh&*66mjJi6CxhXM2Ws6%G*AmGRFD%NEr7BezD2qrg"
app.config['SWAGGER'] = {
    'title': 'Koopy',
    'specs_route': '/api/docs/',
    'termsOfService': '',
    'description': 'API for Koopy application',

}

swagger_config = Swagger.DEFAULT_CONFIG
swagger_config['swagger_ui_bundle_js'] = '//unpkg.com/swagger-ui-dist@3/swagger-ui-bundle.js'
swagger_config['swagger_ui_standalone_preset_js'] = '//unpkg.com/swagger-ui-dist@3/swagger-ui-standalone-preset.js'
swagger_config['jquery_js'] = '//unpkg.com/jquery@2.2.4/dist/jquery.min.js'
swagger_config['swagger_ui_css'] = '//unpkg.com/swagger-ui-dist@3/swagger-ui.css'
swag = Swagger(app, config=swagger_config)

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
