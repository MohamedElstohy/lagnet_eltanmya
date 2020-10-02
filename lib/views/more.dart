import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/constants.dart';

import 'package:lagnet_eltanmyaa/views/more_views/about.dart';
import 'package:lagnet_eltanmyaa/views/more_views/contact.dart';
import 'package:lagnet_eltanmyaa/views/more_views/idea.dart';
import 'package:lagnet_eltanmyaa/views/more_views/rate.dart';

import 'package:lagnet_eltanmyaa/views/ui_widgets/app_bar.dart';

class MoreView extends StatefulWidget {
  @override
  _MoreViewState createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  Widget _listTile({String title , String imagePath}){
    return GestureDetector(
      onTap: (){
        if(title == 'عن التطبيق'){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => AboutView()
            )
          );
        }
        else if(title == 'تواصل معنا'){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ContactView()
            )
          );
        }
        else if(title == 'شاركنا بفكرة'){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => IdeaView()
            )
          );
        }
        else if(title == 'تقييم التطبيق'){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => RateView()
            )
          );
        }
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 40,
              height: 45
            ),

            SizedBox(width: 22,),

            Text(
              title,
              style: kTitleTextStyle().copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: 'اخرى', context: context),

        backgroundColor: Theme.of(context).backgroundColor,
        
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50,),

              Center(
                child: Container(
                  height: 180,
                  width: 130,
                  padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/upside-down-photo-of-a-woman-1821095@3x.png'),
                      fit: BoxFit.cover
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/slogin@3x.png',
                    
                  ),
                ),
              ),
            
              SizedBox(height: 55,),

              _listTile(
                title: 'عن التطبيق',
                imagePath: 'assets/images/about@3x.png'
              ),

              SizedBox(height: 20,),

              _listTile(
                title: 'تواصل معنا',
                imagePath: 'assets/images/contactus@3x.png'
              ),

              SizedBox(height: 20,),

              _listTile(
                title: 'شاركنا بفكرة',
                imagePath: 'assets/images/idea@3x copy.png'
              ),

              SizedBox(height: 20,),

              _listTile(
                title: 'تقييم التطبيق',
                imagePath: 'assets/images/rate@3x.png'
              ),

              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}