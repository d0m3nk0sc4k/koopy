from flask import request
from flask_restful import Resource
from database.tables import Product
from playhouse.shortcuts import model_to_dict, dict_to_model

class ProductInfo(Resource):
    def get(__self__, product_name):
        products = Product.select().where(Product.name == product_name)

        if products.exists():
            return [model_to_dict(product) for product in products]
        else:
            return {"message": "Product with that name does not exist."}, 400


class NewProduct(Resource):
    def post(__self__):
        try:
            data = request.get_json(force=True)
        except:
            return {"message": "Body has to have JSON data with product data."}, 400

        product = Product.select().where(
            Product.name == data["name"] and Product.producer == data["producer"])

        if product.exists():
            return {"message": "Product already exists."}, 400

        try:
            barcode = data["barcode"]
            product = Product.create(
                name=data["name"], producer=data["producer"], barcode=data["barcode"])
        except:
            product = Product.create(
                name=data["name"], producer=data["producer"])

        if product.id > 0:
            return {"message": "Product added."}
        else:
            return {"message": "Something went wrong. Please try again."}, 500

class DeleteProduct(Resource):
    def post(__self__):
        try:
            data = request.get_json(force=True)
        except:
            return {"message": "Body has to have JSON data with product data."}, 400

        products = Product.select().where(Product.name == data["name"] and Product.producer == data["producer"])

        if not products.exists():
            return {"message": "Product does not exist."}, 400

        for product in products:
            product.delete().execute()

        Product.delete().where(Product.name == data["name"] and Product.producer == data["producer"]).execute()
        
        return {"message": "Product successfully deleted."}

class UpdateProduct(Resource):
    def post(__self__):
        try:
            data = request.get_json(force=True)
        except:
            return {"message": "Body has to have JSON data with product data."}, 400

        product = Product.select().where(Product.id == data["id"])

        if not product.exists():
            return {"message": "Product does not exist."}, 400

        product = model_to_dict(product.get())

        for info in data:
            product[info] = data[info]
        
        product = dict_to_model(Product, product)
        product.save()
        
        return {"message": "Product successfully updated."}