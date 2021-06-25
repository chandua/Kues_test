
import 'package:flutter/material.dart';
import 'package:kues_test/model/ProductModel.dart';
import 'package:kues_test/utill/Utils.dart';

CartDialog(context, List<ProductModel> list){
  int qty=1;
  int subQty=0;
  double total = 0;
  list.forEach((ProductModel e){total += e.sum;});
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
                Text(Utils.deliver,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:22,fontFamily: 'SourceSansProBold'),),
                SizedBox(height:20),
                Row(
                  children: [
                    Text('100a Ealing Rd  ',textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:14,fontFamily: 'SourceSansProSemiBold'),),
                    Text(Utils.change_address,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[400],fontSize:12,fontFamily: 'SourceSansProSemiBold'),),
                  ],
                ),
                SizedBox(height:30),
                ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:list.length,
                  itemBuilder: (context, subIndex){
                    qty=list[subIndex].qty;
                    return Container(
                      padding: EdgeInsets.all(10),
                        child:Row(
                          children: [
                            Expanded(
                              flex: 3,
                            child:Image.asset(list[subIndex].productUrl,height: 80,width: 80,),),
                            Expanded(
                                flex: 5,
                                child:Container(
                                    margin: EdgeInsets.only(left: 20.0),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text(list[subIndex].desc,textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:16,fontFamily: 'SourceSansProSemiBold'),),
                                          SizedBox(height: 10,),
                                          Container(
                                            width: 100,
                                              child:Row(
                                                children: [
                                                  Expanded(
                                                      flex:3,
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            setState((){
                                                              if(qty>=1){
                                                                qty=qty-1;
                                                                list[list.indexWhere((element) => element.id==list[subIndex].id)]=ProductModel(list[subIndex].id,list[subIndex].productUrl, list[subIndex].desc, list[subIndex].price,list[subIndex].cal ,qty,(qty*list[subIndex].price));
                                                                if(qty==0)
                                                                  list.remove(list[subIndex]);
                                                              }else {
                                                                list.remove(list[subIndex]);
                                                              }
                                                              total=0.0;
                                                            list.forEach((ProductModel e){total += e.sum;});

                                                            });
                                                          },
                                                          child:Container(
                                                            padding: EdgeInsets.all(8),
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[200],
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                              child:Icon(Icons.remove,size: 15,)
                                                          )

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
                                                              total=0.0;
                                                              list[list.indexWhere((element) => element.id==list[subIndex].id)]=ProductModel(list[subIndex].id,list[subIndex].productUrl, list[subIndex].desc, list[subIndex].price,list[subIndex].cal ,qty,(qty*list[subIndex].price));
                                                              list.forEach((ProductModel e){total += e.sum;});
                                                            });
                                                          },
                                                          child:Container(
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                color: Colors.grey[200],
                                                                borderRadius: BorderRadius.circular(10),
                                                              ),
                                                          child:Icon(Icons.add,size: 15)
                                                          )
                                                      )),

                                                ],
                                              )
                                          )

                                        ]


                                    ))
                            ),
                            Expanded(
                                flex: 2,
                              child:Container(
                                alignment: Alignment.topCenter,
                                child: Text('\$ '+list[subIndex].sum.toString(),textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:14,fontFamily: 'SourceSansProSemiBold'),),

                              )
                            )

                          ],
                        )
                    );
                  }),
                SizedBox(height:10),
                Divider(height: 1,color: Colors.grey[400],thickness: 0.2,),
                SizedBox(height:30),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                        child: Image.asset('assets/images/fork_knife.png',height: 15,width: 15,)),
                    Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(Utils.cutlery,textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:14,fontFamily: 'SourceSansProSemiBold'),),

                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerRight,
                            width: 100,
                            child:Row(
                              children: [
                                Expanded(
                                    flex:3,
                                    child: GestureDetector(
                                        onTap: () {
                                          setState((){
                                            if(subQty>0)
                                              subQty=subQty-1;
                                          });
                                        },
                                        child:Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child:Icon(Icons.remove,size: 15,)
                                        )

                                    )),
                                Expanded(
                                  flex:4,
                                  child:Text(subQty.toString(),textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:16,fontFamily: 'SourceSansProBold'),),
                                ),
                                Expanded(
                                    flex:3,
                                    child: GestureDetector(
                                        onTap: () {
                                          setState((){
                                            subQty=subQty+1;
                                          });
                                        },
                                        child:Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child:Icon(Icons.add,size: 15)
                                        )
                                    )),

                              ],
                            )
                        ))
                  ],
                ),
                SizedBox(height:20),
                Divider(height: 1,color: Colors.grey[400],thickness: 0.2,),
                SizedBox(height:20),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                        child: Container(
                          alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                        Align(
                        alignment: Alignment.centerLeft,
                           child:Text(Utils.delivery,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:16,fontFamily: 'SourceSansProBold'),),
                        ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child:Text(Utils.free_delivery,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[400],fontSize:14,fontFamily: 'SourceSansProRegular'),),
                          )

                        ],
                      ),
                    )),
                    Expanded(
                      flex: 3,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text('\$ 0.00',textAlign:TextAlign.center,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:16,fontFamily: 'SourceSansProBold'),),
                        ))
                  ],
                ),

                SizedBox(height:50),
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(Utils.payment_method,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.grey[600],fontSize:14,fontFamily: 'SourceSansProRegular'),),

                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Image.asset('assets/images/apple_pay.png',height: 40,width: 80,),
                              Text(Utils.apple_pay,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.black,fontSize:14,fontFamily: 'SourceSansProSemiBold'),),


                            ],
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_forward_ios_rounded,size: 15,)
                        ))
                  ],
                ),
                SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity,
                    child:RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(15),
                      textColor: Colors.white,
                      color: Colors.black,
                      onPressed: ()=> {Navigator.pop(context),
                      Utils.list.clear()},
                      child:Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Align(alignment: Alignment.centerLeft,
                                 child:Text(Utils.pay,textAlign:TextAlign.left,style: TextStyle( decoration: TextDecoration.none,color: Colors.white,fontSize:16,fontFamily: 'SourceSansProSemiBold'),),
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
                )








              ],
            ),
          ),
        );
      });





    }, );
}