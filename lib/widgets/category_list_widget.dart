import 'package:flutter/material.dart';

import '../model/emoji_list_model.dart';
import '../pages/main_page/emoji_list.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({Key? key}) : super(key: key);

  late EmojiList emojiList;
  late MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    emojiList = EmojiList(context);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
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
