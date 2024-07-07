import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:masterpie/main_screen.dart';
import 'package:masterpie/util/design/color/app_colors.dart';

import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;



  //how many times you have main dish?
  bool _isCustomNumberMainDishSelected = false;
  int _selectedMainDishChoice= 3;

  //how many times you have side dish?
  bool _isCustomNumberSideDishSelected = false;
  int _selectedSideDishChoice= 2;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [

                  ///step 1
                  _numberOfMealsDuringDays(),

                  /// step2
                  _selectRecipesType(),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    height: 10.0,
                    width: _currentPage == index ? 20.0 : 10.0,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? MASTERPIE_YELLOW_COLOR
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }


  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _selectRecipesType(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 30,
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '2/5',
                    style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  ),
                ),

                skipBtn()

              ],
            ),
          ),

          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),

          /// next & previous button
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(BORDER_RADIUS),
                        ),
                        backgroundColor: MASTERPIE_YELLOW_COLOR
                    ),
                    onPressed: (){
                      setState(() {
                        _goToPage(0);
                      });
                    },
                    child: const Text(PREVIOUS_LABEL, style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                  ),
              ),

              const SizedBox(width: 8,),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(BORDER_RADIUS),
                      ),
                      backgroundColor: DARK_PRIMARY_COLOR
                  ),
                  onPressed: (){
                    //todo go to next page from step 2
                  },
                  child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }



  Widget _numberOfMealsDuringDays(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 30,
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                      '1/5',
                      style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                ),

              skipBtn()

              ],
            ),
          ),

          const SizedBox(height: 24,),

          Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset(FEQUENT_EATING_PATH, width: 200, height: 200,)
          ),

          const SizedBox(height: 32,),


          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ///main dish
                  const Text(
                    EATING_MAIN_DISH_FREQUENCY,
                    style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  if (_isCustomNumberMainDishSelected)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // Border color when the field is focused
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCustomNumberMainDishSelected = false;
                            });
                          },
                          child: const Text(
                            SELECT_ANSWER,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: DARK_PRIMARY_COLOR,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildNumberOfMainDishChoiceChip(1),
                            _buildNumberOfMainDishChoiceChip(2),
                          ],
                        ),
                        // const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildNumberOfMainDishChoiceChip(3),
                            _buildNumberOfMainDishChoiceChip(4),
                          ],
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCustomNumberMainDishSelected = true;
                            });
                          },
                          child: const Text(
                            ENTER_MANUALLY,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: DARK_PRIMARY_COLOR,
                            ),
                          ),
                        ),
                      ],
                    ),


                  const SizedBox(height: 48,),

                  ///side dish
                  const Text(
                    EATING_SIDE_DISH_FREQUENCY,
                    style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  if (_isCustomNumberSideDishSelected)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // Border color when the field is focused
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCustomNumberSideDishSelected = false;
                            });
                          },
                          child: const Text(
                            SELECT_ANSWER,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: DARK_PRIMARY_COLOR,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildNumberOfSideDishChoiceChip(1),
                            _buildNumberOfSideDishChoiceChip(2),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildNumberOfSideDishChoiceChip(3),
                            _buildNumberOfSideDishChoiceChip(4),
                          ],
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCustomNumberSideDishSelected = true;
                            });
                          },
                          child: const Text(
                            ENTER_MANUALLY,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: DARK_PRIMARY_COLOR,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),

          /// next button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(BORDER_RADIUS),
                    ),
                    backgroundColor: DARK_PRIMARY_COLOR
                ),
                onPressed: (){
                  _goToPage(1);
                },
                child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),

            ),
          )
        ],
      ),
    );
  }

  Widget _buildNumberOfMainDishChoiceChip(int value) {
    return ChoiceChip(
      label: SizedBox(width: 70, child: Text(value.toString(), style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14), textAlign: TextAlign.center,),),
      selected: _selectedMainDishChoice == value,
      selectedColor: MASTERPIE_YELLOW_COLOR,
      showCheckmark: false,
      onSelected: (bool selected) {
        setState(() {
          _selectedMainDishChoice = (selected ? value : null)!;
        });
      },
    );
  }


  Widget _buildNumberOfSideDishChoiceChip(int value) {
    return ChoiceChip(
      label: SizedBox(width: 70, child: Text(value.toString(), style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14), textAlign: TextAlign.center,),),
      selected: _selectedSideDishChoice == value,
      selectedColor: MASTERPIE_YELLOW_COLOR,
      showCheckmark: false,
      onSelected: (bool selected) {
        setState(() {
          _selectedSideDishChoice = (selected ? value : null)!;
        });
      },
    );
  }


 Widget skipBtn(){
   return Expanded(
     child: GestureDetector(
       onTap: (){
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => const MainScreen(),
           ),
         );
       },
       child: const Text(
         SKIP_LABEL,
         style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
         textAlign: TextAlign.end,
       ),
     ),
   );
 }

  List<Widget> _buildWizardInstructionContent() {
    return [
      _buildPage(
        image: 'assets/images/healthy_food.svg',
        title: 'Welcome',
        description: 'This is the first page of the onboarding.',
      ),
      _buildPage(
        image: 'assets/images/meal.svg',
        title: 'Discover',
        description: 'Discover new features on the second page.',
      ),
      _buildPage(
        image: 'assets/images/start.svg',
        title: 'Get Started',
        description: 'Get started with the app on the third page.',
      ),
    ];
  }



  Widget _buildPage({required String image, required String title, required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image, width: 300),

        SizedBox(height: 20.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }


}
