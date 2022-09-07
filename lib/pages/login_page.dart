// import 'package:catalogapp/pages/home_page.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  // method for aniamted container for buttone
  moveToHome(BuildContext context) async {
    //if condition check karse form validtor container nu validate karine
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeroute);

      setState(() {
        changebutton = false;
      });
    } //if end
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "welcome $name",
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "UserName",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "user name can not be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password cannot be empty";
                          } else if (value.length < 6) {
                            return "password should  be biger then 6";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),

                      // take a container for animation Container button
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius:
                            BorderRadius.circular(changebutton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 2),

                            width: changebutton ? 80 : 150,
                            height: 50,
                            alignment: Alignment.center,

                            child: changebutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                            // decoration: BoxDecoration(
                            //   color: Colors.deepPurple,
                            //   // shape: changebutton
                            //   //     ? BoxShape.circle
                            //   //     : BoxShape.rectangle,

                            // ),

                            // ElevatedButton(
                            //   child: Text("Login"),
                            //   style: TextButton.styleFrom(
                            //     minimumSize: Size(120.0, 50),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.pushNamed(context, myroutes.homeroute);
                            //     // routes.dart
                            //   },
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
