from flask import Flask
from flask_restful import Api
from resources.user import User

app = Flask(__name__)
api = Api(app)

api.add_resource(User, '/api/user/<string:user_id>')

"""
EXAMPLE
---------------------------------------------------
class HelloWorld(Resource):
    def get(self):
        return {'hello': 'world'}

api.add_resource(HelloWorld, '/')

class TodoSimple(Resource):
    def get(self, todo_id):
        return {todo_id: todos[todo_id]}

    def put(self, todo_id):
        todos[todo_id] = request.form['data']
        return {todo_id: todos[todo_id]}

api.add_resource(TodoSimple, '/<string:todo_id>')
"""

if __name__ == '__main__':
    app.run(debug=True)