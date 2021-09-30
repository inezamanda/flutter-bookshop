import 'package:bookstore_flutter/data/model/book/book.dart';
import 'package:bookstore_flutter/data/repository/book_repository.dart';

class BookViewModel {
  BookRepository _bookRepository = BookRepository();

  addBook(Book newBook)async{
    final newBookRegistered = await _bookRepository.addProduct(newBook);
    print(newBookRegistered);
  }

  Future<List<dynamic>> getBook()async{
    final getListBook = await _bookRepository.getProduct();
    print(getListBook);
    return getListBook;
  }
}