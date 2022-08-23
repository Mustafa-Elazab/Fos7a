class GovermentModel {
  final String id;
  final String governorateNameAr;
  final String governorateNameEn;

  GovermentModel(
      {required this.id,
      required this.governorateNameAr,
      required this.governorateNameEn});

  factory GovermentModel.fromJson(Map<String, dynamic> json) {
    return GovermentModel(
        id: json['id'],
        governorateNameAr: json['governorateNameAr'],
        governorateNameEn: json['governorateNameEn']);
  }
  static List<GovermentModel> fromJsonList(List list) {
    return list.map((item) => GovermentModel.fromJson(item)).toList();
  }

  bool govFilterByName(String filter) {
    return governorateNameEn.toString().contains(filter);
  }

  String govAsString() {
    ///return '${this.id} ${' - '} ${this.governorateNameEn}';
    return governorateNameEn;
  }

  bool isEqual(GovermentModel model) {
    return id == model.id;
  }

  @override
  String toString() => governorateNameEn;
}

class GovermentLocalData {
  static List<GovermentModel> govermentList = [
    GovermentModel(
        id: "1", governorateNameAr: "القاهرة", governorateNameEn: "Cairo"),
    GovermentModel(
        id: "2", governorateNameAr: "الجيزة", governorateNameEn: "Giza"),
    GovermentModel(
        id: "3",
        governorateNameAr: "الأسكندرية",
        governorateNameEn: "Alexandria"),
    GovermentModel(
        id: "4", governorateNameAr: "الدقهلية", governorateNameEn: "Dakahlia"),
    GovermentModel(
        id: "5",
        governorateNameAr: "البحر الأحمر",
        governorateNameEn: "Red Sea"),
    GovermentModel(
        id: "6", governorateNameAr: "البحيرة", governorateNameEn: "Beheira"),
    GovermentModel(
        id: "7", governorateNameAr: "الفيوم", governorateNameEn: "Fayoum"),
    GovermentModel(
        id: "8", governorateNameAr: "الغربية", governorateNameEn: "Gharbiya"),
    GovermentModel(
        id: "9",
        governorateNameAr: "الإسماعلية",
        governorateNameEn: "Ismailia"),
    GovermentModel(
        id: "10", governorateNameAr: "المنوفية", governorateNameEn: "Menofia"),
    GovermentModel(
        id: "11", governorateNameAr: "المنيا", governorateNameEn: "Minya"),
    GovermentModel(
        id: "12",
        governorateNameAr: "القليوبية",
        governorateNameEn: "Qaliubiya"),
    GovermentModel(
        id: "13",
        governorateNameAr: "الوادي الجديد",
        governorateNameEn: "New Valley"),
    GovermentModel(
        id: "14", governorateNameAr: "السويس", governorateNameEn: "Suez"),
    GovermentModel(
        id: "15", governorateNameAr: "اسوان", governorateNameEn: "Aswan"),
    GovermentModel(
        id: "16", governorateNameAr: "اسيوط", governorateNameEn: "Assiut"),
    GovermentModel(
        id: "17",
        governorateNameAr: "بني سويف",
        governorateNameEn: "Beni Suef"),
    GovermentModel(
        id: "18", governorateNameAr: "بورسعيد", governorateNameEn: "Port Said"),
    GovermentModel(
        id: "19", governorateNameAr: "دمياط", governorateNameEn: "Damietta"),
    GovermentModel(
        id: "20", governorateNameAr: "الشرقية", governorateNameEn: "Sharkia"),
    GovermentModel(
        id: "21",
        governorateNameAr: "جنوب سيناء",
        governorateNameEn: "South Sinai"),
    GovermentModel(
        id: "22",
        governorateNameAr: "كفر الشيخ",
        governorateNameEn: "Kafr Al sheikh"),
    GovermentModel(
        id: "23", governorateNameAr: "مطروح", governorateNameEn: "Matrouh"),
    GovermentModel(
        id: "24", governorateNameAr: "الأقصر", governorateNameEn: "Luxor"),
    GovermentModel(
        id: "25", governorateNameAr: "قنا", governorateNameEn: "Qena"),
    GovermentModel(
        id: "26",
        governorateNameAr: "شمال سيناء",
        governorateNameEn: "North Sinai"),
    GovermentModel(
        id: "27", governorateNameAr: "سوهاج", governorateNameEn: "Sohag")
  ];
}
