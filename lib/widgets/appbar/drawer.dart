import 'package:flutter/material.dart';
import 'package:postnews/components/category_component.dart';
import 'package:postnews/config/app_config.dart';
import 'package:postnews/config/app_config_wrapper.dart';
import 'package:postnews/constants/app_colors.dart';
import 'package:postnews/constants/app_fonts.dart';
import 'package:postnews/helpers/share_preference.dart';
import 'package:postnews/helpers/share_preference_key.dart';
import 'package:postnews/models/category/category.dart';
import 'package:postnews/view_models/category_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
var languageController = BehaviorSubject<String>();
var colorController = BehaviorSubject<String>();
final drawer = Drawer(

  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: Builder(builder: (BuildContext context) {

    var getLanguage =  AppSharePreference.getString(SharePreferenceKey.kLanguage);
    languageController.add('$getLanguage');
    AppConfig appConfig = AppConfigWrapper.of(context);
    return Center(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20,bottom: 20),
                    child: InkWell(
                      onTap: () async {
                        await AppSharePreference.setString(
                            SharePreferenceKey.kLanguage, 'en');
                        languageController.add('en');
                        AppConfigWrapper.changeLanguage(
                            context, languageController.value);
                      },
                      child: StreamBuilder(
                        stream: languageController.stream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasError && snapshot.data != null) {
                            if (snapshot.data == 'en') {
                              return Row(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7F7F7),
                                      borderRadius:
                                      BorderRadius.circular(50.0),
                                      border: Border.all(
                                        color: AppColors.redColor(),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:12.0),
                                    child: Text(appConfig.translate('en'),
                                      style: AppFonts.largeText(),
                                    ),
                                  ),
                                ],

                              );
                            }
                          }
                          return Row(
                            children: <Widget>[
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(50.0),
                                  border: Border.all(
                                    color: AppColors.grayColor(),
                                    width: 2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child: Text(appConfig.translate('en'),
                                  style: AppFonts.largeText(),
                                ),
                              ),
                            ],

                          );
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await AppSharePreference.setString(
                          SharePreferenceKey.kLanguage, 'kh');
                      languageController.add('kh');
                      AppConfigWrapper.changeLanguage(
                          context, languageController.value);

                    },
                    child: StreamBuilder(
                      stream: languageController.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasError && snapshot.data != null) {
                          if (snapshot.data == 'kh') {
                            return Row(
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF7F7F7),
                                    borderRadius:
                                    BorderRadius.circular(50.0),
                                    border: Border.all(
                                      color: AppColors.redColor(),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:12.0),
                                  child: Text(appConfig.translate('kh'),
                                    style: AppFonts.largeText(),
                                  ),
                                ),
                              ],

                            );
                          }
                        }
                        return Row(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(50.0),
                                border: Border.all(
                                  color: AppColors.grayColor(),
                                  width: 2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child: Text(appConfig.translate('kh'),
                                style: AppFonts.largeText(),
                              ),
                            ),
                          ],

                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
          Selector<CategoryViewModel, List<Category>>(
              selector: (context, provider) => provider.oldCategoryList,
              builder: (context, categoryList, _) {
                return categoryList == null
                    ? SizedBox.shrink()
                    : ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: categoryList.length,
                        padding: EdgeInsets.only(bottom: 20),
                        itemBuilder: (context, index) {

                          return InkWell(
                            onTap: () async {
                              colorController
                                  .add('${categoryList[index].id}');

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/news_view',
                                      ModalRoute.withName(
                                        '/main_view',
                                      ),
                                      arguments: {'id': categoryList[index].id});
                               },
                            child: StreamBuilder(
                              stream: colorController.stream,
                              builder: (context, snapshot) {
                                if (!snapshot.hasError &&
                                    snapshot.data != null) {
                                  if (snapshot.data == '${categoryList[index].id}') {
                                    return Container(
                                      padding:
                                      EdgeInsets.only(left: 20, right: 20),
                                      margin: EdgeInsets.only(top:5,left: 5.0, right: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                      child: CategoryComponent(
                                        category: categoryList[index],
                                      ),
                                    );
                                  }
                                }
                                return Container(
                                  padding: EdgeInsets.only( left: 20, right: 20.0),
                                  margin: EdgeInsets.only(top:5,left: 5.0, right: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: CategoryComponent(
                                    category: categoryList[index],
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
        ],
      ),
    );
  }),
);
