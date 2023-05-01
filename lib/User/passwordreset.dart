import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final height = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final width = MediaQuery.of(context).size.width;
    final font, size1, size2;
    if (width < 350) {
      font = width * 0.04;
    } else {
      font = height * 0.02;
    }
    if (!isKeyboard) {
      size1 = height * 0.08;
      size2 = height * 0.1;
    } else {
      size1 = height * 0.02;
      size2 = height * 0.06;
    }
    final econtroller = TextEditingController();
    void dispose() {
      econtroller.dispose();
      super.dispose();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: size2,
              ),
              Text('Reset Password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                      color: Color(0xff1c6758),
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.w700)),
              if (!isKeyboard)
                SizedBox(
                  height: height * 0.02,
                ),
              Text(
                'Enter your Email',
                style: GoogleFonts.urbanist(
                    color: Color.fromARGB(255, 8, 8, 8),
                    fontSize: height * 0.02),
              ),
              if (!isKeyboard)
                SizedBox(
                  height: 80,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Smaller TextField
                      SizedBox(
                        width: 30,
                        child: TextField(
                          style:
                              GoogleFonts.urbanist(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email_rounded),
                            enabled: false,
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1c6758))),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: econtroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                          cursorColor: Color.fromRGBO(28, 103, 88, 1),
                          style:
                              GoogleFonts.urbanist(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1c6758))),
                            hintStyle: GoogleFonts.urbanist(fontSize: font),
                            hintText: 'Email ID',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: height * 0.08,
                width: width * 0.8,
                child: ElevatedButton(
                  onPressed: () async {
                    /*if (formKey.currentState!.validate()) */ {
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: econtroller.text);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Recovery Email Successfully Sent'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Color(0xff1c6758),
                        ));
                      } catch (e) {
                        // Show error message or handle error
                      }
                    }

                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xff1c6758)),
                  ),
                  child: Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                /*style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color(0xff1c6758)),),
                            child: Text(
                              'Next',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.w600),
                            )
                            */
              ),
            ],
          ),
        ),
      ),
    );
    /* Future resetpassword() async{
    try{ await FirebaseAuth.instance.sendPasswordResetEmail(email: econtroller.text.trim());
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Recovery Email Successfully Sent'),
                        duration: Duration(seconds: 2),),) ;
    
    }
    catch(e){

    }}
      Navigator.of(context).pop();
    */

    return const Placeholder();
  }
}
