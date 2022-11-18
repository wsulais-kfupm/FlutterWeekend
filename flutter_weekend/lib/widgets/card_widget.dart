import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Flexible(
      
      child: Container(
        height: 300,
        width: 500,
        child: Stack(
          children: [
            Positioned(
                child: Material(
              child: Container(
                height: 200,
                width: 320,
                decoration: BoxDecoration(
                    color: _isDark ? Theme.of(context).cardColor : Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  
                    boxShadow: [
                      BoxShadow(
                        color: _isDark ? Colors.purple.withOpacity(0.3) : Colors.grey.withOpacity(0.4),
                        offset: const Offset(-10, 10),
                        blurRadius: 20.0,
                        spreadRadius: 4.0,
                      ),
                    ]),
              ),
            )),
            Positioned(
              child: Card(
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple[600],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                              width: 80,
                              color: Colors.purple[200],
                                )
                              ],

                            ),
                            ),
                      )
                    ],
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
                      Text(
                        "Hi I am here",
                        style: TextStyle(fontSize: 20, color: Colors.purple[700]),
                      ),
                      Text(
                        "Hi I am here ",
                        style: TextStyle(fontSize: 16, color: Colors.purple[700]),
                      ),
                      Divider(
                        color: Theme.of(context).cardColor,
                        thickness: 1,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
