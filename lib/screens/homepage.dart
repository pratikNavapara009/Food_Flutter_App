import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../controllers/product_controller.dart';
import '../helpers/product_helper.dart';
import '../models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;

  ProductController productController = Get.put(ProductController());

  Future? getData;

  @override
  void initState() {
    getData = DBHelper.dbHelper.fetchAllRecode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.primaries[Random().nextInt((Colors.primaries.length))],
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomLeft,
      //     stops: [0.2, 0.4, 0.8],
      //     colors: [
      //       Color(0xff1a2a6c),
      //       Color(0xffb21f1f),
      //       Color(0xfffdbb2d),
      //     ],
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: const Text("Food App"),
          centerTitle: true,
          backgroundColor: Colors.primaries[Random().nextInt((Colors.primaries.length))],
          actions: [
            IconButton(
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                setState(() {});
              },
              icon: (Get.isDarkMode)
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode_outlined),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/CartPage");
              },
              icon: const Icon(Icons.shopping_cart_checkout_outlined),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.add_location_alt, color: Colors.green),
                  const SizedBox(width: 3),
                  Text(
                    "Surat,Gujarat",
                    style: TextStyle(color: Colors.grey, fontSize: w * 0.05),
                  ),
                  SizedBox(width: w * 0.09),
                ],
              ),
              SizedBox(height: h * 0.02),
              const Text("Hey, Pratik",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: h * 0.016),
              Text(
                "Find Your Food",
                style: TextStyle(
                  fontSize: w * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: h * 0.02),
              Container(
                height: h * 0.07,
                decoration: BoxDecoration(
                    color: Colors.primaries[Random().nextInt((Colors.primaries.length))],
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    SizedBox(width: w * 0.01),
                     Icon(Icons.search, color: Colors.primaries[Random().nextInt((Colors.primaries.length))],),
                    const Text(
                      " Search Food",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.02),
              FutureBuilder(
                future: getData,
                builder: (BuildContext context, AsyncSnapshot snapShot) {
                  if (snapShot.hasError) {
                    return Center(
                      child: Text(
                        "Error : ${snapShot.error}",
                      ),
                    );
                  } else if (snapShot.hasData) {
                    List<ProductDB> data = snapShot.data;

                    return Expanded(
                      child: GridView.builder(
                        itemCount: snapShot.data.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                          MediaQuery.of(context).size.width / 2,
                          mainAxisExtent: 300,
                        ),
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.all(5),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            elevation: 5,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: h * 0.6,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          const BorderRadius.vertical(
                                            top: Radius.circular(25),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              data[i].image!,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "RS: ${data[i].price}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black38,
                                            ),
                                          ),
                                          const Text(
                                            "20Min",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            data[i].name!,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          // const SizedBox(width: 18),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                "/CartPage",
                                                arguments: data[i],
                                              );
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration:  BoxDecoration(
                                                  color: Colors.primaries[Random().nextInt((Colors.primaries.length))],
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(25),
                                                  bottomRight:
                                                  Radius.circular(25),
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}