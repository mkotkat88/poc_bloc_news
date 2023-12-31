import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/news/news_bloc.dart';
import '../../data_layer/model/news/news_model.dart';
import '../../res/app_context_extension.dart';
import 'news_detail_screen.dart';
import '../../ui/widget/custom_widgets.dart';

class NewsScreen extends StatefulWidget {
  static const String id = "news_list_pagination_screen";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() =>
      _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsBloc _newsBloc;
  String selectedCountries = "eg";
  final List<Article> _newsList = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {

    _newsBloc = BlocProvider.of(context);
    _newsBloc.add(NewsDataEvent(selectedCountries));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomWidgets.getAppBar(
        context,
        context.resources.strings?.news ?? "",
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsPageLoading) {
              return CustomWidgets.showLoadingView();
          } else if (state is NewsPageError) {
            return CustomWidgets.showNoResult(context, state.errorMessage);
          } else if (state is NewsPageLoaded) {
            _newsList.addAll(state.data.articles);
            if(_newsList.length >= state.data.totalResults) {
              _newsBloc.haveMoreData = false;
            } else {
              _newsBloc.haveMoreData = true;
            }
          }
          return _newsListView();
        },
        listener: (context, state) {
        },
      ),
    );
  }

  Widget _newsListView() {
    return ListView(
      controller: _scrollController..addListener(() {
        if(_scrollController.offset == _scrollController.position.maxScrollExtent && _newsBloc.haveMoreData) {
          _newsBloc.haveMoreData = false;
          _newsBloc.add(NewsDataEvent(selectedCountries));
        }
      }),
      children: [
        ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _newsList.length,
          itemBuilder: (context, index) {
            return _newsListItems(_newsList[index], index);
          },
        ),
        _newsBloc.haveMoreData?_bottomLoaderView():Container()
      ],
    );
  }

  Widget _newsListItems(Article article, int index) {
    return Card(
      child: ListTile(
        title: Text(
          article.source?.name ?? "unKnown",
          style: context.resources.style.mainTextStyle,
        ),
        subtitle: Text(article.title,
            style: context.resources.style.subTextStyle),
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(NewsDetailScreen.id, arguments: article);
        },
      ),
    );
  }

  Widget _bottomLoaderView() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(color: Colors.red),
      ),
    );
  }
}
