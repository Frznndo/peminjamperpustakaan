import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.namaController,
                    decoration: InputDecoration(hintText: "Masukkan Nama Lengkap"),
                    validator: (value){
                      if (value!.isEmpty) { //minimal username
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    }
                ),
                TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(hintText: "Masukkan Username"),
                    validator: (value){
                      if (value!.length<2) { //minimal huruf password
                        return "Username tidak boleh kosong";
                      }
                      return null;
                    }
                ),
                TextFormField(
                    controller: controller.notelpController,
                    decoration: InputDecoration(hintText: "Masukkan Nomor Telepon"),
                    validator: (value){
                      if (value!.isEmpty) { //minimal huruf password
                        return "Nomor Telepon tidak boleh kosong";
                      }
                      return null;
                    }
                ),
                TextFormField(
                    controller: controller.alamatController,
                    decoration: InputDecoration(hintText: "Masukkan Alamat"),
                    validator: (value){
                      if (value!.isEmpty) { //minimal huruf password
                        return "Alamat tidak boleh kosong";
                      }
                      return null;
                    }
                ),
                TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(hintText: "Masukkan Password"),
                    validator: (value){
                      if (value!.isEmpty) { //minimal huruf password
                        return "Password tidak boleh kosong";
                      }
                      return null;
                    }
                ),
                Obx(() => controller.loading.value?
                CircularProgressIndicator():
                ElevatedButton(onPressed: (){
                  controller.post();
                }, child: Text("REGISTER"))
                )
              ],
            ),
          )
      ),
    );
  }
}
