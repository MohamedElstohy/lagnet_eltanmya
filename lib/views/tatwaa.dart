import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/constants.dart';
import 'package:lagnet_eltanmyaa/views/chance_name.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/app_bar.dart';

enum View{
  ListView,
  GridView
}

class TatwaaView extends StatefulWidget {
  @override
  _TatwaaViewState createState() => _TatwaaViewState();
}

class _TatwaaViewState extends State<TatwaaView> {
  View view = View.GridView;

  void _pressed(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) =>ChanceNameView())
    );
  }

  Widget _listTile({int index , BuildContext context , Function onPressed}){
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
           fit: BoxFit.cover,
            image: AssetImage('assets/images/glenn-carstens-peters-npxXWgQ33ZQ-unsplash@3x.png')
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        height: getDeviceHeight(context) * (1/5) -20,
        padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/ovelayer@3x.png'
                )
              ,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Color(
                  0xFF0A0A0A
                  )
                  .withOpacity(
                    0.3
                  ), 
                  BlendMode.color
              ),
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Text(
              'اسم الفرصة',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFFFFFFF)
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridTile({int index , BuildContext context , Function onPressed}){
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: (getDeviceWidth(context) - 60)/2,
        height: getDeviceHeight(context) * (4/7),
        decoration: BoxDecoration(
          image: DecorationImage(
           fit: BoxFit.cover,
            image: AssetImage('assets/images/glenn-carstens-peters-npxXWgQ33ZQ-unsplash@3x.png')
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ovelayer@3x.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Color(0xFF0A0A0A).withOpacity(0.3), BlendMode.color),
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Text(
              'اسم الفرصة',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFFFFFFF)
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView _listView(BuildContext context){
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal:20 , vertical: 20),
      itemCount: 14,
      itemBuilder: (ctx , index){
        return _listTile(index: index , context: context , onPressed: _pressed);
      },
    );
  }

  GridView _gridView(BuildContext context){
   return GridView.builder(
     itemCount: 14,
     padding: EdgeInsets.symmetric(horizontal:20 , vertical: 20),
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
       childAspectRatio: 18/21,
       crossAxisSpacing: 15,
       mainAxisSpacing: 15
     ),
     itemBuilder: (ctx,index) => _gridTile(index: index, context: context , onPressed: _pressed),
   ); 
  }
  
  List<Widget> _actions(){
    return [
      IconButton(
        icon: Image.asset(
          'assets/images/grid@3x.png',
          fit: BoxFit.cover,
          width: 18,
          height: 18,
        ),
        onPressed: (){
          setState(() {
            view = View.GridView;
          });
        },
      ),

      IconButton(
        icon: Image.asset(
          'assets/images/list@3x.png',
          fit: BoxFit.cover,
          width: 18,
          height: 18,
        ),
        onPressed: (){
          setState(() {
            view = View.ListView;
          });
        },
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: 'فرص التطوع', context: context , actions: _actions()),

        backgroundColor: Theme.of(context).backgroundColor,

        body: view == View.GridView ? _gridView(context) : _listView(context),
      ),
    );
  }
}