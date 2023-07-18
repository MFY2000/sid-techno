import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sid_techno/Components/Tab1.dart';
import 'package:sid_techno/Components/TextInput.dart';
import 'package:get/get.dart';
import 'package:sid_techno/Components/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(112, 19, 20, 41),
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * .05, horizontal: Get.width * .05),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                      height: Get.height * .7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: const [
                                Text(
                                  "Hey",
                                  style: TextStyle(
                                      color: Color.fromARGB(208, 235, 110, 42),
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " Ali",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.play_arrow, size: 30),
                            backgroundColor: Color.fromARGB(208, 235, 110, 42),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Find",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  208, 235, 110, 42),
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "your Workout",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.sort,
                                        color: Colors.white, size: 26)
                                  ],
                                ),
                              ),
                              TextField(
                                onChanged: search,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  hintText: "SEARCH WORKOUT",
                                  suffixIcon:
                                      Icon(Icons.search, color: Colors.white),
                                  // fillColor: Color.fromARGB(142, 35, 36, 66),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * .02,
                          horizontal: Get.width * .05),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: Get.width * .05),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromARGB(208, 235, 110, 42)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("Popular",
                                  style: TextStyle(color: Colors.white))),
                          SizedBox(width: 10),
                          Container(
                              child: Text("Hardwork out",
                                  style: TextStyle(color: Colors.white))),
                        ],
                      )),
                  Container(
                    child: Tab1Screen(),
                  ),
                ]),
              ),
            )));
  }

  search(value) {
    setState(() {
      display = listProduct
          .where((element) => element["title"].contains(value))
          .toList();
    });
  }
}
