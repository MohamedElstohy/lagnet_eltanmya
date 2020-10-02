import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/views/registration.dart';

import '../constants.dart';

class ChanceNameView extends StatelessWidget {
  Padding dot(){
    return Padding(
      padding: const EdgeInsets.only(top:12.0),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: Color(0xFFA2A5A9),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Row orderdLine(String content){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dot(),
        SizedBox(width: 10,),
        Expanded(
          child: Text(
            content,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,

        body: SafeArea(
                  child: ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(
                      right: 20,
                      top: 20
                    ),
                    height: getDeviceHeight(context)/4,
                    width: getDeviceWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/artist.jpg'),
                        fit: BoxFit.cover,
                      ), 
                    ),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/back2@3x.png',
                        height: 32,
                        width: 32,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ),
                  Container(
                    height: 130,
                    width: 295,
                    margin: EdgeInsets.only(
                      top: 155,
                      right: 50
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 12
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مسمى الفرصة التطوعية',
                            style: kTitleTextStyle(),
                          ),

                          SizedBox(
                            height: 7,
                          ),

                          Text(
                            'مجال الفرصة',
                            style: TextStyle(
                              color: Color(0xff0A0A0A),
                              fontSize: 16
                            ),
                          ),

                          SizedBox(
                            height: 5
                          ),

                          Text(
                            '15 يونيو 10 ص  :  25يونيو 3 م',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffD3AD6A)
                              
                              ),
                          )
                        ],
                      ),
                    ),
                 )
                ],
              ), 

              SizedBox(
                height: 12,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal:20),
                padding: EdgeInsets.only(top:10, bottom: 10),
                height: 90, 
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الساعات',
                          style: TextStyle(
                            color: Color(0xFF0A0A0A),
                            fontSize: 14
                          ),
                        ),
                        Text(
                          '5',
                          style: kTitleTextStyle(),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المقاعد المتاحة',
                          style: TextStyle(
                            color: Color(0xFF0A0A0A),
                            fontSize: 14
                          ),
                        ),
                        Text(
                          '122',
                          style: kTitleTextStyle(),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'العمر',
                          style: TextStyle(
                            color: Color(0xFF0A0A0A),
                            fontSize: 14
                          ),
                        ),
                        Text(
                          '32-20',
                          style: kTitleTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الوصف',
                      style: kTitleTextStyle().copyWith(fontSize: 16),
                    ),

                    SizedBox(height: 8,),

                    Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF000000)
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'المواصفات المطلوبه',
                      style: kTitleTextStyle().copyWith(fontSize: 16),
                    ),

                    SizedBox(height: 8,),

                    orderdLine('اشتراك جماعي'),
                    orderdLine('كلا الجنسين'),
                    orderdLine('درجة البكالريوس او ما يعادلها'),
                    orderdLine('التخصص'),
                    orderdLine('المهارات'),
                    orderdLine('فرصة تطوعية عن بعد'),
                    orderdLine('مناسيبة لذوي الإعاقة'),
                    orderdLine('تتطلب مقابلة شخصية'),
                    orderdLine('مهام المتطوع'),
                    orderdLine('الدعم المقدم من الجهة الموفرة للفرص'),
                    orderdLine('التطوعية للمتطوعين'),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'العنوان والتواصل',
                      style: kTitleTextStyle().copyWith(fontSize: 16),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      '9660458752+',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),

                    SizedBox(height: 40,),

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
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) => RegistrationView()
                                  ),
                                );
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}