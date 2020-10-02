import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText; 
  final TextEditingController controller;
  final bool lSizeRatio;
  final bool formEnd;
  final bool isMultiLine;

  CustomTextFormField({
    this.hintText,
    this.controller,
    this.lSizeRatio,
    this.formEnd = false,
    this.isMultiLine = false
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    //bool _formEnd = (widget.hintText == 'البريد الاكتروني' || widget.hintText == 'التخصص' || widget.hintText == 'عدد سنوات الخبرة في العمل التطوعي');
    return Container(
      height: widget.lSizeRatio ? (widget.isMultiLine ? 120 : 45) : 40,
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        minLines: 1,
        maxLines: null,
        textDirection: TextDirection.rtl,
        controller: widget.controller,
        keyboardType: (){
          if(widget.hintText == 'رقم الجوال' || widget.hintText == 'عدد سنوات الخبرة في العمل التطوعي') 
            return TextInputType.phone;
          else if(widget.hintText == 'البريد الالكتروني')
            return TextInputType.emailAddress;
          else if(widget.hintText == 'نص الرساله')
            return TextInputType.multiline;
          else
            return TextInputType.text;
          
        }(),
        textInputAction: (){
          if(widget.formEnd)
            return TextInputAction.done;
          else if(widget.hintText == 'نص الرساله')
            return TextInputAction.newline;
          else
            return TextInputAction.next;
          
        }(),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color(0xFFA2A5A9),
            fontSize: 14
          ),
        ),

        onFieldSubmitted: (val){
          if(widget.formEnd){
            setState(() {
              widget.controller.text = val;
            });
            FocusScope.of(context).unfocus();
          }
          else{
            print(widget.controller.text);
            setState(() {
              widget.controller.text = val;
            });
            FocusScope.of(context).nextFocus();
          } 
        },
      ),
    );
  }
}