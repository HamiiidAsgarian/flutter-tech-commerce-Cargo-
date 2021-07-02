class Watches {
  final int id;
  final String title;
  final String company;
  final int price;
  final String imageUrl;
  final String thumbnail;

  Watches(
      {required this.id,
      required this.title,
      required this.company,
      required this.price,
      required this.imageUrl,
      required this.thumbnail});

  factory Watches.fromJson(Map<String, dynamic> json) {
    return Watches(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['company'] = this.company;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
