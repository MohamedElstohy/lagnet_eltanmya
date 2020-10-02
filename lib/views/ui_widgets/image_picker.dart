import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class CustomImagePicker extends StatefulWidget {
  File imageFile;
  final String title;

  CustomImagePicker({
    this.imageFile,
    this.title
  });

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  String exc;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async{
          showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            contentPadding: EdgeInsets.symmetric(horizontal: 0,),
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: ()async{
                        PickedFile _image = await picker.getImage(source: ImageSource.camera);
                        setState(() {
                          widget.imageFile = File(_image.path);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'إلتقط صورة',
                              style: TextStyle(
                                color: Color(0xFF304637)
                              ),
                            ),

                            SizedBox(width: 20,),

                            Icon(
                              Icons.camera_alt,
                              size: 25,
                              color: Color(0xFF304637),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(),

                  Expanded(
                    child: GestureDetector(
                      onTap: ()async{
                        PickedFile _image = await picker.getImage(source: ImageSource.gallery);;
                        setState(() {
                          widget.imageFile = File(_image.path);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                                'المعرض'
                            ),

                            SizedBox(width: 20,),

                            Icon(
                              Icons.image,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        );

          Future<void> retrieveLostData() async {
            final LostData response = await picker.getLostData();
            if (response.isEmpty) {
              return;
            }
            if (response.file != null) {
              setState(() {
                widget.imageFile = File((response.file).path);
              });
            } else {
              exc = response.exception.code;
              print(exc + 'kos');
            }
          }
        },
        child: Container(
        height: getDeviceHeight(context)/5,
        width: (getDeviceWidth(context)/3)+40,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20)
        ),
        child: widget.imageFile == null 
          ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Color(0xFFA2A5A9),
                  fontSize: 14
                ),
              ),

              Image.asset(
                'assets/images/add@3x.png',
                width: 20,
                height: 20
              )
            ],
          )   
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: FileImage(widget.imageFile),
                  fit: BoxFit.cover
                )
              ),
            )
      ),
    );
  }
}