import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/constants.dart';
import 'package:lagnet_eltanmyaa/views/article.dart';

import 'ui_widgets/app_bar.dart';

class NewsView extends StatelessWidget {
  Widget _card({BuildContext context , int index}){
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => ArticleView(
                  title: (index.isOdd) ? 'سفير جائزة حمدان بن راشد ال حمدان' : 'استضافه مدير مركز التنميه الاجتماعيه' ,
                  imagePath: (index.isOdd) ? 'assets/images/meeting.jpg' : 'assets/images/table.jpg',
                )
              )
            );
          },
          child: Container(
            height: (getDeviceHeight(context) / 4) - 22,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: (index.isOdd) ? AssetImage('assets/images/meeting.jpg') : AssetImage('assets/images/table.jpg'),
                fit: BoxFit.cover
              ),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/ovelayer@3x.png',
                  fit: BoxFit.cover,
                  width: getDeviceWidth(context),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (index.isOdd) ? 'سفير جائزة حمدان بن راشد ال حمدان' : 'استضافه مدير مركز التنميه الاجتماعيه' , 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                            fontSize: 16
                          ),
                        ),
                        Text(
                          '٥ مايو ٢٠٢٠',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFD1D1D1)
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        SizedBox(height: 20,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,

        appBar: customAppBar(context: context, title: 'اخبار اللجنه'),

        body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          itemCount: 4,
          itemBuilder: (ctx , index){
            return _card(index: index, context: context);
          },
        ),
      ),
      
    );
  }
}


//

//