import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/constants.dart';

class ArticleView extends StatelessWidget {
  final String imagePath;
  final String title;

  ArticleView({
    this.imagePath,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: (getDeviceHeight(context) / 3) - 25,
                width: getDeviceWidth(context),
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 1,
                  left: 5,
                  right: 15
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(17.5),
                    bottomRight: Radius.circular(17.5)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/back2@3x.png',
                        width: 32,
                        height: 32,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '65',
                          style: TextStyle(
                            color: Color(0xFFF2F2F2),
                            fontSize: 14
                          ),
                        ),
                        SizedBox(width: 3,),

                        Container(
                          width: 15,
                          height: 15,
                          child: Image.asset('assets/images/eye@3x.png'),
                        ),

                        SizedBox(width: 7,),

                        IconButton(
                          icon: Image.asset(
                            'assets/images/share2@3x.png',
                            width: 18,
                            height:16
                          ),
                          onPressed: (){},
                        )
                      ],
                    )
                  ],
                ),
              ),
            
              SizedBox(height: 15,),

              Padding(
                padding: EdgeInsets.symmetric( horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kTitleTextStyle(),
                    ),

                    SizedBox(height: 5,),

                    Text(
                      '٥ مايو ٢٠٢٠',
                      style: TextStyle(
                        color: Color(0xFFA2A5A9),
                        fontSize: 12,
                      ),
                    ),

                    SizedBox(height: 10,),

                    Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 15,),

                    Text(
                      'مصادر الخبر',
                      style: kTitleTextStyle(),
                    ),

                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Text(
                          'اسم الصحيفة',
                          style: TextStyle(
                            color: Color(0xFF0A0A0A),
                            fontSize: 16
                          ),
                        ),

                        SizedBox(width: 15,),

                        Text(
                          'http://salmaniah.com/news/212',
                          style: TextStyle(
                            color: Color(0xFFD3AD6A),
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  
                    Row(
                      children: [
                        Text(
                          'اسم الصحيفة',
                          style: TextStyle(
                            color: Color(0xFF0A0A0A),
                            fontSize: 16
                          ),
                        ),

                        SizedBox(width: 15,),

                        Text(
                          'http://salmaniah.com/news/212',
                          style: TextStyle(
                            color: Color(0xFFD3AD6A),
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30,)
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