class CategoryModel {
  final String id;
  final String titleAr;
  final String titleEn;
  final String imageUrl;

  CategoryModel({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      titleAr: json['titleAr'],
      titleEn: json['titleEn'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleAr': titleAr,
      'titleEn': titleEn,
      'imageUrl': imageUrl,
    };
  }
}

class LocalCategoryData {
  static final List<CategoryModel> categoryList = [
    CategoryModel(
        id: '1',
        titleAr: ' اثرية و تاريخيه ',
        titleEn: 'Historical & Archaeological',
        imageUrl: 'assets/images/phyramids.jpg'),
    CategoryModel(
        id: '2',
        titleAr: ' اللعب و المغامرات ',
        titleEn: 'Play & Adventures',
        imageUrl: 'assets/images/play.jpeg'),
    CategoryModel(
        id: '3',
        titleAr: 'اماكن عامة',
        titleEn: 'Public Places',
        imageUrl: 'assets/images/public.jpg'),
    CategoryModel(
        id: '4',
        titleAr: 'مطاعم و كافيهات ',
        titleEn: 'Restaurant & Cafe',
        imageUrl: 'assets/images/restrant.jpg'),
    CategoryModel(
        id: '5',
        titleEn: 'Malls',
        titleAr: 'مولات',
        imageUrl: 'assets/images/mall.jpg'),
  ];
}
