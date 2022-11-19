import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_weekend/widgets/card_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';

class profileScreen extends StatefulWidget {
  final PageController _pageController = PageController();
  
   profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
  
}


class _profileScreenState extends State<profileScreen> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      _image = img;
      Navigator.of(context).pop();
    });
  }
  PageController pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    Size size = utils.getScreenSize;
    return Scaffold(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SwitchListTile(
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
              ),
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: _isDark ? Theme.of(context).cardColor : Colors.white,
                ),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 1,
                      left: 95,
                      child: Container(
                          width: 200,
                          height: 193,
                          decoration: BoxDecoration(
                              color: _isDark
                                  ? Theme.of(context).cardColor
                                  : Colors.white,
                              border: Border.all(
                                color: Colors.purple,
                                width: 3,
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(200, 200)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: const Offset(-10, 10),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0,
                                ),
                              ]))),
                  Positioned(
                      top: 13,
                      left: 108,
                      child: Container(
                        width: 174,
                        height: 170,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                        ),
                        child: Center(
                          child: _image == null ? const Text('No image selected', style: TextStyle(fontSize: 20),) : _pickImage(source),
                        ),
                      )),
                  Positioned(
                      top: 155,
                      left: 230,
                      child: Container(
                          width: 45,
                          height: 44,
                          decoration: BoxDecoration(
                            color: _isDark
                                ? Theme.of(context).cardColor
                                : Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(45, 45)),
                          ))),
                  Positioned(
                    top: 160,
                    left: 236,
                    child: Container(
                        width: 33,
                        height: 33,
                        child: const FloatingActionButton(
                          onPressed: null,
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.add),
                        )),
                  ),
                ]),
              ),
              Positioned(
                  top: 320,
                  left: 145,
                  child: Text(
                    'Name',
                    style: TextStyle(
                      color: _isDark ? Colors.white : Colors.black,
                      fontSize: 36,
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.4,
                  width: 350,
                  child: PageView.builder(
                      itemCount: 10,
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return const CardWidget();
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.logout_rounded),
                      backgroundColor: Colors.purple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
