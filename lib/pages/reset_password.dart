import 'package:chatapp/constants.dart';
import 'package:chatapp/helper/show_snackbar.dart';
import 'package:chatapp/widgets/custom_buttom.dart';
import 'package:chatapp/widgets/custom_text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RestPassword extends StatefulWidget {
  RestPassword({Key? key}) : super(key: key);

  static String id = "restpassword";

  @override
  State<RestPassword> createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  String? email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late UserCredential userCredential;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter the email address you used to register an account with on this application.application",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  hintText: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Must be not empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButtom(
                  textButtom: "Submit",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await snedPaswword();
                        showSnackBar(context, "Chick your Email");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        }
                      } catch (e) {
                        showSnackBar(context, "therre was an error");
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> snedPaswword() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
  }
}
