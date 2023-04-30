import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'log.dart';

class login_2 extends StatefulWidget {
  const login_2({super.key});

  @override
  State<login_2> createState() => _login_2State();
}

class _login_2State extends State<login_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SafeArea(child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(children: [
                Text('Login Account',style:TextStyle(color: Color(0xff1c6758),fontSize: 50),),
                Text('Hello! Welcome back to your account',style:TextStyle(color: Color.fromARGB(255, 8, 8, 8),fontSize: 15),)
            
            ],),
              
            ),
            Container(width: 390,height: 56,decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Color(0xffC3E5DF),),
            
             child: 
              Row(
               
                   children: [
                    const SizedBox(width: 20,),
                     SizedBox(height: 44,width: 172,
                      child: TextButton(onPressed: () {
                        Navigator.push(context,(MaterialPageRoute(builder: (context) => login_1())),);
                      }, child: Text('Phone Number'),style: TextButton.styleFrom(foregroundColor: Colors.black),
                      )),
                     const SizedBox(width: 20,),
                      SizedBox(height: 44,width: 172,
                        child: ElevatedButton(onPressed: () {}, child: Text('Email'),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Colors.white,foregroundColor: Colors.black),)),
                      
                   ],
                 
               
             ),
            ),
            Row(
              children: [
                TextField(decoration: InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,),)),),
                TextField(decoration: InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black),)),)
              ],
            )
          ],
        )
        ),
      )
    );
  }
}