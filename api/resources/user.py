from flask import request
from flask_restful import Resource
from database.tables import User, UserPassword
from datetime import datetime
from playhouse.shortcuts import model_to_dict
from json import dumps, loads
from .functions import check_for_data
from flask_jwt_extended import create_access_token, jwt_required
from flasgger import swag_from

class UserInfo(Resource):
    @jwt_required()
    @swag_from('apidoc/userinfo.yml')
    def get(__self__, user_id):
        user = User.select().where(User.id == user_id)
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
        token = create_access_token(identity=user.id)
        return {"token": token}, 200


class LoginUser(Resource):
    @swag_from('apidoc/loginuser.yml')
    def get(__self__):
        data = check_for_data()

        user = User.select().where(User.mail == data["mail"])

        if not user.exists():
            return {"message": "User with that mail does not exist"}, 403

        user = user.get()
        password = user.password.get()

        if (data["password"] == password.password):
            password.update({"last_login": datetime.now()}).execute()
            token = create_access_token(identity=user.id)
            return {"token": token}, 200
        else:
            return {"message": "Wrong password"}, 403


class DeleteUser(Resource):
    @jwt_required()
    def delete(__self__):
        data = check_for_data()

        user = User.select().where(User.mail == data['mail'])

        if not user.exists():
            return {"message": "User does not exist."}

        user = user.get()

        user.password.get().delete().execute()

        user.delete().execute()

        return {"message": "User successfully deleted"}, 200
