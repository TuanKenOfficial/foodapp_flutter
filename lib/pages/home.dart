import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodappbasic/pages/details.dart';
import 'package:foodappbasic/widgets/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello, Đây là app food",
                    style: AppWidget.boldTextFeildStyle()),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Thức ăn ngon",
              style: AppWidget.HeadlineTextFeildStyle(),
            ),
            Text(
              "Khám phá và nhận những món ăn tuyệt vời",
              style: AppWidget.LightTextFeildStyle(),
            ),
            SizedBox(
              height: 20.0,
            ),
            showItem(), //hiện tất cả widget các món ăn bên dưới
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                    "images/salad2.jpg",
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  "Salad/Rau trộn",
                                  style: AppWidget.semiBoolTextFeildStyle(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Ngon, tuyệt vời",
                                  style: AppWidget.LightTextFeildStyle(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "\$25",
                                  style: AppWidget.semiBoolTextFeildStyle(),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                    "images/salad3.jpg",
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  "Salad/Rau trộn",
                                  style: AppWidget.semiBoolTextFeildStyle(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Ngon, tuyệt vời, bổ dưỡng",
                                  style: AppWidget.LightTextFeildStyle(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "\$29",
                                  style: AppWidget.semiBoolTextFeildStyle(),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.all(2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/salad2.jpg",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Salad đậu xanh Sóc Trăng",
                                style: AppWidget.semiBoolTextFeildStyle(),
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Món ngon và bổ rẻ",
                                style: AppWidget.LightTextFeildStyle(),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "\$28",
                                style: AppWidget.semiBoolTextFeildStyle(),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // hiện 4 món ăn chủ yếu
  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: icecream ? Colors.red : Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "images/ice-cream.jpg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: pizza ? Colors.red : Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "images/pizza.jpg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: salad ? Colors.red : Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "images/salad.jpg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: burger ? Colors.red : Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "images/burger.jpg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
