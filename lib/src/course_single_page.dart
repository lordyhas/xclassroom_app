

import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CourseScreen();
  }
}

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Column(),
            Card(
              child: Wrap(
                children: [

                ],
              ),
            ),
            Column(),
          ],
        ),
      ),
    );
  }
}

