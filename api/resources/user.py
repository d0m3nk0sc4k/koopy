from flask_restful import Resource
from ...database.tables import *

class User(Resource):
    def get(__self__, user_id):
        db.connect()
        return {'text': user_id}, 200