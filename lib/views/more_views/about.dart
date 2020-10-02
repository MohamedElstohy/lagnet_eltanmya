import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/constants.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    image: AssetImage('assets/images/meetings.jpg'),
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
            
              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'من نحن؟',
                  style: kMoreTitleTextStyle(),
                ),
              ),

                          
              SizedBox(height: 12,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0A0A0A)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}