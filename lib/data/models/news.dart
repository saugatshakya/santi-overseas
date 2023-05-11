class NewsModel {
  String? imageLink;
  String? newsLink;
  String? rawDate;
  String? source;
  String? summary;
  String? title;

  NewsModel(
      {this.imageLink,
      this.newsLink,
      this.rawDate,
      this.source,
      this.summary,
      this.title});

  NewsModel.fromJson(Map<String, dynamic> json) {
    imageLink = json['image_link'];
    newsLink = json['news_link'];
    rawDate = json['raw_date'];
    source = json['source'];
    summary = json['summary'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_link'] = imageLink;
    data['news_link'] = newsLink;
    data['raw_date'] = rawDate;
    data['source'] = source;
    data['summary'] = summary;
    data['title'] = title;
    return data;
  }
}
