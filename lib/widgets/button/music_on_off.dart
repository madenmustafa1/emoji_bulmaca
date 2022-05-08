import 'package:emoji_bulmaca/model/voice_check_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/song_page_provider.dart';

class MusicOnOffWidget extends ConsumerWidget {
  final MediaQueryData queryData;
  const MusicOnOffWidget({Key? key, required this.queryData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    VoiceCheckModel scoreProvider = ref.watch(voiceCheckNotifierProvider);
    return Column(
      children: [
        SizedBox(
          height: queryData.size.height / 13,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => voiceCheck(ref),
              child: Padding(
                padding: EdgeInsets.only(left: queryData.size.width / 15),
                child: Icon(
                  scoreProvider.voiceCheck == false
                      ? Icons.music_note
                      : Icons.music_off,
                  size: queryData.size.height / 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void voiceCheck(WidgetRef ref) {
    ref.read(voiceCheckNotifierProvider.notifier).setVoiceState();
  }
}
