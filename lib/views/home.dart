import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lagnet_eltanmyaa/constants.dart';
import 'package:lagnet_eltanmyaa/views/more.dart';
import 'package:lagnet_eltanmyaa/views/tatwaa.dart';

import 'categories.dart';
import 'competition.dart';
import 'news.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _imagesPaths = ['assets/images/img3@3x.png' , 'assets/images/img2@3x.png' , 'assets/images/img6@3x.png' , 'assets/images/img4@3x.png'];
  final _icons = [
    Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.asset(
  
      'assets/images/rsz_tatwaa3x.png',
        fit: BoxFit.fill, 
        width: 95 ,
        height: 95,
      ),
    ),

    Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Image.asset(
  
      'assets/images/rsz_news3x.png',
        fit: BoxFit.cover, 
      ),
    ),

    Container(
      padding: EdgeInsets.all(4),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.asset(
        'assets/images/trophy.png',
        fit: BoxFit.fill, 
      ),
    ),

    Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        Icons.settings,
        color: Color(0xFFD3AD6A),
        size: 20,
      ),
    ),

    
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            'الرئيسيه',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900
            ),
          ),
          actions: <Widget>[
            Container(
              child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,),
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.only(left: 12),
            ),
            
          ],
        ),
        
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => CategoriesView()
                  )
                );
              },
              child: Container(
                height: getDeviceHeight(context) /4,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img1@3x.png',),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Color(0xFF304637).withOpacity(0.8) , BlendMode.srcATop)
                  ),
                  borderRadius: BorderRadius.circular(12.5)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 90,
                      height: 90,
                      child: Image.asset(
                        'assets/images/categoriess.png',
                        fit: BoxFit.cover, 
                        // width: 70, 
                        // height: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: Text(
                        'اقسام اللجنة',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: 4,
                 
                  itemBuilder: (BuildContext context , int index) => InkWell(
                    onTap: (){
                      if(index == 0){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => TatwaaView()
                          )
                        );
                      }
                      else if(index == 1){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => NewsView()
                          )
                        );
                      }
                      else if(index == 2){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => CompetitionView()
                          )
                        );
                      }
                      else if(index == 3){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => MoreView()
                          )
                        );
                      }
                    },
                    child: Container(
                      
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_imagesPaths[index]),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Color(0xFF304637).withOpacity(0.8), BlendMode.srcATop)
                        ),
                        borderRadius: BorderRadius.circular(12.5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            
                            _icons[index],

                            Text(
                              ((){
                                if(index == 0)
                                  return 'تطوع معنا';
                                else if(index == 1)
                                  return 'الاخبار';
                                else if(index == 2)
                                  return 'المسابقه';
                                else
                                  return 'المزيد';
                              })(),
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w900
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (int index) => StaggeredTile.count(2 , index.isOdd ? 2 : 3),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}