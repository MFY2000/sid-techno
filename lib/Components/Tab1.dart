import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sid_techno/Components/constant.dart';
import "package:get/get.dart";
import 'package:http/http.dart' as http;

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  loadData() async {
    var url = Uri.parse('https://dummyjson.com/products');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // Request successful, parse the response
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;
        print(data["products"]);
        // var listProduct = [];
        for (var i = 0; i < data["products"].length; i++) {
          listProduct.add(data["products"][i]);
        }
        // listProduct = data.map(e => Product.fromJson(e)).toList();
        setState(() {
          display = listProduct;
        });
        // Process the data as needed
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred while making the request
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
              children: courses.keys
                  .map((e) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * .01),
                            height: Get.height * .3,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: courses[e].length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: Get.width * .3,
                                        height: Get.height * .2,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: Get.width * .005),
                                        child: Image.asset(
                                            "assets/" + courses[e][index][0]),
                                      ),
                                      Text(
                                        courses[e][index][1],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  );
                                }),
                          )
                        ],
                      ))
                  .toList()),
        ),
        SizedBox(
          height: Get.height * .02,
        ),
        Text(
          "Popular Courses",
          style: TextStyle(color: Colors.white, fontSize: 30),
          textAlign: TextAlign.left,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: display.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            child: Column(children: [
              Container(
                  width: Get.width * .9,
                  height: Get.height * .2,
                  padding: EdgeInsets.all(5),
                  child: Image(
                    image: NetworkImage(display[index]["images"][0]),
                    fit: BoxFit.cover,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    display[index]["title"],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    display[index]["rating"].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )
            ]),
          ),
        )
      ],
    );
  }
}
