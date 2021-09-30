import 'package:bookstore_flutter/data/model/member/member.dart';
import 'package:bookstore_flutter/presentation/member/member_view_model.dart';
import 'package:flutter/material.dart';

class MemberListScreen extends StatefulWidget {
  MemberViewModel memberViewModel = MemberViewModel();
  // const MemberListScreen({Key? key}) : super(key: key);

  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  List<dynamic> listMember = <Member>[];

  @override
  void initState() {
    super.initState();
    _getListMember();
  }

  _getListMember() async{
    listMember = await widget.memberViewModel.getMember();
    Future.delayed(const Duration(microseconds: 500), (){
      setState(() {
        listMember = listMember;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              Text('Member List'),
              ElevatedButton(
                  onPressed: () async{
                    final status = await Navigator.pushNamed(context, '/add-member');
                    if(status=='done'){
                      setState(() {
                        _getListMember();
                      });
                    }
                  },
                  child: Text('register'),
              ),
              Expanded(
                  child: Card(
                    child: Scrollbar(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: ListTile(
                                      leading: Icon(Icons.perm_identity, size: 40.0,),
                                      title: Text(listMember[index].firstName),
                                    )
                                )
                              ],
                            ),
                            Divider(height: 5.0, color: Colors.cyan,)
                          ],
                        );
                      },
                        itemCount: listMember.length,
                      ),
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
