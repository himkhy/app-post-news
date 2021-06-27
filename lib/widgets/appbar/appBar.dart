import 'package:flutter/material.dart';
import 'package:postnews/components/tag_component.dart';
import 'package:postnews/models/tag/tag.dart';
import 'package:postnews/view_models/tag_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
var colorController = BehaviorSubject<String>();
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
                      colorController
                          .add('${tagList[index].id}');

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/tag_view',
                          ModalRoute.withName('/main_view',), arguments: {'id':tagList[index].id});
                    },
                    child: StreamBuilder(
                      stream: colorController.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasError &&
                            snapshot.data != null) {
                          if (snapshot.data == '${tagList[index].id}') {
                            return Container(
                              padding:
                              EdgeInsets.only(top: 10, left: 26, right: 26.0),
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                              ),
                              child: TagComponent(
                                tag: tagList[index],
                              ),
                            );
                          }
                        }
                        return Container(
                          padding: EdgeInsets.only(top: 10, left: 26, right: 26.0),
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: TagComponent(
                            tag: tagList[index],
                          ),
                        );
                      },
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