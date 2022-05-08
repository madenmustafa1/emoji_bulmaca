import 'package:emoji_bulmaca/widgets/list/emojilist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/emoji_list_model.dart';
import '../../pages/main_page/emoji_list.dart';

class CategoryListWidget extends ConsumerWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    EmojiList emojiList = EmojiList(context);
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
              return EmojiListItem(
                  url: emojiListModel.coverUrl,
                  totalCount: emojiListModel.totalCount,
                  emojiKey: emojiListModel.name);
            },
          );
        }
      },
    ));
  }
}
