import 'package:flutter/material.dart';
import '../../res/app_context_extension.dart';

class CustomWidgets {
  static getAppBar(BuildContext context, String title) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: context.resources.style.appbarTextStyle,
      ),
    );
  }


  static getSizedBox(BuildContext context) {
    return SizedBox(
      height: context.resources.dimension.defaultMargin,
    );
  }

  static showLoadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static showNoResult(BuildContext context, String errorMessage) {
    return Padding(
      padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
      child: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
