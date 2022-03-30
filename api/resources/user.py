from flask_restful import Resource
import peewee

class User(Resource):
    def get(__self__, user_id):
        #peewee query
        return {'text': user_id}, 200