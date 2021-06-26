import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:postnews/config/app_config.dart';
import 'package:postnews/config/app_config_wrapper.dart';
import 'package:postnews/constants/app_fonts.dart';
import 'package:postnews/helpers/date_time_helper.dart';
import 'package:postnews/helpers/image_url_helper.dart';
import 'package:postnews/helpers/listener_state_helper.dart';
import 'package:postnews/helpers/share_preference.dart';
import 'package:postnews/helpers/share_preference_key.dart';

import 'package:postnews/models/news_detail/news_detail.dart';

import 'package:postnews/view_models/news_detail_viewmodel.dart';

import 'package:postnews/widgets/appbar/appBar.dart';
import 'package:postnews/widgets/appbar/drawer.dart';
import 'package:postnews/widgets/loadings/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class NewsDetailView extends StatefulWidget {
  @override
  _NewsDetailViewState createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {

  int id;
  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final Map<String, dynamic> args =
          ModalRoute.of(context).settings.arguments;
      id = args['id'];
      print('objectId $id');
      Provider.of<NewsDetailViewModel>(context, listen: false).getNewsDetail(id);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var language = AppSharePreference.getString(SharePreferenceKey.kLanguage);
    return Stack(
      children: [
        Scaffold(
          appBar: appBar,
          drawer: drawer,

          body: SingleChildScrollView(

            child: Container(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: RefreshIndicator(
                child: Selector<NewsDetailViewModel, NewsDetail>(
                    selector: (context, provider) => provider.oldNewsDetail,
                    builder: (_, value, __) {

                      return value == null ? SizedBox.shrink():
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: imageUrlHelper(context,'${value.images}'),
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                width: MediaQuery.of(context).size.width,

                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                padding:EdgeInsets.only(top:15,bottom: 20),
                                child: Text(
                                  DateTimeHelper.formatToDBFormat('${value.createdAt}'),
                                  style: AppFonts.h3(),
                              ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                child: Text('${language == 'en' ?value.titleEn:value.titleKh}',
                                style: AppFonts.h2(),),

                              ),

                              HtmlWidget(
                               '${language == 'en' ? value.articleEn: value.articleKh}',
                                textStyle: TextStyle(fontSize: 14),
                              ),
                            ],
                          );
                    }),
                onRefresh: () async {
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                   Provider.of<NewsDetailViewModel>(context, listen: false).getNewsDetail(id);
                  });
                },
              ),
            ),
          ),


        ),
        _loadingView(),
      ],
    );
  }
  _loadingView() {
    return Selector<NewsDetailViewModel, ListenerStateHelper>(
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
