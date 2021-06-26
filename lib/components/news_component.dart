import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:postnews/constants/app_colors.dart';
import 'package:postnews/helpers/date_time_helper.dart';
import 'package:postnews/helpers/image_url_helper.dart';
import 'package:postnews/helpers/share_preference.dart';
import 'package:postnews/helpers/share_preference_key.dart';
import 'package:postnews/models/news/news.dart';

class NewsComponent extends StatelessWidget {
   final News news;
  const NewsComponent({Key key,this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = AppSharePreference.getString(SharePreferenceKey.kLanguage);
    return  Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: imageUrlHelper(context,'${news.images}'),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Container(
              height: 90.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${language == 'en' ? news.titleEn:news.titleKh}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.blackColor(),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${language == 'en' ? news.descriptionEn:news.descriptionKh}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.2,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(DateTimeHelper.formatToDBFormat('${news.createdAt}'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
