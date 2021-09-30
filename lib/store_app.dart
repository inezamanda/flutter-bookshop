import 'package:bookstore_flutter/presentation/book/book_list_screen.dart';
import 'package:bookstore_flutter/presentation/book/book_form_screen.dart';
import 'package:bookstore_flutter/presentation/member/member_form_screen.dart';
import 'package:bookstore_flutter/presentation/member/member_list_screen.dart';
import 'package:flutter/material.dart';

class StoreApp extends StatefulWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  _StoreAppState createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {

  int _currentPage = 0;
  final List _pages = [BookListScreen(), MemberListScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SafeArea(
          child: Scaffold(
            appBar: AppBar(title: Text('Book Store'),),
            body: _pages[_currentPage],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentPage,
              items: [
                BottomNavigationBarItem(
                    label: 'Book',
                    icon: Icon(Icons.book)
                ),
                BottomNavigationBarItem(
                    label: 'Member',
                    icon: Icon(Icons.perm_identity)
                )
              ],
              onTap: (int index){
                setState(() {
                  _currentPage = index;
                });
              },
            ),
        )
      ),
      routes: {
        '/add-book' : (context) => BookFormScreen(),
        '/add-member' : (context) => MemberFormScreen()
      },
    );
  }
}
