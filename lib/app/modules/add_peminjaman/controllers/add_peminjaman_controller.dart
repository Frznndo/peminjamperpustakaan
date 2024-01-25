import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class AddPeminjamanController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tanggalPinjamController = TextEditingController();
  final TextEditingController tanggalKembaliController = TextEditingController();
  //TODO: Implement AddPeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  post() async{
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //untuk ngeclose keyboard
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data:
            {
              "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
              "book_id": int.parse(Get.parameters['id'].toString()),
              "tanggal_pinjam": tanggalPinjamController.text.toString(),
              "tanggal_kembali": tanggalKembaliController.text.toString(),
            }
        );
        if (response.statusCode == 201) {
          Get.snackbar("Selamat", "Berhasil Meminjam", backgroundColor: Colors.green);
          Get.offAllNamed(Routes.BOOK);
        } else {
          Get.snackbar(
              "Sorry", "Add Peminjaman Gagal", backgroundColor: Colors.amberAccent);
        }
      }
      loading(false);
    }on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.amberAccent);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    }catch (e) {loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
