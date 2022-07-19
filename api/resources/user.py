from flask import request
from flask_restful import Resource
from database.tables import User, UserPassword, Family
from datetime import datetime
from playhouse.shortcuts import model_to_dict
from json import dumps, loads, dump, load
from .functions import check_for_data
from flask_jwt_extended import create_access_token, jwt_required
from flasgger import swag_from


class UserFamilies(Resource):
    @jwt_required()
    @swag_from('apidoc/userfamilies.yml')
    def get(__self__, user_id):
        user = User.select().where(User.id == user_id).get()
        families = list(user.families.execute())

        toReturn = dict()

        for family in families:
            print(family.id_f)
            familyName = Family.select(Family.name).where(Family.id == family.id_u)
            toReturn[familyName] = family

        return dumps(toReturn), 200, {'Access-Control-Allow-Origin': '*'}

class UserInfo(Resource):
    @jwt_required()
    @swag_from('apidoc/userinfo.yml')
    def get(__self__, user_id):
        user = User.select().where(User.id == user_id)
        if user.exists():
            return loads(dumps(model_to_dict(user.get()), sort_keys=True, default=str))
        else:
            return {'message': 'User with that email does not exist.'}, 400


class UserCheck(Resource):
    @swag_from('apidoc/usercheck.yml')
    def get(__self__, user_mail):
        user = User.select().where(User.mail == user_mail)
        if user.exists():
            return {"message": "Email taken."}, 400
        else:
            return {"message": "Email free."}, 200


class UserLogin(Resource):
    @swag_from('apidoc/loginuser.yml')
    def post(__self__):
        data = check_for_data()

        user = User.select().where(User.mail == data["mail"])

        if not user.exists():
            return {"message": "User does not exist"}, 400

        user = user.get()
        password = user.password.get()

        if (data["password"] == password.password):
            UserPassword.update({"last_login": datetime.now()}).where(UserPassword.id_u == user.id).execute()
            token = create_access_token(identity=user.id)
            return {"token": token, "id": user.id, "profile_img": user.profile_img, "mail": user.mail, "name": user.name}, 200
        else:
            return {"message": "Wrong password"}, 403


class UserClass(Resource):
    @jwt_required()
    @swag_from('apidoc/deleteuser.yml')
    def delete(__self__):
        data = check_for_data()

        user = User.select().where(User.mail == data['mail'])

        if not user.exists():
            return {"message": "User does not exist."}, 400

        user = user.get()

        user.password.get().delete().execute()

        user.delete().execute()

        return {"message": "User successfully deleted"}, 204

    @swag_from('apidoc/newuser.yml')
    def post(__self__):
        data = check_for_data()

        user = User.select().where(User.mail == data["mail"])

        if user.exists():
            return {"message": "User with that mail already exists"}, 400

        user = User.create(name=data["name"], mail=data["mail"])
        UserPassword.create(
            password=data['password'], last_login=datetime.now(), id_u=user.id)
        token = create_access_token(identity=user.id)
        return {"token": token, "id": user.id, "profile_img": user.profile_img, "mail": user.mail, "name": user.name}, 201
