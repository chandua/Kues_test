

import 'package:flutter/material.dart';
import 'package:kues_test/model/ProductModel.dart';
import 'package:kues_test/utill/Utils.dart';

import 'CartDialog.dart';

CartViewDialog(context, List<ProductModel> list){
  double total = 0;
  list.forEach((ProductModel e){total += e.sum;});
  showModalBottomSheet(
      context: context,
     backgroundColor: Colors.transparent,
      builder: (context) {
        return  Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 50,
            width: double.infinity,
            child:RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(15),
                textColor: Colors.white,
                color: Colors.black,
                onPressed: ()=> {Navigator.pop(context),
                CartDialog(context,list),},
                child:Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Align(alignment: Alignment.centerLeft,
                          child:Text(Utils.cart,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.white,fontSize:16,fontFamily: 'SourceSansProSemiBold'),),
                        )),
                    Expanded(
                        flex: 5,
                        child: Align(alignment: Alignment.centerRight,
                          child:Text('24min . \$'+total.toString(),textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.white,fontSize:16,fontFamily: 'SourceSansProSemiBold'),),
                        ))
                  ],
                )
              // child:Text(Utils.add_to_cart+' \$ 47.00',textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.white,fontSize:16,fontFamily: 'SourceSansProSemiBold'),),

            )
        );
      });
}