import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            //Row(
            //children: [
            // Text ('Find complete maps service',style:TextStyle(color: Color(0xff1c6758),fontSize: 50,),),
            //Text('A map is a symbolic representation of selected characteristics of a place,usually drawn on a flat surface ',style:TextStyle(fontSize: 15,),)
            //]

            // )
            Align(
      alignment: Alignment.center,
      child: SafeArea(
          child: Column(children: [
        //Align(
        Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Image.asset('images/image 6.png'),
                Text(
                  'Find complete maps service',
                  style: TextStyle(
                    color: Color(0xff1c6758),
                    fontSize: 50,
                  ),
                ),
                Text(
                  'A map is a symbolic representation of selected characteristics of a place,usually drawn on a flat surface',
                  style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontSize: 15,
                  ),
                )
              ],
            )),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 30),
            color: Color(0xff1c6758),
            width: double.infinity,
            /*child: Container(
            child: Column(
              children: [
               MaterialButton( height: 5, minWidth: 40, color: Color.fromARGB(255, 250, 252, 251),
                onPressed: () {})
              ],
            ),
          )*/
            child: Column(
              children: [
                SizedBox(
                    height: 57,
                    width: 356,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ))),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: 57,
                    width: 356,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Create an account'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                    )),
              ],
            ),
          ),
        ),

        //),
      ])),
    ));
  }
}
