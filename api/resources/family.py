from email.policy import default
from flask import request
from flask_restful import Resource
from database.tables import Family
from database.tables import Family_has_User
from playhouse.shortcuts import model_to_dict
from json import dumps, loads
from .functions import check_for_data
from uuid import uuid5, NAMESPACE_URL
from flask_jwt_extended import jwt_required
from flasgger import swag_from

class FamilyInfo(Resource):
    @jwt_required()
    @swag_from('apidoc/familyinfo.yml')
    def get(__self__, family_id):
        family = Family.select().where(Family.id == family_id)
        if family.exists():
            toReturn = loads(dumps(model_to_dict(family.get()), sort_keys=True, default=str))
            lists = family.get().lists
            listsAdd = []
            for lista in lists:
                listsAdd.append(lista.id)

            toReturn["lists"] = listsAdd
            
            return loads(dumps(toReturn), default=str), 200
        else:
            return {'message': 'Family with that id does not exist.'}, 400

class FamilyNew(Resource):
    @jwt_required()
    @swag_from('apidoc/newfamily.yml')
    def post(__self__):
        data = check_for_data()

        family = Family.select().where(Family.name == data['name'] and Family.address == data['address'])

        if family.exists():
            return {"message": "Family with that name and address already exists."}, 400

        family = Family.create(name=data['name'], address=data['address'], admin=data['admin'], qrcode=uuid5(NAMESPACE_URL, data['name']+data['address']))
        Family_has_User.create(id_f = family.id, id_u = data['admin'])

        return  loads(dumps(model_to_dict(Family.get(Family.id == family.id)), sort_keys=True, default=str)), 201

class FamilyDelete(Resource):
    @jwt_required()
    @swag_from('apidoc/deletefamily.yml')
    def delete(__self__):
        data = check_for_data()

        try:
            family = Family.get(Family.id == data['id'])
        except:
            return {"message": "Family does not exist."}, 400

        users = family.members
        
        for user in users:
            user.delete().execute()

        lists = family.lists

        for list in lists:
            list.delete().execute()

        family.delete().execute()

        return {"message": "Successfully deleted"}, 204

class FamilyJoin(Resource):
    @jwt_required()
    @swag_from('apidoc/joinfamily.yml')
    def put(__self__):
        data = check_for_data()

        family = Family.select(Family.id).where(Family.qrcode == data["join_key"])

        if not family.exists():
            return {"message": "Family does not exist."}, 400
        
        Family_has_User.create(id_u = data["user"], id_f = family)

        return {"message": "Joined the family."}, 201