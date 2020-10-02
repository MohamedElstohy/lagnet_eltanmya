import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/app_bar.dart';

import '../../constants.dart';

class RateView extends StatefulWidget {
  @override
  _RateViewState createState() => _RateViewState();
}

class _RateViewState extends State<RateView> {
  int _firstGroupValue;
  int _secondGroupValue;
  int _thirdGroupValue;

  Widget _radioButtonField({String title , int questionNumber}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF0A0A0A)
          ),
        ),

        Row(
          children: [
            Radio(
              value: 0,
              activeColor: Color(0xFFD3AD6A),
              hoverColor: Color(0xFFD3AD6A),
              focusColor: Color(0xFFD3AD6A), 
              groupValue: (){
                if(questionNumber == 0)
                  return _firstGroupValue;
                else if(questionNumber == 1)
                  return _secondGroupValue;
                else if(questionNumber == 2)
                  return _thirdGroupValue;
              }(), 
              onChanged: (value){
                setState(() {
                  if(questionNumber == 0)
                    _firstGroupValue = value;
                  else if(questionNumber == 1)
                    _secondGroupValue = value;
                  else if(questionNumber == 2)
                    _thirdGroupValue = value;
                });
              },
            ),
            Text(
              'سئ',
              style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(
              width: (getDeviceWidth(context))/7,
            ),

            Radio(
              value: 1, 
              activeColor: Color(0xFFD3AD6A),
              hoverColor: Color(0xFFD3AD6A),
              focusColor: Color(0xFFD3AD6A),
              groupValue:  (){
                if(questionNumber == 0)
                  return _firstGroupValue;
                else if(questionNumber == 1)
                  return _secondGroupValue;
                else if(questionNumber == 2)
                  return _thirdGroupValue;
              }(), 
              onChanged: (value){
                setState(() {
                  if(questionNumber == 0)
                    _firstGroupValue = value;
                  else if(questionNumber == 1)
                    _secondGroupValue = value;
                  else if(questionNumber == 2)
                    _thirdGroupValue = value;
                });
              },
            ),
            Text(
              'جيد',
              style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(
              width: (getDeviceWidth(context))/7,
            ),

            Radio(
              value: 2, 
              activeColor: Color(0xFFD3AD6A),
              hoverColor: Color(0xFFD3AD6A),
              focusColor: Color(0xFFD3AD6A),
              groupValue:  (){
                if(questionNumber == 0)
                  return _firstGroupValue;
                else if(questionNumber == 1)
                  return _secondGroupValue;
                else if(questionNumber == 2)
                  return _thirdGroupValue;
              }(), 
              onChanged: (value){
                setState(() {
                  if(questionNumber == 0)
                    _firstGroupValue = value;
                  else if(questionNumber == 1)
                    _secondGroupValue = value;
                  else if(questionNumber == 2)
                    _thirdGroupValue = value;
                });
              },
            ),
            Text(
              'ممتاز',
              style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: 'تقييمك', context: context),

        backgroundColor: Theme.of(context).backgroundColor,

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            _radioButtonField(
              questionNumber: 0,
              title: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص؟'
            ),

            SizedBox(height: 15,),

            _radioButtonField(
              questionNumber: 1,
              title: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص؟'
            ),

            SizedBox(height: 15,),

            _radioButtonField(
              questionNumber: 2,
              title: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص؟'
            ),

            SizedBox(height: 80,),

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