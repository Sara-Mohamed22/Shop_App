import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/shopLogin_screen.dart';
import 'package:shop_app/shared/styles/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel
{
  final String? image ;
  final String? title ;
  final String? body ;

  BoardingModel({@required this.image, @required this.title,@required this.body});
}




class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding =[

    BoardingModel(
      image: 'assets/images/onboard1.png' ,
      title: 'On Board1 Title' ,
      body: 'On Board1 Body'
    ) ,
    BoardingModel(
        image: 'assets/images/onboard1.png' ,
        title: 'On Board2 Title' ,
        body: 'On Board2 Body'
    ) ,
    BoardingModel(
        image: 'assets/images/onboard1.png' ,
        title: 'On Board3 Title' ,
        body: 'On Board3 Body'
    ) ,


  ] ;

  bool  isLast = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
           TextButton(onPressed: (){
             Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => ShopLoginScreen()),
             );
           },
               child:
               Text('SKIP',
                 style: TextStyle(fontWeight: FontWeight.bold), ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(

                controller: boardController ,
                onPageChanged: (int index)
                {
                   if(index == boarding.length-1)
                     {
                       print('last');
                        setState(() {
                          isLast = true ;
                        });
                     }
                   else
                     {
                       print(' not last');

                       setState(() {
                         isLast= false;
                       });
                     }
                },
                physics: BouncingScrollPhysics() ,
                itemBuilder: (context , index)=> buildBoardingItem(boarding[index]),
                itemCount: boarding.length ,

              ),
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController ,
                  count: boarding.length ,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey ,
                    activeDotColor: defaultColor ,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10 ,
                    spacing: 5.0
                  ),


                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(isLast==true)
                      {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => ShopLoginScreen()),
                        );
                      }
                    else
                      {
                            boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }

                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            )

          ],
        ),
      ) ,


    );
  }

  Widget buildBoardingItem(BoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Image.asset('${model.image}'),
      // SizedBox(height: 30,),
      Text(
        '${model.title}' ,
        style: TextStyle(
            fontSize: 24.0 ,
            fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: 10,),
      Text(
        '${model.body}' ,
        style: TextStyle(
            fontSize: 14.0 ,
            fontWeight: FontWeight.w400
        ),
      ),


    ],
  );
}
