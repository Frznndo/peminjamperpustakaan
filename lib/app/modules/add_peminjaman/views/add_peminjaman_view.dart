import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child :TextFormField(
              controller: controller.tanggalPinjamController,
              decoration: InputDecoration(hintText: "Masukan Tanggal Pinjam "),
              validator: (value){
                if (value!.isEmpty) { //minimal username
                  return "Tanggal pinjam tidak boleh kosong";
                }
                return null;
              }
          ),
    ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child :TextFormField(
              controller: controller.tanggalKembaliController,
              decoration: InputDecoration(hintText: "Masukkan Tanggal Kembali"),
              validator: (value){
                if (value!.length <2) { //minimal huruf password
                  return "Tanggal kembali tidak boleh kosong";
                }
                return null;
              }

          ),
          ),
          Obx(() => controller.loading.value?
            CircularProgressIndicator():
              Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(onPressed: (){
              controller.post();
              }, child: Text("Pinjam"))
    ),
          )
          ],
          ),
        ),
      )
    );
  }
}
