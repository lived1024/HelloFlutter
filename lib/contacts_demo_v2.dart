import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(ListViewDynamicAcc());

/// 주소록 권한을 주기 전에 실행하면 정상실행되지 않는다.
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
    _checkPermissions();
  }

  _checkPermissions() async{
    await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    refreshContacts();
  }

  refreshContacts() async{            // 비동기
    Iterable<Contact> contacts =
    await ContactsService.getContacts(withThumbnails: false); // 썸네일 로딩 X 설정
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _contacts != null
        ? ListView.builder(itemCount: _contacts.length, itemBuilder: _buildRow) : Center(child: CircularProgressIndicator());
  }

  Widget _buildRow(BuildContext context, int i ){
    Contact c = _contacts.elementAt(i);
    return ListTile(
      leading: (c.avatar != null && c.avatar.length > 0)
          ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
          : CircleAvatar(child: Text(c.initials())),
      title: Text(c.displayName ?? ""),
    );
  }
}

/// permission_handler 패키지에서 제공하는 주요 권한
///                                         Android                       iOS
///
/// PermissionGroup.calendar                Calendar                      Calendar (Events)
/// PermissionGroup.camera                  Camera                        Photos(Camera Roll과 Camera)
/// PermissionGroup.contacts                Contacts                      AddressBook
/// PermissionGroup.location                Fine Location                 CoreLocation(Always와 WhenInUse)
///                                         Coarse Location
/// PermissionGroup.locationAlways          Fine Location(Q-OS 이하)       CoreLocation(Always)
///                                         Coarse Location(Q-OS 이하)
///                                         Background Location(Q 이상)
/// PermissionGroup.locationWhenInUser      Fine Location                 CoreLocation(WhenInUse)
///                                         Coarse Location
/// PermissionGroup.phone                   Phone                         NA
/// PermissionGroup.storage                 External Storage              Documents와 Downloads폴더 접근 권한
/// PermissionGroup.notification            Notification                  Notification