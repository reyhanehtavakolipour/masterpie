import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';

class ViewAutoGenerateMealsScreen extends StatefulWidget {

  const ViewAutoGenerateMealsScreen({super.key});

  @override
  State<ViewAutoGenerateMealsScreen> createState() => _ViewAutoGenerateMealsScreenState();
}


class _ViewAutoGenerateMealsScreenState extends State<ViewAutoGenerateMealsScreen> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(GENERATED_MEALS, style: TextStyle(color: Colors.white),),
            backgroundColor: PRIMARY_COLOR,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
            actions: [

            ],
          ),
           body: Padding(
             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
             child: SingleChildScrollView(
               child: Column(
                 children: [

                 ],
               ),
             ),
           ),
        )
    );
  }



}
