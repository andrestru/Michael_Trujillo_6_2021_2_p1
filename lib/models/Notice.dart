class Notice {
  String? author = '';
  String? content = '';
  String? date = '';
  String? imageUrl = '';
  String? readMoreUrl = '';
  String? time = '';
  String? title = '';
  String? url = '';

  Notice(
      {required this.author,
      required this.content,
      required this.date,
      required this.imageUrl,
      required this.readMoreUrl,
      required this.time,
      required this.title,
      required this.url});

  Notice.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
    date = json['date'];
    imageUrl = json['imageUrl'];
    readMoreUrl = json['readMoreUrl'];
    time = json['time'];
    title = json['title'];
    url = json['url'];
  }
}
