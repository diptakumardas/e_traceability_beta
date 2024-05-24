import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network/network_manager.dart';
import '../network/request_model/request_model.dart';
import 'dash_board.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  final formKey = GlobalKey<FormState>();
  bool isLoading = false;







  void login(String username, password, context) {
    NetworkManager()
        .logIn(LoginRequest(email: username, password: password))
        .then((value) {
      if (value.encoded != null && value.encoded!.isError != null && value.encoded!.isError!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value.encoded!.error?.errMsg ?? 'An error occurred'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login complete!'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      }
    }).catchError((error) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${error.toString().split(':').last}'),
          duration: Duration(seconds: 3),
        ),
      );
    });


  }












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .3,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white38,
                child: const Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: [
                      Text(
                        "সাইন ইন করুন ",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "ওহে! ফিরে স্বাগতম , আপনি মিস করা হয়েছে ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * .7,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white38,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "খামারির আইডি",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        height: 55,
                        child: Form(
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "enter user name";
                              }
                            },
                            controller: userController,
                            decoration: InputDecoration(
                              hintText: "আপনার নাম লিখুন ",
                              fillColor: Colors.white30,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "পাসওয়ার্ড ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 55,
                        child: Form(
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "enter Password";
                              }
                            },
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "পাসওয়ার্ড",
                              fillColor: Colors.white30,
                              filled: true,
                              suffixIcon: const Icon(
                                Icons.remove_red_eye_outlined,
                                size: 30,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      CustomeButton(title: "প্রবেশ করুন ", onClicked: (){
                        if (formKey.currentState!.validate()) {
                          login(userController.text, passwordController.text,
                              context);
                        }





                       /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));*/
                      }),

                      const SizedBox(
                        height: 30,
                      ),

                      const Center(child: Text("নিবন্ধন করার জন্য অফিসার এর সাথে \n             যোগাযোগ করুন "))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
