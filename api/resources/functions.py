from flask import request

def check_for_data():
    try:
        data = request.get_json(force=True)
        return data
    except:
        return {"message": "Body is required"}, 400