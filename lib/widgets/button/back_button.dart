import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return InkWell(
      
      onTap: () => Navigator.of(context).pop(),
      child: SizedBox(
        width: queryData.size.width / 5,
        height: queryData.size.height / 6,
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
