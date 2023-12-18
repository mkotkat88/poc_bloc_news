import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../data_layer/model/news/news_model.dart';
import '../../res/app_context_extension.dart';
import '../../utils/utility.dart';
import '../widget/custom_widgets.dart';

class NewsDetailScreen extends StatefulWidget {

  static const String id = "news_detail_screen";
  final Article objArticle;

  const NewsDetailScreen({required this.objArticle, Key? key}) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.getAppBar(context, context.resources.strings?.newsDetails ?? ""),
      body: Padding(
        padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  widget.objArticle.source?.name ?? "unKnown",
                  style: context.resources.style.mainTextStyle,
                ),
              ),
              CustomWidgets.getSizedBox(context),
              Text(
                widget.objArticle.title,
                style: context.resources.style.subTextStyle,
              ),

              CustomWidgets.getSizedBox(context),

              Container(
                alignment: AlignmentDirectional.topStart,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: widget.objArticle.description,
                    style: context.resources.style.subTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text: context.resources.strings?.more ?? "",
                          style: context.resources.style.hyperLinkStyle,
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Utility.launchURL(widget.objArticle.url);

                          }
                      ),
                    ],
                  ),
                ),
              ),
              //Space between widget
              CustomWidgets.getSizedBox(context),
              //Author name
              Container(
                alignment: AlignmentDirectional.topStart,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: context.resources.strings?.authorName ?? "",
                    style: context.resources.style.mainTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.objArticle.author.isEmpty ? context.resources.strings!.noAuthor : widget.objArticle.author,
                          style: context.resources.style.subTextStyle),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
