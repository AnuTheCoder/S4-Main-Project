import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _namevalidate = false;
  bool _passwordvalidate = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///Body

      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                height: MediaQuery.of(context).size.height * 0.46,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                        ),
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.zero,
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextField(
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  controller: nameController,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    hintText: 'UserName',
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),

                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextField(
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  controller: passwordController,
                                  obscureText: true,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock_rounded,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.transparent,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orange),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                        onPressed: () {
                          setState(() {
                            nameController.text.isEmpty ? _namevalidate = true : _namevalidate = false;
                            passwordController.text.isEmpty ? _passwordvalidate = true : _passwordvalidate = false;
                          });
                          if(_namevalidate==true){
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text("Username can't be empty"),backgroundColor: Colors.red,));
                          }
                          else if(_passwordvalidate==true){
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text("Enter Password"),backgroundColor: Colors.red,));
                          }
                          else {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return HomePage();
                                }));
                          }
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.63,
                          child: const Center(
                            child: Text(
                              'LOG-IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         GestureDetector(
                           child: const Text('Does not have account?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                               ),
                        ),
                           onTap: (){

                           },
                         ),
                        TextButton(
                          child:  const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            //signup screen
                          },
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
    );
  }
}
