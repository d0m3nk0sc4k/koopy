from flask import request
from flask_restful import Resource
from database.tables import User, UserPassword
from datetime import datetime
from playhouse.shortcuts import model_to_dict
from json import dumps, loads
from .functions import check_for_data


class UserInfo(Resource):
    def get(__self__, user_id):
        user = User.select().where(User.mail == user_id)
        if user.exists():
            return loads(dumps(model_to_dict(user.get()), sort_keys=True, default=str))
        else:
            return {'message': 'User with that email does not exist.'}


class NewUser(Resource):
    def post(__self__):
        data = check_for_data()

        user = User.select().where(User.mail == data["mail"])

        if user.exists():
            return {"message": "User with that mail already exists"}, 403

        user = User.create(name=data["name"], mail=data["mail"])
        UserPassword.create(password=data['password'], last_login=datetime.now(), id_u=user.id)

        return {"status": "ok"}, 200


class LoginUser(Resource):
    def get(__self__):
        data = check_for_data()

        user = User.select().where(User.mail == data["mail"])

        if not user.exists():
            return {"message": "User with that mail does not exist"}, 403

        user = user.get()
        password = user.password.get()

        if (data["password"] == password.password):
            password.update({"last_login": datetime.now()}).execute()
            return {"message": "ok"}, 200
        else:
            return {"message": "Wrong password"}, 403


class DeleteUser(Resource):
    def post(__self__):
        data = check_for_data()

        User.delete().where(User.mail == data["mail"]).execute()

        return {"message": "User successfully deleted"}, 200
