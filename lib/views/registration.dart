import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/app_bar.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/image_picker.dart';

import '../constants.dart';


enum GroupValueType{
  License,
  Sick,
  Disabled
}

class RegistrationView extends StatefulWidget {
  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _firstFormKey = GlobalKey();
  final _secondFormKey = GlobalKey();
  final _thirdFormKey = GlobalKey();

  final List<TextEditingController> _firstStepValues = [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];
  final List<TextEditingController> _secondStepValues = [TextEditingController(),TextEditingController(),TextEditingController(),];
  final List<File> _images = [null , null];

  int _stepIndex = 0;

  int _sexGroupValue = 0;
  int _licenseGroupValue;
  int _sickGroupValue;
  int _disabledGroupValue;

  String _nationalitylistValue;
  String _bloodlistValue;

  List<DropdownMenuItem<String>> _nationalityListItems = [
    DropdownMenuItem<String>(child: Text('مصر'),value: '1',),
    DropdownMenuItem<String>(child: Text('السعودية'),value: '2',),
  ];

  List<DropdownMenuItem<String>> _bloodListItems = [
    DropdownMenuItem<String>(child: Text('A+'),value: '1',),
    DropdownMenuItem<String>(child: Text('A-'),value: '2',),
  ];

  void _modalBottomSheetMenu(){
    showModalBottomSheet(
      context: context,
      builder: (builder){
        return new Container(
          height: 350.0,
          // color: Colors.transparent,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 115,
                width: 115,
                child: Image.asset('assets/images/confirm@3x.png',fit: BoxFit.cover,),
              ),

              Text(
                'تم الاشتراك ف المسابقه بنجاح',
                style: kTitleTextStyle().copyWith(color: Color(0xFF000000)),
              ),

              Container(
                width: double.infinity,
                height: 65,
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,),
                  child: Material(
                    color: Color(0xFF304637),
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      minWidth: 200,
                      height: 45,
                      onPressed: (){
                        setState(() {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        'تأكيد',
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
            ],
          ),
        );
      }
    );
  }

  Widget secondStep(){
    bool lSize = (getDeviceHeight(context) - getDeviceWidth(context) > 400);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: [
        Container(
          height: (getDeviceHeight(context)/4) - 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  'الوظائف',
                  style: titleTextStyle(),
                ),
                
              SizedBox(height: lSize ? 10 : 7,),

              Form(
                key: _thirdFormKey,
                child: Column(
                  children: [
                    customTextFormField(
                        hintText: 'قطاع العمل',
                        controller: _secondStepValues[0],
                        lSizeRatio: lSize
                      ),

                      SizedBox(height: 10,),

                      customTextFormField(
                        hintText: 'الوظيفه',
                        controller: _secondStepValues[1],
                        lSizeRatio: lSize
                      ),

                      SizedBox(height: 10,),

                      customTextFormField(
                        hintText: 'عدد سنوات الخبرة في العمل التطوعي',
                        controller: _secondStepValues[2],
                        lSizeRatio: lSize
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
         
        SizedBox(height: lSize ? 20 : 10 ,),

        Container(
          height: (getDeviceHeight(context)/4) - 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'الحاله الصحية',
                style: titleTextStyle(),
              ),
                
              SizedBox(height: lSize ? 10 : 7,),

              _radioButtonField(
                title: 'هل تعاني من وجود امراض؟',
                type: GroupValueType.Sick
              ),

              _radioButtonField(
                title: 'هل انت من ذوي الاحتياجات الخاصة؟',
                type: GroupValueType.Disabled
              ),
            ],
          ),
        ),

        SizedBox(height: lSize ? 20 : 10 ,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomImagePicker(
              title: 'صورة الهوية',
              imageFile: _images[0],
            ),

            CustomImagePicker(
              title: 'صورة شخصية',
              imageFile: _images[1],
            ),
          ],
        ),
      

        SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '2/2',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFD3AD6A)
              ),
            ),

            SizedBox(width: (getDeviceWidth(context)/3),),

            IconButton(
              alignment: Alignment.centerRight,
              icon: Image.asset(
                'assets/images/left@3x.png',
                width: 32,
                height: 32,
              ),
              onPressed: (){
                setState(() {
                  _stepIndex--;
                });
              },
            ),
          ],
        ),
      
        SizedBox(height: 30,),

        Align(
          alignment: Alignment.center,
          child: Container(
            height: 65,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10,),
              child: Material(
                color: Color(0xFF304637),
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                  minWidth: 200,
                  height: 45,
                  onPressed: (){
                    _modalBottomSheetMenu();
                  },
                  child: Text(
                    'تسجيل',
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
      
        SizedBox(height: 20,),
      ],
    );
  }

  Widget firtsStep(){
    bool lSize = (getDeviceHeight(context) - getDeviceWidth(context) > 400);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            Container(
              height: lSize ? (getDeviceHeight(context)/3)-25 : (getDeviceWidth(context)/3) + 100 ,
              width: getDeviceWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'البيانات الشخصية',
                    style: titleTextStyle(),
                  ),
                  
                  SizedBox(height: lSize ? 10 : 7,),

                  Form(
                  key: _firstFormKey,
                    child: Column(
                      children: [
                        customTextFormField(
                          hintText: 'الاسم الرباعي',
                          controller: _firstStepValues[0],
                          lSizeRatio: lSize
                        ),

                        SizedBox(height: 10,),

                        customTextFormField(
                          hintText: 'السجل المدني',
                          controller: _firstStepValues[1],
                          lSizeRatio: lSize
                        ),

                        SizedBox(height: 10,),

                        customTextFormField(
                          hintText: 'رقم الجوال',
                          controller: _firstStepValues[2],
                          lSizeRatio: lSize
                        ),

                        SizedBox(height: 10,),

                        customTextFormField(
                          hintText: 'البريد الاكتروني',
                          controller: _firstStepValues[3],
                          lSizeRatio: lSize
                        ),     
                      ],
                    ),
                  )
                ],
              ),
            ),
          
            SizedBox(height: lSize ? 20 : 10 ,),

            Container(
              height: lSize ? (getDeviceHeight(context)/4) - 10: (getDeviceWidth(context)/3) + 100 ,
              width: getDeviceWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'البيانات الاساسية',
                    style: titleTextStyle(),
                  ),
                  
                  SizedBox(height: lSize ? 5 : 2,),

                  Row(
                    children: [
                      Radio(
                        value: 0,
                        activeColor: Color(0xFFD3AD6A),
                        hoverColor: Color(0xFFD3AD6A),
                        focusColor: Color(0xFFD3AD6A), 
                        groupValue: _sexGroupValue, 
                        onChanged: (value){
                          setState(() {
                            _sexGroupValue = value;
                          });
                        },
                      ),
                      Text(
                        'ذكر',
                        style: TextStyle(
                          color: Color(0xFF0A0A0A),
                          fontSize: 16
                        ),
                      ),

                      SizedBox(
                        width: (getDeviceWidth(context))/4,
                      ),

                      Radio(
                        value: 1, 
                        activeColor: Color(0xFFD3AD6A),
                        hoverColor: Color(0xFFD3AD6A),
                        focusColor: Color(0xFFD3AD6A),
                        groupValue: _sexGroupValue, 
                        onChanged: (value){
                          setState(() {
                            _sexGroupValue = value;
                          });
                        },
                      ),
                      Text(
                        'انثي',
                        style: TextStyle(
                          color: Color(0xFF0A0A0A),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ), 

                  SizedBox(height: 10,),

                  dropdownButton(
                    largeSize: lSize,
                    items: _nationalityListItems,
                    buttonValue: _nationalitylistValue,
                    hintText: 'الجنسية'
                  ),

                  SizedBox(height: 12,),

                  dropdownButton(
                    largeSize: lSize,
                    items: _bloodListItems,
                    buttonValue: _bloodlistValue,
                    hintText: 'فصيله الدم'
                  ),
                ],
              ),
            ),


            SizedBox(height: lSize ? 20 : 10 ,),

            Container(
              height: getDeviceHeight(context)/4 + 20,
              width: getDeviceWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'مؤهلات دراسية',
                    style: titleTextStyle(),
                  ),

                  SizedBox(height: lSize ? 10 : 7),

                  Form(
                    key: _secondFormKey,
                      child: Column(
                      children: [
                        customTextFormField(
                          hintText: 'المؤهل الدراسي',
                          controller: _firstStepValues[4],
                          lSizeRatio: lSize
                        ),
                     
                        SizedBox(height: 12,),

                        customTextFormField(
                          hintText: 'التخصص',
                          controller: _firstStepValues[5],
                          lSizeRatio: lSize
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12,),

                  _radioButtonField(
                    title: 'يوجد رخصة قيادة',
                    type: GroupValueType.License
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                IconButton(
                  alignment: Alignment.centerRight,
                  icon: Image.asset(
                    'assets/images/right@3x.png',
                    width: 32,
                    height: 32,
                  ),
                  onPressed: (){
                    setState(() {
                      _stepIndex++;
                    });
                  },
                ),

                SizedBox(width: (getDeviceWidth(context)/3),),

                Text(
                  '2/1',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFD3AD6A)
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),
          ],
    );
  }

  Widget _radioButtonField({String title , GroupValueType type}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
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
                if(type == GroupValueType.License)
                  return _licenseGroupValue;
                else if(type == GroupValueType.Sick)
                  return _sickGroupValue;
                else 
                  return _disabledGroupValue;
              }(), 
              onChanged: (value){
                setState(() {
                  if(type == GroupValueType.License)
                    _licenseGroupValue = value;
                  else if(type == GroupValueType.Sick)
                    _sickGroupValue = value;
                  else 
                    _disabledGroupValue = value;
                });
              },
            ),
            Text(
              'نعم',
              style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16
              ),
            ),

            SizedBox(
              width: (getDeviceWidth(context))/4,
            ),

            Radio(
              value: 1, 
              activeColor: Color(0xFFD3AD6A),
              hoverColor: Color(0xFFD3AD6A),
              focusColor: Color(0xFFD3AD6A),
              groupValue:  (){
                if(type == GroupValueType.License)
                  return _licenseGroupValue;
                else if(type == GroupValueType.Sick)
                  return _sickGroupValue;
                else 
                  return _disabledGroupValue;
              }(), 
              onChanged: (value){
                setState(() {
                  if(type == GroupValueType.License)
                    _licenseGroupValue = value;
                  else if(type == GroupValueType.Sick)
                    _sickGroupValue = value;
                  else 
                    _disabledGroupValue = value;
                });
              },
            ),
            Text(
              'لا',
              style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16,
              ),
            ),
          ],
        )
      ],
    );
  }

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

  Widget customTextFormField({String hintText , TextEditingController controller , bool lSizeRatio}){
    bool _formEnd = (hintText == 'البريد الالكتروني' || hintText == 'التخصص' || hintText == 'عدد سنوات الخبرة في العمل التطوعي');
    return Container(
      height: lSizeRatio ? 45 : 40,
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        minLines: 1,
        maxLines: null,
        textDirection: TextDirection.rtl,
        controller: controller,
        keyboardType: (){
          if(hintText == 'رقم الجوال' || hintText == 'عدد سنوات الخبرة في العمل التطوعي') 
            return TextInputType.phone;
          else if(hintText == 'البريد الالكتروني')
            return TextInputType.emailAddress;
          else
            return TextInputType.text;
          
        }(),
        textInputAction: (){
          if(_formEnd)
            return TextInputAction.done;
          else
            return TextInputAction.next;
          
        }(),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFFA2A5A9),
            fontSize: 14
          ),
        ),

        onFieldSubmitted: (val){
          if(_formEnd){
            setState(() {
              controller.text = val;
            });
            FocusScope.of(context).unfocus();
          }
          else{
            setState(() {
              controller.text = val;
            });
            FocusScope.of(context).nextFocus();
          }
          
        },
      ),
    );
  }

  TextStyle titleTextStyle(){
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0A0A0A)
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [firtsStep() , secondStep()];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(context: context , title: 'بيانات التسجيل'),
        
        backgroundColor: Theme.of(context).backgroundColor,
        
        body: steps[_stepIndex],
      ),
    );
  }
}