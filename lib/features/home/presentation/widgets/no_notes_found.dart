import 'package:flutter/widgets.dart';
import 'package:notes_app/core/utils/app_images.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    super.key,
    required this.title,
    required this.dataImage,
  });
  final String title;
  final String dataImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Image.asset(
          dataImage,
          fit: BoxFit.fill,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
