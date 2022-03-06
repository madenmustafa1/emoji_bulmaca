import 'package:flutter/material.dart';

import '../model/emoji_list_model.dart';
import '../pages/main_page/emoji_list.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
    required this.emojiList,
    required this.queryData,
  }) : super(key: key);

  final EmojiList emojiList;
  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<List<EmojiListModel>>(
      future: emojiList.getEmojiList(),
      builder: (context, AsyncSnapshot<List<EmojiListModel>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              EmojiListModel emojiListModel = snapshot.data![index];
              return emojiList.listViewItem(
                emojiListModel.coverUrl,
                queryData,
                emojiListModel.totalCount,
                emojiListModel.name,
              );
            },
          );
        }
      },
    ));
  }
}

