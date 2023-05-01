// import 'package:eazygo_prof/screens/profilePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../SourceScreen/Variables.dart';
// import '../SourceScreen/widgets.dart';
import 'package:flutter/material.dart';
import 'SourceScreen/widgets.dart';
import 'SourceScreen/Variables.dart';
import 'profilePage.dart';
import 'package:url_launcher/url_launcher.dart';
Uri phoneNo = Uri.parse('tel:+916238303567');
String email = Uri.encodeComponent("aswin_asokan@outlook.com");
String subject = Uri.encodeComponent("eazyGo Help Center");
Uri mail = Uri.parse("mailto:$email?subject=$subject");
class contactPage extends StatelessWidget {
  const contactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        padding: EdgeInsets.only(top: 30,left: 15,right: 15),
        child: Column(
          children: [
            Title_m(Title: "Contact Us",context: context,Page: profilePage()),
            Image.asset("asset/Images/contact.png",height: 250,width: 250,),
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Contact",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: mainColor),),
                //SizedBox(height: 1,),
                Text("we are here to help! send us your query via the phone number below or send us through email for any issue you are facing",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.grey),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.phone,color: mainColor,size: 20,),
                    
                    TextButton(onPressed: () {
                       launchUrl(phoneNo);
                    }, child: Text("+91 6238303567",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey))),
                    ],
                ),
                Row(
                  children: [
                    Icon(Icons.mail,color: mainColor,size: 20,),
                    
                    TextButton(onPressed: () {
                       launchUrl(mail);
                    }, child: Text("aswin_asokan@outlook.com",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey)))
                    ],
                )
              ],
            )
          ],
        ),
      )),
    );
  
  }
}