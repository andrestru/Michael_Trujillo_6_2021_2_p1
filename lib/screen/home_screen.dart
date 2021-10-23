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
      body: _getBody(),
      drawer: _getDrawer(),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/noticias.png'),
            fit: BoxFit.cover,
            height: 300,
            width: 300,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Bienvenid@ a la mejor aplicación de noticias, colocate al día en cuestion de segundos...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _getDrawer() {
    return Drawer(
      child: Container(
        color: Colors.blueAccent[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Image(
              image: AssetImage('assets/noticias.png'),
            )),
            ListTile(
              leading: Icon(Icons.all_inbox),
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
                leading: Icon(Icons.countertops),
                title: Text('Nacionales'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _national)));
                }),
            ListTile(
                leading: Icon(Icons.business_sharp),
                title: Text('Negocio'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _business)));
                }),
            ListTile(
                leading: Icon(Icons.sports_soccer),
                title: Text('Deporte'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _sports)));
                }),
            ListTile(
                leading: Icon(Icons.menu_sharp),
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
                leading: Icon(Icons.cell_wifi),
                title: Text('Tecnologia'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _technology)));
                }),
            ListTile(
                leading: Icon(Icons.access_alarms),
                title: Text('En marcha'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _startup)));
                }),
            ListTile(
                leading: Icon(Icons.emoji_nature),
                title: Text('Entretenimiento'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _entertainment)));
                }),
            ListTile(
                leading: Icon(Icons.handyman),
                title: Text('Diversa'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _miscellaneous)));
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text('A la mano'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _hatke)));
                }),
            ListTile(
                leading: Icon(Icons.science),
                title: Text('Ciencia'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NoticeAllScreen(type_notice: _science)));
                }),
            ListTile(
                leading: Icon(Icons.auto_awesome_mosaic),
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
