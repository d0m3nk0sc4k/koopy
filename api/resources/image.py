from flask import request, send_file
from flask_restful import Resource
from database.tables import User, UserPassword
from datetime import datetime
from playhouse.shortcuts import model_to_dict
from json import dumps, loads
from .functions import check_for_data
from flask_jwt_extended import create_access_token, jwt_required
from flasgger import swag_from
from werkzeug.utils import secure_filename
from os import path

class ImageGet(Resource):
    @swag_from('apidoc/getimage.yml')
    def get(__self__, image_name):
        return send_file('/mnt/koopy/profile/' + image_name, mimetype='image/png')

class ImagePost(Resource):
    @jwt_required()
    @swag_from('apidoc/uploadimage.yml')
    def post(__self__):
        file = request.files['file']
        filename = secure_filename(file.filename)
        file.save(path.join('/mnt/koopy/profile', filename))
        user = request.form['user']
        
        User.update({'profile_img': filename}).where(User.id == user).execute()

        return file.filename[:-3]