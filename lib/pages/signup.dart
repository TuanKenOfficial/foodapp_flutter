import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodappbasic/pages/bottomnav.dart';
import 'package:foodappbasic/pages/login.dart';
import 'package:foodappbasic/services/database.dart';
import 'package:foodappbasic/services/share_preference.dart';
import 'package:foodappbasic/widgets/widget_support.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          content: Text("Đăng ký thành công", style: TextStyle(fontSize: 20.0)),
        )));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
        String Id = randomAlphaNumeric(10);
        Map<String, dynamic> addUserInfo = {
          "Name": nameController.text,
          "Email": emailController.text,
          "Wallet": "0",
          "Id": Id,
        };
        await DatabaseMethods().addUserDetail(addUserInfo, Id);
        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveUserEmail(emailController.text);
        await SharedPreferenceHelper().saveUserWallet('0');
        await SharedPreferenceHelper().saveUserId(Id);

        // ignore: use_build_context_synchronously
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Mật khẩu bạn nhập quá yếu",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Tài khoản đã tồn tại",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0xFFff5c30),
                    Color(0xFFe74b1e),
                  ])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Text(""),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Đăng ký",
                                style: AppWidget.HeadlineTextFeildStyle(),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vui lòng nhập tên';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                    hintText: 'Tên',
                                    hintStyle:
                                        AppWidget.semiBoolTextFeildStyle(),
                                    prefixIcon: Icon(Icons.person_outline)),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'vui lòng nhập email';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle:
                                        AppWidget.semiBoolTextFeildStyle(),
                                    prefixIcon: Icon(Icons.email_outlined)),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vui lòng nhập mật khẩu';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Mật khẩu',
                                    hintStyle:
                                        AppWidget.semiBoolTextFeildStyle(),
                                    prefixIcon: Icon(Icons.password_outlined)),
                                cursorColor: Colors.yellow,
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                      password = passwordController.text;
                                      name = nameController.text;
                                    });
                                  }
                                  registration();
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Color(0xffff5722),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        "Đăng ký",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins1',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text(
                        "Bạn đã có tài khoản? Đăng nhập",
                        style: AppWidget.semiBoolTextFeildStyle(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
