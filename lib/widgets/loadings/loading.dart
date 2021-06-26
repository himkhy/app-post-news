/*
| ----------------------------------------------------------------------
| Add More Action Button / Menu
| ----------------------------------------------------------------------
|
|
|
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postnews/constants/app_colors.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      return Container(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryBlue),
                    strokeWidth: 2.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    'loading',

                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      decoration: TextDecoration.none,
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

