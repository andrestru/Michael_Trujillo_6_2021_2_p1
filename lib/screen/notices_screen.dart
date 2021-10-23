import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:michael_trujillo_6_2021_2_p1/models/Notice.dart';

class NoticeScreen extends StatefulWidget {
  final String type_notice;
  final Notice notice;

  NoticeScreen({required this.type_notice, required this.notice});

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<Notice> _notice = [];
  bool _showloader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Noticias'),
        ),
        body: Center(child: _getContent()));
  }

  _getContent() {
    return _getListView();
  }

  Widget _getListView() {
    return Container(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: CachedNetworkImage(
                imageUrl: widget.notice.imageUrl.toString(),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
            height: 30,
          ),
          Text(
            'Autor',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Column(
            children: [
              Text(
                widget.notice.author.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Titulo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            widget.notice.title.toString(),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Contenido:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            widget.notice.content.toString(),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Fecha',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Column(
            children: [
              Text(
                widget.notice.date.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Hora',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.notice.time.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Url',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            widget.notice.url.toString(),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Leer más...',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            widget.notice.readMoreUrl.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
    );
  }
}
