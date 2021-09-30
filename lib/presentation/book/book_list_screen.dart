import 'package:bookstore_flutter/data/model/book/book.dart';
import 'package:bookstore_flutter/presentation/book/book_view_model.dart';
import 'package:flutter/material.dart';

class BookListScreen extends StatefulWidget {
  BookViewModel bookViewModel = BookViewModel();
  // const BookListScreen({Key? key}) : super(key: key);

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<dynamic> listBook = <Book>[];

  @override
  void initState() {
    super.initState();
    _getListBook();
  }

  _getListBook() async{
    listBook = await widget.bookViewModel.getBook();
    Future.delayed(const Duration(microseconds: 500), (){
      setState(() {
        listBook = listBook;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              Text('Book List'),
              ElevatedButton(
                onPressed: () async{
                  final status = await Navigator.pushNamed(context, '/add-book');
                  if(status=='done'){
                    setState(() {
                      _getListBook();
                    });
                  }
                },
                child: Text('add book'),
              ),
              Expanded(
                  child: Card(
                    child: Scrollbar(
                        child: ListView.builder(itemBuilder: (context, index){
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: ListTile(
                                        leading: Icon(Icons.book, size: 40.0,),
                                        title: Text(listBook[index].title),
                                      )
                                  ),
                                ],
                              ),
                              Divider(height: 5.0, color: Colors.cyan,)
                            ],
                          );
                          },
                        itemCount: listBook.length,
                        )
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
