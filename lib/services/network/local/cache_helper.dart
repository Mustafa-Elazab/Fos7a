class CacheHelper {
  // static late SharedPreferences sharedPreferences;
  // static var IMAGE_KEY = 'IMAGE_KEY';
  // static init() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }

  // static Future<bool> putData({
  //   required String key,
  //   required bool boolValue,
  // }) async {
  //   return await sharedPreferences.setBool(key, boolValue);
  // }

  // static dynamic getData({
  //   required String key,
  // }) {
  //   return sharedPreferences.get(key);
  // }

  // static Future<bool> saveData({
  //   required String key,
  //   required dynamic value,
  // }) async {
  //   if (value is String) return await sharedPreferences.setString(key, value);
  //   if (value is int) return await sharedPreferences.setInt(key, value);
  //   if (value is bool) return await sharedPreferences.setBool(key, value);
  //   return await sharedPreferences.setDouble(key, value);
  // }

  // static Future<bool> removeData({
  //   required String key,
  // }) async {
  //   return await sharedPreferences.remove(key);
  // }

  // static const String KEY = "IMAGE_KEY";

  // static Future<String?> getImageFromPreferences() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(KEY);
  // }

  // static Future<bool> saveImageToPreferences(String value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setString(KEY, value);
  // }

  // static Image imageFromBase64String(String base64String) {
  //   return Image.memory(
  //     base64Decode(base64String),
  //     fit: BoxFit.fill,
  //   );
  // }

  // static Uint8List dataFromBase64String(String base64String) {
  //   return base64Decode(base64String);
  // }

  // static String base64String(Uint8List data) {
  //   return base64Encode(data);
  // }
  // // static setUser(UserModel userModel) async {
  // //   await sharedPreferences.setString('user', json.encode(userModel.toJson()));
  // // }

  // // static getUser() async {
  // //   var value = sharedPreferences.getString('user');
  // //   return UserModel.fromJson(json.decode(value!));
  // // }

  // // Future<UserModel?> get getUserData async {
  // //   try {
  // //     UserModel userModel = await getUser();
  // //     if (userModel == null) {
  // //       return null;
  // //     }
  // //     return userModel;
  // //   } catch (e) {
  // //     print(e.toString());
  // //     return null;
  // //   }
  // // }
}
