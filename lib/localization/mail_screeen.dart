import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MailScreeen extends StatelessWidget {
  const MailScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Language".tr,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hey... Developers".tr,textScaleFactor: 2,style: TextStyle(fontWeight: FontWeight.w500),),
          const SizedBox(height: 5,),
          Text('Welcome to Dotpitch Technology'.tr,textScaleFactor: 1.5,),
          const SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                Get.updateLocale(Locale("en","US"));
              }, child: Text("English")),

              ElevatedButton(onPressed: () {
                Get.updateLocale(Locale("hi","IN"));
              }, child: Text("Hindi")),

              ElevatedButton(onPressed: () {
                Get.updateLocale(Locale("guj","IN"));
              }, child: Text("Gujarati"))
            ],
          )
        ],
      ),
    );
  }
}
