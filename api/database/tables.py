from peewee import *

db = MySQLDatabase(database='koopy', port=3306,
                   host='192.168.0.4', user='koopy_api')


class BaseModel(Model):
    class Meta:
        database = db


class User(BaseModel):
    id = AutoField()
    name = TextField()
    mail = TextField(unique=True)
    profile_img = TextField(default="placeholder.png")


class UserPassword(BaseModel):
    id = AutoField()
    password = TextField()
    last_login = DateTimeField()
    id_u = ForeignKeyField(User, backref='password')


class Family(BaseModel):
    id = AutoField()
    name = TextField()
    address = TextField()
    admin = ForeignKeyField(User, backref='family_admin')
    qrcode = TextField()


class Family_has_User(BaseModel):
    id = AutoField()
    id_u = ForeignKeyField(User, backref='families')
    id_f = ForeignKeyField(Family, backref='members')


class Product(BaseModel):
    id = AutoField()
    name = TextField()
    barcode = TextField(null=True)
    producer = TextField()


class List(BaseModel):
    id = AutoField()
    name = TextField()
    id_f = ForeignKeyField(Family, backref='lists')
    admin = ForeignKeyField(User, backref='list_admin'),
    created = DateTimeField()


class List_has_Product(BaseModel):
    id = AutoField()
    id_p = ForeignKeyField(Product, backref='lists')
    id_l = ForeignKeyField(List, backref='products')
    added = DateTimeField()
    bought = DateTimeField(null=True)
    added_u = ForeignKeyField(User, backref='added_products')
    bought_u = ForeignKeyField(User, backref='bought_products', null=True)
    quantity = IntegerField(null=False, default=1)


if __name__ == '__main__':
    db.connect()

    db.drop_tables([User, Family, Family_has_User,
                    Product, List, List_has_Product, UserPassword])

    db.create_tables([User, Family, Family_has_User,
                     Product, List, List_has_Product, UserPassword])

    db.close()
