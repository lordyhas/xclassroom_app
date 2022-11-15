class CourseCategory {
  CourseCategory({
    this.title = '',
    this.shortTitle,
    this.imagePath = '',
    this.lessonCredit = 0,
    this.hours = 0,
    this.rating = 0.0,
    dynamic teacher,
  });
  String title;
  String? shortTitle;
  int lessonCredit;
  int hours;
  double rating;
  String imagePath;


}
