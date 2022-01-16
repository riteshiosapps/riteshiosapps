import 'package:datapersistence/model/course.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  Course course;
  CourseDetails(this.course);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    List<String> result = widget.course.content.split(',');
    final titles = ["List 1", "List 2", "List 3"];
    var body1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        elevation: 0.0,
        title: Text('English To Marathi Dictionary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(widget.course.name),
            Expanded(
              child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return Card(
                    //shape: StadiumBorder(),
                    child: ListTile(
                      title: Text(result[index]),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        )
        /*Column(children: [
          Text(
            widget.course.name,
          ),
          /*ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                //shape: StadiumBorder(),
                child: ListTile(
                  title: Text(titles[index]),
                  onTap: () {},
                ),
              );
            },
          )*/
          /*Text(
              result[0],
              style: Theme.of(context).textTheme.bodyText2,
            ),*/
        ])*/
        ,
      ),
    );
  }
}
