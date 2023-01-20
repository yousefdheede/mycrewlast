import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: FontSizeManager.fontSize14), maxLines: 5,);
  }
}