import 'package:flutter/material.dart';
import 'package:my_crew/utils/utils/utils.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return const Center(child: CircularProgressIndicator(),);
  }
}