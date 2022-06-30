// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/model/dio-model/emoji_list_model_dio.dart';
import '/dependency_injection/setup.dart';
import '/pages/main_page/main_page_view_model.dart';
import '/widgets/list/emojilist_item.dart';

class CategoryListWidget extends ConsumerWidget {
  CategoryListWidget({Key? key}) : super(key: key);

  //MainPageViewModel mainPageViewModel = MainPageViewModel();

  final MainPageViewModel mainPageViewModel = getIt<MainPageViewModel>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //EmojiList emojiList = EmojiList(context);
    return Expanded(
        child: FutureBuilder<List<EmojiCategoryModelDio>?>(
      future: mainPageViewModel.getEmojiCategoryList(),
      builder: (context, AsyncSnapshot<List<EmojiCategoryModelDio>?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              EmojiCategoryModelDio emojiListModel = snapshot.data![index];
              return EmojiListItem(
                base64Img: emojiListModel.image,
                totalCount: emojiListModel.totalCount,
                emojiKey: emojiListModel.index.toString(),
              );
            },
          );
        }
      },
    ));
  }
}
