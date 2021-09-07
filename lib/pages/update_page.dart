import 'package:flutter/material.dart';
import 'package:pattern_scoped_model/scopes/update_scoped.dart';
class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String title, body;
  UpdatePage({this.title, this.body, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateScoped scoped = UpdateScoped();


  @override
  void initState() {
    super.initState();

    scoped.titleTextEditingController.text = widget.title;
    scoped.bodyTextEditingController.text = widget.body;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // Title
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(5),

                          child: Center(
                            child: TextField(maxLines: 2,
                              controller: scoped.titleTextEditingController,
                              style: TextStyle(fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Title',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),




                        // Body
                        Container(
                          height: 500,
                          padding: EdgeInsets.all(5),

                          child: TextField(
                            controller: scoped.bodyTextEditingController,
                            style: TextStyle(fontSize: 20),
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



      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          scoped.apiPostUpdate(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
