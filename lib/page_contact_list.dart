// ignore: import_of_legacy_library_into_null_safe
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_start/page_contact_detail.dart';
import 'package:permission_handler/permission_handler.dart';

///대부분 내용은 contacts_demo_v1과 동일
class ContactListPage extends StatefulWidget{
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage>{
  late Iterable<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  _checkPermissions() async{  /// 주소록 접근 권한 획득
    await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    refreshContacts();
  }

  refreshContacts() async{
    Iterable<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('주소록 데모')),
      body: _contacts != null ? ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: _buildRow,
      ) : Center(child: CircularProgressIndicator())
    );
  }

  Widget _buildRow(BuildContext context, int i){
    Contact c = _contacts.elementAt(i);
    return ListTile(
      leading: (c.avatar != null && c.avatar.length > 0)
        ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
        : CircleAvatar(child: Text(c.initials())),
      title: Text(c.displayName ?? ""),

      /// 주소록 항목 선택하면 ContactDetailPage에 선택된 주소록 객체 넘긴다.
      ///                                       '/contact'                 , 주소록 객체
      onTap: () => Navigator.pushNamed(context, ContactDetailPage.routeName, arguments: c),
    );
  }
}