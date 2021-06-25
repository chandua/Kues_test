
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kues_test/model/ProductModel.dart';

import 'dialog/ProductDetailsDialog.dart';


Widget ProductListWidget(context){
  List<ProductModel> productsList=<ProductModel>[
    ProductModel(1,'assets/images/indian_chutney.png', 'Indian chutney', 1.00,'10kcal' ,0,0.0),
    ProductModel(2,'assets/images/banana.png', 'Banana', 6.00,'40kcal', 0,0.0),
    ProductModel(3,'assets/images/tomato.png', 'Tamato', 8.00,'10kcal', 0,0.0),
    ProductModel(4,'assets/images/meat.png', 'Meat', 20.00,'400kcal', 0,0.0),
    ProductModel(5,'assets/images/dessert.png', 'Dessert', 30.00,'350kcal', 0,0.0),
    ProductModel(6,'assets/images/sweet_bowl.png', 'Sweet bowl', 25.00,'40kcal', 0,0.0),
    ProductModel(7,'assets/images/salad.png', 'Salad', 45.00, '100kcal',0,0.0),
    ProductModel(8,'assets/images/bread_slices.png', 'Bread Slices', 5.00,'50kcal', 0,0.0),

  ];
  return Stack(
    children: [
      ListView.builder( physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:productsList.length,
          itemBuilder: (context, subIndex) {
            return Container(
                width: double.infinity,
                margin: EdgeInsets.all(10.0),
                child: new Material(
                  child:InkWell(
                      onTap: (){
                        ProductDetailsDialog(context,productsList[subIndex]);
                      },
                      child:Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child:Image.asset(productsList[subIndex].productUrl)

                          ),
                          Expanded(
                              flex: 7,
                              child:Container(
                                  margin: EdgeInsets.only(left: 20.0),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Text(productsList[subIndex].desc,textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:14,fontFamily: 'SourceSansProRegular'),),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child:  Row(
                                            children: [
                                              Container(

                                                padding: EdgeInsets.only(left: 12.0,top:8.0,right: 12.0,bottom: 8.0),
                                                margin: EdgeInsets.only(left: 0.0,top:10.0,right: 12.0,bottom: 10.0),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: Colors.grey[200]),
                                                child: Text('\$'+productsList[subIndex].price.toString(),textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:14,fontFamily: 'SourceSansProSemiBold'),),
                                              ),
                                              Text(productsList[subIndex].cal,textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[600],fontSize:14,fontFamily: 'SourceSansProSemiBold'),),

                                            ],
                                          ),
                                        )

                                      ]


                                  ))
                          )

                        ],
                      )
                  ),
                  color: Colors.white,

                )


            );
          }),
    ],
  );

}

