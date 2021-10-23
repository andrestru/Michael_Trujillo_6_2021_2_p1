import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:michael_trujillo_6_2021_2_p1/components/loader_component.dart';
import 'package:michael_trujillo_6_2021_2_p1/helpers/api_helper.dart';
import 'package:michael_trujillo_6_2021_2_p1/models/Notice.dart';
import 'package:michael_trujillo_6_2021_2_p1/models/response.dart';

import 'notices_screen.dart';

class NoticeAllScreen extends StatefulWidget {
  final String type_notice;

  NoticeAllScreen({required this.type_notice});

  @override
  _NoticeAllScreenState createState() => _NoticeAllScreenState();
}

class _NoticeAllScreenState extends State<NoticeAllScreen> {
  String _search = '';
  bool _isFilter = false;
  List<Notice> _notice = [];
  bool _showloader = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNotice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.type_notice),
          actions: <Widget>[
            _isFilter
                ? IconButton(
                    onPressed: _removeFilter, icon: Icon(Icons.filter_none))
                : IconButton(
                    onPressed: _showFilter, icon: Icon(Icons.filter_alt)),
          ],
        ),
        body: Center(
          child: _showloader
              ? LoaderComponent(
                  text: 'Por favor espere...',
                )
              : _getContent(),
        ));
  }

  Future<Null> _getNotice() async {
    setState(() {
      _showloader = true;
    });

    Response response = await ApiHelper.getNotice(widget.type_notice);

    setState(() {
      _showloader = false;
    });

    if (!response.isSuccess) {
      await showAlertDialog(
          context: context,
          title: 'error',
          message: response.message,
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
          ]);
      return;
    }
    setState(() {
      _notice = response.result;
    });
  }

  _getContent() {
    return _notice.length == 0 ? _noContent() : _getListView();
  }

  Widget _noContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          _isFilter
              ? 'No hay Noticias con ese criterio de busqueda'
              : 'No hay Noticias registrados',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getListView() {
    return RefreshIndicator(
      onRefresh: _getNotice,
      child: ListView(
        children: _notice.map((e) {
          return Card(
            child: InkWell(
              onTap: () => _goEdit(e),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: CachedNetworkImage(
                          imageUrl: e.imageUrl.toString(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                          height: 300,
                          width: 300,
                          placeholder: (context, url) => Image(
                            image: AssetImage('assets/noticias.png'),
                            fit: BoxFit.cover,
                            height: 300,
                            width: 300,
                          ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Titulo: ' + e.title.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showFilter() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text('Filtrar Noticias'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Escriba las primeras letras de la noticia'),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Criterio de busqueda...',
                    labelText: 'Buscar',
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    _search = value;
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('cancelar')),
              TextButton(onPressed: () => _filter, child: Text('Filtrar'))
            ],
          );
        });
  }

  void _removeFilter() {
    setState(() {
      _isFilter = false;
    });
    _getNotice();
  }

  void _filter() {
    if (_search.isEmpty) {
      return;
    }

    List<Notice> filteredlist = [];

    for (var notice in _notice) {
      if (notice.title
          .toString()
          .toLowerCase()
          .contains(_search.toLowerCase())) {
        filteredlist.add(notice);
      }
    }

    setState(() {
      _notice = filteredlist;
      _isFilter = true;
    });

    Navigator.of(context).pop();
  }

  void _goEdit(Notice notice) async {
    String? result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NoticeScreen(
                  type_notice: widget.type_notice,
                  notice: notice,
                )));

    if (result == 'yes') {
      _getNotice();
    }
  }
}
