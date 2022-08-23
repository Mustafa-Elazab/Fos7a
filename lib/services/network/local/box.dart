import 'package:fos7a/data/models/place_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<PlaceModel> getTasks() => Hive.box<PlaceModel>('favourite');
}
