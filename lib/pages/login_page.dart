import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/pages/register_page.dart';
import 'package:tareeq/pages/services_page.dart';
import 'package:tareeq/widgets/custom_button.dart';
import 'package:tareeq/widgets/custom_text_field.dart';
import 'package:tareeq/widgets/media_connect.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? phone;

  String? password;

  bool isLoading= false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xfffffefd), Color(0xfffff3d0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Center(
                child: Column(
              children: [
                Column(children: [
                  SizedBox(height: 90),
                  Text(
                    "3 alTareeQ",
                    style: TextStyle(
                        fontFamily: kFont,
                        color: kprimaryColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("for car services",
                      style: TextStyle(
                          fontFamily: kFont, color: kprimaryColor, fontSize: 20)),
                  SizedBox(height: 35),
                ]),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("  User email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff675c3d))),
                      CustomTextField(
                        onChanged: (data) {
                          phone = data;
                        },
                        hintText: "Enter your Email",
                      ),
                      const SizedBox(height: 50),
                      Text(
                        "  Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff675c3d))),
                      CustomTextField(
                        obscureText: true,
                        onChanged: (data) {
                           
                          password = data;
                        },
                        hintText: "Enter Password",
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: kprimaryColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              isLoading=true;
                              setState(() {
                                
                              });
                              try {
                                UserCredential user = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: phone!, password: password!);
                                Navigator.pushNamed(context, ServicesPage.id,
                                    arguments: phone);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('weak password')));
                                } else if (e.code == 'Wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Wrong password')));
                                }
                              } catch (e) {
                                print(e);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('there was an error')));
                              } isLoading=false;
                              setState(() {
                                
                              });
                            } else {}
                          },
                          text: "Login",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "or continue with",
                      style: TextStyle(color: Color(0xff675c3d)),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MediaConnect(image: "assets/images/google_icon.png"),
                          MediaConnect(image: "assets/images/apple_icon.png"),
                          MediaConnect(image: "assets/images/facebook_icon.png")
                        ],
                      ),
                    ),
                    SizedBox(height: 27),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an accout?",
                          style: TextStyle(color: kprimaryColor),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                            },
                            child: Text(" Register now"))
                      ],
                    )
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
