import 'package:flutter/material.dart';
import 'package:postnews/components/tag_component.dart';
import 'package:postnews/models/tag/tag.dart';
import 'package:postnews/view_models/tag_viewmodel.dart';
import 'package:provider/provider.dart';

final appBar = AppBar(
  // backgroundColor: Color(0xFF2F2F2F),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(),
      Center(
        child: Image.asset(
          'assets/images/ic_logo.png',
          fit: BoxFit.fitHeight,
          width: 40,
          height: 40,
        ),
      ),
      Container(
        width: 30,
      )
    ],
  ),
  bottom : PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: Container(

        height: 60,

        child: Selector<TagViewModel, List<Tag>>(
            selector: (context, provider) => provider.oldTagList,
            builder: (context, tagList, _) {
              return tagList == null ? SizedBox.shrink() :ListView.separated(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                // physics: ScrollPhysics(),
                itemCount: tagList.length,
                padding: EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/tag_view',
                          ModalRoute.withName('/main_view',), arguments: {'id':tagList[index].id});

                    }
                    ,
                    child: TagComponent(
                      tag: tagList[index],
                    ),
                  );

                },
                separatorBuilder: (context, index) {
                  return SizedBox.shrink();
                },
              );
            }),
      ),
    ),
);