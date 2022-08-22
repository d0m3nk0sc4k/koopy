from flask import request
from flask_restful import Resource
from database.tables import Product
from playhouse.shortcuts import model_to_dict, dict_to_model
from .functions import check_for_data
from flask_jwt_extended import jwt_required
from flasgger import swag_from


class ProductInfo(Resource):
    @jwt_required()
    @swag_from('apidoc/productinfo.yml')
    def get(__self__, product_name):

        products = Product.select().where(Product.name == product_name)

        if products.exists():
            return [model_to_dict(product) for product in products], 200
        else:
            return {"message": "Product with that name does not exist."}, 400

class ProductNew(Resource):
    @jwt_required()
    @swag_from('apidoc/newproduct.yml')
    def post(__self__):
        data = check_for_data()

        product = Product.select().where(
            Product.name == data["name"] and Product.producer == data["producer"])

        if product.exists():
            return {"message": "Product already exists.", "id": product.id}, 400

        try:
            barcode = data["barcode"]
            product = Product.create(
                name=data["name"], producer=data["producer"], barcode=barcode)
        except:
            product = Product.create(
                name=data["name"], producer=data["producer"])

        if product.id > 0:
            return {"message": "Product added.", "id": product.id}, 201
        else:
            return {"message": "Something went wrong. Please try again."}, 500

class ProductDelete(Resource):
    @jwt_required()
    @swag_from('apidoc/deleteproduct.yml')
    def delete(__self__):
        data = check_for_data()

        products = Product.select().where(
            Product.name == data["name"] and Product.producer == data["producer"])

        if not products.exists():
            return {"message": "Product does not exist."}, 400

        for product in products:
            product.delete().execute()

        Product.delete().where(Product.name ==
                               data["name"] and Product.producer == data["producer"]).execute()

        return {"message": "Product successfully deleted."}, 204

class ProductUpdate(Resource):
    @jwt_required()
    @swag_from('apidoc/updateproduct.yml')
    def put(__self__):
        data = check_for_data()

        product = Product.select().where(Product.id == data["id"])

        if not product.exists():
            return {"message": "Product does not exist."}, 400

        product = model_to_dict(product.get())

        for info in data:
            product[info] = data[info]

        product = dict_to_model(Product, product)
        product.save()

        return {"message": "Product successfully updated."}, 201