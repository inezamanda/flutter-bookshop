import 'package:bookstore_flutter/data/model/member/member.dart';
import 'package:bookstore_flutter/data/repository/member_repository.dart';

class MemberViewModel {
  MemberRepository _memberRepository = MemberRepository();

  addMember(Member newMember) async {
    final newMemberRegistered = await _memberRepository.addProduct(newMember);
    print(newMemberRegistered);
  }

  Future<List<dynamic>> getMember() async {
    final getListMember = await _memberRepository.getProduct();
    print(getListMember);
    return getListMember;
  }

  deleteMember(int id)async {
    print(id);
    final deleteMemberFromList = await _memberRepository.deleteProduct(id);

    print(deleteMemberFromList);
  }
}