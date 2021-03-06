import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:pattern_scoped_model/model/post_model.dart';
import 'package:pattern_scoped_model/scopes/home_scoped.dart';

Widget itemOfPost(HomeScoped homeScoped,Post post){
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20,right: 20, top:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 5,),
          Text(post.body)

        ],
      ),
    ),
    actions:<Widget> [
      IconSlideAction(
        caption: "Update",
        color: Colors.indigo,
        icon:Icons.edit,
        onTap: (){

        },
      )

    ],
    secondaryActions:<Widget> [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){
          homeScoped.apiPostDelete(post).then((value) => {
            if(value)homeScoped.apiPostList(),
          });
        },
      )

    ],
  );
}