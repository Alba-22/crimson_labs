import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        navigatorKey: Modular.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Crimson Labs',
        theme: ThemeData(
          primaryColor: Color(0xFFDC143C),
          accentColor: Color(0xFFED224B),
          fontFamily: "Gotham",
          backgroundColor: Colors.white,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
