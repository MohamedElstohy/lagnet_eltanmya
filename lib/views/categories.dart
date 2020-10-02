import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/constants.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/app_bar.dart';

class CategoriesView extends StatelessWidget {
  
  final _cardIcons = [
    'assets/images/handshake@3x.png',
    'assets/images/group@3x.png',
    'assets/images/woman@3x.png',
    'assets/images/puzzle@3x.png',
    'assets/images/logic@3x.png',
    'assets/images/idea@3x.png',
    'assets/images/share@3x.png'
  ];

  final _titles = [
    'نحو',
    'مركز',
    'مركز',
    'مركز',
    'مركز',
    'مركز',
    'فريق'
  ];

  final _subTitles = [
    'مجتمع متعاون',
    'سواعد الشباب',
    'قمة النسائي',
    'أجيال للاطفال',
    'قادر لتنميه مهارات',
    'نماء للابناء',
    'تعاون التطوعي'
  ];

  TextStyle _titleStyle(int index){
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: index == 0 ? Color(0xFFFFFFFF) : Color(0xFF0A0A0A)
    );
  }

  Widget _card({int index , double deviceHeight}){
    bool _isFirstIndex = (index == 0);
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: (deviceHeight / 5) + 30,
        padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
        decoration: BoxDecoration(
          color: _isFirstIndex ? Color(0xFF304637) : Color(0xFFFFFFFF),
          image: DecorationImage(
            image: AssetImage(_isFirstIndex ? 'assets/images/Mask@3x.png' : 'assets/images/Mask2@3x.png',),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(17.5)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              _cardIcons[index],
              width: 35,
              height: 35,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _titles[index],
                  style: _titleStyle(index),
                ),
                Text(
                  _subTitles[index],
                  style: _titleStyle(index),
                ),
              ],
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
        backgroundColor: Theme.of(context).backgroundColor,

        appBar: customAppBar(context: context , title: 'اقسام اللجنه'),

        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
          itemCount: 7,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 18/21,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ), 
          itemBuilder: (ctx , index){
            return _card(index: index , deviceHeight: getDeviceHeight(context));
          }
        ),
      ),
    );
  }
}