from bookshop_app.config.mysqlconnection import connectToMySQL
from bookshop_app.models import book
from flask import flash

#from flask_app.models import topping
#burger.toppings.append( topping.Topping( topping_data ) )
class Author:
    def __init__(self,data):
        self.id=data['id']
        self.name=data['name']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
        self.books=[]

    def add(data):
        query='INSERT INTO authors (id, name, created_at, updated_at) VALUES (%(id)s,%(name)s,NOW(),NOW())'
        return connectToMySQL('bookshop').query_db(query,data)
    
    def get_by_name(data):
        query=f'SELECT * FROM authors WHERE name="{data}";'
        return connectToMySQL('bookshop').query_db(query)
    def get_by_id(data):
        query=f'SELECT * FROM authors WHERE id={data};'
        return connectToMySQL('bookshop').query_db(query)
    
    @classmethod
    def get_all(cls):
        query='SELECT * FROM authors;'
        results=connectToMySQL('bookshop').query_db(query)
        authors=[]
        for author in results:
            authors.append(cls(author))
        return authors
    @classmethod
    def get_fav_books_of_author(cls, id):
        query = f"SELECT * FROM books LEFT JOIN favorites ON favorites.books_id = books.id LEFT JOIN authors ON favorites.authors_id = authors.id WHERE authors.id = {id};"
        results = connectToMySQL('bookshop').query_db( query )
        author = cls( results[0] )
        for row_from_db in results:
            book_data = {
                "id" : row_from_db["id"],
                "title" : row_from_db["title"],
                "num_of_pages" : row_from_db["num_of_pages"],
                "created_at" : row_from_db["created_at"],
                "updated_at" : row_from_db["updated_at"]
            }
            author.books.append(book.Book(book_data))
        return author
    @staticmethod
    def validate_author(author):
        is_valid = True
        if author ['name']=='':
            flash('Title is required.')
            is_valid = False
        return is_valid
    
    @classmethod
    def add_to_favs(cls,data):
        query="INSERT INTO favorites (authors_id, books_id) VALUES (%(authors_id)s,%(books_id)s)"
        return connectToMySQL('bookshop').query_db(query,data)