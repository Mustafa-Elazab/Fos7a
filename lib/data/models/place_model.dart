import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'place_model.g.dart';

@HiveType(typeId: 0)
class PlaceModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? address;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? openingTime;
  @HiveField(5)
  String? facebookLink;
  @HiveField(6)
  String? instagramLink;
  @HiveField(7)
  String? thumbnail;
  @HiveField(8)
  String? categoryId;
  @HiveField(9)
  String? govermentId;
  @HiveField(10)
  int? phone;
  @HiveField(11)
  int? whatsupNumber;
  @HiveField(12)
  List<String>? images;
  // String? thumbnail,
  //     title,
  //     address,
  //     description,
  //     openingTime,
  //     id,
  //     facebookLink,
  //     instagramLink,
  //     categoryId,
  //     categoryName,
  //     govermentId;
  // List<String>? images;
  // int? phone, whatsupNumber;

  PlaceModel({
    this.id,
    this.title,
    this.address,
    this.description,
    this.openingTime,
    this.facebookLink,
    this.instagramLink,
    this.thumbnail,
    this.categoryId,
    this.govermentId,
    this.phone,
    this.whatsupNumber,
    this.images,
  });

  PlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    description = json['description'];
    openingTime = json['openingTime'];
    facebookLink = json['facebookLink'];
    instagramLink = json['instagramLink'];
    thumbnail = json['thumbnail'];
    categoryId = json['categoryId'];
    govermentId = json['govermentId'];
    phone = json['phone'];
    whatsupNumber = json['whatsupNumber'];
    images = json['images'].cast<String>();
  }
  //  id = json['id'];
  //   thumbnail = json['thumbnail'];
  //   title = json['title'];
  //   address = json['address'];
  //   description = json['description'];
  //   images = json['images'];
  //   openingTime = json['openingTime'];
  //   facebookLink = json['facebookLink'];
  //   phone = json['phone'];
  //   whatsupNumber = json['whatsupNumber'];
  //   categoryId = json['categoryId'];
  //   govermentId = json['govermentId'];
  //   categoryName = json['profilePhoto'];
  //   instagramLink = json['instagramLink'];

}

class LocalPlaceData {
  static List<PlaceModel> placeList = [
    PlaceModel(
        id: '1',
        govermentId: '1',
        categoryId: '4',
        thumbnail: 'assets/images/a1.jpg',
        title: 'HR Restaurant',
        address: '٦٠ كورنيش النيل، الڤلل، بنها، القليوبية',
        description:
            'حقيقي القعدة قصاد النيل بتخليك مستمتع بكل لحظة، و احلى حاجة في مطعم (( HR Restaurant )) إن و الڤيو كله على النيل 🌅 و في كمان كيدز اريا',
        openingTime: '',
        instagramLink: '',
        whatsupNumber: 01017170000,
        phone: 01017170000,
        facebookLink: '',
        images: [
          'assets/images/a.jpg',
          'assets/images/a1.jpg',
          'assets/images/a2.jpg',
          'assets/images/a3.jpg',
        ]),
    PlaceModel(
        id: '2',
        govermentId: '3',
        categoryId: '4',
        thumbnail: 'assets/images/b.jpg',
        title: 'المرسى للمأكولات البحرية ',
        address:
            '157شارع خالد ابن الوليد بعد فندق هيلتون الكورنيش سيدى بشر - اسكندرية  ',
        description:
            'بص من الاخر كدة بدل ما تضيع السفرية بتلف و تدور كتير على مطعم أسماك كويس .. هو المرسى مضمون و دايما محافظ على مستواه من ساعة ما فتح لحد دلوقتي ',
        openingTime: '',
        instagramLink: '',
        whatsupNumber: 0,
        phone: 035406087,
        facebookLink: '',
        images: [
          'assets/images/b.jpg',
          'assets/images/b1.jpg',
          'assets/images/b2.jpg',
          'assets/images/b3.jpg',
        ]),
    PlaceModel(
        id: '3',
        govermentId: '1',
        categoryId: '1',
        thumbnail: 'assets/images/c.jpg',
        title: 'The Guard Hotel ',
        address: 'شارع الصاعقة، فندق ذا جارد The Guard ، شيراتون',
        description:
            'اخطف يوم تفصل فيه و تقضي يوم كامل على حمام السباحة 🏊‍♀️ و مش هتسافر .. الفندق في القاهرة 😍',
        openingTime: '',
        instagramLink: '',
        whatsupNumber: 0,
        phone: 01013000642,
        facebookLink: '',
        images: [
          'assets/images/c.jpg',
          'assets/images/c1.jpg',
          'assets/images/c2.jpg',
        ]),
    PlaceModel(
        id: '4',
        thumbnail: 'assets/images/onBoardImage1.jpg',
        title: 'Jonn Deep',
        govermentId: '1',
        categoryId: '2',
        address: '3 Day ago',
        openingTime: '',
        instagramLink: '',
        whatsupNumber: 0,
        phone: 0,
        facebookLink: '',
        description: 'love it i had fun ,love it i had fun,love it i had fun',
        images: [
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
        ]),
    PlaceModel(
        id: '5',
        thumbnail: 'assets/images/onBoardImage1.jpg',
        title: 'Jonn Deep',
        openingTime: '',
        instagramLink: '',
        govermentId: '1',
        categoryId: '3',
        whatsupNumber: 0,
        phone: 0,
        facebookLink: '',
        address: '5 Day ago',
        description: 'love it i had fun ,love it i had fun,love it i had fun',
        images: [
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
        ]),
    PlaceModel(
        id: '6',
        instagramLink: '',
        whatsupNumber: 0,
        phone: 0,
        govermentId: '2',
        categoryId: '4',
        facebookLink: '',
        thumbnail: 'assets/images/onBoardImage2.jpg',
        title: 'Jonn Deep',
        openingTime: '',
        address: '9 Day ago',
        description: 'love it i had fun ,love it i had fun,love it i had fun',
        images: [
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
        ]),
    PlaceModel(
        id: '7',
        thumbnail: 'assets/images/onBoardImage2.jpg',
        title: 'Jonn Deep',
        instagramLink: '',
        govermentId: '2',
        categoryId: '1',
        whatsupNumber: 0,
        phone: 0,
        facebookLink: '',
        address: '10 Day ago',
        openingTime: '',
        description: 'love it i had fun ,love it i had fun,love it i had fun',
        images: [
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
        ]),
    PlaceModel(
        id: '8',
        thumbnail: 'assets/images/onBoardImage2.jpg',
        title: 'Jonn Deep',
        instagramLink: '',
        govermentId: '2',
        categoryId: '1',
        whatsupNumber: 0,
        phone: 0,
        facebookLink: '',
        address: '10 Day ago',
        openingTime: '',
        description: 'love it i had fun ,love it i had fun,love it i had fun',
        images: [
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
        ]),
    PlaceModel(
        id: '9',
        thumbnail: 'assets/images/onBoardImage2.jpg',
        title: 'Jonn Deep',
        instagramLink: '',
        govermentId: '2',
        categoryId: '1',
        whatsupNumber: 0,
        phone: 0,
        facebookLink: '',
        address: '10 Day ago',
        openingTime: '',
        description: 'love it i had fun ,love it i had fun,love it i had fun',
        images: [
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
        ]),
    PlaceModel(
        id: '10',
        thumbnail: 'assets/images/onBoardImage2.jpg',
        title: 'Jonn Deep',
        instagramLink: '',
        govermentId: '2',
        categoryId: '1',
        whatsupNumber: 0,
        phone: 0,
        facebookLink: '',
        address: '10 Day ago',
        openingTime: '',
        description: 'love it i had fun ,love it i had fun,love it i had fun',
        images: [
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
          'assets/images/onBoardImage1.jpg',
        ]),
  ];
}
