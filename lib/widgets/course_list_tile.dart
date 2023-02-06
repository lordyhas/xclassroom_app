import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unhorizons/logic/models/course_category.dart';

class CourseListTile extends StatelessWidget {

  final CourseCategory category;
  final VoidCallback? onPressed;
  const CourseListTile({required this.category, Key? key, this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: ListTile(
          leading: Ink(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(50.0),
            ),
              child: const Icon(CupertinoIcons.book),
          ),
          title: SelectableText(category.title),
          subtitle: SelectableText("${category.lessonCredit} crédit",),
          trailing: SizedBox(
            child: Column(
              children: [
                const Icon(Icons.star_half),
                Text("${category.rating}"),
              ],
            ),
          ),
          onTap: (){
            onPressed!();
          },
        ),
      ),
    );
  }
}
