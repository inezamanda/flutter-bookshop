import 'package:bookstore_flutter/data/model/member/member.dart';

class MemberResponse {
  List<dynamic> members;

  MemberResponse({required this.members});

  factory MemberResponse.fromList(List<dynamic> listOfMember) {
    List<dynamic> listMember = listOfMember.map((e) => Member.fromMap(e)).where((element) => element.status == 0).toList();

    return MemberResponse(members: listMember);
  }
}