import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kues_test/model/IntroModel.dart';
import 'package:kues_test/model/ProductModel.dart';
import 'package:kues_test/utill/Utils.dart';
import 'package:kues_test/widgets/CategoryWidget.dart';
import 'package:kues_test/widgets/ProductListWidget.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;
  List<IntroModel> introModelList=<IntroModel>[
    IntroModel('assets/images/sweet_bowl.png', 'Sweet bowl', '\$12.40 '),
    IntroModel('assets/images/salad.png', 'Salad with egg , cheese and shrimps', '\$9.25 '),
    IntroModel('assets/images/bread_slices.png', 'burgers are great, but bacon burgers are magic', '\$10.40 '),
    IntroModel('assets/images/food_plate.png', 'People who love to eat are always the best people', '\$5.40 '),
    IntroModel('assets/images/dessert.png', 'Delicious biryani quotes for all the biryani lovers', '\$50.40 '),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white),
        child: SingleChildScrollView(
          child:   Column(
            children: [
              SizedBox(height: 40,),
              Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/images/menu.png',height: 20,width: 20,),),
                    Expanded(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          child: Text('100a Ealing Rd . 24 mins',textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.white,fontSize:11,fontFamily: 'SourceSansProRegular'),),
                        )),
                    Expanded(flex: 2,child: Image.asset('assets/images/search.png',height: 20,width: 20,),)
                  ],),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child:Text(Utils.hits_of_week,textAlign:TextAlign.left,style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize:21,fontFamily: 'SourceSansProBold'),),

              ),
              SizedBox(height: 30,),
            Column(
                children:[
                  CarouselSlider(

                    options: CarouselOptions(
                      height: 200.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,),
                    items: introModelList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Container(
                                child: Stack(
                                  children: [

                                    Container(
                                      margin: EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                            colors: [
                                              Colors.blue[300],
                                              Colors.blue[50],
                                            ],
                                          )),


                                    ),


                                    Container(
                                        padding: EdgeInsets.only(left: 25.0,top:0.0,right: 25.0,bottom: 0.0),
                                        alignment: Alignment.centerRight,
                                        child:Column(

                                            children:[
                                              SizedBox(height: 130,),
                                              Row(
                                                children: [
                                                  Expanded(flex: 6,
                                                      child:Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(i.desc,textAlign:TextAlign.left,maxLines:2,style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize:13,fontFamily: 'SourceSansProRegular'),),

                                                      )
                                                  ),
                                                  Expanded(flex:4,child: Container(
                                                      alignment: Alignment.centerRight,
                                                      child:Container(
                                                        padding: EdgeInsets.only(left: 12.0,top:8.0,right: 12.0,bottom: 8.0),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(20),
                                                            color: Colors.black),
                                                        child: Text(i.price,textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.white,fontSize:13,fontFamily: 'SourceSansProRegular'),),
                                                      )

                                                  ) )

                                                ],
                                              )

                                            ]
                                        )

                                    ),



                                  ],

                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(bottom: 80),
                                alignment: Alignment.topCenter,
                                child:Image.asset(i.productUrl,height: 110,width: 110,),
                              ),
                            ],
                          );


                        },
                      );
                    }).toList(),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: introModelList.map((image) {
                      int index=introModelList.indexOf(image);
                      return Container(
                        width: 50.0,
                        height: 3.5,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                            color: _current == index
                                ? Colors.black
                                : Colors.grey[200]
                        ),
                      );
                    },
                    ).toList(), // this was the part the I had to add
                  ),

                ]

            ),
              CategoryWidget(context),
              ProductListWidget(context),


            ],
          ),
        )


    );
  }
}