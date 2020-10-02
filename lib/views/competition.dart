import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/constants.dart';
import 'package:lagnet_eltanmyaa/views/ui_widgets/app_bar.dart';

class CompetitionView extends StatefulWidget {
  @override
  _CompetitionViewState createState() => _CompetitionViewState();
}

class _CompetitionViewState extends State<CompetitionView> {
  final _formKey = GlobalKey();
  final List<TextEditingController> _values = [TextEditingController(),TextEditingController(),TextEditingController()];
  TextEditingController secondStepAnswer = TextEditingController();
  TextEditingController fourthStepAnswer = TextEditingController();
  int stepIndex = 0;
  final List<String> _answers = ['الإجابة أ'  ,  'الإجابة ب هذا نموذج الاجابة'  , 'الإجابة ج هذا نموذج الاجابة' , 'الإجابة د'];

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

  Widget fourthStep(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
          child: Text(
            'اسئلة المسابقة',
            style: kTitleTextStyle().copyWith(color: Color(0xFF000000)),
          ),
        ),

        SizedBox(height: 20,),

        Container(
          height: getDeviceHeight(context) /3 - ((getDeviceHeight(context)/8) * 1.5) ,
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(horizontal: 7 , vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/images/Mask2@3x.png'),
              fit: BoxFit.cover
            ),
          ),

          child: Text(
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص؟',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: customTextFormField(
            hintText: 'اكتب اجابتك هنا...',
            controller: fourthStepAnswer
          ),
        ),

        SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: IconButton(
            alignment: Alignment.centerLeft,
            icon: Image.asset(
              'assets/images/left@3x.png',
              width: 32,
              height: 32,
            ),
            onPressed: (){
              setState(() {
                stepIndex--;
              });
            },
          ),
        ),   

        SizedBox(height: 65,),

        Container(
          height: 65,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 32),
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
      ],
    );
  }

  Widget thirdStep(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
          child: Text(
            'اسئلة المسابقة',
            style: kTitleTextStyle().copyWith(color: Color(0xFF000000)),
          ),
        ),

        SizedBox(height: 20,),

        Container(
          height: getDeviceHeight(context) /4 +(getDeviceHeight(context)/8) ,
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(horizontal: 7 , vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/images/Mask2@3x.png'),
              fit: BoxFit.cover
            ),
          ),

          child: Column(
            children: [
              Container(
                height: (getDeviceHeight(context) /4 +(getDeviceHeight(context)/8)) /2 + 20 ,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/images/book.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),

              SizedBox(height: 20,),

              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ), 

        SizedBox(height: 15,),

        Container(
          height: getDeviceHeight(context)/4 - 15,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            // height: getDeviceHeight(context)/4,
            // padding: EdgeInsets.symmetric(horizontal: 15),  
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 21/10,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ), 
            itemCount: 4,
            itemBuilder: (context , index){
              // bool _isSelected = false;
              return InkWell(
                onTap: (){
                  // setState(() {
                  //   !_isSelected;
                  // });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(
                    //   width: _isSelected ? 1 : 0 ,
                    //   color: _isSelected ? Color(0xFF000000) : Color(0xFFF2F2F2)
                    // ) 
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _answers[index],
                    style: TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 16
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    stepIndex++;
                  });
                },
              ),

              IconButton(
                alignment: Alignment.centerRight,
                icon: Image.asset(
                  'assets/images/left@3x.png',
                  width: 32,
                  height: 32,
                ),
                onPressed: (){
                  setState(() {
                    stepIndex--;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget secondStep(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
          child: Text(
            'اسئلة المسابقة',
            style: kTitleTextStyle().copyWith(color: Color(0xFF000000)),
          ),
        ),

        SizedBox(height: 20,),

        Container(
          height: getDeviceHeight(context) /4 +(getDeviceHeight(context)/8) ,
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(horizontal: 7 , vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/images/Mask2@3x.png'),
              fit: BoxFit.cover
            ),
          ),

          child: Column(
            children: [
              Container(
                height: (getDeviceHeight(context) /4 +(getDeviceHeight(context)/8)) /2 + 20 ,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/images/book.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),

              SizedBox(height: 20,),

              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: customTextFormField(
            hintText: 'اكتب اجابتك هنا...',
            controller: secondStepAnswer
          ),
        ),

        SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: IconButton(
            alignment: Alignment.centerRight,
            icon: Image.asset(
              'assets/images/right@3x.png',
              width: 32,
              height: 32,
            ),
            onPressed: (){
              setState(() {
                stepIndex++;
              });
            },
          ),
        ),   
      ],
    );
  }

  Widget firstStep(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
          height: (getDeviceHeight(context)/3)- 40,
          width: getDeviceWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'للاشتراك ادخل البيانات الاتيه',
                style: kTitleTextStyle().copyWith(color: Color(0xFF000000)),
              ),
              SizedBox(height: 15,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    customTextFormField(
                      hintText: 'الاسم الرباعي',
                      controller: _values[0],
                    ),

                    SizedBox(height: 10,),

                    customTextFormField(
                      hintText: 'رقم الجوال',
                      controller: _values[1],
                    ),

                    SizedBox(height: 10,),

                    customTextFormField(
                      hintText: 'البريد الالكتروني',
                      controller: _values[2],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      
        Padding(
          padding: EdgeInsets.only(left: 25 , right: 20,bottom: 15,top:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'شروط المسابقه',
                style: kTitleTextStyle().copyWith(color: Color(0xFF000000)),
              ),

              SizedBox(height: 10,),

              orderdLine(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
              ),


              orderdLine('هذا النص هو مثال لنص يمكن أن يستبدل',),

              orderdLine(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
              ),


              orderdLine('هذا النص هو مثال لنص يمكن أن يستبدل',),

              orderdLine(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
              ),
            ],
          ),
        ),

        SizedBox(height: 25,),

        Container(
          height: 65,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 32),
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
                    stepIndex++;
                  });
                },
                child: Text(
                  'اشترك الان',
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
    );
  }

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
            maxLines: 3,
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

  Widget customTextFormField({String hintText , TextEditingController controller }){
    bool _formEnd = (hintText == 'البريد الالكتروني');
    bool _isMultiLine = (hintText == 'اكتب اجابتك هنا...');
    return Container(
      height: _isMultiLine ? 100 : 45,
      width: getDeviceWidth(context) - 40,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        minLines: _isMultiLine ? 3 : 1,
        maxLines: null,
        textDirection: TextDirection.rtl,
        controller: controller,
        keyboardType: (){
          if(hintText == 'رقم الجوال')
            return TextInputType.phone;
          else if(hintText == 'اكتب اجابتك هنا...')
            return TextInputType.multiline;
          else if(_formEnd)
            return TextInputType.emailAddress;
          else
            return TextInputType.text;
          
        }(),
        textInputAction: (){
          if(_formEnd)
            return TextInputAction.done;
          else if(hintText == 'اكتب اجابتك هنا...')
            return TextInputAction.newline;
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
          if(_formEnd)
            FocusScope.of(context).unfocus();
          else
            FocusScope.of(context).nextFocus();

          setState(() {
            controller.text = val;
          });
        },
        onChanged: (val){
          setState(() {
            controller.text = val;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [firstStep() , secondStep() , thirdStep() , fourthStep()];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,

        appBar: customAppBar(context: context , title: 'المسابقه'),
      
        body: steps[stepIndex],
      ),
    );
  }
}