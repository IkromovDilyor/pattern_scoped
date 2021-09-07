import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pattern_scoped_model/scopes/home_scoped.dart';

import 'package:pattern_scoped_model/views/item_of_post.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  HomeScoped scoped = HomeScoped();
@override
@override
void initState() {
  super.initState();
  scoped.apiPostList();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: ScopedModel<HomeScoped>(
        model: scoped,
        child:ScopedModelDescendant<HomeScoped>(
          builder: (context, index, model)=>
              Stack(
                  children: [
                    ListView.builder(
                      itemCount: scoped.items.length,
                      itemBuilder: (ctx, index){
                        return itemOfPost(scoped,scoped.items[index]);
                      },

                    ),
                    scoped.isLoading  ?
                    Center(
                      child: CircularProgressIndicator(),
                    ):SizedBox.shrink(),
                  ],
                ),
              ),

        ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          //Navigator.pushNamed(context, CreatePage.id);

        },
        child: Icon(Icons.add),
      ),

    );
  }


}
