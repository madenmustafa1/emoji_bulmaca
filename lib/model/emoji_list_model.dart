class EmojiListModel {
  final int totalCount;
  final String coverUrl;
  final String name;

  const EmojiListModel(
    this.totalCount,
    this.coverUrl,
    this.name,
  );

  factory EmojiListModel.fromMap(Map map) {
    return EmojiListModel(
      map['totalCount'],
      map['coverUrl'],
      map['name'],
    );
  }

  Map<String, dynamic> asMap() => {
   'totalCount' : totalCount,
   'coverUrl' : coverUrl,
   'name' : name
  };
}