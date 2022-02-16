class EmojiModel {
  final String id;
  final String url;
  final String name;

  const EmojiModel(
    this.id,
    this.url,
    this.name,
  );

  factory EmojiModel.fromMap(Map map) {
    return EmojiModel(
      map['id'],
      map['url'],
      map['name'],
    );
  }

  Map<String, dynamic> asMap() => {
   'id' : id,
   'url' : url,
   'name' : name
  };
}