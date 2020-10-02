import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/TextFormField.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/app_bar.dart';

import '../../constants.dart';

class IdeaView extends StatefulWidget {
  @override
  _IdeaViewState createState() => _IdeaViewState();
}

class _IdeaViewState extends State<IdeaView> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: 'شاركنا بفكرة', context: context),

        backgroundColor: Theme.of(context).backgroundColor,

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              'يسعدنا دائما ان تشاركنا افكارك و مقتراحاتك',
              style: kMoreTitleTextStyle()
            ),

            SizedBox(height: 20,),


            Text(
              'يسعدنا تواصلك معنا',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF0A0A0A)
              ),
            ),

            SizedBox(height: 30,),

            CustomTextFormField(
              controller: _controller,
              hintText: 'اكتب فكرتك هنا',
              lSizeRatio: true,
              formEnd: true,
              isMultiLine: true,
            ),

            SizedBox(height: 50,),

            Align(
              alignment: Alignment.center,
              child: Container(
                height: 65,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,),
                  child: Material(
                    color: Color(0xFF304637),
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      minWidth: 200,
                      height: 45,
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'ارسال',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}