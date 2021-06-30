import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'page_contact_list.dart';
import 'page_contact_detail.dart';

void main() => runApp(ContactsDemoV3());

class ContactsDemoV3 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /// ContactListPage : page_contact_list에 선언한 클래스
      home: ContactListPage(),
      /// 동적으로 routes를 구성하기위해 onGenerateRoute 속성을 구현해야함
      /// 아래 속성에서 실행되는 함수의 원형은 다음과 같다
      /// typedef RouteFactory = Route<dynamic> Function(RouteSettings settings);
      /// Route<dynamic>을 반환
      /// RouteSettings에 경로이름인 name과 새로운 페이지에 넘길 인자인 arguments속성이 있음
      onGenerateRoute: (RouteSettings settings){
        if(ContactDetailPage.routeName == settings.name){
          Contact? c = settings.arguments as Contact?;
          return MaterialPageRoute(
            builder: (context) => ContactDetailPage(c!)
          );
        }
        /// 적절한 경로를 찾을 수 없을때 해당 함수 실행
        return _noWay;
      },
    );
  }

  final MaterialPageRoute _noWay = MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('경로가 없습니다'),
        ),
      )
  );
}

