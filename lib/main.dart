import 'package:flutter/material.dart';

import 'contents/contentlist.dart';
import 'contents/texts.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget menuList;

    switch (tabIndex) {
      case 0:
        menuList = MaterialList();
        break;
      case 1:
        menuList = CupertinoList();
        break;
      case 2:
        menuList = AdvancedList();
        break;
    }
    return Scaffold(
      body: Container(
        // color: Color.fromARGB(255, 15, 76, 129),
        child: menuList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (position) {
          setState(() {
            tabIndex = position;
          });
        },
        currentIndex: tabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ad_units),
            label: "프론트",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backup_outlined),
            label: "백앤드",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_settings_alt),
            label: "세팅",
          ),
        ],
      ),
    );
  }
}

//프론트 리스트
class MaterialList extends StatelessWidget {
  final List<CookItem> cooks = [
    TextDemo(),
  ];

  //리스트뷰 출력하기 위한 함수
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cooks.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTitle(),
            );
          } else if (index == cooks.length + 1) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: CookContent(item: cooks[index - 1]),
            );
          }
        });
  }
}

class CupertinoList extends StatelessWidget {
  final List<CookItem> cooks = [

  ];

  //리스트뷰 출력하기 위한 함수
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cooks.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTitle(),
            );
          } else if (index == cooks.length + 1) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: CookContent(item: cooks[index - 1]),
            );
          }
        });
  }
}

//리스트뷰 출력하는 클래스
class AdvancedList extends StatelessWidget {
  final List<CookItem> cooks = [
    // RiveItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cooks.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTitle(),
            );
          } else if (index == cooks.length + 1) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: CookContent(item: cooks[index - 1]),
            );
          }
        });
  }
}

class ListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: Center(
        child: Text(
          "Flutter ",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.display2.fontSize,
              color: Colors.black),
        ),
      ),
    );
  }
}

//리스트뷰 아이템 카드 설정 클래스
class CookContent extends StatelessWidget {
  final CookItem item;

  CookContent({this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        item.onSelect(context);
      },
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}
