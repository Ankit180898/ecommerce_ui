import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gemini/model_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final controller=Get.put(ModelController());
   var rating=0.0.obs;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      drawer: Drawer(

      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Couch',
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.deepOrangeAccent,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: 350,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: WebViewWidget(controller: controller.controller,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(

                  'Couch',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24,),
                ),
                Text("\$100",style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent, fontSize: 24,),)
              ],
            ),
            Row(
            children: [
              RatingBar.builder(
                itemSize: 20,
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 1,
                itemPadding: EdgeInsets.only(right: 5),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                ),
                onRatingUpdate: (ratings) {
                  rating.value=ratings;
                },
              ),
              Text("4.5",style: TextStyle(
                fontSize: 16,
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
            const SizedBox(height: 20,),
            Text("Product details",style:TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 16,),),
            const SizedBox(height: 10,),
            const Expanded(
              child: Text(
                '''
Outer Material: Molfino Fabric and Solid Wood || Inner Material: Foam 42 Density and Wood
Sofa Size(Inches) LxBxH:- 70 x 27 x 30 Inch || Weight(Kg) approx.: Sofa : 40
WARRANTY:- 2 Month Warranty Against Manufacturing Defect.''',
                style: TextStyle(color: Colors.grey,fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.deepOrangeAccent),
          child: const Center(
              child: Text(
                'Buy now',
                style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}