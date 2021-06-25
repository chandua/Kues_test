
import 'package:flutter/material.dart';
import 'package:kues_test/model/ProductModel.dart';
import 'package:kues_test/utill/Utils.dart';
import 'package:toast/toast.dart';

import 'CartViewDialog.dart';


ProductDetailsDialog(context, ProductModel productsList){
    int qty=productsList.qty;

    showModalBottomSheet(
      context: context,
     isScrollControlled: true,
     shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))
     ),
     builder: (context) {
      return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
        return   AnimatedContainer(
          height: MediaQuery.of(context).size.height/1.1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
          ),
          padding: EdgeInsets.all(20.0),
          duration: Duration(seconds: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Image.asset(productsList.productUrl,height: 200,width: 200,),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(productsList.desc,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:22,fontFamily: 'SourceSansProBold'),),

                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(productsList.desc,textAlign:TextAlign.left,maxLines:3,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[800],fontSize:13,fontFamily: 'SourceSansProRegular'),),
                ),
                SizedBox(height: 20,),
                Container(

                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[400]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text('325',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:18,fontFamily: 'SourceSansProSemiBold'),),
                              SizedBox(height: 5,),
                              Text('Kcal',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[400],fontSize:14,fontFamily: 'SourceSansProRegular'),),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text('420',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:18,fontFamily: 'SourceSansProSemiBold'),),
                              SizedBox(height: 5,),
                              Text('grams',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[400],fontSize:14,fontFamily: 'SourceSansProRegular'),),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text('21',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:18,fontFamily: 'SourceSansProSemiBold'),),
                              SizedBox(height: 5,),
                              Text('proteins',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[400],fontSize:14,fontFamily: 'SourceSansProRegular'),),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text('19',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:18,fontFamily: 'SourceSansProSemiBold'),),
                              SizedBox(height: 5,),
                              Text('fats',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[400],fontSize:14,fontFamily: 'SourceSansProRegular'),),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text('65',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:18,fontFamily: 'SourceSansProSemiBold'),),
                              SizedBox(height: 5,),
                              Text('carb',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[400],fontSize:14,fontFamily: 'SourceSansProRegular'),),
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex:5,child: Container(
                      alignment: Alignment.centerLeft,
                      child:Text(Utils.add_in_poke,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:16,fontFamily: 'SourceSansProSemiBold'),),

                    )),
                    Expanded(flex:5,child: Container(
                      alignment: Alignment.centerRight,
                      child:Icon(Icons.arrow_forward_ios_rounded,size: 16,),

                    )),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex:4,child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex:3,
                              child: GestureDetector(
                                  onTap: () {
                                    setState((){
                                      if(qty>0)
                                        qty=qty-1;
                                    });
                                  },
                                  child:Icon(Icons.remove,size: 15,)
                              )),
                          Expanded(
                            flex:4,
                            child:Text(qty.toString(),textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:16,fontFamily: 'SourceSansProBold'),),
                          ),
                          Expanded(
                              flex:3,
                              child: GestureDetector(
                                  onTap: () {
                                  setState((){
                                        qty=qty+1;
                                    });
                                  },
                                  child:Icon(Icons.add,size: 15)
                              )),

                        ],
                      ),

                    )),
                    Expanded(flex:6,child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:GestureDetector(
                        onTap: (){
                          if(qty>0){
                            Navigator.pop(context);

                            Utils.list.add(ProductModel(productsList.id,productsList.productUrl, productsList.desc, productsList.price,productsList.cal ,qty,(qty*productsList.price)));
                            CartViewDialog(context, Utils.list);
                          }else Toast.show("Select Qty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


                        },
                        child:Text(Utils.add_to_cart+" \$"+(qty*productsList.price).toString(),textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.white,fontSize:16,fontFamily: 'SourceSansProSemiBold'),),

                      )


                    )),
                  ],
                ),


              ],
            ),
          ),
        );
      });





     }, );
   }

