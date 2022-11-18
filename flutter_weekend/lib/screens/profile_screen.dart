import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    
    return Scaffold(
      backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        body: Center(
      child: Column(
        children: [
          
          Container(
              width: 400,
              height: 400,
              decoration:  BoxDecoration(
                color:  _isDark ? Theme.of(context).cardColor : Colors.white,
              ),
              child: Stack(children: <Widget>[
                Positioned(
                    top: 116,
                    left: 95,
                    child: Container(
                        width: 200,
                        height: 193,
                        decoration: BoxDecoration(
                          color: _isDark ? Theme.of(context).cardColor : Colors.white,
                          border: Border.all(
                            color: Colors.purple,
                            width: 3,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(200, 200)),
                               boxShadow: [ BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          offset: const Offset(-10,10),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,

                        ),]
                        ))),
                        
                       
                Positioned(
                    top: 129,
                    left: 108,
                    child: Container(
                      width: 174,
                      height: 170,
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/image1.png"),
                            fit: BoxFit.fill),
                        color: _isDark ? Theme.of(context).cardColor : Colors.white,
                        shape: BoxShape.circle,
                      ),
                    )),
                Positioned(
                    top: 255,
                    left: 230,
                    child: Container(
                        width: 45,
                        height: 44,
                        decoration:  BoxDecoration(
                          color: _isDark ? Theme.of(context).cardColor : Colors.white,
                          borderRadius: BorderRadius.all(Radius.elliptical(45, 45)),
                        ))),
                 Positioned(
                    top: 320,
                    left: 145,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        color: _isDark ?  Colors.white : Theme.of(context).cardColor,
                        fontSize: 36,
                      ),
                    )),
                Positioned(
                  top: 260,
                  left: 236,
                  child: Container(
                    width: 33,
                    height: 33,
                    child:const FloatingActionButton(onPressed: null,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.add),
                    )
                  ),
                ),
              ])),
              Container(
                height: 200,
               
                child: Stack(
                  children: [
                    Positioned(child: Material(
                      child: Container(height: 200,
                      width:   320,
                      decoration: BoxDecoration(
                        color: _isDark ? Theme.of(context).cardColor : Colors.white,
                        borderRadius: BorderRadius.circular(0),
                        boxShadow: [ BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          offset: const Offset(-10,10),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,

                        ),]
                      ),
                      
                      
                      
                      ),
                    )),Positioned(
                      
                      child: Card(
                      elevation: 10,
                      shadowColor: Colors.grey.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple[800],
                          
                          
                        ),
                        child: Column(

                        ),
                      ),
                      
                      
                        
                    ),
                    ),
                    Positioned(
                      left: 170,
                      child: Container(
                       
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text("Hi I am here", style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple[700]
                          ),),
                          Text("Hi I am here ", style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple[700]
                          ),),
                           Divider(color: Theme.of(context).cardColor,
                          thickness: 1,),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
             
        ],
      ),
          
    ));
  }
}
