import 'package:bookstore_flutter/data/api/api_helper.dart';
import 'package:bookstore_flutter/data/model/book/book.dart';
import 'package:bookstore_flutter/data/model/book/book_response.dart';

class BookRepository {
  final ApiHelper _apiHelper = ApiHelper.INSTANCE;
  
  Future<Book> addProduct(Book newBook) async{
    final response = await _apiHelper.postData('/book', newBook.toMap());
    return Book.fromMap(response);
  }

  Future<List<dynamic>> getProduct() async {
    final response = await _apiHelper.getData('/book');
    return BookResponse.fromList(response).books;
  }
}