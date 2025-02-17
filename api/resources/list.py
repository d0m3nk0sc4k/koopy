from flask_restful import Resource
from datetime import datetime
from database.tables import List_has_Product
from database.tables import List
from playhouse.shortcuts import model_to_dict, dict_to_model
from json import dumps, loads
from .functions import check_for_data
from flask_jwt_extended import jwt_required
from flasgger import swag_from

class ListRemoveItem(Resource):
    @jwt_required()
    def delete(__self__):
        data = check_for_data()
        q = List_has_Product.delete().where((List_has_Product.id_l == data["list_id"]) & (List_has_Product.id_p == data["product_id"]))
        q.execute()
        return {"message": "Product successfully removed"}, 204

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
        seznam = {list.name: {"data": [], "admin": {}}}
        products = list.products
        for product in products:
            seznam[list.name]["data"].append(model_to_dict(product))
        seznam[list.name]["admin"] = list.admin
        return loads(dumps(seznam, sort_keys=True, default=str))

class ListNew(Resource):
    @jwt_required()
    @swag_from('apidoc/newlist.yml')
    def post(__self__):
        data = check_for_data()

        listek = List.select().where((List.id_f == data["family_id"]) & (List.name == data["name"]))

        if listek.exists():
            return {"message": "List with that name in family already exists."}, 400
        
        listek = List.create(name=data["name"], id_f=data["family_id"], admin=data["admin"], created=datetime.now())

        return loads(dumps(model_to_dict(listek), sort_keys=True, default=str)), 201

class ListDelete(Resource):
    @jwt_required()
    @swag_from('apidoc/deletelist.yml')
    def delete(__self__):
        data = check_for_data()

        listek = List.select().where(List.id == data['id'])
        list_h_prod = List_has_Product.select().where(List_has_Product.id_l == data['id'])

        if not listek.exists():
            return {"message": "List does not exist"}, 400

        for product in list_h_prod:
            product.delete().execute()

        List.delete().where(List.id == data['id']).execute()

        return {"message": "List successfully deleted"}, 204

class AddItemToList(Resource):
    @jwt_required()
    def post(__self__):
        data = check_for_data()

        check = List_has_Product.select().where((List_has_Product.id_p == data["id_p"]) & (List_has_Product.id_l == data["id_l"]))
        if (check.exists()):
            return "Product already on that list.", 400

        List_has_Product.create(id_p = data["id_p"], id_l = data["id_l"], added_u = data["user"], quantity = data["quantity"], added = datetime.now())
        return "OK", 201

class ProductBought(Resource):
    @jwt_required()
    def put(__self__):
        data = check_for_data()

        product = List_has_Product.select().where(List_has_Product.id == data["id"])

        if not product.exists():
            return {"message": "Product does not exist."}, 400

        product = model_to_dict(product.get())

        for info in data:
            product[info] = data[info]

        product["bought"] = datetime.now()

        product = dict_to_model(List_has_Product, product)
        product.save()