import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  saveDataPref(int value,String dIdUser, Namauser, Emailuser, Telpuser,JkUser) async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();

      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("id", dIdUser);
      sharedPreferences.setString("nama", Namauser);
      sharedPreferences.setString("email", Emailuser);
      sharedPreferences.setString("telp", Telpuser);
      sharedPreferences.setString("jk", JkUser);


  }
}
