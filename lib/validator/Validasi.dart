import 'package:flutter/cupertino.dart';
import 'package:note/database/Services.dart';
import 'package:toast/toast.dart';

class Validasi {
  Services services = new Services();

  Future<void> validasi_register(BuildContext context, String nama,
      String email, String telp, String password, String jk) {
    if (nama.isEmpty) {
      Toast.show("Nama belum diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (!email.contains("@")) {
      Toast.show("Email tidak valid", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (telp.isEmpty) {
      Toast.show("No telp harus diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (telp.length > 13) {
      Toast.show("No telp tidak boleh lebih dari 13 karakter", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (password.length < 4 || password.length > 15) {
      Toast.show("Minimal password 4 karakter dan Maximal password 15 karakter",
          context,
          duration: 5, gravity: Toast.BOTTOM);
    } else {
      services.register(context, nama, email, telp, password, jk);
    }


  }

  Future<void> validasi_login(
      BuildContext context, String email, String password) {
    if (!email.contains("@")) {
      Toast.show("Email tidak valid", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (password.length < 4 || password.length > 15) {
      Toast.show(
          "Minimal password 4 karakter dan Maximal password 15 karakter",
          context,
          duration: 5,
          gravity: Toast.BOTTOM);
    } else {
      services.login(context, email, password);

    }
  }
  Future<void> validasi_addDataNote(
      BuildContext context, String judul, String isi,String id) {
    if (judul.isEmpty) {
      Toast.show("Judul note tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (isi.isEmpty) {
      Toast.show(
          "Note belum diisi",
          context,
          duration: 5,
          gravity: Toast.BOTTOM);
    } else if (id.isEmpty){
      Toast.show("User tidak ditemukan", context,
          duration: 5, gravity: Toast.BOTTOM);

    }else {
      services.addData(context, judul, isi, id);

    }
  }
}
