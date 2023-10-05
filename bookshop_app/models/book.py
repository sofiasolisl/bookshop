from bookshop_app.config.mysqlconnection import connectToMySQL
from bookshop_app.models import author
from flask import flash

class Book:
    def __init__(self,data):
        self.id=data['id']
        self.title=data['title']
        self.pages=data['num_of_pages']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
        self.on_authors = []
    
    @classmethod
    def get_all(cls):
        query='SELECT * FROM books;'
        results=connectToMySQL('bookshop').query_db(query)
        books=[]
        for book in results:
            books.append(cls(book))
        print(books)
        return books
    
    @classmethod
    def add(cls,data):
        query='INSERT INTO books (id,title,num_of_pages,created_at, updated_at) VALUES (%(id)s,%(title)s,%(pages)s,NOW(),NOW())'
        return connectToMySQL('bookshop').query_db(query,data)
    
    def get_by_id(id):
        query=f"SELECT * from books WHERE id='{id}'"
        book=connectToMySQL('bookshop').query_db(query)
        return book
    def get_by_name(data):
        query='SELECT * FROM books WHERE name=%(data)s;'
        return connectToMySQL('bookshop').query_db(query,data)
    @classmethod
    def get_fav_authors_of_book(cls, id):
        query = f"SELECT * FROM books LEFT JOIN favorites ON favorites.books_id = books.id LEFT JOIN authors ON favorites.authors_id = authors.id WHERE books.id = {id};"
        results = connectToMySQL('bookshop').query_db( query )
        book = cls( results[0] )
        for row_from_db in results:
            author_data = {
                "id" : row_from_db["authors.id"],
                "name" : row_from_db["name"],
                "created_at" : row_from_db["authors.created_at"],
                "updated_at" : row_from_db["authors.updated_at"]
            }
            book.on_authors.append(author.Author(author_data))
        return book
    
    @staticmethod
    def validate_book(book):
        is_valid = True
        if book ['title']=='':
            flash('Title is required.')
            is_valid = False
        if book ['pages']=='':
            flash('Number of pages is required.')
            is_valid = False
        return is_valid
