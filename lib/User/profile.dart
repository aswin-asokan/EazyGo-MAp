



import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class login_4 extends StatelessWidget {
  const login_4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SafeArea(child: Column(
          
          children: [
            Expanded(
              child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,color: Color(0xff1c6758),),
                            onPressed: null,
                          ),
                    ),
                   Align(alignment: Alignment.center, child: Text('Create Profile',style:TextStyle(color: Color(0xff1c6758),fontSize: 30),),),
                       SizedBox(height:20),
                        ],
                      ),
                       
                       Stack(children: [Image.asset('assets/image4.png',height: 250,width: 250),
                       Positioned(left: 0,right:0,top: 0,bottom: 0,
                       child: Icon(Icons.person,size: 100,color: Color(0xff1c6758),
                       
                       ),
                       
                       ),
                       Positioned(left: 100,right: 10,top: 100,bottom: 0, child: Icon(Icons.add_a_photo,color: Color(0xff1c6758),
                        
                       )),
                       
                       ],),
                        Row(
                children: [
                  
                  // Smaller TextField
                  SizedBox(
                    width: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person)
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'User name',
                        
                      ),
                    ),
                    
                  ),
                
                ],
              ),
              SizedBox(height: 10),
               Row(
                children: [
                  // Smaller TextField
                  SizedBox(
                    width: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_2_outlined),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Full name',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
               Row(
                children: [
                  // Smaller TextField
                  SizedBox(
                    width: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.my_location),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Location',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
                 
                  SizedBox(height: 57,width: 356,
                          child: ElevatedButton(onPressed: () {}, child: const Text('Create'),style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1c6758),foregroundColor: Colors.white),)),
              
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}