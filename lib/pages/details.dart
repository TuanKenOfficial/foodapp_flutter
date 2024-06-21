import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodappbasic/services/database.dart';
import 'package:foodappbasic/services/share_preference.dart';
import 'package:foodappbasic/widgets/widget_support.dart';

class Details extends StatefulWidget {
  String image, name, detail, price;
  Details(
      {required this.detail,
      required this.image,
      required this.name,
      required this.price});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1, total = 0;
  String? id;

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ontheload();
    total = int.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                )),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 100.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  widget.image,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: AppWidget.semiBoolTextFeildStyle(),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                      total = total - int.parse(widget.price);
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  a.toString(),
                  style: AppWidget.semiBoolTextFeildStyle(),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    ++a;
                    total = total + int.parse(widget.price);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              widget.detail,
              style: AppWidget.LightTextFeildStyle(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  "Thời gian giao hàng",
                  style: AppWidget.semiBoolTextFeildStyle(),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.alarm,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "30 phút",
                  style: AppWidget.semiBoolTextFeildStyle(),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Text(
                      "Tổng giá",
                      style: AppWidget.boldTextFeildStyle(),
                    ),
                    Text(
                      "\$" + total.toString(),
                      style: AppWidget.HeadlineTextFeildStyle(),
                    ),
                  ]),
                  GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> addFoodtoCart = {
                        "Name": widget.name,
                        "Quantity": a.toString(),
                        "Total": total.toString(),
                        "Image": widget.image
                      };
                      await DatabaseMethods().addFoodToCart(addFoodtoCart, id!);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            "Thực phẩm được thêm vào giỏ hàng",
                            style: TextStyle(fontSize: 18.0),
                          )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Thêm vào giỏ hàng",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
