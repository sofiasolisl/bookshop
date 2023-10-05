from bookshop_app import app
from flask import render_template, redirect, request
from bookshop_app.models.book import Book
from bookshop_app.models.author import Author

@app.route('/', methods=['POST', 'GET'])
@app.route('/authors', methods=['POST', 'GET'])
def authors():
    if request.method=='POST':
        if not Author.validate_author(request.form):
            return redirect('/authors')
        id=len(Author.get_all()) + 1
        data={
            'id':id,
            'name':request.form['name']
        }
        Author.add(data)
        return redirect ("/")
    else: 
        authors=Author.get_all()
        return render_template ('authors.html', all_authors=authors)

@app.route('/books', methods=['POST', 'GET'])
def books():
    if request.method=='POST':
        if not Book.validate_book(request.form):
            return redirect('/books')
        id=len(Book.get_all()) + 1
        data={
            'id':id,
            'title':request.form['title'],
            'pages':request.form['pages']
        }
        Book.add(data)
        return redirect ('/books')
    else: 
        books=Book.get_all()
        return render_template ('books.html', all_books=books)

@app.route('/author_show/<author_id>', methods=['POST','GET'])
def author_show(author_id):
    if request.method=='POST':
        book_id=request.form['book']
        data={
            "authors_id": author_id,
            "books_id":book_id
        }
        Author.add_to_favs(data)
        return redirect (f'/author_show/{author_id}')
    else:
        fav_books=Author.get_fav_books_of_author(author_id).books
        all_books=Book.get_all()
        author_data=Author.get_by_id(author_id)[0]
        print(author_data)
        return render_template('author_show.html',fav_books=fav_books, all_books=all_books,author_data=author_data)
    
@app.route('/book_show/<book_id>', methods=['POST','GET'])
def book_show(book_id):
    if request.method=='POST':
        author_id=request.form['author']
        data={
            "authors_id": author_id,
            "books_id":book_id
        }
        Author.add_to_favs(data)
        return redirect (f'/book_show/{book_id}')
    else:
        fav_authors=Book.get_fav_authors_of_book(book_id).on_authors
        all_authors=Author.get_all()
        book_data=Book.get_by_id(book_id)[0]
        return render_template('book_show.html',fav_authors=fav_authors, all_authors=all_authors,book_data=book_data)