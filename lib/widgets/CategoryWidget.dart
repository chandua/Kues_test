
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kues_test/model/CategoryModel.dart';
import 'package:kues_test/model/ProductModel.dart';

Widget CategoryWidget(context){
  List<CategoryModel> categoryList=<CategoryModel>[
    CategoryModel('Salads',1),
    CategoryModel('Pizza',2),
    CategoryModel('Beverages', 3),
    CategoryModel('Sweets', 4),
    CategoryModel('fruits', 5),
    CategoryModel('Snacks', 6),


  ];
  return Container(

    child: Row(
      children: [
        Container(
         padding: EdgeInsets.all(15.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300]),
          child: Image.asset('assets/images/equalizer.png',height: 10,width: 10,),),

        Expanded(child: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          child:ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:categoryList.length,
            itemBuilder: (context, subIndex) {
              return  Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.all(10.0),
                padding:  EdgeInsets.only(left: 10.0,top: 0.0,right: 10.0,bottom: 0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]),
                child: Text(categoryList[subIndex].name,textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:12,fontFamily: 'SourceSansProSemiBold'),),

              );


            },
          ),
        ))


      ],


    ),


  );
}