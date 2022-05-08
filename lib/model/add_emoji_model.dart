class AddEmojiModel {
  final String emojiName;
  final String uuid;
  final bool read = false;
  AddEmojiModel(this.emojiName, this.uuid);

  Map<String, dynamic> toJson() {
    return {'emojiName': emojiName, 'uuid': uuid, 'read': read};
  }
}
