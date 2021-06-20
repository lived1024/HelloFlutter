import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(ListViewDynamicAcc());

/// 해당 앱 실행은 해당 폰에서 설정 - 애플리케이션 - 프로젝트명 - 권한 - 주소록 줘야 실행가능
class ListViewDynamicAcc extends StatelessWidget{
  static const String _title = "동적 ListView 위젯 데모";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: ContactListPage(),
      )
    );
  }
}

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  late Iterable<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    refreshContacts();
  }

  refreshContacts() async{
    Iterable<Contact> contacts =
    await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _contacts != null
        ? ListView.builder(itemCount: _contacts.length, itemBuilder: _buildRow) : Center(child: CircularProgressIndicator());
  }

  Widget _buildRow(BuildContext constext, int i ){
    Contact c = _contacts.elementAt(i);
    return ListTile(
      leading: (c.avatar != null && c.avatar.length > 0)
        ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
        : CircleAvatar(child: Text(c.initials())),
      title: Text(c.displayName ?? ""),
    );
  }
}