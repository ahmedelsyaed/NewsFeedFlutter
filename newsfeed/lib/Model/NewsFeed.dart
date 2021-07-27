class NewsFeed {
  String _status = "";
  String _source = "";
  String _sortBy = "";
  List<Articles> _articles = [];

  NewsFeed(
      {required String status,
      required String source,
      required String sortBy,
      required List<Articles> articles}) {
    this._status = status;
    this._source = source;
    this._sortBy = sortBy;
    this._articles = articles;
  }

  String get status => _status;
  set status(String status) => _status = status;
  String get source => _source;
  set source(String source) => _source = source;
  String get sortBy => _sortBy;
  set sortBy(String sortBy) => _sortBy = sortBy;
  List<Articles> get articles => _articles;
  set articles(List<Articles> articles) => _articles = articles;

  NewsFeed.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _source = json['source'];
    _sortBy = json['sortBy'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['source'] = this._source;
    data['sortBy'] = this._sortBy;
    if (this._articles != null) {
      data['articles'] = this._articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String _author="";
  String _title="";
  String _description="";
  String _url= "";
  String _urlToImage= "";
  String _publishedAt = "";

  Articles(
      {required String author,
      required String title,
      required String description,
      required String url,
      required String urlToImage,
      required String publishedAt}) {
    this._author = author;
    this._title = title;
    this._description = description;
    this._url = url;
    this._urlToImage = urlToImage;
    this._publishedAt = publishedAt;
  }

  String get author => _author;
  set author(String author) => _author = author;
  String get title => _title;
  set title(String title) => _title = title;
  String get description => _description;
  set description(String description) => _description = description;
  String get url => _url;
  set url(String url) => _url = url;
  String get urlToImage => _urlToImage;
  set urlToImage(String urlToImage) => _urlToImage = urlToImage;
  String get publishedAt => _publishedAt;
  set publishedAt(String publishedAt) => _publishedAt = publishedAt;

  Articles.fromJson(Map<String, dynamic> json) {
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this._author;
    data['title'] = this._title;
    data['description'] = this._description;
    data['url'] = this._url;
    data['urlToImage'] = this._urlToImage;
    data['publishedAt'] = this._publishedAt;
    return data;
  }
}
