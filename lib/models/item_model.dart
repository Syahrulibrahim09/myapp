class Item {
  final int id;
  final String title;
  final String description;

  Item({required this.id, required this.title, required this.description});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
