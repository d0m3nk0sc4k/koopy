from flask_restful import Resource
from flask import send_file

class Favicon(Resource):
    def get(__self__):
        return send_file('../assets/logo/primary.png', mimetype='image/png')