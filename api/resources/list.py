from flask_restful import Resource
from datetime import datetime
from database.tables import List
from playhouse.shortcuts import model_to_dict
from json import dumps, loads
from .functions import check_for_data
from flask_jwt_extended import jwt_required
from flasgger import swag_from
from database.tables import Product

class ListInfo(Resource):
    @jwt_required()
    @swag_from('apidoc/listinfo.yml')
    def get(__self__, list_id):
        list = List.select().where(List.id == list_id)
        if list.exists():
            return loads(dumps(model_to_dict(list.get()), sort_keys=True, default=str)), 200
        else:
            return {'message': 'List with that id does not exist.'}, 400

class ListProducts(Resource):
    @jwt_required()
    def get(__self__, list_id):
        list = List.select().where(List.id == list_id).get()
        seznam = {list.name: []}
        products = list.products
        for product in products:
            print(model_to_dict(product.id_p))
            #temp_product = Product.select().where(Product.id == product).get()
            #seznam[list.name].append(model_to_dict(temp_product))
        return seznam

class ListNew(Resource):
    @jwt_required()
    @swag_from('apidoc/newlist.yml')
    def post(__self__):
        data = check_for_data()

        list = List.select().where(List.name == data["name"] and List.id_f == data["family_id"])

        if list.exists():
            return {"message": "List with that name in family already exists."}, 400
        
        list = List.create(name=data["name"], id_f=data["family_id"], admin=data["admin"], created=datetime.now())

        return model_to_dict(list), 201

class ListDelete(Resource):
    @jwt_required()
    @swag_from('apidoc/deletelist.yml')
    def delete(__self__):
        data = check_for_data()

        list = List.select().where(List.id == data['id'])

        if not list.exist():
            return {"message": "List does not exist"}, 400

        products = List.get().products

        for product in products:
            product.delete().execute()

        list.delete().execute()

        return {"message": "List successfully deleted"}, 204