import 'package:flutter/material.dart';
import 'package:untitled/mywebview.dart';
import 'package:untitled/homepage.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int _bottomIndex=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF122454),
          title: Text("Ders Programı"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  child: Image.asset("assets/images/uniLogo.png"),
                ),
              ),
              myDrawerItem(Icons.home_rounded, "Anasayfa", "/homepage"),
              myDrawerItem(Icons.account_circle_rounded, "Profil","/profile"),
              myDrawerItem(Icons.calendar_today_rounded,"Ders Programı" ,"/schedule"),
              myDrawerItem(Icons.logout_rounded,"Çıkış Yap" ,"/logout"),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:_bottomIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.arrow_back),title: Text("LMS")),
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded),title: Text("Anasayfa")),
            BottomNavigationBarItem(icon: Icon(Icons.arrow_forward),title: Text("UBS")),
          ],
          onTap: (index){
            _splitScreen(index);
            setState(() {
              _bottomIndex=index;

            });
          },),
        body: Column(

        ),
      ),
    );
  }
  Widget myDrawerItem(IconData icon, String title, String routeName) => ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: ()=> Navigator.pushNamed(context, routeName)
  );
  void _splitScreen(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context)=>MyWebView(title: "LMS PAGE",
            selectedUrl: "https://lms.antalya.edu.tr/",
          ),
        ));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage())
        );
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context)=>MyWebView(title: "UBS PAGE",
            selectedUrl: "https://ubs.antalya.edu.tr/",
          ),
        ));
        break;
    }
  }
}

