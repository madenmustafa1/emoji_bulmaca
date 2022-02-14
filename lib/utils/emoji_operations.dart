import 'package:flutter/material.dart';

import 'constants.dart';

class EmojiOperations {
  Constants constants = Constants();

  Image getNextImg(String path, int index) {
    return Image.asset(
      'assets/img/$path/${index.toString()}.png',
      fit: BoxFit.cover,
    );
  }

  Widget newFutureBuilderText(Future<int> songsCount) {
    return FutureBuilder<int>(
      future: songsCount,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          //
          return Text(
            snapshot.data.toString(),
            style: constants.returnTextStyle(constants.MAIN_TITLE_NO_2),
          );
        }
      },
    );
  }

  Widget futureGetNextImg(String path, Future<int> songsCount) {
    return FutureBuilder<int>(
      future: songsCount,
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data != null) {
            return getNextImg(path, snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }
}
