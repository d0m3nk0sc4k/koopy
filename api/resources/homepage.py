from flask import request
from flask_restful import Resource

class Homepage(Resource):
    def get(__self__):
        return {"Message": "Welcome to the homepage!"}