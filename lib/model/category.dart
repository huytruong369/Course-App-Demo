class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

var huy1 = Category(categoriesData[0]['name'].toString(), 22, '');

List<Category> categories = categoriesData
    .map(
      (item) => Category(
        item['name'].toString(),
        int.parse(
          item['courses'].toString(),
        ),
        item['image'].toString(),
      ),
    )
    .toList();

var categoriesData = [
  {"name": "Marketing", 'courses': 17, 'image': "assets/images/marketing.png"},
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/ux_design.png"},
  {
    "name": "Photography",
    'courses': 13,
    'image': "assets/images/photography.png"
  },
  {"name": "Business", 'courses': 17, 'image': "assets/images/business.png"},
];
