from flask import request
from flask_restful import Resource
from database.tables import User
from datetime import datetime
from playhouse.shortcuts import model_to_dict
from json import dumps, loads

class UserInfo(Resource):
    def get(__self__, user_id):
        user = User.select().where(User.mail == user_id)
        if user.exists():
            return loads(dumps(model_to_dict(user.get()), sort_keys=True, default=str))
        else:
            return {'message': 'User with that email does not exist.'}

class UserRegistration(Resource):
    def post(__self__):
        try:
            data = request.get_json(force=True)
            print(data)
        except:
            return {"message": "Body has to have JSON data with user credentials."}, 400

        user = User.select().where(User.mail == data["mail"])

        if user.exists():
            return {"message": "User with that mail already exists"}, 403
        
        User.create(name=data["name"], mail=data["mail"], password=data["password"], last_login=datetime.now())
        
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

        user = user.get()

        if (data["password"] == user.password):
            q = User.update({"last_login": datetime.now()}).where(User.mail == data["mail"])
            q.execute()
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