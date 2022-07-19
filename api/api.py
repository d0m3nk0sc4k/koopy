#!/usr/bin/env python3
from datetime import timedelta
from flask import Flask, url_for
from flask_restful import Api
from flask_cors import CORS
from resources.user import *
from resources.product import *
from resources.family import *
from resources.list import *
from resources.homepage import *
from resources.favicon import *
from resources.image import *
from flask_jwt_extended import JWTManager
from flasgger import Swagger

app = Flask(__name__)
api = Api(app)

cors = CORS(app, allow_headers=['Content-Type', 'Authorization'], resources={r"/api/*": {"origins": "*"}})

app.config["JWT_SECRET_KEY"] = "ijpdhnmUb2iArs9x9pLn93EsZgmshLYrbzGpv$f4xQgP@eEWbH$h$N9AfwH3DN@5yX@nBm^3MBGEu$MZ#3Ur4ehh&*66mjJi6CxhXM2Ws6%G*AmGRFD%NEr7BezD2qrg"
app.config["JWT_ACCESS_TOKEN_EXPIRES"] = timedelta(hours=24)
app.config['SWAGGER'] = {
    'title': 'Koopy',
    'specs_route': '/api/docs/',
    'termsOfService': '',
    'description': 'API for Koopy application'
}
app.config['UPLOAD_FOLDER'] = '/mnt/koopy/profile'

swagger_config = Swagger.DEFAULT_CONFIG
swagger_config['swagger_ui_bundle_js'] = '//unpkg.com/swagger-ui-dist@3/swagger-ui-bundle.js'
swagger_config['swagger_ui_standalone_preset_js'] = '//unpkg.com/swagger-ui-dist@3/swagger-ui-standalone-preset.js'
swagger_config['jquery_js'] = '//unpkg.com/jquery@2.2.4/dist/jquery.min.js'
swagger_config['swagger_ui_css'] = '//unpkg.com/swagger-ui-dist@3/swagger-ui.css'
swag = Swagger(app, config=swagger_config)

jwt = JWTManager(app)

# FIRST PAGE
api.add_resource(Homepage, '/api/')
api.add_resource(Favicon, '/api/favicon')

#  IMAGE API
api.add_resource(ImageGet, '/api/image/<string:image_name>')
api.add_resource(ImagePost, '/api/image')

#  USER API
api.add_resource(UserClass, '/api/user')
api.add_resource(UserLogin, '/api/user/login')
api.add_resource(UserCheck, '/api/user/check/<string:user_mail>')
api.add_resource(UserInfo, '/api/user/<string:user_id>')
api.add_resource(UserFamilies, '/api/user/families/<string:user_id>')

#  PRODUCT API
api.add_resource(ProductInfo, '/api/product/info/<string:product_name>')
api.add_resource(ProductNew, '/api/product/new')
api.add_resource(ProductDelete, '/api/product/delete')
api.add_resource(ProductUpdate, '/api/product/update')

# FAMILY API
api.add_resource(FamilyInfo, '/api/family/info/<string:family_id>')
api.add_resource(FamilyNew, '/api/family/new')
api.add_resource(FamilyDelete, '/api/family/delete')
api.add_resource(FamilyJoin, '/api/family/join')

# LIST API
api.add_resource(ListInfo, '/api/list/info/<string:list_id>')
api.add_resource(ListNew, '/api/list/new')
api.add_resource(ListDelete, '/api/list/delete')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
