import 'package:flutter/material.dart';
import 'package:michael_trujillo_6_2021_2_p1/screen/notice_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _all = 'all';
  String _national = 'national';
  String _business = 'business';
  String _sports = 'sports';
  String _world = 'world';
  String _politics = 'politics';
  String _technology = 'technology';
  String _startup = 'startup';
  String _entertainment = 'entertainment';
  String _miscellaneous = 'miscellaneous';
  String _hatke = 'hatke';
  String _science = 'science';
  String _automobile = 'automobile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notices'),
      ),
      drawer: _getBody(),
    );
  }

  Widget _getBody() {
    return Drawer(
      child: Container(
        color: Colors.indigo[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Image(
              image: AssetImage('assets/noticias.png'),
            )),
            ListTile(
              leading: Icon(Icons.two_wheeler),
              title: Text('All'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NoticeAllScreen(type_notice: _all)));
              },
            ),
            ListTile(
                leading: Icon(Icons.precision_manufacturing),
                title: Text('Nacionales'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _national)));
                }),
            ListTile(
                leading: Icon(Icons.precision_manufacturing),
                title: Text('Negocio'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _business)));
                }),
            ListTile(
                leading: Icon(Icons.badge),
                title: Text('Deporte'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _sports)));
                }),
            ListTile(
                leading: Icon(Icons.toys),
                title: Text('Mundo'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _world)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('Politica'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _politics)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('Tecnologia'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _technology)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('En marcha'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _startup)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('Entretenimiento'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _entertainment)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('A la mano'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _miscellaneous)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('Ciencia'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _hatke)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('Ciencia'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _science)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('Automovil'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _automobile)));
                }),
          ],
        ),
      ),
    );
  }
}
