

import 'package:flutter/material.dart';
import 'package:pattern_scoped_model/scopes/create_scoped.dart';
import 'package:pattern_scoped_model/scopes/home_scoped.dart';
import 'package:scoped_model/scoped_model.dart';




class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateScoped scoped = CreateScoped();


  @override
  Widget build( context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body:ScopedModel<HomeScoped>(

        child:  ScopedModelDescendant<CreateScoped>(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Title
                    Container(
                      height: 50,

                      child: Center(
                        child: TextField(
                          controller: scoped.titleTextEditingController,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // Body
                    Container(
                      height: 200,
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        controller: scoped.bodyTextEditingController,
                        style: TextStyle(fontSize: 18),
                        maxLines: 10,
                        decoration: InputDecoration(
                          labelText: 'Body',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              scoped.isLoading
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          scoped.apiPostCreate(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
