import 'package:bookstore_flutter/data/model/book/book.dart';
import 'package:bookstore_flutter/presentation/book/book_view_model.dart';
import 'package:bookstore_flutter/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class BookFormScreen extends StatefulWidget {
  BookViewModel bookViewModel = BookViewModel();
  // const BookFormScreen({Key? key}) : super(key: key);

  @override
  _BookFormScreenState createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
  TextEditingController bookTitle = new TextEditingController();
  TextEditingController bookDesc = new TextEditingController();
  TextEditingController bookYear = new TextEditingController();
  TextEditingController bookPages = new TextEditingController();
  TextEditingController bookLanguage = new TextEditingController();
  TextEditingController bookPublisher = new TextEditingController();
  TextEditingController bookPrice = new TextEditingController();
  TextEditingController bookStock = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Book'),),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      controller: bookTitle,
                      str: 'Book Title',
                      inputType: TextInputType.text,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Book title is required'),
                        MinLengthValidator(3, errorText: 'This field must be at least 3 characters'),
                      ]),
                    ),
                    TextFieldWidget(
                      controller: bookDesc,
                      str: 'Book Desc',
                      inputType: TextInputType.text,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Book description is required'),
                        MinLengthValidator(5, errorText: 'This field must be at least 5 characters'),
                        ]),
                    ),
                    TextFieldWidget(
                      controller: bookYear,
                      str: 'Book Year',
                      inputType: TextInputType.number,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Year published is required'),
                        MinLengthValidator(4, errorText: 'This field must be at least 4 characters'),
                        ]),
                    ),
                    TextFieldWidget(
                      controller: bookPages,
                      str: 'Book Pages',
                      inputType: TextInputType.number,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Book page is required'),
                      ]),
                    ),
                    TextFieldWidget(
                      controller: bookLanguage,
                      str: 'Book Language',
                      inputType: TextInputType.text,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Book language is required'),
                        MinLengthValidator(5, errorText: 'This field must be at least 5 characters'),
                      ]),
                    ),
                    TextFieldWidget(
                      controller: bookPublisher,
                      str: 'Book Publisher',
                      inputType: TextInputType.text,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Book publisher is required'),
                        MinLengthValidator(5, errorText: 'This field must be at least 5 characters'),
                      ]),
                    ),
                    TextFieldWidget(
                      controller: bookPrice,
                      str: 'Book Price',
                      inputType: TextInputType.number,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Book price is required'),
                      ]),
                    ),
                    TextFieldWidget(
                      controller: bookStock,
                      str: 'Book Stock',
                      inputType: TextInputType.number,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Book stock is required'),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              widget.bookViewModel.addBook(Book(
                                  title: bookTitle.text,
                                  description: bookDesc.text,
                                  year: int.parse(bookYear.text),
                                  pages: int.parse(bookPages.text),
                                  language: bookLanguage.text,
                                  publisher: bookLanguage.text,
                                  price: int.parse(bookPrice.text),
                                  stock: int.parse(bookStock.text)
                              ));
                            });
                            Navigator.pop(context, 'done');
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}
