import 'package:flutter/material.dart';
import 'package:postnews/components/category_component.dart';
import 'package:postnews/components/news_component.dart';
import 'package:postnews/components/tag_component.dart';
import 'package:postnews/config/app_config.dart';
import 'package:postnews/config/app_config_wrapper.dart';
import 'package:postnews/helpers/listener_state_helper.dart';
import 'package:postnews/models/category/category.dart';
import 'package:postnews/models/news/news.dart';
import 'package:postnews/models/tag/tag.dart';
import 'package:postnews/view_models/category_viewmodel.dart';
import 'package:postnews/view_models/news_viewmodel.dart';
import 'package:postnews/view_models/tag_viewmodel.dart';
import 'package:postnews/widgets/appbar/appBar.dart';
import 'package:postnews/widgets/appbar/drawer.dart';
import 'package:postnews/widgets/loadings/loading.dart';
import 'package:provider/provider.dart';
// FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//php artisan serve --host=192.168.43.176

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool hasMoreData = true;
  bool isLoadingMoreData = false;
  int _perPage = 15;
  int _page = 1;
  int id;


  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final Map<String, dynamic> args =
          ModalRoute.of(context).settings.arguments;
      id = args['id'];
      print('haveId $id');
      Provider.of<NewsViewModel>(context, listen: false).getCategoryArticle(id,_perPage, _page);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfigWrapper.of(context);
    return Stack(
      children: [
        Scaffold(
          appBar: appBar,
          drawer: drawer,
          body: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: RefreshIndicator(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (!hasMoreData) return false;

                  if (scrollInfo.metrics.maxScrollExtent <=
                      scrollInfo.metrics.pixels + 50) {
                    if (isLoadingMoreData) return false;

                    isLoadingMoreData = true;
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      Provider.of<NewsViewModel>(context, listen: false)
                          .getCategoryArticle(id,_perPage, ++_page);
                    });
                  }

                  return false;
                },
                child: Selector<NewsViewModel, List<News>>(
                    selector: (context, provider) => provider.oldNewsList,
                    builder: (context, newsList, _) {
                     isLoadingMoreData = false;
                      hasMoreData = Provider.of<NewsViewModel>(
                          context,
                          listen: false)
                          .hasMoreDataPush;
                      return newsList == null ? SizedBox.shrink(): ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: newsList.length,
                        padding: EdgeInsets.only(bottom: 20),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {

                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/news_detail_view',
                                  ModalRoute.withName('/main_view',), arguments: {'id':newsList[index].id});

                            },
                            child: NewsComponent(
                              news: newsList[index],
                            ),
                          );

                        },
                        separatorBuilder: (context, index) {
                          return SizedBox.shrink();
                        },
                      );
                    }),
              ),
              onRefresh: () async {
                setState(() {
                  _page = 1;
                });
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                 Provider.of<NewsViewModel>(context, listen: false).getCategoryArticle(id,_perPage, _page);
                });
              },
            ),
          ),


        ),
        _loadingView(),
      ],
    );
  }
  _loadingView() {
    return Selector<NewsViewModel, ListenerStateHelper>(
      selector: (context, viewModel) => viewModel.listenerStateHelper,
      builder: (_, value, __) {
        if (value == ListenerStateHelper.Loading) {
          return Loading();
        } else if (value == ListenerStateHelper.Loaded) {
          return SizedBox.shrink();
        } else if (value == ListenerStateHelper.Error) {
          return SizedBox.shrink();
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
