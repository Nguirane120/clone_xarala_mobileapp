import 'package:clonexaralalmobileapp/const.dart';
import 'package:clonexaralalmobileapp/widgets/chapterTab.dart';
import 'package:clonexaralalmobileapp/widgets/descritionTab.dart';
import 'package:flutter/material.dart';

import '../data/models/course.dart';

class MyCustomTab extends StatefulWidget {
  const MyCustomTab({super.key,required this.course});
  final Course course;

  @override
  State<MyCustomTab> createState() => _MyCustomTabState();
}

class _MyCustomTabState extends State<MyCustomTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    color: primaryColor,
                    // border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: "Contenu",
                    ),
                    Tab(
                      text: "Description",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [Chaptertab(course:widget.course), Descritiontab()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
