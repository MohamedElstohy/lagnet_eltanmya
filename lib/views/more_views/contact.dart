import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/TextFormField.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/app_bar.dart';

import '../../constants.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  String _contactListValue;
  GlobalKey _formKey = GlobalKey();

  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<DropdownMenuItem<String>> _contactItems = [
    DropdownMenuItem<String>(child: Text('الهاتف'),value: '1',),
    DropdownMenuItem<String>(child: Text('التواصل الاجتماعي'),value: '2',),
    DropdownMenuItem<String>(child: Text('المقابلة'),value: '3',),
  ];

  Widget dropdownButton({bool largeSize , String hintText , List<DropdownMenuItem<String>> items , String buttonValue}){
    return Container(
      height: largeSize ? 45 : 40,
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15)
      ),
      child: DropdownButtonFormField<String>(   
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal:12)
        ),              
        autofocus: true,
        hint: Text(
          hintText,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFFA2A5A9),
            fontWeight: FontWeight.normal,
            fontFamily: 'Cairo'
          ),
        ),
        icon: Container(padding: EdgeInsets.only(left: 5),child: Image.asset('assets/images/arrow@3x.png',width: 14,height: 14,)),
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Color(0xFF0A0A0A),
          fontFamily:  'Cairo'
        ),
        value: buttonValue,
        items: items,
        isDense: true,
        onChanged: (String value){
          setState(() {
            buttonValue = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: 'تواصل معنا', context: context),

        backgroundColor: Theme.of(context).backgroundColor,

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              'كيف يمكننا مساعدتك',
              style: kMoreTitleTextStyle()
            ),

            SizedBox(height: 15,),

            Text(
              'يسعدنا تواصلك معنا',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF0A0A0A)
              ),
            ),

            SizedBox(height: 25,),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _controllers[0],
                    lSizeRatio: true,
                    hintText: 'الاسم الرباعي',
                  ),

                  SizedBox(height: 12,),

                  CustomTextFormField(
                    controller: _controllers[1],
                    lSizeRatio: true,
                    hintText: 'رقم الجوال',
                  ),

                  SizedBox(height: 12,),

                  CustomTextFormField(
                    controller: _controllers[2],
                    lSizeRatio: true,
                    hintText: 'البريد الالكتروني',
                  ),

                  SizedBox(height: 12,),

                  dropdownButton(
                    largeSize: true,
                    hintText: 'نوع التواصل',
                    buttonValue: _contactListValue,
                    items: _contactItems
                  ),

                  SizedBox(height: 12,),

                  CustomTextFormField(
                    controller: _controllers[3],
                    lSizeRatio: true,
                    hintText: 'نص الرساله',
                    formEnd: true,
                    isMultiLine: true,
                  ),
                ],
              ),
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
          ]
        ),
      ),
    );
  }
}