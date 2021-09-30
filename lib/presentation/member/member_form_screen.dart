import 'package:bookstore_flutter/data/model/member/member.dart';
import 'package:bookstore_flutter/presentation/member/member_view_model.dart';
import 'package:bookstore_flutter/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MemberFormScreen extends StatefulWidget {
  MemberViewModel memberViewModel = MemberViewModel();
  // const MemberFormScreen({Key? key}) : super(key: key);

  @override
  _MemberFormScreenState createState() => _MemberFormScreenState();
}

class _MemberFormScreenState extends State<MemberFormScreen> {
  TextEditingController memberFirstName = new TextEditingController();
  TextEditingController memberLastName = new TextEditingController();
  TextEditingController memberEmail = new TextEditingController();
  TextEditingController memberPassword = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Member'),),
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
                      controller: memberFirstName, 
                      str: 'First Name',
                      inputType: TextInputType.text,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'First name is required'),
                        MinLengthValidator(3, errorText: 'This field must be at least 3 characters'),
                      ]),
                    ),
                    TextFieldWidget(
                      controller: memberLastName,
                      str: 'Last Name',
                      inputType: TextInputType.text,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Last name is required'),
                        MinLengthValidator(3, errorText: 'This field must be at least 3 characters'),
                      ]),
                    ),
                    TextFieldWidget(
                      controller: memberEmail,
                      str: 'Email',
                      inputType: TextInputType.emailAddress,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Email is required'),
                        MinLengthValidator(3, errorText: 'This field must be at least 3 characters'),
                        EmailValidator(errorText: 'Please enter a valid email address')
                      ]),
                    ),
                    TextFieldWidget(
                      controller: memberPassword,
                      str: 'Password',
                      inputType: TextInputType.visiblePassword,
                      validate: MultiValidator([
                        RequiredValidator(errorText: 'Password is required'),
                        MinLengthValidator(8, errorText: 'This field must be at least 8 characters'),
                      ]),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()) {
                              setState(() {
                                widget.memberViewModel.addMember(Member(
                                    firstName: memberFirstName.text,
                                    lastName: memberLastName.text,
                                    email: memberEmail.text,
                                    password: memberPassword.text,
                                    status: 0
                                ));
                              });
                              Navigator.pop(context, 'done');
                            }
                          },
                          child: Text('Submit'),
                        ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
