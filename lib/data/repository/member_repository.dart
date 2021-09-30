import 'package:bookstore_flutter/data/api/api_helper.dart';
import 'package:bookstore_flutter/data/model/member/member.dart';
import 'package:bookstore_flutter/data/model/member/member_response.dart';

class MemberRepository {
  final ApiHelper _apiHelper = ApiHelper.INSTANCE;

  Future<Member> addProduct(Member newMember) async{
    final response = await _apiHelper.postData('/member', newMember.toMap());
    return Member.fromMap(response);
  }

  Future<List<dynamic>> getProduct() async {
    final response = await _apiHelper.getData('/member');
    return MemberResponse.fromList(response).members;
  }

  Future<Member> deleteProduct(int id)async{
    final response = await _apiHelper.deleteData('/member/${id}/1');
    return Member.fromMap(response);
  }
}