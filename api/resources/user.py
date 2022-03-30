from flask import request
from flask_restful import Resource
from database.tables import *
from datetime import date

class UserInfo(Resource):
    def get(__self__, user_id):
        return {'text': user_id}, 200

class UserRegistration(Resource):
    def post(__self__):
        try:
            data = request.get_json(force=True)
            print(data)
        except:
            return {"message": "Body has to have JSON data with user credentials."}, 400

        user = User.select().where(User.mail == data["mail"])

        if user.exists():
            db.close()
            return {"message": "User with that mail already exists"}, 403
        
        User.create(name=data["name"], mail=data["mail"], password=data["password"], last_login=date.today())
        
        return {"status": "ok"}, 200

class UserLogin(Resource):
    def get(__self__):
        try:
            data = request.get_json(force=True)
        except:
            return {"message": "Body has to have JSON data with user credentials."}, 400

        user = User.select().where(User.mail == data["mail"])

        if not user.exists():
            return {"message": "User with that mail does not exist"}, 403

        password = User.get(User.mail == data["mail"])

        if (data["password"] == password.password):
            return {"message": "ok"}, 200
        else:
            return {"message": "Wrong password"}, 403

class UserDelete(Resource):
    def post(__self__):
        try:
            data = request.get_json(force=True)
        except:
            return {"message": "Body has to have JSON data with user credentials."}, 400

        User.delete().where(User.mail == data["mail"]).execute()

        return {"message": "User successfully deleted"}, 200